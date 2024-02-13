unit untRelatPedidos2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, Buttons, StdCtrls, DBCtrls,
  ComCtrls, DB, ibx.IBTable, ibx.IBCustomDataSet, ibx.IbQuery, Grids, DBGrids;

type
  TfrmRelatPedidos_TOTALVENDA = class(TForm)
    GroupBox1: TGroupBox;
    PRODUTOVENDEDOR: TRadioButton;
    PRODUTO: TRadioButton;
    PRODUTOCLIENTE: TRadioButton;
    PRODUTOTODOS: TRadioButton;
    FORNECEDORPERIODO: TRadioButton;
    FORNECEDORCLIENTE: TRadioButton;
    FORNECEDORVENDEDOR: TRadioButton;
    fornecedortodos: TRadioButton;
    Shape2: TShape;
    linha: TRadioButton;
    vendedor: TRadioButton;
    Report: TQuickRep;
    QRSubDetail9: TQRSubDetail;
    QRShape196: TQRShape;
    QRShape197: TQRShape;
    QRShape199: TQRShape;
    QRDBText63: TQRDBText;
    QRDBText69: TQRDBText;
    QRBand23: TQRBand;
    QRLabel105: TQRLabel;
    EMPRESA: TQRLabel;
    PERIODO: TQRLabel;
    QRShape204: TQRShape;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel91: TQRLabel;
    QRExpr10: TQRExpr;
    QRShape195: TQRShape;
    QRExpr9: TQRExpr;
    QRShape193: TQRShape;
    QRBand24: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRShape205: TQRShape;
    qryJOIN: TIBQuery;
    dsJOIN: TDataSource;
    qryProdutos: TIBQuery;
    dtGrade: TIBTable;
    dsGradeJoin: TDataSource;
    dtFornecedor: TIBTable;
    qryJOINPRODESCRICAO: TIBStringField;
    qryJOINQTDE: TFloatField;
    qryJOINtotal: TCurrencyField;
    dtFornecedorFORCODFORN: TIBStringField;
    dtFornecedorFORDATACAD: TDateTimeField;
    dtFornecedorFORRAZAO: TIBStringField;
    dtFornecedorFORENDERECO: TIBStringField;
    dtFornecedorFORBAIRRO: TIBStringField;
    dtFornecedorFORCIDADE: TIBStringField;
    dtFornecedorFORUF: TIBStringField;
    dtFornecedorFORCEP: TIBStringField;
    dtFornecedorFORCGC: TIBStringField;
    dtFornecedorFORINSC: TIBStringField;
    dtFornecedorFORTEL: TIBStringField;
    dtFornecedorFORFAX: TIBStringField;
    dtFornecedorFORCONTATO: TIBStringField;
    dtFornecedorFOROBS: TIBStringField;
    dtFornecedorCONTA: TIBStringField;
    dtFornecedorAGENCIA: TIBStringField;
    dtFornecedorBANCO: TIBStringField;
    dtFornecedorCIDADE: TIBStringField;
    dtFornecedorUF: TIBStringField;
    dtFornecedorTELEFONE: TIBStringField;
    qryJOINSUM: TFloatField;
    QRDBText1: TQRDBText;
    QRLabel115: TQRLabel;
    QRShape207: TQRShape;
    QRShape208: TQRShape;
    QRShape210: TQRShape;
    QRShape211: TQRShape;
    QRLabel118: TQRLabel;
    QRShape213: TQRShape;
    TITULO: TQRLabel;
    QRShape214: TQRShape;
    INICIAL: TQRLabel;
    QRShape215: TQRShape;
    QRShape216: TQRShape;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    FINAL: TQRLabel;
    TEXTO1: TQRLabel;
    DB1: TQRDBText;
    QRShape220: TQRShape;
    QRLabel127: TQRLabel;
    TEXTO2: TQRLabel;
    TEXTO3: TQRLabel;
    TEXTO4: TQRLabel;
    DB2: TQRLabel;
    DB3: TQRLabel;
    DB4: TQRLabel;
    QRShape1: TQRShape;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    SpeedButton4: TSpeedButton;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    datainicial: TDateTimePicker;
    datafinal: TDateTimePicker;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    atingida: TQRLabel;
    dtMetas: TIBTable;
    dtMetasCODPRODUTO: TIBStringField;
    dtMetasCODVENDEDOR: TIBStringField;
    dtMetasMETA: TIntegerField;
    dtMetasPRODESCRICAO: TIBStringField;
    Image2: TImage;
    cliente: TRadioButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    combocliente: TComboBox;
    combofornecedor: TComboBox;
    combovendedor: TComboBox;
    comboproduto: TComboBox;
    combolinha: TComboBox;
    Shape4: TShape;
    Label22: TLabel;
    Label36: TLabel;
    Image3: TImage;
    GroupBox6: TGroupBox;
    chsim: TRadioButton;
    chnao: TRadioButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure QRSubDetail9BeforePrint(Sender: TQRCustomBand;var PrintBand: Boolean);
    procedure ControlaMeta(vModo:boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure vendedorClick(Sender: TObject);
    procedure clienteClick(Sender: TObject);
    procedure linhaClick(Sender: TObject);
    procedure PRODUTOClick(Sender: TObject);
    procedure PRODUTOCLIENTEClick(Sender: TObject);
    procedure PRODUTOVENDEDORClick(Sender: TObject);
    procedure PRODUTOTODOSClick(Sender: TObject);
    procedure FORNECEDORPERIODOClick(Sender: TObject);
    procedure FORNECEDORCLIENTEClick(Sender: TObject);
    procedure FORNECEDORVENDEDORClick(Sender: TObject);
    procedure fornecedortodosClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure QRDBText63Print(sender: TObject; var Value: String);
    procedure QRExpr10Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatPedidos_TOTALVENDA: TfrmRelatPedidos_TOTALVENDA;

implementation

uses untMenu, untgrafico, untProcedures;

{$R *.dfm}

procedure TfrmRelatPedidos_TOTALVENDA.SpeedButton1Click(Sender: TObject);
begin

if datainicial.Date > datafinal.Date then
 begin
  messagedlg('Data inicial NÃO PODE ser maior que a Data final!',mterror,[mbok],0);
  datainicial.SetFocus;
  exit;
 end;

if vendedor.Checked = true then
 begin

  ControlaMeta(True);

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

  dtMetas.Open;
  dtMetas.Filter := 'CODVENDEDOR = '+ quotedstr(inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset)));
  dtMetas.Filtered := true;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto    = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and pedidos.codvendedor = :pVen');
    sql.add('Group By Produtos.proDescricao');
   end;

   if chSim.Checked = true then qryjoin.ParamByName('pbon').Value := 'SIM' else qryjoin.ParamByName('pbon').Value := 'NAO';

   with qryjoin do
    begin
     ParamByName('pVen').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Vendedor: '+comboVendedor.text+' no período de ' +datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date) + ' !',mterror,[mbok],0);
      combovendedor.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Vendedor/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption  := '';
   DB1.DataSet     := qryJoin;
   DB1.DataField   := 'NENHUM';

   TEXTO2.Left     := 6;
   TEXTO2.Caption  := 'Vendedor: ';
   db2.Left        := 70;
   DB2.Caption     := combovendedor.text;

   texto3.left    :=230;
   TEXTO3.Caption := '';
   db3.Left       :=310;
   DB3.Caption    :='';

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.Preview;
 end;

