using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LacquaMessenger.Domain.Entities
{
    public partial class RetornoAck
    {
        [Key]
        public int IdAck { get; set; }
        public bool? FromMe { get; set; }
        public string? Remote { get; set; }
        public string? Id { get; set; }
        public string? Serialized { get; set; }
        public string? Body { get; set; }
        public string? Type { get; set; }
        public long? T { get; set; }
        public string? NotifyName { get; set; }
        public string? From { get; set; }
        public string? To { get; set; }
        public string? Self { get; set; }
        public string? Ack { get; set; }
        public bool? Invis { get; set; }
        public bool? IsNewMsg { get; set; }
        public bool? Star { get; set; }
        public bool? RecvFresh { get; set; }
        public bool? IsFromTemplate { get; set; }
        public bool? IsVcardOverMmsDocument { get; set; }
        public bool? IsForwarded { get; set; }
        public long? EphemeralStartTimestamp { get; set; }
    }
}
