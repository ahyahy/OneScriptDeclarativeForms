using System;
using System.Net;
using System.Net.WebSockets;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.HostedScript.Library;
using ScriptEngine.Machine;
using System.Threading.Tasks;
using System.Collections.Concurrent;
using System.Threading;
using System.Text;
using System.IO;

namespace osws
{
    [ContextClass("ВебСерверПолученияДекларФорм", "WebServerReceivingDeclarForms")]
    public class WebServerReceivingDeclarForms : AutoContext<WebServerReceivingDeclarForms>
    {
        private static string iPAddress;
        private static int port;
        public static WebServerReceivingDeclarForms WebServer;
        public static WsReceivingMessageEventArgs Event = null;
        public static WsReceivingAction EventAction = null;
        public static ConcurrentQueue<WsReceivingMessageEventArgs> EventQueue = new ConcurrentQueue<WsReceivingMessageEventArgs>();
        // Это событие возникает при получении нового сообщения.
        public event EventHandler<WsReceivingEventArgs> ReceivedMessage;
        public static WebSocket _webSocket;

        [ScriptConstructor]
        public static IRuntimeContextInstance Constructor()
        {
            WebServer = new WebServerReceivingDeclarForms();
            WebServer.ReceivedMessage += WebServer_ReceivedMessage;
            return WebServer;
        }

        [ContextProperty("АргументыСобытия", "EventArgs")]
        public WsReceivingMessageEventArgs EventArgs
        {
            get { return Event; }
        }

        public static bool goOn = true;
        [ContextProperty("Продолжать", "GoOn")]
        public bool GoOn
        {
            get { return goOn; }
            set { goOn = value; }
        }

        [ContextMethod("ПолучитьСобытие", "DoEvents")]
        public DelegateAction DoEvents()
        {
            while (EventQueue.Count == 0)
            {
                System.Threading.Thread.Sleep(7);
            }

            IValue Action1 = EventHandling();
            if (Action1.GetType() == typeof(WsReceivingAction))
            {
                return DelegateAction.Create(((WsReceivingAction)Action1).Script, ((WsReceivingAction)Action1).MethodName);
            }
            return (DelegateAction)Action1;
        }

        public static WsReceivingAction EventHandling()
        {
            WsReceivingMessageEventArgs EventArgs1;
            EventQueue.TryDequeue(out EventArgs1);
            Event = EventArgs1;
            EventAction = EventArgs1.EventAction;
            return EventAction;
        }

        [ContextMethod("Начать", "Start")]
        public void Start(string p1, int p2)
        {
            iPAddress = p1;
            port = p2;

            Wsserver1();
        }
        public async void Wsserver1()
        {
            await WsserverStart();
        }
        static async Task WsserverStart()
        {
            var listener = new HttpListener();
            listener.Prefixes.Add("http://" + iPAddress + ":" + port + "/");
            try
            {
                listener.Start();
                osdf.DeclarativeForms.webserverReceivingUploaded = true;
            }
            catch (Exception ex)
            {
                osdf.DeclarativeForms.GlobalContext().Echo("ServerReceiving ex.Message = " + ex.Message);
                return;
            }

            //osdf.DeclarativeForms.GlobalContext().Echo("WebServerReceiving Listening...");

            while (true)
            {
                var context = await listener.GetContextAsync();
                if (context.Request.IsWebSocketRequest)
                {
                    await ProcessWebSocketRequest(context);
                }
                else
                {
                    context.Response.StatusCode = 400;
                    context.Response.Close();
                }
            }
        }

        static async Task ProcessWebSocketRequest(HttpListenerContext context)
        {
            var ws = await context.AcceptWebSocketAsync(subProtocol: null);
            _webSocket = ws.WebSocket;
            // osdf.DeclarativeForms.GlobalContext().Echo("WebServerReceiving connected");

            if (!firstTime)
            {
                osdf.DeclarativeForms.TimeClietnConnected = osdf.DeclarativeForms.GlobalContext().CurrentUniversalDateInMilliseconds();
            }

            try
            {
                await Echo(ws.WebSocket);
            }
            catch (Exception)
            {
                //osdf.DeclarativeForms.GlobalContext().Echo("WebServerReceiving ex.Message = " + ex.Message);

                if (osdf.DeclarativeForms.instance.OpenInBrowser)
                {
                    osdf.DeclarativeForms.GlobalContext().Echo("Произошло не корректное обновление страницы (" + osdf.DeclarativeForms.GlobalContext().CurrentUniversalDate() + ").");
                    osdf.DeclarativeForms.GlobalContext().Echo("Повторно обновите страницу.");
                    Environment.Exit(1);
                }
            }
        }

