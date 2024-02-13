program prjVendas;

uses
  Forms,
  untMenu in 'untMenu.pas' {frmSYSMenu},
  untLogin in 'untLogin.pas' {frmSYSLogin},
  untDM in 'untDM.pas' {DM: TDataModule},
  untSplash in 'untSplash.pas' {frmSYSSplash},
  untFornecedores in 'untFornecedores.pas' {frmCADFornecedores},
  untProdutos in 'untProdutos.pas' {frmCADProdutos},
  untMedidas in 'untMedidas.pas' {frmCADUnidades},
  untFuncionarios in 'untFuncionarios.pas' {frmCADFuncionarios},
  untClientes in 'untClientes.pas' {frmCADClientes},
  untPedidos in 'untPedidos.pas' {frmCADPedidos},
  untPagamento in 'untPagamento.pas' {frmCADPagamento},
  untRelat in 'untRelat.pas' {frmRelatFornecedor},
  untRelatFunc in 'untRelatFunc.pas' {frmRelatFuncionario},
  relatProd in 'relatProd.pas' {frmRelatProduto},
  untSobre in 'untSobre.pas' {frmSYSSobre},
  untRelatCliente in 'untRelatCliente.pas' {frmRelatCliente},
  untRelatPedido in 'untRelatPedido.pas' {frmRelatPedidos_FEITOS},
  untInfo in 'untInfo.pas' {frmOUTRepresentacao},
  untRelatPedidos2 in 'untRelatPedidos2.pas' {frmRelatPedidos_TOTALVENDA},
  untBackup in 'untBackup.pas' {frmOUTBackup},
  untVerificacao in 'untVerificacao.pas' {frmOUTVerificacao},
  untRelatpedidos3 in 'untRelatpedidos3.pas' {frmRelatPedidos_PEDIDO},
  untgrafico in 'untgrafico.pas' {frmRelatGrafico1},
  untGrade in 'untGrade.pas' {frmCADGrade},
  untPrePedido in 'untPrePedido.pas' {frmPrePedido_GRADE},
  untPrepedido2 in 'untPrepedido2.pas' {frmPrePedido_ESPELHO},
  untTotalizacao in 'untTotalizacao.pas' {frmRelatTotalizacao},
  untPrePedido3 in 'untPrePedido3.pas' {frmPrePedido_BRANCO},
  untPrePedido4 in 'untPrePedido4.pas' {frmPrepedido_FORNECEDOR},
  untComissao in 'untComissao.pas' {frmCADComissao},
  untRelatComissao in 'untRelatComissao.pas' {frmRelatComissao},
  untPesqProdutos in 'untPesqProdutos.pas' {frmPesqProdutos},
  untExcel in 'untExcel.pas' {frmEXPExcel},
  untLiberar in 'untLiberar.pas' {frmREGLiberar},
  UntLibera in 'UntLibera.pas' {frmREGCodigo},
  untMensagens in 'untMensagens.pas' {frmOUTSair},
  uPesquisar in 'uPesquisar.pas' {frmSYSPesquisar},
  untPromotor in 'untPromotor.pas' {frmEXPPromotor},
  untMeta in 'untMeta.pas' {frmCADMetas},
  untVendedor_Cliente in 'untVendedor_Cliente.pas' {frmOUTCliVen},
  untUsuarios in 'untUsuarios.pas' {frmCADUsuarios},
  untProcedures in 'untProcedures.pas' {frmSYSProcedures},
  frmRelatGrafico_Itens in 'frmRelatGrafico_Itens.pas' {frmRelatGrafico2},
  untRelatGrafico3 in 'untRelatGrafico3.pas' {frmRelatGrafico3},
  untRelatgrafico4 in 'untRelatgrafico4.pas' {frmRelatGrafico4},
  untRelatGrafico5 in 'untRelatGrafico5.pas' {frmRelatGrafico5},
  untNaoPagas in 'untNaoPagas.pas' {frmComissaoNaoPaga},
  untContas in 'untContas.pas' {frmCADContas},
  untGastos in 'untGastos.pas' {frmCADGastos},
  untGraficoGastos in 'untGraficoGastos.pas' {frmRelatGrafico6},
  Unit1 in 'Unit1.pas' {frmVISAgendamento},
  frmEscolhevendedor in 'frmEscolhevendedor.pas' {frmVISVendedor},
  untVisConsulta in 'untVisConsulta.pas' {frmVISConsulta},
  untVisitasEntrada in 'untVisitasEntrada.pas' {frmVISEntrada},
  untVisHoje in 'untVisHoje.pas' {frmVisHoje},
  untRelGastos in 'untRelGastos.pas' {frmRelatGastos},
  untDevolucoes in 'untDevolucoes.pas' {frmCADDevolucao},
  untRelDevolucao in 'untRelDevolucao.pas' {frmRelatDevolucao},
  untOUTExportacaoDados in 'untOUTExportacaoDados.pas' {frmOUTExportacaoPedido},
  frmOUTArquivoMorto in 'frmOUTArquivoMorto.pas' {frmSYSArquivoMorto};

{$R *.res}
var
i:shortint;
maximo:shortint=0;
divisor:shortint=19;

begin
Application.Initialize;
Application.Title := 'Repress 4.5';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmSYSMenu, frmSYSMenu);
  Application.CreateForm(TfrmSYSProcedures, frmSYSProcedures);
  Application.CreateForm(TfrmSYSPesquisar, frmSYSPesquisar);
  application.run;

end.


