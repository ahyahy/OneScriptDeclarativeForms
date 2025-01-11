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
    [ContextClass("ВебСерверОтправкиДекларФорм", "WebServerSendDeclarForms")]
    public class WebServerSendDeclarForms : AutoContext<WebServerSendDeclarForms>
    {
        private static string iPAddress;
        private static int port;
        public static WebServerSendDeclarForms WebServer;
        public static WsSendMessageEventArgs Event = null;
        public static WsSendAction EventAction = null;
        public static ConcurrentQueue<WsSendMessageEventArgs> EventQueue = new ConcurrentQueue<WsSendMessageEventArgs>();
        // Это событие возникает при получении нового сообщения.
        public event EventHandler<WsSendEventArgs> ReceivedMessage;
        public static WebSocket _webSocket;

        [ScriptConstructor]
        public static IRuntimeContextInstance Constructor()
        {
            WebServer = new WebServerSendDeclarForms();
            WebServer.ReceivedMessage += WebServer_ReceivedMessage;
            return WebServer;
        }

        [ContextProperty("АргументыСобытия", "EventArgs")]
        public WsSendMessageEventArgs EventArgs
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
            if (Action1.GetType() == typeof(WsSendAction))
            {
                return DelegateAction.Create(((WsSendAction)Action1).Script, ((WsSendAction)Action1).MethodName);
            }
            return (DelegateAction)Action1;
        }

        public static WsSendAction EventHandling()
        {
            WsSendMessageEventArgs EventArgs1;
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
                osdf.DeclarativeForms.webserverSendUploaded = true;
            }
            catch (Exception ex)
            {
                osdf.DeclarativeForms.GlobalContext().Echo("ServerSend ex.Message = " + ex.Message);
                return;
            }

            //osdf.DeclarativeForms.GlobalContext().Echo("WebServerSend Listening...");

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
            // osdf.DeclarativeForms.GlobalContext().Echo("WebServerSend connected");

            try
            {
                await Echo(ws.WebSocket);
            }
            catch (Exception)
            {
                //osdf.DeclarativeForms.GlobalContext().Echo("WebServerSend ex.Message = " + ex.Message);
            }
        }

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
                    }
                    else if (result.MessageType == WebSocketMessageType.Close)
                    {
                        // osdf.DeclarativeForms.GlobalContext().Echo("WebServerSend closed");
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
                    //osdf.DeclarativeForms.GlobalContext().Echo("Отправлено сервером отправки - " + text);
                }
                catch (Exception ex)
                {
                    osdf.DeclarativeForms.GlobalContext().Echo("Не удалось отправить _webSocket.SendAsync = " + ex.StackTrace);
                    osdf.DeclarativeForms.GlobalContext().Echo("text = " + text);
                }
            }
        }

        [ContextProperty("ПриПолученииСообщения", "MessageReceived")]
        public WsSendAction MessageReceived { get; set; }

        [ContextMethod("Действие", "Action")]
        public WsSendAction Action(IRuntimeContextInstance script, string methodName)
        {
            return new WsSendAction(script, methodName);
        }

        private static void WebServer_ReceivedMessage(object sender, WsSendEventArgs e)
        {
            if (WebServer.MessageReceived != null)
            {
                WsSendMessageEventArgs WsSendMessageEventArgs1 = new WsSendMessageEventArgs(e.MessageData);
                WsSendMessageEventArgs1.EventAction = WebServer.MessageReceived;
                WsSendMessageEventArgs1.Message = e.MessageData;
                EventQueue.Enqueue(WsSendMessageEventArgs1);

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
                handler(this, new WsSendEventArgs(message));
            }
        }
    }

    public class WsSendEventArgs
    {
        public string MessageData { get; set; }
        public WsSendEventArgs(string messageData)
        {
            MessageData = messageData;
        }
    }

    [ContextClass("ВсОтправкиСообщениеАрг", "WsSendMessageEventArgs")]
    public class WsSendMessageEventArgs : AutoContext<WsSendMessageEventArgs>
    {
        public WsSendMessageEventArgs(string p1)
        {
            message = p1;
        }

        private WsSendAction eventAction;
        [ContextProperty("Действие", "EventAction")]
        public WsSendAction EventAction
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

    [ContextClass("ВсОтправкиДействие", "WsSendAction")]
    public class WsSendAction : AutoContext<WsSendAction>
    {
        public WsSendAction(IRuntimeContextInstance script, string methodName)
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