        private static bool firstTime = true;
        static async Task Echo(WebSocket ws)
        {
            var buffer = new ArraySegment<byte>(new byte[2048]);
            while (true)
            {
                if (ws.State != WebSocketState.Aborted)
                {
                    WebSocketReceiveResult result;
                    var ms = new MemoryStream();
                    do
                    {
                        result = await ws.ReceiveAsync(buffer, CancellationToken.None);
                        ms.Write(buffer.Array, buffer.Offset, result.Count);
                    } while (!result.EndOfMessage);

                    ms.Seek(0, SeekOrigin.Begin);
                    if (result.MessageType == WebSocketMessageType.Text)
                    {
                        var reader = new StreamReader(ms, Encoding.UTF8);
                        string ts = await reader.ReadToEndAsync();
                        //////osdf.DeclarativeForms.GlobalContext().Echo("4Received message: " + ts);
                        WebServer.OnReceivedMessage(ts); // Без этой строки не будут работать события.

                        if (ts == "mainForm|loaded" && !firstTime) // строка нужна для запуска после перезагрузки
                        {
                            string message = osdf.DeclarativeForms.InitialStrFunctions;
                            var bytes = System.Text.Encoding.UTF8.GetBytes(message);
                            await ws.SendAsync(new ArraySegment<byte>(bytes, 0, bytes.Length), WebSocketMessageType.Text, true, CancellationToken.None);
                        }
                        firstTime = false;
                    }
                    else if (result.MessageType == WebSocketMessageType.Close)
                    {
                        // После закрытия соединения с клиентом возможно подключится новый клиент и через короткий промежуток. 
                        // Не больше 100 миллисекунд. Значит было произведено обновление страницы и закрывать программу не нужно.
                        // Если в течении секунды новый клиент не подключился, значит вкладка с программой была закрыта и
                        // следует закрыть программу.

                        if (!firstTime)
                        {
                            osdf.DeclarativeForms.TimeClietnClosed = osdf.DeclarativeForms.GlobalContext().CurrentUniversalDateInMilliseconds();
                        }

                        // osdf.DeclarativeForms.GlobalContext().Echo("WebServerReceiving closed");
                        break;
                    }
                }
            }
        }

        [ContextMethod("ОтправитьТекст", "SendText")]
        public void SendText(string text)
        {
            SendText1(text);
        }
        public async void SendText1(string text)
        {
            await Send(text);
        }
        static async Task Send(string text)
        {
            if (_webSocket.State == WebSocketState.Open)
            {
                try
                {
                    var buffer = Encoding.UTF8.GetBytes(text);
                    await _webSocket.SendAsync(new ArraySegment<byte>(buffer), WebSocketMessageType.Text, true, CancellationToken.None);
                    ////_server.OnSentMessage(mes);
                    //osdf.DeclarativeForms.GlobalContext().Echo("Отправлено сервером получения - " + text);
                }
                catch (Exception ex)
                {
                    osdf.DeclarativeForms.GlobalContext().Echo("Не удалось отправить _webSocket.SendAsync = " + ex.StackTrace);
                    osdf.DeclarativeForms.GlobalContext().Echo("text = " + text);
                }
            }
        }

        [ContextProperty("ПриПолученииСообщения", "MessageReceived")]
        public WsReceivingAction MessageReceived { get; set; }

        [ContextMethod("Действие", "Action")]
        public WsReceivingAction Action(IRuntimeContextInstance script, string methodName)
        {
            return new WsReceivingAction(script, methodName);
        }

        private static void WebServer_ReceivedMessage(object sender, WsReceivingEventArgs e)
        {
            if (WebServer.MessageReceived != null)
            {
                WsReceivingMessageEventArgs WsReceivingMessageEventArgs1 = new WsReceivingMessageEventArgs(e.MessageData);
                WsReceivingMessageEventArgs1.EventAction = WebServer.MessageReceived;
                WsReceivingMessageEventArgs1.Message = e.MessageData;
                EventQueue.Enqueue(WsReceivingMessageEventArgs1);

                while (EventQueue.Count > 0)
                {
                    System.Threading.Thread.Sleep(5);
                }
            }
        }

        // Вызывает событие MessageReceived.
        // "message" - Полученное сообщение.
        public void OnReceivedMessage(string message)
        {
            var handler = ReceivedMessage;
            if (handler != null)
            {
                handler(this, new WsReceivingEventArgs(message));
            }
        }
    }

    public class WsReceivingEventArgs
    {
        public string MessageData { get; set; }
        public WsReceivingEventArgs(string messageData)
        {
            MessageData = messageData;
        }
    }

    [ContextClass("ВсПолученияСообщениеАрг", "WsReceivingMessageEventArgs")]
    public class WsReceivingMessageEventArgs : AutoContext<WsReceivingMessageEventArgs>
    {
        public WsReceivingMessageEventArgs(string p1)
        {
            message = p1;
        }

        private WsReceivingAction eventAction;
        [ContextProperty("Действие", "EventAction")]
        public WsReceivingAction EventAction
        {
            get { return eventAction; }
            set { eventAction = value; }
        }

        private string message;
        [ContextProperty("Сообщение", "Message")]
        public string Message
        {
            get { return message; }
            set { message = value; }
        }
    }

    [ContextClass("ВсПолученияДействие", "WsReceivingAction")]
    public class WsReceivingAction : AutoContext<WsReceivingAction>
    {
        public WsReceivingAction(IRuntimeContextInstance script, string methodName)
        {
            Script = script;
            MethodName = methodName;
        }

        [ContextProperty("ИмяМетода", "MethodName")]
        public string MethodName { get; set; }

        [ContextProperty("Сценарий", "Script")]
        public IRuntimeContextInstance Script { get; set; }
    }
}
