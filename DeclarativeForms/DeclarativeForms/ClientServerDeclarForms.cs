﻿using System;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using ScriptEngine.HostedScript.Library;
using ScriptEngine.HostedScript.Library.Binary;
using System.Collections.Concurrent;

namespace oscs
{
    [ContextClass ("КлиентСерверДекларФорм", "ClientServerDeclarForms")]
    public class ClientServerDeclarForms : AutoContext<ClientServerDeclarForms>
    {
        private static CsClientMode cs_ClientMode = new CsClientMode();
        private static CsCommunicationStates cs_CommunicationStates = new CsCommunicationStates();
        public static IValue Event = null;
        public static IValue EventAction = null;
        public static ConcurrentQueue<dynamic> EventQueue = new ConcurrentQueue<dynamic>();
        public static bool goOn = true;
        public static IValue ServerMessageReceived;
        public static IValue ServerMessageSent;
        public static int thirdPartyClientMode;

        [ScriptConstructor]
        public static IRuntimeContextInstance Constructor()
        {
            thirdPartyClientMode = cs_ClientMode.None;
            return new ClientServerDeclarForms();
        }

        public ClientServerDeclarForms Base_obj;
        
        [ContextProperty("АргументыСобытия", "EventArgs")]
        public IValue EventArgs
        {
            get { return Event; }
        }
        
        [ContextProperty("Отправитель", "Sender")]
        public IValue Sender
        {
            get { return ClientServerDeclarForms.RevertObj(((dynamic)Event).Base_obj.Sender); }
        }
        
        [ContextProperty("Продолжать", "GoOn")]
        public bool GoOn
        {
            get { return goOn; }
            set { goOn = value; }
        }
        
        [ContextProperty("РежимСтороннегоКлиента", "ThirdPartyClientMode")]
        public int ThirdPartyClientMode
        {
            get { return thirdPartyClientMode; }
            set { thirdPartyClientMode = value; }
        }

        [ContextProperty("РежимКлиента", "ClientMode")]
        public CsClientMode ClientMode
        {
            get { return cs_ClientMode; }
        }

        [ContextProperty("СостояниеСоединения", "CommunicationStates")]
        public CsCommunicationStates CommunicationStates
        {
            get { return cs_CommunicationStates; }
        }
        
        [ContextMethod("TCPКлиент", "TcpClient")]
        public CsTcpClient TcpClient(CsTcpEndPoint p1)
        {
            return new CsTcpClient(p1);
        }

        [ContextMethod("TCPКонечнаяТочка", "TcpEndPoint")]
        public CsTcpEndPoint TcpEndPoint(string p1, int p2)
        {
            return new CsTcpEndPoint(p1, p2);
        }

        [ContextMethod("TCPСервер", "TcpServer")]
        public CsTcpServer TcpServer(int p1)
        {
            return new CsTcpServer(p1);
        }

        [ContextMethod("Действие", "Action")]
        public CsAction Action(IRuntimeContextInstance script, string methodName)
        {
            return new CsAction(script, methodName);
        }

        [ContextMethod("ПолучитьСобытие", "DoEvents")]
        public DelegateAction DoEvents()
        {
            while (EventQueue.Count == 0)
            {
                System.Threading.Thread.Sleep(7);
            }

            IValue Action1 = EventHandling();
            if (Action1.GetType() == typeof(CsAction))
            {
                return DelegateAction.Create(((CsAction)Action1).Script, ((CsAction)Action1).MethodName);
            }
            return (DelegateAction)Action1;
        }

        public static IValue EventHandling()
        {
            dynamic EventArgs1;
            EventQueue.TryDequeue(out EventArgs1);
            Event = EventArgs1.dll_obj;
            EventAction = EventArgs1.EventAction;
            return EventAction;
        }

        [ContextMethod("СообщениеБайты", "ByteMessage")]
        public CsByteMessage ByteMessage(BinaryDataContext p1 = null)
        {
            return new CsByteMessage(p1);
        }

        [ContextMethod("СообщениеТекст", "TextMessage")]
        public CsTextMessage TextMessage(string p1)
        {
            return new CsTextMessage(p1);
        }

        [ContextMethod("СообщениеАрг", "MessageEventArgs")]
        public CsMessageEventArgs MessageEventArgs()
        {
        	return (CsMessageEventArgs)Event;
        }
        
