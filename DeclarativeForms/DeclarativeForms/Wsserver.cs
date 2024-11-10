using System;
using System.Net;
using System.Net.WebSockets;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.HostedScript.Library;
using ScriptEngine.Machine;
using System.Threading.Tasks;
using System.Collections.Concurrent;

namespace osws
{
    [ContextClass("ВебСерверДекларФорм", "WsserverDeclarForms")]
    public class WsserverDeclarForms : AutoContext<WsserverDeclarForms>
    {
        private static string iPAddress;
        private static int port;
        public static WsserverDeclarForms instance;
        public static WsMessageEventArgs Event = null;
        public static WsAction EventAction = null;
        public static ConcurrentQueue<WsMessageEventArgs> EventQueue = new ConcurrentQueue<WsMessageEventArgs>();
        public static bool goOn = true;
        // Это событие возникает при получении нового сообщения.
        public event EventHandler<MessageEventArgs> MessageReceived;

        [ScriptConstructor]
        public static IRuntimeContextInstance Constructor()
        {
            instance = new WsserverDeclarForms();
            instance.MessageReceived += Instance_MessageReceived;
            return instance;
        }

        [ContextProperty("АргументыСобытия", "EventArgs")]
        public WsMessageEventArgs EventArgs
        {
            get { return Event; }
        }

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
            if (Action1.GetType() == typeof(WsAction))
            {
                return DelegateAction.Create(((WsAction)Action1).Script, ((WsAction)Action1).MethodName);
            }
            return (DelegateAction)Action1;
        }

        public static WsAction EventHandling()
        {
            WsMessageEventArgs EventArgs1;
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
            listener.Start();

            osdf.DeclarativeForms.wsserverOn = true;
            osdf.DeclarativeForms.GlobalContext().Echo("Listening...");

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
            //osdf.DeclarativeForms.GlobalContext().Echo("WebSocket connected");
            await Echo(ws.WebSocket);
        }

        static async Task Echo(WebSocket ws)
        {
            //var buffer = new byte[1024 * 4];
            var buffer = new byte[1024 * 1024 * 128]; //128 Megabytes.
            while (true)
            {
                var result = await ws.ReceiveAsync(new ArraySegment<byte>(buffer), System.Threading.CancellationToken.None);
                if (result.MessageType == WebSocketMessageType.Text)
                {
                    string message1 = System.Text.Encoding.UTF8.GetString(buffer, 0, result.Count);
                    //osdf.DeclarativeForms.GlobalContext().Echo("Received: " + message1);

                    instance.OnMessageReceived(message1);

                    string message = osdf.DeclarativeForms.strFunctions;

                    var bytes = System.Text.Encoding.UTF8.GetBytes(message);
                    await ws.SendAsync(new ArraySegment<byte>(bytes, 0, bytes.Length), WebSocketMessageType.Text, true, System.Threading.CancellationToken.None);

                    osdf.DeclarativeForms.strFunctions = "";
                }
                else if (result.MessageType == WebSocketMessageType.Close)
                {
                    osdf.DeclarativeForms.wsserverOn = false;
                    osdf.DeclarativeForms.GlobalContext().Echo("WebSocket closed");
                    break;
                }
            }
        }

        [ContextProperty("ПриПолученииСообщения", "MessageReceived")]
        public WsAction MessageReceived1 { get; set; }

        [ContextMethod("Действие", "Action")]
        public WsAction Action(IRuntimeContextInstance script, string methodName)
        {
            return new WsAction(script, methodName);
        }

        private static void Instance_MessageReceived(object sender, MessageEventArgs e)
        {
            //osdf.DeclarativeForms.GlobalContext().Echo("========================DfWsserver_MessageReceived");
            if (instance.MessageReceived1 != null)
            {
                WsMessageEventArgs WsMessageEventArgs1 = new WsMessageEventArgs(e.MessageData);
                WsMessageEventArgs1.EventAction = instance.MessageReceived1;
                WsMessageEventArgs1.Message = e.MessageData;
                //MessageEventArgs1.Sender = this;
                EventQueue.Enqueue(WsMessageEventArgs1);

                while (EventQueue.Count > 0)
                {
                    System.Threading.Thread.Sleep(7);
                }
            }
        }

        // Вызывает событие MessageReceived.
        // "message" - Полученное сообщение.
        public void OnMessageReceived(string message)
        {
            var handler = MessageReceived;
            if (handler != null)
            {
                handler(this, new MessageEventArgs(message));
            }
        }
    }

    public class MessageEventArgs
    {
        // Данные сообщения, которые передаются.
        public string MessageData { get; set; }

        ////// Пустой конструктор по умолчанию.
        ////public MessageEventArgs()
        ////{
        ////}

        // Создает новый объект ScsRawDataMessage со свойством MessageData.
        // "messageData" - Данные сообщения, которые передаются.
        public MessageEventArgs(string messageData)
        {
            MessageData = messageData;
        }

        //////[ContextProperty("Действие", "EventAction")]
        ////public WsAction EventAction
        ////{
        ////    get { return EventAction; }
        ////    set { EventAction = value; }
        ////}
    }

    [ContextClass("ВсСообщениеАрг", "WsMessageEventArgs")]
    public class WsMessageEventArgs : AutoContext<WsMessageEventArgs>
    {
        public WsMessageEventArgs(string p1)
        {
            message = p1;
        }

        private WsAction eventAction;
        [ContextProperty("Действие", "EventAction")]
        public WsAction EventAction
        {
            get { return eventAction; }
            set { eventAction = value; }
        }

        //[ContextProperty("Отправитель", "Sender")]
        //public IValue Sender
        //{
        //    get { return Base_obj.Sender.dll_obj; }
        //}

        private string message;
        [ContextProperty("Сообщение", "Message")]
        public string Message
        {
            get { return message; }
            set { message = value; }
        }
    }

    public class WsEventArgs
    {
        public WsEventArgs()
        {
        }

        //[ContextProperty("Действие", "EventAction")]
        //public IValue EventAction
        //{
        //    get { return Base_obj.EventAction; }
        //    set { Base_obj.EventAction = value; }
        //}

        //[ContextProperty("Отправитель", "Sender")]
        //public IValue Sender
        //{
        //    get { return OneScriptClientServer.RevertObj(Base_obj.Sender); }
        //}
    }

    [ContextClass("ВсДействие", "WsAction")]
    public class WsAction : AutoContext<WsAction>
    {
        public WsAction(IRuntimeContextInstance script, string methodName)
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
