﻿using Unimake.Business.DFe.Servicos;
using Unimake.Business.DFe.Servicos.NF3e;
using Unimake.Business.DFe.Xml.NF3e;
using Xunit;

namespace Unimake.DFe.Test.NF3e
{
    /// <summary>
    /// Testar o serviço de consulta recibo da NF3e
    /// </summary>
    public class RetAutorizacaoTest
    {
        /// <summary>
        /// Consultar o recibo da NF3e somente para saber se a conexão com o webservice está ocorrendo corretamente e se quem está respondendo é o webservice correto.
        /// Efetua uma consulta por estado + ambiente para garantir que todos estão funcionando.
        /// </summary>
        /// <param name="ufBrasil">UF para onde deve ser enviado a consulta recibo</param>
        /// <param name="tipoAmbiente">Ambiente para onde deve ser enviado a consulta recibo</param>
        [Theory]
        [Trait("DFe", "NF3e")]
        [InlineData(UFBrasil.MG, TipoAmbiente.Homologacao)]
        [InlineData(UFBrasil.PR, TipoAmbiente.Homologacao)]
        [InlineData(UFBrasil.MG, TipoAmbiente.Producao)]
        [InlineData(UFBrasil.PR, TipoAmbiente.Producao)]
        public void ConsultarRecibo(UFBrasil ufBrasil, TipoAmbiente tipoAmbiente)
        {
            var xml = new ConsReciNF3e
            {
                Versao = "1.00",
                TpAmb = tipoAmbiente,
                NRec = ((int)ufBrasil).ToString() + "12101403512190"
            };

            var configuracao = new Configuracao
            {
                TipoDFe = TipoDFe.NF3e,
                TipoEmissao = TipoEmissao.Normal,
                Servico = Servico.NF3eConsultaRecibo,
                CertificadoDigital = PropConfig.CertificadoDigital
            };

            var retAutorizacao = new RetAutorizacaoSinc(xml, configuracao);
            retAutorizacao.Executar();

            Assert.True(configuracao.CodigoUF.Equals((int)ufBrasil), "UF definida nas configurações diferente de " + ufBrasil.ToString());
            Assert.True(configuracao.TipoAmbiente.Equals(tipoAmbiente), "Tipo de ambiente definido nas configurações diferente de " + tipoAmbiente.ToString());
            Assert.True(retAutorizacao.Result.CUF.Equals(ufBrasil), "Webservice retornou uma UF e está diferente de " + ufBrasil.ToString());
            Assert.True(retAutorizacao.Result.TpAmb.Equals(tipoAmbiente), "Webservice retornou um Tipo de ambiente diferente " + tipoAmbiente.ToString());
            if (retAutorizacao.Result.NRec != null && retAutorizacao.Result.NRec != "000000000000000" && retAutorizacao.Result.NRec != "0" && retAutorizacao.Result.NRec != "$numeroRecibo")
            {
                Assert.True(retAutorizacao.Result.NRec.Equals(xml.NRec), "Webservice retornou um número diferente do informado no XML da consulta." + xml.NRec);
            }
            //Assert.True(retAutorizacao.Result.CStat.Equals(106), "Status está diferente de \"106-Recibo pesquisado não foi encontrado\". Analise!!!");
        }

        [Theory]
        [Trait("DFe", "NF3e")]
        [InlineData(UFBrasil.PR, TipoAmbiente.Producao)]
        public void ConsultarReciboString(UFBrasil ufBrasil, TipoAmbiente tipoAmbiente)
        {
            var xml = new ConsReciNF3e
            {
                Versao = "1.00",
                TpAmb = tipoAmbiente,
                NRec = ((int)ufBrasil).ToString() + "12101403512190"
            };

            var configuracao = new Configuracao
            {
                TipoDFe = TipoDFe.NF3e,
                TipoEmissao = TipoEmissao.Normal,
                CertificadoDigital = PropConfig.CertificadoDigital,
                Servico = Servico.NF3eConsultaRecibo
            };

            var retAutorizacao = new RetAutorizacaoSinc(xml.GerarXML().OuterXml, configuracao);
            retAutorizacao.Executar();

            Assert.True(configuracao.CodigoUF.Equals((int)ufBrasil), "UF definida nas configurações diferente de " + ufBrasil.ToString());
            Assert.True(configuracao.TipoAmbiente.Equals(tipoAmbiente), "Tipo de ambiente definido nas configurações diferente de " + tipoAmbiente.ToString());
            Assert.True(retAutorizacao.Result.CUF.ToString().Equals(ufBrasil.ToString()), "Webservice retornou uma UF e está diferente de " + ufBrasil.ToString());
            Assert.True(retAutorizacao.Result.TpAmb.Equals(tipoAmbiente), "Webservice retornou um Tipo de ambiente diferente " + tipoAmbiente.ToString());
            if (retAutorizacao.Result.NRec != null && retAutorizacao.Result.NRec != "000000000000000" && retAutorizacao.Result.NRec != "0" && retAutorizacao.Result.NRec != "$numeroRecibo")
            {
                Assert.True(retAutorizacao.Result.NRec.Equals(xml.NRec), "Webservice retornou um número diferente do informado no XML da consulta." + xml.NRec);
            }
            //Assert.True(retAutorizacao.Result.CStat.Equals(106), "Status está diferente de \"106-Recibo pesquisado não foi encontrado\". Analise!!!");
        }
    }
}