if cliente.Checked = true then
 begin

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;

  ControlaMeta(False);

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto    = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and pedidos.codcliente  = :pCli');
    sql.add('Group By Produtos.proDescricao');
   end;

  if chSim.Checked = true then qryjoin.ParamByName('pbon').Value := 'SIM' else qryjoin.ParamByName('pbon').Value := 'NAO';

   with qryjoin do
    begin
     ParamByName('pCli').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS para o Cliente: '+comboCliente.text+' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      comboCliente.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Cliente/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption  := '';
   DB1.DataSet     := qryJoin;
   DB1.DataField   := 'NENHUM';

   TEXTO2.Left     := 6;
   TEXTO2.Caption  := 'Cliente: ';
   db2.Left        := 70;
   DB2.Caption     := combocliente.text;

   texto3.left    :=230;
   TEXTO3.Caption := '';
   db3.Left       :=310;
   DB3.Caption    :='';

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.Preview;
 end;

if linha.Checked = true then
 begin

  if combolinha.Text = '' then
   begin
    messagedlg('SELECIONE uma Linha de Produto!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','GRADE','DESCRICAO',combolinha.text,'LINHA DO PRODUTO','prograde','ENCONTRAR_CODIGO',combolinha,frmsysprocedures.dataset) = 0 then exit;

  ControlaMeta(False);

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and itens.grade = :pGra');
    sql.add('Group By Produtos.proDescricao');
   end;

  if chSim.Checked = true then qryjoin.ParamByName('pbon').Value := 'SIM' else qryjoin.ParamByName('pbon').Value := 'NAO';
   with qryjoin do
    begin
     ParamByName('pGra').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','GRADE','DESCRICAO',combolinha.text,'LINHA DO PRODUTO','prograde','ENCONTRAR_CODIGO',combolinha,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS da Linha de Produto: '+comboLinha.text+' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      comboLinha.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Grade/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption  := '';
   DB1.DataSet     := qryJoin;
   DB1.DataField   := 'NENHUM';

   TEXTO2.Left     := 6;
   TEXTO2.Caption  :='Linha de Produto: ';
   db2.Left        := 100;
   DB2.Caption     := combolinha.text;

   TEXTO3.Caption  := '';
   DB3.Caption     :='';

   TEXTO4.Caption  := '';
   DB4.Caption     := '';

   REPORT.Preview;
 end;


if produto.Checked = true then
 begin

  if comboproduto.Text = '' then
   begin
    messagedlg('SELECIONE um Produto!',mterror,[mbok],0);
    comboproduto.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset) = 0 then exit;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and itens.codproduto = :pProd');
    sql.add('Group By Produtos.proDescricao');
   end;
   if chSim.Checked = true then qryjoin.ParamByName('pbon').Value := 'SIM' else qryjoin.ParamByName('pbon').Value := 'NAO';
   with qryjoin do
    begin
     ParamByName('pProd').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset);
     ParamByName('pDataini').value  := datetostr(datainicial.date);
     ParamByName('pDatafim').value  := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Produto: '+comboproduto.text+ ' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      comboproduto.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  :='Volume de vendas (Produto/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   ControlaMeta(false);

   TEXTO1.Caption := 'Produto: ';
   DB1.DataSet    := qryJoin;
   db1.left       := 58;
   DB1.DataField  := 'ProDescricao';

   TEXTO2.Caption := '';
   DB2.Caption    := '';

   TEXTO3.Caption := '';
   DB3.Caption    := '';

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.Preview;
 end;

