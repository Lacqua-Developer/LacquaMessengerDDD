using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Model
{


    public class messageData : Base
    {
        public messageData() { }
        public string senderId { get; set; }
        public string messageId { get; set; }
        public string recipientID { get; set; }
        public long timeOfMessage { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string message { get; set; }
        public string conversaId { get; set; }
        public string hostcli { get; set; }

        public string Print()
        {
            string ret = "";

            ret += "SenderId:" + senderId + "\n";
            ret += "messageId:" + messageId + "\n";
            ret += "recipientID:" + recipientID + "\n";
            ret += "timeOfMessage:" + timeOfMessage + "\n";
            ret += "first_name:" + first_name + "\n";
            ret += "last_name:" + last_name + "\n";
            ret += "message:" + message + "\n";
            ret += "conversaId:" + conversaId + "\n";
            ret += "hostcli:" + hostcli;
            return ret;
        }
    }

}


public class MensagemFace
{
    public string senderId { get; set; }
    public string messageId { get; set; }
    public string recipientID { get; set; }
    public long timeOfMessage { get; set; }
    public string first_name { get; set; }
    public string last_name { get; set; }
    public string message { get; set; }
    public string conversaId { get; set; }
    public string tipo { get; set; }
    public string hostcli { get; set; }
    public string telefone { get; set; }
    public string ImageProfile { get; set; }

    public string Print()
    {
        string ret = "";

        ret += "SenderId:" + senderId + "\n";
        ret += "messageId:" + messageId + "\n";
        ret += "recipientID:" + recipientID + "\n";
        ret += "timeOfMessage:" + timeOfMessage + "\n";
        ret += "first_name:" + first_name + "\n";
        ret += "last_name:" + last_name + "\n";
        ret += "message:" + message + "\n";
        ret += "conversaId:" + conversaId + "\n";
        ret += "tipo:" + tipo;
        ret += "hostcli:" + hostcli;

        return ret;
    }
}
