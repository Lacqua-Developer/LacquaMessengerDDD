using LacquaMessenger.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace LacquaMessenger.App.Core
{
    public class AnalyzeResponseBot
    {



        public async Task<string> Exec(string from, string to, string id, string name, string message, string origem, string tipo, string url, string imageurl)
        {
            ContatoSevice wsContato = new ContatoSevice();
            ConversaService wsConversa = new ConversaService();
            SessaoService wsSessao = new SessaoService();
            imageurl = CommonLib.Util.ConvertType.IsNull(imageurl, "").ToString();
            imageurl = imageurl.Length > 0 ? (imageurl.Substring(imageurl.Length - 1, 1).Trim() == "," ? imageurl.Substring(0, imageurl.Length - 1).Trim() : imageurl) : null;
            var messageData = "";
            var regex = new Regex("/^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$/");
            Anexo an = new Anexo();
            try
            {
                CommonLib.Util.Write.Log(DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss") + " - " +
                                         "WhatsAppCore Session Telefone: " +
                                         this.phoneNum + " - " + "Mensagem recebida de " + from + " Cliente:" + name + " Mensagem: " + message);
                var de = "";
                try
                {
                    if (from.Contains("@"))
                    {
                        de = from.Substring(0, from.IndexOf('@'));
                    }
                    else
                    {
                        de = from;
                    }
                }
                catch
                {
                    de = "00000000000";
                }

                Sessao sessao = new Sessao();
                Contato contato = new Contato();
                Conversa conversa = new Conversa();
                var ofensa = OfensaServ.GetOfensaPalavras();
                var ofensaComp = OfensaServ.GetOfensaPalavras(true);

                ListaService ls = new ListaService();
                Lista lista = new Lista();

                int ver_id = 0;
                string xx = message;
                //addHistorico(name,message);
                contato.IdContato = int.TryParse(id, out ver_id) ? ver_id : 0;
                contato.NomeRetornado = name;
                contato.UserWhatsApp = from;
                contato.IdWhatsApp = from;
                contato.FaceId = id;
                contato.Cadastro = origem;
                contato.ImageProfile = imageurl;
                contato.Telefone = from.IndexOf('@') > -1 ? from.Split('@')[0] : from;
                contato.IdConfig = _config.ID;
                contato.FaceRecipentId = to;


                var retContato = await wsContato.setContato(contato);
                //CommonLib.Util.Write.Log("Contato - " + CommonLib.Util.Util_JSonConvert.Serialize<Contato>(retContato));
                if (retContato != null)
                {

                    sessao.Contato_Idcontato = retContato.IdContato;
                    sessao.Config_idconfig = cfg.ID;
                    var idlst = retContato.Lista != null ? retContato.Lista.IdLista : 0;



                    var sessaos = await wsSessao.getOpenSessao(sessao);

                    conversa.Config_IdConfig = _config.ID;
                    conversa.Contatos_IdContato = retContato.IdContato;
                    conversa.IdConversaWhats = id;
                    conversa.Sentido = "Entrada";
                    conversa.Data = DateTime.Now;
                    conversa.Destino = (sessaos.Count > 0 ? "Sessao: " + sessaos[0].IdSession.ToString() : "Robot");
                    conversa.Mensagem = message;
                    conversa.Origem = origem == "WhatsApp" ? 0 : 1;


                    var retConversa = await wsConversa.setConversa(conversa);
                    if (tipo != "chat" && url.Length > 0)
                    {
                        var arquivo = url.Split('/');
                        var ext = arquivo[arquivo.Length - 1].Split('.');
                        string tipoArquivoAnexo = "";
                        if (ext.Length > 1)
                        {
                            tipoArquivoAnexo = CommonLib.Util.MimeTypes.GetMimeTypeArquivo("." + ext[ext.Length - 1]);
                        }

                        var anexo = new Anexo(0, retConversa.IdConversa, url, arquivo[arquivo.Length - 1], tipoArquivoAnexo);

                        var anexoServ = new AnexoService();

                        anexoServ.setAnexos(anexo);
                    }
                    CommonLib.Util.Write.Log("Conversas - " + retConversa.ToString());
                    StatusAtendimento st = new StatusAtendimento();
                    string MSG = "";
                    string ret = "";

                    string[] retMsg;

                    string[] frm = from.Split('@');
                    CommonLib.Util.Write.Log("Sessaos - " + sessaos.ToString());
                    //Desistência
                    var desistencia = parametro.Desistencia.ToUpper().Split('|');
                    List<string> lstDes = desistencia.OfType<string>().ToList();


                    if (lstDes.Contains(message.Trim().ToUpper()))
                    {
                        sessao = await wsSessao.setSessao(sessao);

                        conversa.Mensagem = "Obrigado, Desculpe-me pelo incômodo!";

                        conversa.Contatos_IdContato = retContato.IdContato;
                        conversa.IdConversaWhats = "";
                        conversa.Sentido = "Entrada";
                        conversa.Data = DateTime.Now;
                        conversa.Destino = "Tranf";
                        conversa.Config_IdConfig = _config.ID;
                        conversa = await wsConversa.setConversa(conversa);

                        retContato.Status = "Bloqueado";
                        wsContato.setContato(retContato);
                        return "Obrigado, Desculpe-me pelo incômodo!";
                    }


                    if (message.Trim().ToUpper() == parametro.PalavraTransf.ToUpper() || (sessaos.Count == 0 && idlst == 0) && sessaos.Count == 0)
                    {

                        if (message.Trim().ToUpper() == parametro.PalavraTransf.ToUpper())
                        {
                            sessao = await wsSessao.setSessao(sessao);

                            conversa.Mensagem = "Aguarde um instante que um colaborador nosso irá atende-lo!";
                            conversa.Sentido = "Entrada";
                            conversa.Destino = "Tansf";

                            conversa.Contatos_IdContato = retContato.IdContato;
                            conversa.IdConversaWhats = id;

                            conversa.Data = DateTime.Now;

                            conversa.Config_IdConfig = _config.ID;
                            conversa = await wsConversa.setConversa(conversa);
                            await WhatsAppData.Brocker.RabbitMQ.EnviaRabbitMQ(sessao.Usuario_IdUsuario, "Espera", $"tipo:Espera,UltimoIdConversa:{conversa.IdConversa.ToString()}, IdContato:{conversa.Contatos_IdContato}", conversa.Sentido);
                            return conversa.Mensagem;
                        }
                        else if (parametro.CampanhaIdcampanha == 0)
                        {
                            conversa.Mensagem = $"Obrigado pelo contato, caso deseje mais alguma informacão digitar '{parametro.PalavraTransf.ToUpper()}'!";
                            conversa.Sentido = "Saida";
                            conversa.Destino = "Robot";
                            conversa.Contatos_IdContato = retContato.IdContato;
                            conversa.IdConversaWhats = id;

                            conversa.Data = DateTime.Now;

                            conversa.Config_IdConfig = _config.ID;
                            conversa = await wsConversa.setConversa(conversa);
                            return conversa.Mensagem;
                        }
                    }

                    if (sessaos.Count > 0)
                    {
                        sessao.Conversa_IdConversa = retConversa.IdConversa;
                        sessao.IdSession = sessaos[0].IdSession;
                        await wsSessao.setAtendimento(sessao.IdSession, sessao.Conversa_IdConversa);
                        await WhatsAppData.Brocker.RabbitMQ.EnviaRabbitMQ(sessaos[0].Usuario_IdUsuario, "Ativos", $"tipo:Ativos,UltimoIdConversa:{retConversa.IdConversa.ToString()} ,Idcontato:{retConversa.Contatos_IdContato}", retConversa.Sentido);
                        return "";
                    }
                    else
                    {

                        if (retContato.StatusAtendimento != null) //(Int64.TryParse(message, out ver))
                        {
                            if (retContato.StatusAtendimento.FluxoDestinoEsperado == null)
                            {
                                FluxoAtendimento FluxoAtendimento = new FluxoAtendimento();

                                retContato.StatusAtendimento.FluxoDestinoEsperado = FluxoAtendimento;
                                retContato.StatusAtendimento.FluxoDestinoEsperado.Tipo = 1;
                            }

                            if (TratamentoTexto.ValidaOfensa(message, out MSG))
                            {
                                switch (retContato.StatusAtendimento.TipoFluxo)
                                {

                                    case 2:
                                        if (TratamentoTexto.ValidaContato(message, retContato))
                                        {
                                            MSG = TratamentoTexto.SubstituiTexto(retContato.StatusAtendimento.FluxoDestinoEsperado.Mensagem.Texto, retContato);
                                            st.ContatoIdContato = retContato.IdContato;
                                            st.IdFluxoDestinoEsperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao1;
                                            st.IdFluxoDestinoInesperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao2;
                                            st.FluxoOrigem = retContato.StatusAtendimento.FluxoDestinoEsperado.IdFluxoAtendimento;
                                            st.ListaIdLista = retContato.StatusAtendimento.ListaIdLista;
                                            st.Finalizado = retContato.StatusAtendimento.FluxoDestinoEsperado.Finalizado;
                                            st.RespostaEsperada = retContato.StatusAtendimento.FluxoDestinoEsperado.Chave;
                                            st.TipoFluxo = retContato.StatusAtendimento.FluxoDestinoEsperado.Tipo;
                                            CkAnexo(an, retContato, st.RespostaEsperada, st.TipoFluxo);

                                        }
                                        else
                                        {
                                            MSG = TratamentoTexto.SubstituiTexto(retContato.StatusAtendimento.FluxoDestinoInesperado.Mensagem.Texto, retContato);
                                            st = retContato.StatusAtendimento;
                                            //st.ContatoIdContato = retContato.IdContato;
                                            //st.IdFluxoDestinoEsperado = retContato.StatusAtendimento.FluxoDestinoInesperado.Condicao1;
                                            //st.IdFluxoDestinoInesperado = retContato.StatusAtendimento.FluxoDestinoInesperado.Condicao2;
                                            //st.FluxoOrigem = retContato.StatusAtendimento.FluxoDestinoInesperado.IdFluxoAtendimento;
                                            //st.ListaIdLista = retContato.StatusAtendimento.ListaIdLista;
                                            //st.Finalizado = retContato.StatusAtendimento.FluxoDestinoInesperado.Finalizado;
                                            //st.RespostaEsperada = retContato.StatusAtendimento.FluxoDestinoInesperado.Chave;
                                            //st.TipoFluxo = retContato.StatusAtendimento.FluxoDestinoInesperado.Tipo;
                                            //CkAnexo(an, retContato, st.RespostaEsperada, st.TipoFluxo);
                                        }
                                        break;

                                    case 3:


                                        if (TratamentoTexto.ValidaConfirmacao(message, out MSG))
                                        {
                                            MSG = TratamentoTexto.SubstituiTexto(retContato.StatusAtendimento.FluxoDestinoEsperado.Mensagem.Texto, retContato);

                                            st.ContatoIdContato = retContato.IdContato;
                                            st.IdFluxoDestinoEsperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao1;
                                            st.IdFluxoDestinoInesperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao2;
                                            st.FluxoOrigem = retContato.StatusAtendimento.FluxoDestinoEsperado.IdFluxoAtendimento;
                                            st.ListaIdLista = retContato.StatusAtendimento.ListaIdLista;
                                            st.Finalizado = retContato.StatusAtendimento.FluxoDestinoEsperado.Finalizado;
                                            st.RespostaEsperada = retContato.StatusAtendimento.FluxoDestinoEsperado.Chave;
                                            st.TipoFluxo = retContato.StatusAtendimento.FluxoDestinoEsperado.Tipo;
                                            CkAnexo(an, retContato, st.RespostaEsperada, st.TipoFluxo);
                                        }
                                        else
                                        {
                                            if (MSG.Length == 0)
                                            {
                                                MSG = TratamentoTexto.SubstituiTexto(retContato.StatusAtendimento.FluxoDestinoInesperado.Mensagem.Texto, retContato);

                                                st.ContatoIdContato = retContato.IdContato;
                                                st.IdFluxoDestinoEsperado = retContato.StatusAtendimento.FluxoDestinoInesperado.Condicao1;
                                                st.IdFluxoDestinoInesperado = retContato.StatusAtendimento.FluxoDestinoInesperado.Condicao2;
                                                st.FluxoOrigem = retContato.StatusAtendimento.FluxoDestinoInesperado.IdFluxoAtendimento;
                                                st.Finalizado = retContato.StatusAtendimento.FluxoDestinoInesperado.Finalizado;
                                                st.ListaIdLista = retContato.StatusAtendimento.ListaIdLista;

                                                st.RespostaEsperada = retContato.StatusAtendimento.FluxoDestinoInesperado.Chave;
                                                st.TipoFluxo = retContato.StatusAtendimento.FluxoDestinoInesperado.Tipo;
                                                CkAnexo(an, retContato, st.RespostaEsperada, st.TipoFluxo);
                                            }
                                        }
                                        break;

                                    case 4:

                                        if (TratamentoTexto.ValidaQuestionamento(message, retContato, out MSG))
                                        {
                                            MSG = TratamentoTexto.SubstituiTexto(retContato.StatusAtendimento.FluxoDestinoEsperado.Mensagem.Texto, retContato);

                                            st.ContatoIdContato = retContato.IdContato;
                                            st.IdFluxoDestinoEsperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao1;
                                            st.IdFluxoDestinoInesperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao2;
                                            st.FluxoOrigem = retContato.StatusAtendimento.FluxoDestinoEsperado.IdFluxoAtendimento;
                                            st.ListaIdLista = retContato.StatusAtendimento.ListaIdLista;
                                            st.Finalizado = retContato.StatusAtendimento.FluxoDestinoEsperado.Finalizado;
                                            st.RespostaEsperada = retContato.StatusAtendimento.FluxoDestinoEsperado.Chave;
                                            st.TipoFluxo = retContato.StatusAtendimento.FluxoDestinoEsperado.Tipo;
                                            CkAnexo(an, retContato, st.RespostaEsperada, st.TipoFluxo);
                                        }
                                        else
                                        {
                                            MSG = TratamentoTexto.SubstituiTexto(retContato.StatusAtendimento.FluxoDestinoInesperado.Mensagem.Texto, retContato);

                                            st.ContatoIdContato = retContato.IdContato;
                                            st.IdFluxoDestinoEsperado = retContato.StatusAtendimento.FluxoDestinoInesperado.Condicao1;
                                            st.IdFluxoDestinoInesperado = retContato.StatusAtendimento.FluxoDestinoInesperado.Condicao2;
                                            st.FluxoOrigem = retContato.StatusAtendimento.FluxoDestinoInesperado.IdFluxoAtendimento;
                                            st.ListaIdLista = retContato.StatusAtendimento.ListaIdLista;
                                            st.Finalizado = retContato.StatusAtendimento.FluxoDestinoInesperado.Finalizado;
                                            st.RespostaEsperada = retContato.StatusAtendimento.FluxoDestinoInesperado.Chave;
                                            st.TipoFluxo = retContato.StatusAtendimento.FluxoDestinoInesperado.Tipo;
                                            CkAnexo(an, retContato, st.RespostaEsperada, st.TipoFluxo);
                                        }
                                        break;

                                    case 5:
                                        if (TratamentoTexto.ValidaOpcoes(message, retContato, out MSG))
                                        {
                                            MSG = TratamentoTexto.SubstituiTexto(MSG, retContato);

                                            st.ContatoIdContato = retContato.IdContato;
                                            st.IdFluxoDestinoEsperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao1;
                                            st.IdFluxoDestinoInesperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao2;
                                            st.FluxoOrigem = retContato.StatusAtendimento.FluxoDestinoEsperado.IdFluxoAtendimento;
                                            st.ListaIdLista = retContato.StatusAtendimento.ListaIdLista;
                                            st.Finalizado = retContato.StatusAtendimento.FluxoDestinoEsperado.Finalizado;
                                            st.RespostaEsperada = retContato.StatusAtendimento.FluxoDestinoEsperado.Chave;
                                            st.TipoFluxo = retContato.StatusAtendimento.FluxoDestinoEsperado.Tipo;
                                            CkAnexo(an, retContato, st.RespostaEsperada, st.TipoFluxo);
                                        }
                                        else
                                        {
                                            MSG = TratamentoTexto.SubstituiTexto(retContato.StatusAtendimento.FluxoDestinoInesperado.Mensagem.Texto, retContato);

                                            st.ContatoIdContato = retContato.IdContato;
                                            st.IdFluxoDestinoEsperado = retContato.StatusAtendimento.FluxoDestinoInesperado.Condicao1;
                                            st.IdFluxoDestinoInesperado = retContato.StatusAtendimento.FluxoDestinoInesperado.Condicao2;
                                            st.FluxoOrigem = retContato.StatusAtendimento.FluxoDestinoInesperado.IdFluxoAtendimento;
                                            st.ListaIdLista = retContato.StatusAtendimento.ListaIdLista;
                                            st.Finalizado = retContato.StatusAtendimento.FluxoDestinoInesperado.Finalizado;
                                            st.RespostaEsperada = retContato.StatusAtendimento.FluxoDestinoInesperado.Chave;
                                            st.TipoFluxo = retContato.StatusAtendimento.FluxoDestinoInesperado.Tipo;
                                            CkAnexo(an, retContato, st.RespostaEsperada, st.TipoFluxo);
                                        }
                                        break;

                                    case 6:

                                        sessao.Contato_Idcontato = retContato.IdContato;
                                        sessao.Config_idconfig = cfg.ID;

                                        MSG = TratamentoTexto.SubstituiTexto(retContato.StatusAtendimento.FluxoDestinoEsperado.Mensagem.Texto, retContato);
                                        st.ContatoIdContato = retContato.IdContato;
                                        st.IdFluxoDestinoEsperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao1;
                                        st.IdFluxoDestinoInesperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao2;
                                        st.FluxoOrigem = retContato.StatusAtendimento.FluxoDestinoEsperado.IdFluxoAtendimento;
                                        st.ListaIdLista = retContato.StatusAtendimento.ListaIdLista;
                                        st.Finalizado = retContato.StatusAtendimento.FluxoDestinoEsperado.Finalizado;
                                        st.RespostaEsperada = retContato.StatusAtendimento.FluxoDestinoEsperado.Chave;
                                        st.TipoFluxo = retContato.StatusAtendimento.FluxoDestinoEsperado.Tipo;
                                        CkAnexo(an, retContato, st.RespostaEsperada, st.TipoFluxo);
                                        sessao = wsSessao.setSessao(sessao).Result;


                                        break;

                                    case 7:

                                        if (message.Length > 3 && regex.IsMatch(message))
                                        {
                                            sessao.Contato_Idcontato = retContato.IdContato;
                                            sessao.Config_idconfig = cfg.ID;

                                            MSG = TratamentoTexto.SubstituiTexto(retContato.StatusAtendimento.FluxoDestinoEsperado.Mensagem.Texto, retContato);
                                            st.ContatoIdContato = retContato.IdContato;
                                            st.IdFluxoDestinoEsperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao1;
                                            st.IdFluxoDestinoInesperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao2;
                                            st.FluxoOrigem = retContato.StatusAtendimento.FluxoDestinoEsperado.IdFluxoAtendimento;
                                            st.ListaIdLista = retContato.StatusAtendimento.ListaIdLista;
                                            st.Finalizado = retContato.StatusAtendimento.FluxoDestinoEsperado.Finalizado;
                                            st.RespostaEsperada = retContato.StatusAtendimento.FluxoDestinoEsperado.Chave;
                                            st.TipoFluxo = retContato.StatusAtendimento.FluxoDestinoEsperado.Tipo;
                                            CkAnexo(an, retContato, st.RespostaEsperada, st.TipoFluxo);
                                            sessao = await wsSessao.setSessao(sessao);
                                        }
                                        else
                                        {
                                            MSG = "A identificação deve ter somente letras e ser maior que 3 caracteres!";
                                        }

                                        break;

                                    case 8:

                                        MSG = TratamentoTexto.SubstituiTexto(retContato.StatusAtendimento.FluxoDestinoEsperado.Mensagem.Texto, retContato);
                                        switch (retContato.StatusAtendimento.FluxoDestinoEsperado.Chave)
                                        {
                                            case "Anexo1":
                                                an.url = retContato.Lista.Anexo1;
                                                break;
                                            case "Anexo2":
                                                an.url = retContato.Lista.Anexo2;
                                                break;
                                            case "Anexo3":
                                                an.url = retContato.Lista.Anexo3;
                                                break;
                                        }


                                        st.ContatoIdContato = retContato.IdContato;
                                        st.IdFluxoDestinoEsperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao1;
                                        st.IdFluxoDestinoInesperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao2;
                                        st.FluxoOrigem = retContato.StatusAtendimento.FluxoDestinoEsperado.IdFluxoAtendimento;
                                        st.ListaIdLista = retContato.StatusAtendimento.ListaIdLista;
                                        st.Finalizado = retContato.StatusAtendimento.FluxoDestinoEsperado.Finalizado;
                                        st.RespostaEsperada = retContato.StatusAtendimento.FluxoDestinoEsperado.Chave;
                                        st.TipoFluxo = retContato.StatusAtendimento.FluxoDestinoEsperado.Tipo;
                                        break;

                                    default:

                                        MSG = TratamentoTexto.SubstituiTexto(retContato.StatusAtendimento.FluxoDestinoEsperado.Mensagem.Texto, retContato);
                                        CampanhaService campanha = new CampanhaService();
                                        var camp = campanha.getCampanhaInicial();

                                        st.ContatoIdContato = retContato.IdContato;
                                        st.IdFluxoDestinoEsperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao1;
                                        st.IdFluxoDestinoInesperado = retContato.StatusAtendimento.FluxoDestinoEsperado.Condicao2;
                                        st.FluxoOrigem = retContato.StatusAtendimento.FluxoDestinoEsperado.IdFluxoAtendimento;
                                        st.ListaIdLista = retContato.StatusAtendimento.ListaIdLista;
                                        st.Finalizado = retContato.StatusAtendimento.FluxoDestinoEsperado.Finalizado;
                                        st.RespostaEsperada = retContato.StatusAtendimento.FluxoDestinoEsperado.Chave;
                                        st.TipoFluxo = retContato.StatusAtendimento.FluxoDestinoEsperado.Tipo;
                                        CkAnexo(an, retContato, st.RespostaEsperada, st.TipoFluxo);
                                        break;
                                }
                            }

                        }
                        else
                        {
                            MSG = TratamentoTexto.SubstituiTexto(parametro.MensagemSaudacao.Texto, contato);
                            CampanhaService cs = new CampanhaService();
                            var camp = new Campanha(parametro.CampanhaIdcampanha);
                            var camplst = cs.getCampanha(camp);
                            camp = camplst.Count > 0 ? camplst[0] : null;


                            if (camp != null)
                            {
                                var retContatoLista = wsContato.getLiscaContato(retContato, camp.IdCampanha);
                                if (camp.FluxoAtendimento.Length > 0 ? camp.FluxoAtendimento[0].Tipo == 6 : false)
                                {

                                    sessao.Contato_Idcontato = retContato.IdContato;
                                    sessao.Config_idconfig = cfg.ID;
                                    st.ContatoIdContato = retContato.IdContato;
                                    st.IdFluxoDestinoEsperado = 0;
                                    st.IdFluxoDestinoInesperado = 0;
                                    st.FluxoOrigem = camp.FluxoAtendimento[0].IdFluxoAtendimento;
                                    st.idCampanha = camp.IdCampanha;
                                    st.ListaIdLista = retContatoLista.Lista != null ? retContatoLista.Lista.IdLista : 0;
                                    st.Finalizado = true;
                                    st.RespostaEsperada = "";
                                    st.TipoFluxo = camp.FluxoAtendimento[0].Tipo;

                                    sessao = await wsSessao.setSessao(sessao);
                                }
                                else
                                {

                                    st.ContatoIdContato = retContato.IdContato;
                                    st.IdFluxoDestinoEsperado = camp.FluxoAtendimento[0].Condicao1;
                                    st.IdFluxoDestinoInesperado = camp.FluxoAtendimento[0].Condicao2;
                                    st.FluxoOrigem = camp.FluxoAtendimento[0].IdFluxoAtendimento;
                                    st.ListaIdLista = retContatoLista.Lista != null ? retContatoLista.Lista.IdLista : 0;
                                    st.Finalizado = camp.FluxoAtendimento[0].Finalizado;
                                    st.RespostaEsperada = camp.FluxoAtendimento[0].Chave;
                                    st.TipoFluxo = camp.FluxoAtendimento[0].Tipo;
                                    CkAnexo(an, retContato, st.RespostaEsperada, st.TipoFluxo);
                                }

                                if (retContatoLista.Lista != null)
                                {
                                    lista.Ativo = false;
                                    lista.CampanhaIdCampanha = 1;
                                    lista.Chave = "";
                                    lista.ContatoIdContato = retContato.IdContato;
                                    lista.Nome = retContato.NomeRetornado;
                                    lista.FacebookId = from.ToString();
                                    lista = ls.setLista(lista);
                                }
                                else
                                {
                                    lista.Ativo = false;
                                    lista.CampanhaIdCampanha = 1;
                                    lista.Chave = "";
                                    lista.ContatoIdContato = retContato.IdContato;
                                    lista.Nome = retContato.NomeRetornado;
                                    lista.FacebookId = from.ToString();
                                    lista = ls.setLista(lista);
                                }
                            }
                        }

                        try
                        {
                            conversa.Mensagem = MSG;

                            conversa.Contatos_IdContato = retContato.IdContato;
                            conversa.IdConversaWhats = "";
                            conversa.Sentido = "Saida";
                            conversa.Data = DateTime.Now;
                            conversa.Destino = retContato.StatusAtendimento.TipoFluxo == 6 ? "Tranf" : "Robot";
                            conversa.Config_IdConfig = _config.ID;
                            conversa = await wsConversa.setConversa(conversa);
                            st.ConversaIdConversa = conversa.IdConversa;
                            st.ContatoIdContato = retContato.IdContato;
                            lista.ConversaIdConversa = conversa.IdConversa;
                            lista.CampanhaIdCampanha = 1;
                            var url_x = an.url != null ? an.url : "";

                            if (url_x.Length > 0)
                            {
                                var conversaAn = new Conversa();
                                conversaAn.Contatos_IdContato = retContato.IdContato;
                                conversaAn.IdConversaWhats = "";
                                conversaAn.Sentido = "Saida";
                                conversaAn.Data = DateTime.Now;
                                conversaAn.Destino = retContato.StatusAtendimento.TipoFluxo == 6 ? "Tranf" : "Automatico";
                                conversaAn.Origem = 0;
                                conversaAn.Config_IdConfig = _config.ID;
                                conversaAn = await wsConversa.setConversa(conversaAn);

                                an.ConversasIdConversa = conversaAn.IdConversa;

                                an.NomeArquivo = an.url.Split('/')[an.url.Split('/').Length - 1];
                                AnexoService ans = new AnexoService();
                                ans.setAnexos(an);
                            }
                            ls.setLista(lista);
                            wsStatusAtendimento.setStatusAtendimento(st);

                            messageData = MSG.ToString() + "#" + conversa.IdConversa.ToString().PadLeft(8, '0');//
                        }
                        catch (Exception ex)
                        {
                            CommonLib.Util.Write.Log("Erro: " + ex.Message + ex.StackTrace);
                        }
                    };
                }
            }
            catch (Exception ex)
            {
                try
                {
                    Log log = new Log();
                    LogService WsLog = new LogService();

                    log.Tipo = "WhatsAppCore Session Telefone: " + this.phoneNum;
                    log.Data = DateTime.Now;
                    log.Mensagem = ex.Message + ex.StackTrace;

                    wsLog.setLog(log);
                }
                catch (Exception exe)
                {
                    CommonLib.Util.Write.Log(DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss") + " - " + "WhatsAppCore Session Telefone: " + this.phoneNum + " - " + exe.Message + exe.StackTrace);
                }
            }

            return messageData;
        }

    }
}