if produtocliente.Checked = true then
 begin

  if comboproduto.Text = '' then
   begin
    messagedlg('SELECIONE um Produto!',mterror,[mbok],0);
    comboproduto.SetFocus;
    exit;
   end;

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and pedidos.codCliente = :pCli ');
    sql.add('and itens.codproduto   = :pProd');
    sql.add('Group By Produtos.proDescricao');
   end;
   if chSim.Checked = true then qryjoin.ParamByName('pbon').Value := 'SIM' else qryjoin.ParamByName('pbon').Value := 'NAO';
   with qryjoin do
    begin
     ParamByName('pProd').Value    := frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset);
     ParamByName('pCli').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Produto: '+comboproduto.text+ ' para o Cliente: '+combocliente.text+ ' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      comboproduto.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Produto/Cliente/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   ControlaMeta(False);

   TEXTO1.Caption := 'Produto: ';
   DB1.DataSet    := qryJoin;
   db1.Left       := 58;
   DB1.DataField  := 'Prodescricao';

   texto2.left    := 330;
   TEXTO2.Caption := 'Cliente:';
   db2.left       := 380;
   DB2.CAPTION    := comboCliente.Text;

   TEXTO3.Caption := '';
   DB3.CAPTION    := '';

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.Preview;
 end;

if produtovendedor.Checked = true then
 begin

  if comboproduto.Text = '' then
   begin
    messagedlg('SELECIONE um Produto!',mterror,[mbok],0);
    comboproduto.SetFocus;
    exit;
   end;

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

  ControlaMeta(True);

  dtMetas.Open;
  dtMetas.Filter  := 'CODVENDEDOR = '+ quotedstr(inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset)));
  dtmetas.Filtered := true;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and pedidos.codvendedor = :pVen');
    sql.add('and itens.codproduto    = :pProd');
    sql.add('Group By Produtos.proDescricao');
   end;
   if chSim.Checked = true then qryjoin.ParamByName('pbon').Value := 'SIM' else qryjoin.ParamByName('pbon').Value := 'NAO';
   with qryjoin do
    begin
     ParamByName('pProd').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset) ;
     ParamByName('pVen').Value      := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pDataini').value  := datetostr(datainicial.date);
     ParamByName('pDatafim').value  := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Vendedor: '+combovendedor.text+ ' para o Produto: '+comboproduto.text+ ' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      comboproduto.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  :='Volume de vendas (Produto/Vendedor/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption := 'Produto: ';
   DB1.DataSet    := qryJoin;
   db1.Left       := 58;
   DB1.DataField  := 'ProDescricao';

   texto2.Left    := 320;
   TEXTO2.Caption := 'Vendedor: ';
   db2.left       := 380;
   DB2.CAPTION    := ComboVendedor.Text;

   TEXTO3.Caption := '';
   DB3.CAPTION    := '';

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.Preview;
 end;


if produtotodos.Checked = true then
 begin

  if comboproduto.Text = '' then
   begin
    messagedlg('SELECIONE um Produto!',mterror,[mbok],0);
    comboproduto.SetFocus;
    exit;
   end;

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

 if frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset) = 0 then exit;
 if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
 if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

 ControlaMeta(True);
 dtMetas.Open;
 dtMetas.Filter   := 'CODVENDEDOR = '+ quotedstr(inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset)));
 dtMetas.Filtered := true;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto    = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and pedidos.codCliente  = :pCli ');
    sql.add('and pedidos.codVendedor = :pVen ');
    sql.add('and itens.codproduto    = :pProd');
    sql.add('Group By Produtos.proDescricao');
   end;
   if chSim.Checked = true then qryjoin.ParamByName('pbon').Value := 'SIM' else qryjoin.ParamByName('pbon').Value := 'NAO';
   with qryjoin do
    begin
     ParamByName('pProd').Value    := frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset) ;
     ParamByName('pCli').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pVen').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Vendedor: '+combovendedor.text+ ' do Produto: '+comboproduto.text+ ' para o Cliente: '+combocliente.text+ ' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      comboproduto.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Produto/Cliente/Vendedor/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption  := 'Produto: ';
   DB1.DataSet     := qryJoin;
   DB1.DataField   := 'Prodescricao';

   texto2.left     := 330;
   TEXTO2.Caption  := 'Cliente: ';
   db2.left        := 380;
   DB2.CAPTION     := ComboCliente.Text;

   TEXTO3.Caption  := 'Vendedor: ';
   db3.left        := 305;
   DB3.CAPTION     := ComboVendedor.text;

   TEXTO4.Caption  := '';
   DB4.Caption     :='';

   REPORT.Preview;
 end;


if fornecedorperiodo.Checked = true then
 begin

 if combofornecedor.Text = '' then
  begin
   messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
   combofornecedor.SetFocus;
   exit;
  end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao   = :pbon');
    sql.add('and pedidos.codfornecedor = :pFor');
    sql.add('Group By Produtos.proDescricao');
   end;
   if chSim.Checked = true then qryjoin.ParamByName('pbon').Value := 'SIM' else qryjoin.ParamByName('pbon').Value := 'NAO';
   with qryjoin do
    begin
     ParamByName('pFor').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) ;
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Fornecedor: '+combofornecedor.text+ ' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      combofornecedor.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Fornecedor/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   ControlaMeta(False);

   TEXTO1.Caption := '';
   DB1.DataSet    := qryJoin;
   DB1.DataField  := 'NENHUM';

   TEXTO2.Left    := 6;
   TEXTO2.Caption := 'Fornecedor: ';
   db2.Left       := 80;
   DB2.Caption    := ComboFornecedor.text;

   TEXTO3.Caption := '';
   DB3.Caption    := '';

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.Preview;
 end;

