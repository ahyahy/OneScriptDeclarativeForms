﻿using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using Hik.Communication.Scs.Communication.Messages;
using Hik.Communication.Scs.Client;

namespace oscs
{
    public class TcpClient
    {
        public CsTcpClient dll_obj;
        public IScsClient M_TcpClient;

        public TcpClient(TcpEndPoint p1)
        {
            M_TcpClient = ScsClientFactory.CreateClient(p1.M_TcpEndPoint);
            M_TcpClient.Connected += M_TcpClient_Connected;
            M_TcpClient.Disconnected += M_TcpClient_Disconnected;
            M_TcpClient.MessageSent += M_TcpClient_MessageSent;
            M_TcpClient.MessageReceived += M_TcpClient_MessageReceived;
            Connected = "";
            Disconnected = "";
            MessageReceived = "";
            MessageSent = "";
        }

        public int CommunicationState
        {
            get { return (int)M_TcpClient.CommunicationState; }
        }

        public string Connected { get; set; }

        public string Disconnected { get; set; }

        public string MessageReceived { get; set; }

        public string MessageSent { get; set; }

        public void Connect()
        {
            M_TcpClient.Connect();
        }

        public void Disconnect()
        {
            M_TcpClient.Disconnect();
        }

        private void M_TcpClient_Connected(object sender, System.EventArgs e)
        {
            if (dll_obj.Connected != null)
            {
                oscs.EventArgs EventArgs1 = new oscs.EventArgs();
                EventArgs1.EventAction = dll_obj.Connected;
                EventArgs1.Sender = this;
                CsEventArgs CsEventArgs1 = new CsEventArgs(EventArgs1);
                ClientServerDeclarForms.EventQueue.Enqueue(EventArgs1);
            }
        }

        private void M_TcpClient_Disconnected(object sender, System.EventArgs e)
        {
            if (dll_obj.Disconnected != null)
            {
                oscs.EventArgs EventArgs1 = new oscs.EventArgs();
                EventArgs1.EventAction = dll_obj.Disconnected;
                EventArgs1.Sender = this;
                CsEventArgs CsEventArgs1 = new CsEventArgs(EventArgs1);
                ClientServerDeclarForms.EventQueue.Enqueue(EventArgs1);
            }
        }

        private void M_TcpClient_MessageReceived(object sender, Hik.Communication.Scs.Communication.Messages.MessageEventArgs e)
        {
            if (dll_obj.MessageReceived != null)
            {
                oscs.MessageEventArgs MessageEventArgs1 = new oscs.MessageEventArgs(e.Message);
                MessageEventArgs1.EventAction = dll_obj.MessageReceived;
                MessageEventArgs1.Sender = this;
                CsMessageEventArgs CsMessageEventArgs1 = new CsMessageEventArgs(MessageEventArgs1);
                ClientServerDeclarForms.EventQueue.Enqueue(MessageEventArgs1);
            }
        }

        private void M_TcpClient_MessageSent(object sender, Hik.Communication.Scs.Communication.Messages.MessageEventArgs e)
        {
            if (e.Message.GetType() == typeof(ScsPingMessage))
            {
                return;
            }

            if (dll_obj.MessageSent != null)
            {
                oscs.MessageEventArgs MessageEventArgs1 = new oscs.MessageEventArgs(e.Message);
                MessageEventArgs1.EventAction = dll_obj.MessageSent;
                MessageEventArgs1.Sender = this;
                CsMessageEventArgs CsMessageEventArgs1 = new CsMessageEventArgs(MessageEventArgs1);
                ClientServerDeclarForms.EventQueue.Enqueue(MessageEventArgs1);
            }
        }

        public void SendMessage(IScsMessage p1)
        {
            M_TcpClient.SendMessage(p1);
        }
    }

    [ContextClass ("КсTCPКлиент", "CsTcpClient")]
    public class CsTcpClient : AutoContext<CsTcpClient>
    {
        public CsTcpClient(CsTcpEndPoint p1)
        {
            TcpClient TcpClient1 = new TcpClient(p1.Base_obj);
            TcpClient1.dll_obj = this;
            Base_obj = TcpClient1;
        }

        public TcpClient Base_obj;
        
        [ContextProperty("ПриОтключении", "Disconnected")]
        public IValue Disconnected { get; set; }
        
        [ContextProperty("ПриОтправкеСообщения", "MessageSent")]
        public IValue MessageSent { get; set; }
        
        [ContextProperty("ПриПодключении", "Connected")]
        public IValue Connected { get; set; }
        
        [ContextProperty("ПриПолученииСообщения", "MessageReceived")]
        public IValue MessageReceived { get; set; }
        
        [ContextProperty("СостояниеСоединения", "CommunicationState")]
        public int CommunicationState
        {
            get { return (int)Base_obj.CommunicationState; }
        }
        
        [ContextMethod("Отключить", "Disconnect")]
        public void Disconnect()
        {
            Base_obj.Disconnect();
        }
					
        [ContextMethod("ОтправитьСообщение", "SendMessage")]
        public void SendMessage(IValue p1)
        {
            Base_obj.SendMessage(((dynamic)p1).Base_obj.M_Obj);
        }

        [ContextMethod("Подключить", "Connect")]
        public void Connect()
        {
            Base_obj.Connect();
        }
    }
}