        [ContextMethod("СерверКлиентАрг", "ServerClientEventArgs")]
        public CsServerClientEventArgs ServerClientEventArgs()
        {
        	return (CsServerClientEventArgs)Event;
        }
        
        public static IValue RevertObj(dynamic initialObject) 
        {
            //ScriptEngine.Machine.Values.NullValue NullValue1;
            //ScriptEngine.Machine.Values.BooleanValue BooleanValue1;
            //ScriptEngine.Machine.Values.DateValue DateValue1;
            //ScriptEngine.Machine.Values.NumberValue NumberValue1;
            //ScriptEngine.Machine.Values.StringValue StringValue1;

            //ScriptEngine.Machine.Values.GenericValue GenericValue1;
            //ScriptEngine.Machine.Values.TypeTypeValue TypeTypeValue1;
            //ScriptEngine.Machine.Values.UndefinedValue UndefinedValue1;

            try
            {
                if (initialObject == null)
                {
                    return (IValue)null;
                }
            }
            catch { }

            try
            {
                string str_initialObject = initialObject.GetType().ToString();
            }
            catch
            {
                return (IValue)null;
            }

            dynamic Obj1 = null;
            string str1 = initialObject.GetType().ToString();
            try
            {
                Obj1 = initialObject.dll_obj;
            }
            catch { }
            if (Obj1 != null)
            {
                return (IValue)Obj1;
            }

            try
            {
                Obj1 = initialObject.M_Object.dll_obj;
            }
            catch { }
            if (Obj1 != null)
            {
                return (IValue)Obj1;
            }

            try // если initialObject не из пространства имен oscs, то есть Уровень1
            {
                if (!str1.Contains("oscs."))
                {
                    string str2 = "oscs.Cs" + str1.Substring(str1.LastIndexOf(".") + 1);
                    System.Type TestType = System.Type.GetType(str2, false, true);
                    object[] args = { initialObject };
                    Obj1 = Activator.CreateInstance(TestType, args);
                }
            }
            catch { }
            if (Obj1 != null)
            {
                return (IValue)Obj1;
            }

            try // если initialObject из пространства имен oscs, то есть Уровень2
            {
                if (str1.Contains("oscs."))
                {
                    string str3 = str1.Replace("oscs.", "oscs.Cs");
                    System.Type TestType = System.Type.GetType(str3, false, true);
                    object[] args = { initialObject };
                    Obj1 = Activator.CreateInstance(TestType, args);
                }
            }
            catch { }
            if (Obj1 != null)
            {
                return (IValue)Obj1;
            }

            string str4 = null;
            try
            {
                str4 = initialObject.SystemType.Name;
            }
            catch
            {
                if ((str1 == "System.String") ||
                (str1 == "System.Decimal") ||
                (str1 == "System.Int32") ||
                (str1 == "System.Boolean") ||
                (str1 == "System.DateTime"))
                {
                    return (IValue)ValueFactory.Create(initialObject);
                }
                else if (str1 == "System.Byte")
                {
                    int vOut = Convert.ToInt32(initialObject);
                    return (IValue)ValueFactory.Create(vOut);
                }
                else if (str1 == "System.DBNull")
                {
                    string vOut = Convert.ToString(initialObject);
                    return (IValue)ValueFactory.Create(vOut);
                }
            }
			
            if (str4 == "Неопределено")
            {
                return (IValue)null;
            }
            if (str4 == "Булево")
            {
                return (IValue)initialObject;
            }
            if (str4 == "Дата")
            {
                return (IValue)initialObject;
            }
            if (str4 == "Число")
            {
                return (IValue)initialObject;
            }
            if (str4 == "Строка")
            {
                return (IValue)initialObject;
            }
            return (IValue)initialObject;
        }
			
        public static dynamic RedefineIValue(dynamic p1)
        {
            if (p1.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
            {
                return p1.AsString();
            }
            else if (p1.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
            {
                return p1.AsNumber();
            }
            else if (p1.GetType() == typeof(ScriptEngine.Machine.Values.BooleanValue))
            {
                return p1.AsBoolean();
            }
            else if (p1.GetType() == typeof(ScriptEngine.Machine.Values.DateValue))
            {
                return p1.AsDate();
            }
            else if (p1.GetType() == typeof(BinaryDataContext))
            {
                return p1.Buffer;
            }
            else
            {
                return p1;
            }
        }
    }
}