if fornecedorcliente.Checked = true then
 begin

  if combofornecedor.Text = '' then
   begin
    messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and pedidos.codfornecedor = :pFor');
    sql.add('and pedidos.codcliente    = :pCli');
    sql.add('Group By Produtos.proDescricao');
   end;
   if chSim.Checked = true then qryjoin.ParamByName('pbon').Value := 'SIM' else qryjoin.ParamByName('pbon').Value := 'NAO';
   with qryjoin do
    begin
     ParamByName('pFor').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) ;
     ParamByName('pCli').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) ;
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Fornecedor: '+combofornecedor.text+ ' para o Cliente: '+combocliente.text+' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      combofornecedor.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Fornecedor/Cliente/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   ControlaMeta(False);

   TEXTO1.Caption := '';
   DB1.DataSet    := qryJoin;
   DB1.DataField  := 'NENHUM';

   TEXTO2.Left    := 6;
   TEXTO2.Caption :='Fornecedor: ';
   db2.Left       := 80;
   DB2.Caption    := ComboFornecedor.text;

   texto3.left    := 252;
   TEXTO3.Caption := 'Cliente: ';
   db3.Left       := 304;
   DB3.Caption    := ComboCliente.Text;

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.Preview;
 end;

if fornecedorvendedor.Checked = true then
 begin

  if combofornecedor.Text = '' then
   begin
    messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

 if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
 if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

 ControlaMeta(True);
 dtMetas.Open;
 dtMetas.Filter   := 'CODVENDEDOR = '+ quotedstr(inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset)));
 dtMetas.Filtered := true;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao   = :pbon');
    sql.add('and pedidos.codfornecedor = :pFor');
    sql.add('and pedidos.codvendedor   = :pVen');
    sql.add('Group By Produtos.proDescricao');
   end;
   if chSim.Checked = true then qryjoin.ParamByName('pbon').Value := 'SIM' else qryjoin.ParamByName('pbon').Value := 'NAO';
   with qryjoin do
    begin
     ParamByName('pFor').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) ;
     ParamByName('pVen').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Vendedor: '+combovendedor.text+ ' para o Fornecedor: '+combofornecedor.text+' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      combofornecedor.SetFocus;
      exit;
     end;


   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Fornecedor/Vendedor/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption  := '';
   DB1.DataSet     := qryJoin;
   DB1.DataField   := 'NENHUM';

   TEXTO2.Left     := 6;
   TEXTO2.Caption  :='Fornecedor: ';
   db2.Left        := 80;
   DB2.Caption     := combofornecedor.text;

   texto3.left     := 252;
   TEXTO3.Caption  := 'Vendedor: ';
   db3.left        := 315;
   DB3.Caption     := combovendedor.Text;

   TEXTO4.Caption  := '';
   DB4.Caption     := '';

   REPORT.Preview;
 end;


if fornecedortodos.Checked = true then
 begin

   if combofornecedor.Text = '' then
    begin
     messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

   if combovendedor.Text = '' then
    begin
     messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
     combovendedor.SetFocus;
     exit;
    end;

   if combocliente.Text = '' then
    begin
     messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
     combocliente.SetFocus;
     exit;
    end;


 if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
 if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
 if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

 ControlaMeta(True);
 dtMetas.Open;
 dtMetas.Filter := 'CODVENDEDOR = '+ quotedstr(inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset)));
 dtmetas.Filtered := true;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto    = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao   = :pbon');
    sql.add('and pedidos.codfornecedor = :pFor');
    sql.add('and pedidos.codcliente    = :pCli');
    sql.add('and pedidos.codvendedor   = :pVen');
    sql.add('Group By Produtos.proDescricao');
   end;
   if chSim.Checked = true then qryjoin.ParamByName('pbon').Value := 'SIM' else qryjoin.ParamByName('pbon').Value := 'NAO';
   with qryjoin do
    begin
     ParamByName('pFor').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCli').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) ;
     ParamByName('pVen').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Vendedor: '+combovendedor.text+ ' para o Fornecedor: '+combofornecedor.text+ ' para o Cliente: '+combocliente.text+ ' no período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      combofornecedor.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Fornecedor/Vendedor/Cliente/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption  := '';
   DB1.DataSet     := qryJoin;
   DB1.DataField   := 'NENHUM';

   TEXTO2.Left     := 6;
   TEXTO2.Caption  :='Fornecedor: ';
   db2.Left        := 80;
   DB2.Caption     := combofornecedor.text;

   texto3.left     := 252;
   TEXTO3.Caption  := 'Cliente: ';
   db3.Left        := 304;
   DB3.Caption     := combocliente.Text;

   TEXTO4.Caption  := 'Vendedor: ';
   DB4.Caption     := combovendedor.Text;

   REPORT.Preview;
 end;
end;

procedure TfrmRelatPedidos_TOTALVENDA.FormShow(Sender: TObject);
begin
datafinal.Date   := now;
datainicial.Date := incmonth(now,-1);
end;

