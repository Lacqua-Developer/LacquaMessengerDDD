namespace LacquaMessenger.Domain.Models
{
    public class MessagemWhats
    {
        public class message
        {

            //public message(string json)
            //{
            //    dynamic jsonTratado = JsonValue.Parse(json);
            //  //  var d = (Dictionary<string, dynamic>)jsonTratado;
            //    foreach (var dir in jsonTratado)
            //    {
            //        var dd = dir;
            //    }
            //}
            public string id { get; set; }                     //        "id":"false_551148581164@c.us_6DA6A5BCA65AFEE022E6F96BCDE8AAC4",
            public string body { get; set; }                   //        "body":"atendimento",
            public string type { get; set; }                   //        "type":"chat",
            public string t { get; set; }                      //        "t":1601037674,
            public string notifyName { get; set; }             //        "notifyName":"",
            public string from { get; set; }                   //        "from":"551148581164@c.us",
            public string to { get; set; }                     //        "to":"5511932434657@c.us",
            public string self { get; set; }                   //        "self":"in",
            public string ack { get; set; }                    //        "ack":-1,
            public string invis { get; set; }                  //        "invis":false,
            public string isNewMsg { get; set; }               //        "isNewMsg":true,
            public string star { get; set; }                   //        "star":false,
            public string recvFresh { get; set; }              //        "recvFresh":true,
            public string broadcast { get; set; }              //        "broadcast":false,
            public string mentionedJidList { get; set; }       //        "mentionedJidList":[],
            public string isVcardOverMmsDocument { get; set; } //        "isVcardOverMmsDocument":false,
            public string isForwarded { get; set; }            //        "isForwarded":false,
            public string labels { get; set; }                 //        "labels":[],
            public string sender { get; set; }
            public string timestamp { get; set; }              //        "timestamp":1601037674,
            public string content { get; set; }                //        "content":"atendimento",
            public string isGroupMsg { get; set; }             //        "isGroupMsg":false,
            public string isMMS { get; set; }                  //        "isMMS":false,
            public string isMedia { get; set; }                //        "isMedia":false,
            public string isNotification { get; set; }         //        "isNotification":false,
            public string isPSA { get; set; }                  //        "isPSA":false,
            public string chat { get; set; }
            public string tt { get; set; }                     //        "t":1600706311,
            public string unreadCount { get; set; }            //        "unreadCount":0,
            public string archive { get; set; }                //        "archive":false,
            public string isReadOnly { get; set; }             //        "isReadOnly":false,
            public string muteExpiration { get; set; }         //        "muteExpiration":0,
            public string notSpam { get; set; }                //        "notSpam":true,
            public string pin { get; set; }                    //        "pin":0,
            public string msgs { get; set; }                   //        "msgs":null,
            public string kind { get; set; }                   //        "kind":"chat",
            public string isGroup { get; set; }                //        "isGroup":false,
            public string contact { get; set; }
            public string groupMetadata { get; set; }          //        "groupMetadata":null,
            public string presence { get; set; }
            public string isOnline { get; set; }               //        "isOnline":true,
            public string lastSeen { get; set; }               //        "lastSeen":null,
            public string chatId { get; set; }                 //        "chatId":"551148581164@c.us",
            public string quotedMsgObj { get; set; }           //        "quotedMsgObj":null,
            public string mediaData { get; set; }              //        "mediaData":{}
        }

        public class sender                                          //"sender":
        {

            public string id { get; set; }                 //            "id":"551148581164@c.us",
            public string name { get; set; }
            public string shortName { get; set; }
            public string pushname { get; set; }
            public string type { get; set; }               //            "type":"in",
            public string verifiedName { get; set; }       //            "verifiedName":"Lacqua Promotora",
            public string isBusiness { get; set; }         //            "isBusiness":true,
            public string isEnterprise { get; set; }       //            "isEnterprise":false,
            public string verifiedLevel { get; set; }      //            "verifiedLevel":0,
            public string statusMute { get; set; }         //            "statusMute":false,
            public string labels { get; set; }             //            "labels":[],
            public string formattedName { get; set; }      //            "formattedName":"+55 11 4858-1164",
            public string isMe { get; set; }               //            "isMe":false,
            public string isMyContact { get; set; }        //            "isMyContact":false,
            public string isPSA { get; set; }              //            "isPSA":false,
            public string isUser { get; set; }             //            "isUser":true,
            public string isWAContact { get; set; }        //            "isWAContact":true,
            public string profilePicThumbObj { get; set; }
            public string msgs { get; set; }               //            "msgs":null
        }


        public class chat
        {
            public string id { get; set; }                 //            "id":"551148581164@c.us",
            public string pendingMsgs { get; set; }        //            "pendingMsgs":false,
            public string lastReceivedKey { get; set; }    //            "lastReceivedKey":{
            public string fromMe { get; set; }             //                "fromMe":true,
            public string remote { get; set; }             //                "remote":"551148581164@c.us",
            public string idMsg { get; set; }              //                "id":"3EB09746F5B7C6DEC75F",
            public string _serialized { get; set; }        //                "_serialized":"true_551148581164@c.us_3EB09746F5B7C6DEC75F",
            public string t { get; set; }                  //                "t":1600706311
            public string contact { get; set; }
        }


        public class contact
        {
            public string id { get; set; }                 //                "id":"551148581164@c.us",name
            public string name { get; set; }
            public string shortName { get; set; }
            public string pushname { get; set; }
            public string type { get; set; }               //                "type":"in",
            public string verifiedName { get; set; }       //                "verifiedName":"Lacqua Promotora",
            public string isBusiness { get; set; }         //                "isBusiness":true,
            public string isEnterprise { get; set; }       //                "isEnterprise":false,
            public string verifiedLevel { get; set; }      //                "verifiedLevel":0,
            public string statusMute { get; set; }         //                "statusMute":false,
            public string labels { get; set; }             //                "labels":[
            public string formattedName { get; set; }      //             "formattedName":"+55 11 4858-1164",
            public string isMe { get; set; }               //                "isMe":false,
            public string isMyContact { get; set; }        //                "isMyContact":false,
            public string isPSA { get; set; }              //                "isPSA":false,
            public string isUser { get; set; }             //                "isUser":true,
            public string isWAContact { get; set; }        //                "isWAContact":true,
            public string profilePicThumbObj { get; set; }

            public string msgs { get; set; }               //                "msgs":null
        }




        public class profilePicThumbObj             //                "profilePicThumbObj":
        {
            public string eurl { get; set; }               //                    "eurl":null,
            public string id { get; set; }                  //                    "id":"551148581164@c.us",
            public string img { get; set; }                //                    "img":null,
            public string imgFull { get; set; }            //                    "imgFull":null,
            public string tag { get; set; }                //                    "tag":null
        }

        public class presence
        {
            public string id { get; set; }                 //                "id":"551148581164@c.us",
            public string chatstates { get; set; }         //                "chatstates"
            public string isOnline { get; set; }           //            "isOnline":true,
            public string lastSeen { get; set; }           //            "lastSeen":null
        }
    }
}