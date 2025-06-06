/*

Unimake Software
Exemplo de uso da DLL Unimake.Dfe
Data: 15/02/2022 
Autores: 
- Edson Mundin Ferreira
- Wandrey Mundin Ferreira

*/
Function Main()
   Local aOpcoes, nOpcao
   
   aOpcoes := {}
   AAdd(aOpcoes, "Consultar Status NFe")
   AAdd(aOpcoes, "Consultar Situacao NFe")
   AAdd(aOpcoes, "Enviar NFe - Modo sincrono")   
   AAdd(aOpcoes, "Enviar NFe - Modo assincrono")   
   AAdd(aOpcoes, "Enviar NFe - Desserializando o XML")                               
   AAdd(aOpcoes, "Testes diversos com certificado digital no xHarbour pago ou free (BBC)")  
   AAdd(aOpcoes, "Enviar Evento de Cancelamento da NFe")
   AAdd(aOpcoes, "Enviar Evento de Cancelamento da NFe - Desserializando o XML")
   Aadd(aOpcoes, "Gerar XML de distribuicao com um nome diferente do padrao da DLL")
   Aadd(aOpcoes, "Consultar Status MDFe")
   Aadd(aOpcoes, "Enviar MDFe - Modo assincrono")
   Aadd(aOpcoes, "Enviar MDFe - Modo assincrono - Desserializando o XML")
   Aadd(aOpcoes, "Enviar NFCe - Modo sincrono")
   Aadd(aOpcoes, "Enviar NFCe - Modo sincrono - Desserializando o XML")
   Aadd(aOpcoes, "Enviar MDFe - Modo sincrono")
   Aadd(aOpcoes, "Validar XML")
   AAdd(aOpcoes, "Enviar Evento de Cancelamento da NFCe")     
   Aadd(aOpcoes, "Consultar GTIN")
   Aadd(aOpcoes, "Imprimir DANFe/DACTe/DAMDFe via DLL UniDANFe")
   Aadd(aOpcoes, "Executar telas do UniDANFe")                              
   AAdd(aOpcoes, "Enviar Evento de cancelamento do MDFe")   
   AAdd(aOpcoes, "Enviar Evento de encerramento do MDFe")   
   Aadd(aOpcoes, "Finalizar a nota pela consulta situacao da NFe") 
   AAdd(aOpcoes, "Gerando a NFCe em contingencia OffLine")
   AAdd(aOpcoes, "Enviar CTe - Modo Assincrono") 
   AAdd(aOpcoes, "Enviar Lote RPS (NFSe) - Assincrono")
   AAdd(aOpcoes, "Enviar Consulta Lote RPS (NFSe)")
   AAdd(aOpcoes, "Enviar Cancelamento da NFSe")
   AAdd(aOpcoes, "Enviar NFe em contingencia SVC-AN e SVC-RS")
   AAdd(aOpcoes, "Enviar CTe em contingencia SVC-SP e SVC-RS")
   AAdd(aOpcoes, "Como encriptar a tag <Assinatura> NFSe Sao Paulo")
   AAdd(aOpcoes, "EPEC NFe - Gerar XML NFe em contingencia EPEC")
   AAdd(aOpcoes, "EPEC NFe - Enviar Evento de EPEC da NFe")     
   AAdd(aOpcoes, "EPEC NFe - Enviar o XML da NFe")
   Aadd(aOpcoes, "Enviar CTe - Modo Assincrono - Desserializando o XML")
   Aadd(aOpcoes, "Enviar MDFe - Modo sincrono - Desserializando o XML")
   Aadd(aOpcoes, "Gerar XML da NFSe") 
   AAdd(aOpcoes, "Enviar Evento de Cancelamento do CTe")
   AAdd(aOpcoes, "Enviar Evento de Cancelamento do CTe - Desserializando XML")   
   AAdd(aOpcoes, "Desserializar XML NFe compra p/dar entrada no ERP (B2B)")
   AAdd(aOpcoes, "Testes diversos com certificado digital no Harbour 3.x")  
   AAdd(aOpcoes, "Enviar XML de Inutirlizacao do CTe")  
   AAdd(aOpcoes, "Enviar XML de Inutirlizacao do CTe - Com Desserializacao")  
   AAdd(aOpcoes, "Enviar Evento de CCE da NFe")  
   Aadd(aOpcoes, "Enviar CTe - Modo Assincrono - Desserializando o XML")
   
   Aadd(aOpcoes, "Consulta de documentos fiscais eletronicos destinados")
   AAdd(aOpcoes, "Consultar Status CTe")
   
   AAdd(aOpcoes, "Consultar URL NFSe")
   
   AAdd(aOpcoes, "Gerando XML de distribuicao Evento Canc NFe via consulta situacao")
   AAdd(aOpcoes, "Consulta MDFes nao encerrados")
   
   AAdd(aOpcoes, "Obter a versao da DLL Unimake.DFe")
   
   Aadd(aOpcoes, "Extrair eventos retornados na consulta situacao da NFe/NFCe")
   
   Aadd(aOpcoes, "Verificar se a DLL esta instalada no PC")
   
   Aadd(aOpcoes, "eSocial - Consultar lote assincrono")   
   Aadd(aOpcoes, "eSocial - Evento 2210 - Enviar lote")
   Aadd(aOpcoes, "eSocial - Evento 2210 - Enviar lote - XML desserializado")
   Aadd(aOpcoes, "eSocial - Evento 2221 - Enviar lote")
   Aadd(aOpcoes, "eSocial - Evento 1010 - Enviar lote")
   Aadd(aOpcoes, "eSocial - Evento 2220 - Enviar lote")
   Aadd(aOpcoes, "eSocial - Evento 1200 - Enviar lote")   
   Aadd(aOpcoes, "eSocial - Evento 2240 - Enviar lote")   
   Aadd(aOpcoes, "eSocial - Evento 1210 - Enviar lote")   
   Aadd(aOpcoes, "eSocial - Evento 2220 - Enviar lote - XML desserializado")
   Aadd(aOpcoes, "eSocial - Evento 2200 - Enviar lote")   
   Aadd(aOpcoes, "eSocial - Evento 2230 - Enviar lote")
   Aadd(aOpcoes, "eSocial - Evento 2299 - Enviar lote")
   Aadd(aOpcoes, "eSocial - Download Eventos Por ID")
   Aadd(aOpcoes, "eSocial - Download Eventos Por Nr Recibo")
   Aadd(aOpcoes, "eSocial - Consultar Eventos - Tabela")
   Aadd(aOpcoes, "eSocial - Consultar Eventos - Trabalhador")
   Aadd(aOpcoes, "eSocial - Consultar Eventos - Empregador")
   Aadd(aOpcoes, "eSocial - Evento 1200 - Enviar lote - XML desserializado")
   Aadd(aOpcoes, "eSocial - Evento 1000 - Enviar lote")
   Aadd(aOpcoes, "eSocial - Evento 1000 - Enviar lote - XML desserializado")
   
   Aadd(aOpcoes, "Assinar XML")   
   
   Aadd(aOpcoes, "eSocial - Evento 2206 - Enviar lote")
   
   Do While .T.
      Cls
      
      @ 1,2 Say "Unimake.Dfe DLL for " + Version()
	  
      nOpcao := Achoice( 3, 2, 30, 80, aOpcoes)

      Cls

      do case
         case LastKey() = 27
              Exit

         case nOpcao = 1
              ConsultaStatusNfe()

         case nOpcao = 2
              ConsultaSituacaoNfe()

         case nOpcao = 3
              EnviarNfeSincrono()			  

         case nOpcao = 4
              EnviarNfeAssincrono()

         case nOpcao = 5
              EnviarNfeDeserializando()			  			  

         case nOpcao = 6
              TesteDiversoCertificado()

         case nOpcao = 7
              CancelarNFe()

         case nOpcao = 8
              CancelarNFeDesserializando()

         case nOpcao = 9
              GerarXmlDistribuicaoNomeDif()

         case nOpcao = 10
              ConsultaStatusMDFe()

         case nOpcao = 11
              EnviarMDFeAssincrono()

         case nOpcao = 12
              EnviarMDFeAssincronoDesserializando()

         case nOpcao = 13
              EnviarNfceSincrono()			  

         case nOpcao = 14
              EnviarNFCeSincronoDesserializando()

         case nOpcao = 15
              EnviarMDFeSincrono()

         case nOpcao = 16
              ValidarXML()

         case nOpcao = 17
              CancelarNFCe()

         case nOpcao = 18
              ConsultarGTIN()

         case nOpcao = 19
              ImprimirDANFe()

         case nOpcao = 20
              ExecutarTelaUniDANFe()

         case nOpcao = 21
              CancelarMDFe()		 

         case nOpcao = 22
              EncerramentoMDFe()

         case nOpcao = 23
              FinalizarNFePelaConsultaSituacao()

         case nOpcao = 24
              EnviarNFCeSincronoOffline()

         case nOpcao = 25
              EnviarCTeAssincrono()

         case nOpcao = 26
              EnviarLoteRPSAssincrono() 		 

         case nOpcao = 27
              EnviarConsultaLoteRPS() 		 

         case nOpcao = 28
              EnviarCancelamentoNFSe() 	

         case nOpcao = 29
              EnviarNFeContigenciaSVC()

         case nOpcao = 30
              EnviarCTeContigenciaSVC()

         case nOpcao = 31	  
              EncriptarAssinaturaSP()

         case nOpcao = 32
              EPECGerarXMLNFe()

         case nOpcao = 33	  
              EPECEnviarEventoEPEC()

         case nOpcao = 34	  
              EPECEnviarXMLNFe()

         case nOpcao = 35
              EnviarCTeAssincronoDesserializando()

         case nOpcao = 36
              EnviarMDFeSincronoDesserializando()

         case nOpcao = 37
              GerarXmlNFSe()

         case nOpcao = 38
              EnviarCancCTe()

         case nOpcao = 39
              EnviarCancCTeDesserializando()

         case nOpcao = 40
              DesserializarXMLNFeCompra()

         case nOpcao = 41
              TesteDiversoCertificadoHarbour3x()

         case nOpcao = 42
              EnviarInutCTe()

         case nOpcao = 43
              EnviarInutCTeDesserializacao()	  

         case nOpcao = 44
              EnviarEventoCCeNFe()	  

         case nOpcao = 45
              EnviarCTeAssincronoDesserializando2()

         case nOpcao = 46
              ConsultaDFe()

         case nOpcao = 47
              ConsultaStatusCTe()

         case nOpcao = 48
              ConsultarURLNfse()

         case nOpcao = 49
              GerarXmlDistribuicaoEvento()

         case nOpcao = 50
              ConsultaMDFeNaoEnc()

         case nOpcao = 51
              oInfoInterop = CreateObject("Unimake.Business.DFe.Utility.InfoInterop")
              Cls

              ? oInfoInterop:VersaoDLL
              ?
              ?
              Wait

              Cls		

         case nOpcao = 52			  
              ExtrairEventoPedSitNFe()

         case nOpcao = 53
              VerificarDLLInstalada()

         case nOpcao = 54
              eSocialConsultaLoteAssincrono()		 

         case nOpcao = 55
              EnviarEsocial2210()

         case nOpcao = 56
              EnviarEsocial2210Desserializando()

         case nOpcao = 57
              EnviarEsocial2221()			  

         case nOpcao = 58
              EnviarEsocial1010()			  

         case nOpcao = 59
              EnviarEsocial2220()			  

         case nOpcao = 60
              EnviarEsocial1200()			  

         case nOpcao = 61
              EnviarEsocial2240()			  

         case nOpcao = 62
              EnviarEsocial1210()			  

         case nOpcao = 63
              EnviarEsocial2220Desserializando()			  

         case nOpcao = 64
              EnviarEsocial2200()		 

         case nOpcao = 65
              EnviarEsocial2230()		 

         case nOpcao = 66
              EnviarEsocial2299()		 

         case nOpcao = 67
              DownloadEventoESocialPorID()		 

         case nOpcao = 68
              DownloadEventoESocialPorNRRec()

         case nOpcao = 69			
              ConsultarEvtsTabelaESocial()

         case nOpcao = 70
              ConsultarEvtsTrabalhadorESocial()

         case nOpcao = 71
              ConsultarEvtsEmpregadorESocial()		 

         case nOpcao = 72
              EnviarEsocial1200Desserializando()

         case nOpcao = 73
              EnviarEsocial1000()

         case nOpcao = 74
              EnviarEsocial1000Desserializando()

         case nOpcao = 75
              AssinarXML()
			  
         case nOpcao = 76
              EnviarEsocial2206()			  
      endcase
   EndDo
Return       