procedure TfrmRelatPedidos_TOTALVENDA.FormCreate(Sender: TObject);
begin
frmSYSProcedures.qryempresa.Open;
empresa.caption := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
frmSYSProcedures.qryEMPRESA.close;

frmSYSProcedures.constroicombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
frmSYSProcedures.constroicombo('select * from clientes order by razao','razao',combocliente);
frmSYSProcedures.constroicombo('select * from produtos order by prodescricao','prodescricao',comboproduto);
frmSYSProcedures.constroicombo('select * from grade order by descricao','descricao',combolinha);

frmsysprocedures.combo(combovendedor,true);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,false);
frmsysprocedures.combo(combolinha,false);
frmsysprocedures.combo(comboproduto,false);
end;

procedure TfrmRelatPedidos_TOTALVENDA.SpeedButton3Click(Sender: TObject);
begin
report.PrinterSetup;
end;

procedure TfrmRelatPedidos_TOTALVENDA.QRSubDetail9BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
vVendida:real;
vMeta:real;
vTotal:real;
begin
 try
  vMeta := dtmetas.fieldbyname('meta').value;
  vVendida := qryjoin.fieldbyname('qtde').value;
  vVendida := vVendida * 100;
  vTotal := vVendida / vMeta;
  atingida.Caption := floattostr(TRUNC(vTotal*100)/100) + '%';
 except
  atingida.caption:= '------';
 end;
end;

PROCEDURE tfrmRelatPedidos_TOTALVENDA.ControlaMeta(vModo:boolean);
begin
//COM METAS
if vModo = True then
begin
QRSHAPE208.WIDTH     := 701;
QRSHAPE2.PEN.Style   := PSSOLID;
QRLABEL2.Font.Color  := CLBLACK;
QRSHAPE3.PEN.Style   := PSSOLID;
QRLABEL1.Font.Color  := CLBLACK;
QRDBTEXT3.Font.Color := CLBLACK;
ATINGIDA.Font.Color  := CLBLACK;
QRSHAPE5.PEN.Style   := PSSOLID;
QRSHAPE196.WIDTH     := 701;
end;

//SEM METAS
if vModo = False then
begin
QRSHAPE208.WIDTH     := 541;
QRSHAPE2.PEN.Style   := PSCLEAR;
QRLABEL2.Font.Color  := CLWHITE;
QRSHAPE3.PEN.Style   := PSCLEAR;
QRLABEL1.Font.Color  := CLWHITE;
QRDBTEXT3.Font.Color := CLWHITE;
ATINGIDA.Font.Color  := CLWHITE;
QRSHAPE5.PEN.Style   := PSCLEAR;
QRSHAPE196.WIDTH     := 541;
end;

end;

procedure TfrmRelatPedidos_TOTALVENDA.QRDBText3Print(sender: TObject;  var Value: String);
begin
IF (VALUE = NULL) OR (VALUE = '0') THEN VALUE := 'SEM META';
end;

procedure TfrmRelatPedidos_TOTALVENDA.FormKeyDown(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then SpeedButton1Click(self);
if key = vk_escape then close;
end;

procedure TfrmRelatPedidos_TOTALVENDA.vendedorClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,true);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,false);
frmsysprocedures.combo(combolinha,false);
frmsysprocedures.combo(comboproduto,false);
Combovendedor.SetFocus;
end;

procedure TfrmRelatPedidos_TOTALVENDA.clienteClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,false);
frmsysprocedures.combo(combocliente,true);
frmsysprocedures.combo(combofornecedor,false);
frmsysprocedures.combo(combolinha,false);
frmsysprocedures.combo(comboproduto,false);
Combocliente.SetFocus;
end;

procedure TfrmRelatPedidos_TOTALVENDA.linhaClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,false);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,false);
frmsysprocedures.combo(combolinha,true);
frmsysprocedures.combo(comboproduto,false);
Combolinha.SetFocus;
end;

procedure TfrmRelatPedidos_TOTALVENDA.PRODUTOClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,false);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,false);
frmsysprocedures.combo(combolinha,false);
frmsysprocedures.combo(comboproduto,true);
Comboproduto.SetFocus;
end;

procedure TfrmRelatPedidos_TOTALVENDA.PRODUTOCLIENTEClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,false);
frmsysprocedures.combo(combocliente,true);
frmsysprocedures.combo(combofornecedor,false);
frmsysprocedures.combo(combolinha,false);
frmsysprocedures.combo(comboproduto,true);
Comboproduto.SetFocus;
end;

procedure TfrmRelatPedidos_TOTALVENDA.PRODUTOVENDEDORClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,true);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,false);
frmsysprocedures.combo(combolinha,false);
frmsysprocedures.combo(comboproduto,true);
Comboproduto.SetFocus;
end;

procedure TfrmRelatPedidos_TOTALVENDA.PRODUTOTODOSClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,true);
frmsysprocedures.combo(combocliente,true);
frmsysprocedures.combo(combofornecedor,false);
frmsysprocedures.combo(combolinha,false);
frmsysprocedures.combo(comboproduto,true);
Comboproduto.SetFocus;
end;

procedure TfrmRelatPedidos_TOTALVENDA.FORNECEDORPERIODOClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,false);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,true);
frmsysprocedures.combo(combolinha,false);
frmsysprocedures.combo(comboproduto,false);
Combofornecedor.SetFocus;
end;

