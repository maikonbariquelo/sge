program SGI;



uses
  Windows,
  Forms,
  Controls,
  IniFiles,
  SysUtils,
  MidasLIB,
  HPL_Strings in '..\Sys\lib\HPL_Strings.pas',
  UEcfAgil in '..\Sys\lib\UEcfAgil.pas',
  UEcfGenerico in '..\Sys\lib\UEcfGenerico.pas',
  UEcfFactory in '..\Sys\lib\UEcfFactory.pas',
  UDMBusiness in '..\Sys\UDMBusiness.pas' {DMBusiness: TDataModule},
  USobre in '..\Sys\USobre.pas' {frmSobre},
  UPrinc in 'UPrinc.pas' {frmPrinc},
  UGrPadraoCadastro in '..\Sys\lib\UGrPadraoCadastro.pas' {frmGrPadraoCadastro},
  UGrPadrao in '..\Sys\lib\UGrPadrao.pas' {frmGrPadrao},
  UGeBancos in '..\Sys\UGeBancos.pas' {frmGeBancos},
  UGeTipoLogradouro in '..\Sys\UGeTipoLogradouro.pas' {frmGeTipoLogradouro},
  UGeEstado in '..\Sys\UGeEstado.pas' {frmGeEstado},
  UGeCidade in '..\Sys\UGeCidade.pas' {frmGeCidade},
  UGeDistrito in '..\Sys\UGeDistrito.pas' {frmGeDistrito},
  UGeBairro in '..\Sys\UGeBairro.pas' {frmGeBairro},
  UGeLogradouro in '..\Sys\UGeLogradouro.pas' {frmGeLogradouro},
  UGeEmpresa in '..\Sys\UGeEmpresa.pas' {frmGeEmpresa},
  UGeCliente in '..\Sys\UGeCliente.pas' {frmGeCliente},
  UGeFornecedor in '..\Sys\UGeFornecedor.pas' {frmGeFornecedor},
  UGeGrupoProduto in '..\Sys\UGeGrupoProduto.pas' {frmGeGrupoProduto},
  UGeSecaoProduto in '..\Sys\UGeSecaoProduto.pas' {frmGeSecaoProduto},
  UGeUnidade in '..\Sys\UGeUnidade.pas' {frmGeUnidade},
  UGeTabelaCFOP in '..\Sys\UGeTabelaCFOP.pas' {frmGeTabelaCFOP},
  UGeFormaPagto in '..\Sys\UGeFormaPagto.pas' {frmGeFormaPagto},
  UGeVendedor in '..\Sys\UGeVendedor.pas' {frmGeVendedor},
  UGeProduto in '..\System_SGE\UGeProduto.pas' {frmGeProduto},
  UGeVenda in '..\Sys\UGeVenda.pas' {frmGeVenda},
  UGeCondicaoPagto in '..\Sys\UGeCondicaoPagto.pas' {frmGeCondicaoPagto},
  UGeEntradaEstoque in '..\Sys\UGeEntradaEstoque.pas' {frmGeEntradaEstoque},
  UGeContasAReceber in '..\Sys\UGeContasAReceber.pas' {frmGeContasAReceber},
  UGrPadraoCadastroSimples in '..\Sys\lib\UGrPadraoCadastroSimples.pas' {frmGrPadraoCadastroSimples},
  UGeEfetuarPagtoREC in '..\Sys\UGeEfetuarPagtoREC.pas' {frmGeEfetuarPagtoREC},
  UGeContasAPagar in '..\Sys\UGeContasAPagar.pas' {frmGeContasAPagar},
  UGeEfetuarPagtoPAG in '..\Sys\UGeEfetuarPagtoPAG.pas' {frmGeEfetuarPagtoPAG},
  UDMNFe in '..\Sys\UDMNFe.pas' {DMNFe: TDataModule},
  UGeVendaGerarNFe in '..\Sys\UGeVendaGerarNFe.pas' {frmGeVendaGerarNFe},
  UGeConfigurarNFeACBr in '..\Sys\UGeConfigurarNFeACBr.pas' {frmGeConfigurarNFeACBr},
  UGeEntradaEstoqueCancelar in '..\Sys\UGeEntradaEstoqueCancelar.pas' {frmGeEntradaEstoqueCancelar},
  UEnviarLoteNFe in '..\Sys\UEnviarLoteNFe.pas' {frmEnviarLoteNFe},
  UGeTipoDespesa in '..\Sys\UGeTipoDespesa.pas' {frmGeTipoDespesa},
  UGeVendaCancelar in '..\Sys\UGeVendaCancelar.pas' {frmGeVendaCancelar},
  UGrCampoRequisitado in '..\Sys\lib\UGrCampoRequisitado.pas' {frmCampoRequisitado},
  UGeGerarBoletos in '..\Sys\UGeGerarBoletos.pas' {frmGeGerarBoleto},
  UGeRemessaBoletos in '..\Sys\UGeRemessaBoletos.pas' {frmGeRemessaBoleto},
  UGeRetornoBoletos in '..\Sys\UGeRetornoBoletos.pas' {frmGeRetornoBoleto},
  UGeEntradaConfirmaDuplicatas in '..\Sys\UGeEntradaConfirmaDuplicatas.pas' {frmGeEntradaConfirmaDuplicatas},
  UGePromocao in '..\Sys\UGePromocao.pas' {frmGePromocao},
  UGeContaCorrente in '..\Sys\UGeContaCorrente.pas' {frmGeContaCorrente},
  UGeCaixa in '..\Sys\UGeCaixa.pas' {frmGeCaixa},
  UGeFluxoCaixa in '..\Sys\UGeFluxoCaixa.pas' {frmGeFluxoCaixa},
  UFuncoes in '..\Sys\lib\UFuncoes.pas',
  UInfoVersao in '..\Sys\lib\UInfoVersao.pas',
  UGeFabricante in '..\Sys\UGeFabricante.pas' {frmGeFabricante},
  FormFactoryU in '..\Sys\lib\FormFactoryU.pas',
  FuncoesFormulario in '..\Sys\lib\FuncoesFormulario.pas',
  UConstantesDGE in '..\Sys\UConstantesDGE.pas',
  UGeVendaFormaPagto in '..\Sys\UGeVendaFormaPagto.pas' {frmGeVendaFormaPagto},
  UGeEntradaEstoqueGerarNFe in '..\Sys\UGeEntradaEstoqueGerarNFe.pas' {frmGeEntradaEstoqueGerarNFe},
  UGeExportarNFeGerada in '..\Sys\UGeExportarNFeGerada.pas' {frmGeExportarNFeGerada},
  UGeVendaTransporte in '..\Sys\UGeVendaTransporte.pas' {frmGeVendaTransporte},
  UGeSobre in '..\System_SGE\UGeSobre.pas' {frmGeSobre},
  UGrUsuarioAlterarSenha_v2 in '..\System_SGE\UGrUsuarioAlterarSenha_v2.pas' {frmGrUsuarioAlterarSenha},
  UGrPesq in '..\System_SGE\UGrPesq.pas' {frmPesq},
  UGeVendaConfirmaTitulos in '..\Sys\UGeVendaConfirmaTitulos.pas' {frmGeVendaConfirmaTitulos},
  UGrPadraoPesquisa in '..\Sys\lib\UGrPadraoPesquisa.pas' {frmGrPadraoPesquisa},
  UGeVendaItemPesquisa in '..\Sys\UGeVendaItemPesquisa.pas' {FrmGeVendaItemPesquisa},
  UGeProdutoRotatividadePRC in '..\Sys\UGeProdutoRotatividadePRC.pas' {FrmGeProdutoRotatividadePRC},
  UGeConfiguracaoEmpresa in '..\Sys\UGeConfiguracaoEmpresa.pas' {frmGeConfiguracaoEmpresa},
  UGeInutilizarNumeroNFe in '..\Sys\UGeInutilizarNumeroNFe.pas' {frmGeInutilizarNumeroNFe},
  UGeProdutoEstoqueMinimo in '..\System_SGE\UGeProdutoEstoqueMinimo.pas' {FrmGeProdutoEstoqueMinimo},
  UGeConsultarLoteNFe_v2 in '..\System_SGE\UGeConsultarLoteNFe_v2.pas' {frmGeConsultarLoteNFe_v2},
  UGrPadraoLogin in '..\Sys\lib\UGrPadraoLogin.pas' {frmGrPadraoLogin},
  UGrConsultarCNJP in '..\Sys\lib\UGrConsultarCNJP.pas' {frmGrConsultarCNJP},
  UObserverInterface in '..\Sys\lib\UObserverInterface.pas',
  UBaseObject in '..\Sys\lib\UBaseObject.pas',
  UCliente in '..\Sys\lib\UCliente.pas',
  UGrPadraoImpressao in '..\System_SGE\lib\UGrPadraoImpressao.pas' {frmGrPadraoImpressao},
  UGeClienteImpressao in '..\System_SGE\UGeClienteImpressao.pas' {frmGeClienteImpressao},
  UGeEstoqueAjusteManual in '..\System_SGE\UGeEstoqueAjusteManual.pas' {frmGeEstoqueAjusteManual},
  UGeRequisicaoCliente in '..\System_SGE\UGeRequisicaoCliente.pas' {frmGeRequisicaoCliente},
  UGrUsuario in '..\System_SGE\UGrUsuario.pas' {frmGrUsuario},
  UGeVendaImpressao in '..\System_SGE\UGeVendaImpressao.pas' {frmGeVendaImpressao},
  UGeEfetuarLogin in '..\System_SGE\UGeEfetuarLogin.pas' {FrmEfetuarLogin},
  UGrMessage in '..\Sys\lib\UGrMessage.pas' {frmGeMessage},
  UGeExportarChaveNFeGerada in '..\Sys\UGeExportarChaveNFeGerada.pas' {frmGeExportarChaveNFeGerada},
  UGeExportarNFC in '..\Sys\UGeExportarNFC.pas' {frmGeExportarNFC},
  UGeContasAReceberImpressao in '..\System_SGE\UGeContasAReceberImpressao.pas' {frmGeContasAReceberImpressao},
  UGrConfigurarAmbiente in '..\Sys\lib\UGrConfigurarAmbiente.pas' {frmGrConfigurarAmbiente},
  UGeAutorizacaoCompra in '..\System_SGE\UGeAutorizacaoCompra.pas' {frmGeAutorizacaoCompra},
  UGeAutorizacaoCompraCancelar in '..\System_SGE\UGeAutorizacaoCompraCancelar.pas' {frmGeAutorizacaoCompraCancelar},
  UGeContasAPagarImpressao in '..\System_SGE\UGeContasAPagarImpressao.pas' {frmGeContasAPagarImpressao},
  UGeEntradaImpressao in '..\System_SGE\UGeEntradaImpressao.pas' {frmGeEntradaImpressao},
  UGeContasAPagarQuitar in '..\System_SGE\UGeContasAPagarQuitar.pas' {frmGeContasAPagarQuitar},
  UGrUsuarioPerfil in '..\System_SGE\UGrUsuarioPerfil.pas' {frmGrUsuarioPerfil},
  UGrUsuarioCopiarPerfil in '..\System_SGE\UGrUsuarioCopiarPerfil.pas' {frmGrUsuarioCopiarPerfil},
  UGeCotacaoCompra in '..\System_SGE\UGeCotacaoCompra.pas' {frmGeCotacaoCompra},
  UGeCotacaoCompraCancelar in '..\System_SGE\UGeCotacaoCompraCancelar.pas' {frmGeCotacaoCompraCancelar},
  UGeCotacaoCompraFornecedor in '..\System_SGE\UGeCotacaoCompraFornecedor.pas' {frmGeCotacaoCompraFornecedor},
  UEcfWindowsPrinter in '..\Sys\lib\UEcfWindowsPrinter.pas',
  UGeFornecedorImpressao in '..\System_SGE\UGeFornecedorImpressao.pas' {frmGeFornecedorImpressao},
  UGrRegistroEstacao in '..\Sys\lib\UGrRegistroEstacao.pas' {FrmGrRegistroEstacao},
  UGeRequisicaoCompra in '..\System_SGE\UGeRequisicaoCompra.pas' {frmGeRequisicaoCompra},
  UGeRequisicaoCompraCancelar in '..\System_SGE\UGeRequisicaoCompraCancelar.pas' {frmGeRequisicaoCompraCancelar},
  UGeRequisicaoCompraPesquisa in '..\System_SGE\UGeRequisicaoCompraPesquisa.pas' {frmGeRequisicaoCompraPesquisa},
  UGeCartaCorrecao in '..\Sys\UGeCartaCorrecao.pas' {frmGeCartaCorrecao},
  UGeNFEmitida in '..\Sys\UGeNFEmitida.pas' {frmGeNFEmitida},
  UGeCentroCusto in '..\Sys\UGeCentroCusto.pas' {frmGeCentroCusto},
  UGePlanoContas in '..\Sys\UGePlanoContas.pas' {frmGePlanoContas},
  UGeProdutoImpressao in '..\System_SGE\UGeProdutoImpressao.pas' {frmGeProdutoImpressao},
  UGeProdutoKardex in '..\Sys\UGeProdutoKardex.pas' {frmGeProdutoKardex},
  UGeApropriacaoEstoque in 'UGeApropriacaoEstoque.pas' {frmGeApropriacaoEstoque},
  UGeApropriacaoEstoqueCancelar in 'UGeApropriacaoEstoqueCancelar.pas' {frmGeApropriacaoEstoqueCancelar},
  UGeApropriacaoEstoquePesquisa in 'UGeApropriacaoEstoquePesquisa.pas' {frmGeApropriacaoEstoquePesquisa},
  UGeRequisicaoAlmox in 'UGeRequisicaoAlmox.pas' {frmGeRequisicaoAlmox},
  UGeRequisicaoAlmoxCancelar in 'UGeRequisicaoAlmoxCancelar.pas' {frmGeRequisicaoAlmoxCancelar},
  UGeRequisicaoAlmoxMonitor in 'UGeRequisicaoAlmoxMonitor.pas' {frmGeRequisicaoAlmoxMonitor},
  UGeInventario in 'UGeInventario.pas' {frmGeInventario},
  UGrMemo in '..\Sys\lib\UGrMemo.pas' {frmGrMemo},
  UGeProdutoEstoqueImpressao in '..\System_SGE\UGeProdutoEstoqueImpressao.pas' {frmGeProdutoEstoqueImpressao},
  UDMRecursos in '..\Sys\UDMRecursos.pas' {DMRecursos: TDataModule},
  UGeSolicitacaoCompra in 'UGeSolicitacaoCompra.pas' {frmGeSolicitacaoCompra},
  UGeSolicitacaoCompraCancelar in 'UGeSolicitacaoCompraCancelar.pas' {frmGeSolicitacaoCompraCancelar},
  UGeApropriacaoEstoqueImpressao in 'UGeApropriacaoEstoqueImpressao.pas' {frmGeApropriacaoEstoqueImpressao},
  UGeRequisicaoAlmoxImpressao in 'UGeRequisicaoAlmoxImpressao.pas' {frmGeRequisicaoAlmoxImpressao},
  UGeVendaDevolucaoNF in '..\Sys\UGeVendaDevolucaoNF.pas' {frmGeVendaDevolucaoNF},
  UGrConfigurarBackup in '..\Sys\lib\UGrConfigurarBackup.pas' {frmGrConfigurarBackup},
  UGeFuncionario in '..\Sys\UGeFuncionario.pas' {frmGeFuncionario},
  UGeEntradaEstoqueDevolucaoNF in '..\Sys\UGeEntradaEstoqueDevolucaoNF.pas' {frmGeEntradaEstoqueDevolucaoNF},
  UGeContasAReceberQuitar in '..\System_SGE\UGeContasAReceberQuitar.pas' {frmGeContasAReceberQuitar},
  UGeContasAPagarLoteParcela in '..\Sys\UGeContasAPagarLoteParcela.pas' {frmGeContasAPagarLoteParcela},
  UGeContasAReceberLoteParcela in '..\Sys\UGeContasAReceberLoteParcela.pas' {frmGeContasAReceberLoteParcela},
  UGeTabelaIBPT in '..\Sys\UGeTabelaIBPT.pas' {frmGeTabelaIBPT},
  UGeTabelaIBPTImportar in '..\Sys\UGeTabelaIBPTImportar.pas' {frmGeTabelaIBPTImportar},
  UGeAutorizacaoCompraImpressao in '..\System_SGE\UGeAutorizacaoCompraImpressao.pas' {frmGeAutorizacaoCompraImpressao},
  UGeTipoReceita in '..\Sys\UGeTipoReceita.pas' {frmGeTipoReceita},
  UGeFluxoCaixaImpressao in '..\Sys\UGeFluxoCaixaImpressao.pas' {frmGeFluxoCaixaImpressao},
  UGrAguarde in '..\Sys\UGrAguarde.pas' {frmAguarde};

{$R *.res}

begin
  FileINI := TIniFile.Create( ExtractFilePath(ParamStr(0)) + 'Conexao.ini' );

  Application.Initialize;
  Application.Title := 'SGI | Sistema Integrado de Gest�o Industrial';
  Application.CreateForm(TDMRecursos, DMRecursos);
  Application.CreateForm(TDMBusiness, DMBusiness);
  Application.CreateForm(TDMNFe, DMNFe);
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.CreateForm(TfrmPesq, frmPesq);
  Application.Run;
end.
