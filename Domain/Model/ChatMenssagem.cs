using LacquaMessenger.Core.Entities;

namespace LacquaMessenger.Domain.Model
{

    public class ChatMenssagens
    {
        public ChatMenssagem chatMenssagens { get; set; }
    }

    public class ChatMenssagem : Base
    {

        public int username { get; set; }
        public string content { get; set; }
        public string attachmet { get; set; }
        public int config { get; set; }
        public string sessionChip { get; set; }
    }
}