procedure TfrmRelatPedidos_TOTALVENDA.FORNECEDORCLIENTEClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,false);
frmsysprocedures.combo(combocliente,true);
frmsysprocedures.combo(combofornecedor,true);
frmsysprocedures.combo(combolinha,false);
frmsysprocedures.combo(comboproduto,false);
Combofornecedor.SetFocus;
end;

procedure TfrmRelatPedidos_TOTALVENDA.FORNECEDORVENDEDORClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,true);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,true);
frmsysprocedures.combo(combolinha,false);
frmsysprocedures.combo(comboproduto,false);
Combofornecedor.SetFocus;
end;

procedure TfrmRelatPedidos_TOTALVENDA.fornecedortodosClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,true);
frmsysprocedures.combo(combocliente,true);
frmsysprocedures.combo(combofornecedor,true);
frmsysprocedures.combo(combolinha,false);
frmsysprocedures.combo(comboproduto,false);
Combofornecedor.SetFocus;
end;

procedure TfrmRelatPedidos_TOTALVENDA.SpeedButton4Click(Sender: TObject);
begin

if datainicial.Date > datafinal.Date then
 begin
  messagedlg('Data inicial NÃO PODE ser maior que a Data final!',mterror,[mbok],0);
  datainicial.SetFocus;
  exit;
 end;

if vendedor.Checked = true then
 begin

  ControlaMeta(True);

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

  dtMetas.Open;
  dtMetas.Filter := 'CODVENDEDOR = '+ quotedstr(inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset)));
  dtMetas.Filtered := true;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto    = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and pedidos.codvendedor = :pVen');
    sql.add('Group By Produtos.proDescricao');
   end;

   with qryjoin do
    begin
     ParamByName('pVen').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Vendedor: '+comboVendedor.text+' no período de ' +datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date) + ' !',mterror,[mbok],0);
      combovendedor.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Vendedor/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption  := '';
   DB1.DataSet     := qryJoin;
   DB1.DataField   := 'NENHUM';

   TEXTO2.Left     := 6;
   TEXTO2.Caption  := 'Vendedor: ';
   db2.Left        := 70;
   DB2.Caption     := combovendedor.text;

   texto3.left    :=230;
   TEXTO3.Caption := '';
   db3.Left       :=310;
   DB3.Caption    :='';

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.print;
 end;

if cliente.Checked = true then
 begin

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;

  ControlaMeta(False);

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto    = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and pedidos.codcliente  = :pCli');
    sql.add('Group By Produtos.proDescricao');
   end;

   with qryjoin do
    begin
     ParamByName('pCli').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS para o Cliente: '+comboCliente.text+' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      comboCliente.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Cliente/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption  := '';
   DB1.DataSet     := qryJoin;
   DB1.DataField   := 'NENHUM';

   TEXTO2.Left     := 6;
   TEXTO2.Caption  := 'Cliente: ';
   db2.Left        := 70;
   DB2.Caption     := combocliente.text;

   texto3.left    :=230;
   TEXTO3.Caption := '';
   db3.Left       :=310;
   DB3.Caption    :='';

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.print;
 end;

if linha.Checked = true then
 begin

  if combolinha.Text = '' then
   begin
    messagedlg('SELECIONE uma Linha de Produto!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','GRADE','DESCRICAO',combolinha.text,'LINHA DO PRODUTO','prograde','ENCONTRAR_CODIGO',combolinha,frmsysprocedures.dataset) = 0 then exit;

  ControlaMeta(False);

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and itens.grade = :pGra');
    sql.add('Group By Produtos.proDescricao');
   end;

   with qryjoin do
    begin
     ParamByName('pGra').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','GRADE','DESCRICAO',combolinha.text,'LINHA DO PRODUTO','prograde','ENCONTRAR_CODIGO',combolinha,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS da Linha de Produto: '+comboLinha.text+' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      comboLinha.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Grade/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption  := '';
   DB1.DataSet     := qryJoin;
   DB1.DataField   := 'NENHUM';

   TEXTO2.Left     := 6;
   TEXTO2.Caption  :='Linha de Produto: ';
   db2.Left        := 100;
   DB2.Caption     := combolinha.text;

   TEXTO3.Caption  := '';
   DB3.Caption     :='';

   TEXTO4.Caption  := '';
   DB4.Caption     := '';

   REPORT.print;
 end;


if produto.Checked = true then
 begin

  if comboproduto.Text = '' then
   begin
    messagedlg('SELECIONE um Produto!',mterror,[mbok],0);
    comboproduto.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset) = 0 then exit;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and itens.codproduto = :pProd');
    sql.add('Group By Produtos.proDescricao');
   end;

   with qryjoin do
    begin
     ParamByName('pProd').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset);
     ParamByName('pDataini').value  := datetostr(datainicial.date);
     ParamByName('pDatafim').value  := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Produto: '+comboproduto.text+ ' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      comboproduto.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  :='Volume de vendas (Produto/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   ControlaMeta(false);

   TEXTO1.Caption := 'Produto: ';
   DB1.DataSet    := qryJoin;
   db1.left       := 58;
   DB1.DataField  := 'ProDescricao';

   TEXTO2.Caption := '';
   DB2.Caption    := '';

   TEXTO3.Caption := '';
   DB3.Caption    := '';

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.print;
 end;

if produtocliente.Checked = true then
 begin

  if comboproduto.Text = '' then
   begin
    messagedlg('SELECIONE um Produto!',mterror,[mbok],0);
    comboproduto.SetFocus;
    exit;
   end;

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and pedidos.codCliente = :pCli ');
    sql.add('and itens.codproduto   = :pProd');
    sql.add('Group By Produtos.proDescricao');
   end;

   with qryjoin do
    begin
     ParamByName('pProd').Value    := frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset);
     ParamByName('pCli').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Produto: '+comboproduto.text+ ' para o Cliente: '+combocliente.text+ ' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      comboproduto.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Produto/Cliente/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   ControlaMeta(False);

   TEXTO1.Caption := 'Produto: ';
   DB1.DataSet    := qryJoin;
   db1.Left       := 58;
   DB1.DataField  := 'Prodescricao';

   texto2.left    := 330;
   TEXTO2.Caption := 'Cliente:';
   db2.left       := 380;
   DB2.CAPTION    := comboCliente.Text;

   TEXTO3.Caption := '';
   DB3.CAPTION    := '';

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.print;
 end;

if produtovendedor.Checked = true then
 begin

  if comboproduto.Text = '' then
   begin
    messagedlg('SELECIONE um Produto!',mterror,[mbok],0);
    comboproduto.SetFocus;
    exit;
   end;

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

  ControlaMeta(True);

  dtMetas.Open;
  dtMetas.Filter  := 'CODVENDEDOR = '+ quotedstr(inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset)));
  dtmetas.Filtered := true;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and pedidos.codvendedor = :pVen');
    sql.add('and itens.codproduto    = :pProd');
    sql.add('Group By Produtos.proDescricao');
   end;

   with qryjoin do
    begin
     ParamByName('pProd').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset) ;
     ParamByName('pVen').Value      := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pDataini').value  := datetostr(datainicial.date);
     ParamByName('pDatafim').value  := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Vendedor: '+combovendedor.text+ ' para o Produto: '+comboproduto.text+ ' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      comboproduto.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  :='Volume de vendas (Produto/Vendedor/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption := 'Produto: ';
   DB1.DataSet    := qryJoin;
   db1.Left       := 58;
   DB1.DataField  := 'ProDescricao';

   texto2.Left    := 320;
   TEXTO2.Caption := 'Vendedor: ';
   db2.left       := 380;
   DB2.CAPTION    := ComboVendedor.Text;

   TEXTO3.Caption := '';
   DB3.CAPTION    := '';

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.print;
 end;


if produtotodos.Checked = true then
 begin

  if comboproduto.Text = '' then
   begin
    messagedlg('SELECIONE um Produto!',mterror,[mbok],0);
    comboproduto.SetFocus;
    exit;
   end;

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

 if frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset) = 0 then exit;
 if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
 if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

 ControlaMeta(True);
 dtMetas.Open;
 dtMetas.Filter   := 'CODVENDEDOR = '+ quotedstr(inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset)));
 dtMetas.Filtered := true;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto    = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and pedidos.codCliente  = :pCli ');
    sql.add('and pedidos.codVendedor = :pVen ');
    sql.add('and itens.codproduto    = :pProd');
    sql.add('Group By Produtos.proDescricao');
   end;

   with qryjoin do
    begin
     ParamByName('pProd').Value    := frmSYSProcedures.BuscaCombo('PESQUISA','PRODUTOS','PRODESCRICAO',comboproduto.text,'PRODUTO','PROCODIGO','ENCONTRAR_CODIGO',comboproduto,frmsysprocedures.dataset) ;
     ParamByName('pCli').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pVen').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Vendedor: '+combovendedor.text+ ' do Produto: '+comboproduto.text+ ' para o Cliente: '+combocliente.text+ ' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      comboproduto.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Produto/Cliente/Vendedor/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption  := 'Produto: ';
   DB1.DataSet     := qryJoin;
   DB1.DataField   := 'Prodescricao';

   texto2.left     := 330;
   TEXTO2.Caption  := 'Cliente: ';
   db2.left        := 380;
   DB2.CAPTION     := ComboCliente.Text;

   TEXTO3.Caption  := 'Vendedor: ';
   db3.left        := 305;
   DB3.CAPTION     := ComboVendedor.text;

   TEXTO4.Caption  := '';
   DB4.Caption     :='';

   REPORT.print;
 end;


if fornecedorperiodo.Checked = true then
 begin

 if combofornecedor.Text = '' then
  begin
   messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
   combofornecedor.SetFocus;
   exit;
  end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao   = ''NAO''');
    sql.add('and pedidos.codfornecedor = :pFor');
    sql.add('Group By Produtos.proDescricao');
   end;

   with qryjoin do
    begin
     ParamByName('pFor').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) ;
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Fornecedor: '+combofornecedor.text+ ' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      combofornecedor.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Fornecedor/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   ControlaMeta(False);

   TEXTO1.Caption := '';
   DB1.DataSet    := qryJoin;
   DB1.DataField  := 'NENHUM';

   TEXTO2.Left    := 6;
   TEXTO2.Caption := 'Fornecedor: ';
   db2.Left       := 80;
   DB2.Caption    := ComboFornecedor.text;

   TEXTO3.Caption := '';
   DB3.Caption    := '';

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.print;
 end;

if fornecedorcliente.Checked = true then
 begin

  if combofornecedor.Text = '' then
   begin
    messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = :pBon');
    sql.add('and pedidos.codfornecedor = :pFor');
    sql.add('and pedidos.codcliente    = :pCli');
    sql.add('Group By Produtos.proDescricao');
   end;

   with qryjoin do
    begin
     ParamByName('pFor').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) ;
     ParamByName('pCli').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) ;
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Fornecedor: '+combofornecedor.text+ ' para o Cliente: '+combocliente.text+' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      combofornecedor.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Fornecedor/Cliente/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   ControlaMeta(False);

   TEXTO1.Caption := '';
   DB1.DataSet    := qryJoin;
   DB1.DataField  := 'NENHUM';

   TEXTO2.Left    := 6;
   TEXTO2.Caption :='Fornecedor: ';
   db2.Left       := 80;
   DB2.Caption    := ComboFornecedor.text;

   texto3.left    := 252;
   TEXTO3.Caption := 'Cliente: ';
   db3.Left       := 304;
   DB3.Caption    := ComboCliente.Text;

   TEXTO4.Caption := '';
   DB4.Caption    := '';

   REPORT.print;
 end;

if fornecedorvendedor.Checked = true then
 begin

  if combofornecedor.Text = '' then
   begin
    messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

 if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
 if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

 ControlaMeta(True);
 dtMetas.Open;
 dtMetas.Filter   := 'CODVENDEDOR = '+ quotedstr(inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset)));
 dtMetas.Filtered := true;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao   = ''NAO''');
    sql.add('and pedidos.codfornecedor = :pFor');
    sql.add('and pedidos.codvendedor   = :pVen');
    sql.add('Group By Produtos.proDescricao');
   end;

   with qryjoin do
    begin
     ParamByName('pFor').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) ;
     ParamByName('pVen').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Vendedor: '+combovendedor.text+ ' para o Fornecedor: '+combofornecedor.text+' no período de '+datetostr(datainicial.date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      combofornecedor.SetFocus;
      exit;
     end;


   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Fornecedor/Vendedor/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption  := '';
   DB1.DataSet     := qryJoin;
   DB1.DataField   := 'NENHUM';

   TEXTO2.Left     := 6;
   TEXTO2.Caption  :='Fornecedor: ';
   db2.Left        := 80;
   DB2.Caption     := combofornecedor.text;

   texto3.left     := 252;
   TEXTO3.Caption  := 'Vendedor: ';
   db3.left        := 315;
   DB3.Caption     := combovendedor.Text;

   TEXTO4.Caption  := '';
   DB4.Caption     := '';

   REPORT.print;
 end;


if fornecedortodos.Checked = true then
 begin

   if combofornecedor.Text = '' then
    begin
     messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

   if combovendedor.Text = '' then
    begin
     messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
     combovendedor.SetFocus;
     exit;
    end;

   if combocliente.Text = '' then
    begin
     messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
     combocliente.SetFocus;
     exit;
    end;


 if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
 if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
 if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

 ControlaMeta(True);
 dtMetas.Open;
 dtMetas.Filter := 'CODVENDEDOR = '+ quotedstr(inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset)));
 dtmetas.Filtered := true;

  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))');
    sql.add('From Produtos,Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Itens.CodProduto    = Produtos.procodigo');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao   = ''NAO''');
    sql.add('and pedidos.codfornecedor = :pFor');
    sql.add('and pedidos.codcliente    = :pCli');
    sql.add('and pedidos.codvendedor   = :pVen');
    sql.add('Group By Produtos.proDescricao');
   end;

   with qryjoin do
    begin
     ParamByName('pFor').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCli').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) ;
     ParamByName('pVen').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pDataini').value := datetostr(datainicial.date);
     ParamByName('pDatafim').value := datetostr(datafinal.date);
     open;
    end;

    if qryjoin.Eof then
     begin
      Messagedlg('NÃO FORAM encontrados VENDAS do Vendedor: '+combovendedor.text+ ' para o Fornecedor: '+combofornecedor.text+ ' para o Cliente: '+combocliente.text+ ' no período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.date),mterror,[mbok],0);
      combofornecedor.SetFocus;
      exit;
     end;

   periodo.Caption := 'RELATÓRIO DE: '+datetostr(datainicial.Date)+ ' ATÉ '+datetostr(datafinal.Date);
   titulo.Caption  := 'Volume de vendas (Fornecedor/Vendedor/Cliente/Período)';
   inicial.caption := datetostr(datainicial.Date);
   final.caption   := datetostr(datafinal.Date);

   TEXTO1.Caption  := '';
   DB1.DataSet     := qryJoin;
   DB1.DataField   := 'NENHUM';

   TEXTO2.Left     := 6;
   TEXTO2.Caption  :='Fornecedor: ';
   db2.Left        := 80;
   DB2.Caption     := combofornecedor.text;

   texto3.left     := 252;
   TEXTO3.Caption  := 'Cliente: ';
   db3.Left        := 304;
   DB3.Caption     := combocliente.Text;

   TEXTO4.Caption  := 'Vendedor: ';
   DB4.Caption     := combovendedor.Text;

   REPORT.print;
 end;

end;

procedure TfrmRelatPedidos_TOTALVENDA.QRDBText63Print(sender: TObject;
  var Value: String);
var
 tot:integer;
begin
tot   := trunc(qryjoin.Fieldbyname('qtde').value);
value := inttostr(tot);
end;

procedure TfrmRelatPedidos_TOTALVENDA.QRExpr10Print(sender: TObject;
  var Value: String);
var
conv:real;
begin
conv:=strtofloat(value);
value := inttostr(trunc(conv));
end;

end.
