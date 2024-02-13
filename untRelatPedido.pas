unit untRelatPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls, DB, ibx.IBCustomDataSet, ibx.IbQuery,
  QRCtrls, QuickRpt, ExtCtrls, ibx.IBTable, DBTables, Grids, DBGrids, DBCtrls,QRExport,
  OleServer, WordXP;

type
  TfrmRelatPedidos_FEITOS = class(TForm)
    GroupBox1: TGroupBox;
    periodo: TRadioButton;
    VENDEDOR: TRadioButton;
    FORNECVENDEDOR: TRadioButton;
    CLIENTEFORNECEDOR: TRadioButton;
    CLIENTE: TRadioButton;
    qpedidos: TQuickRep;
    dsPedidos: TDataSource;
    qryPedidos: TIBQuery;
    qryPedidosCODPEDIDO: TIBStringField;
    qryPedidosCODCLIENTE: TIntegerField;
    qryPedidosCODVENDEDOR: TIBStringField;
    qryPedidosCODFORNECEDOR: TIBStringField;
    qryPedidosCODTRANS: TIBStringField;
    qryPedidosTIPO_FRETE: TIBStringField;
    qryPedidosPRAZO_PGTO: TIntegerField;
    qryPedidosENTREGA: TDateTimeField;
    qryPedidosDATA: TDateTimeField;
    dtItens: TIBTable;
    dtItensCODPEDIDO: TIBStringField;
    dtItensCODPRODUTO: TIBStringField;
    dtItensQTDE: TFloatField;
    dtItensVALOR: TFloatField;
    dtClientes: TIBTable;
    dtVendedor: TIBTable;
    dtPgto: TIBTable;
    dtItenstotal: TCurrencyField;
    FORNECEDOR: TRadioButton;
    TODOS: TRadioButton;
    VENDEDORCLIENTE: TRadioButton;
    dtProdutos: TIBTable;
    dsItens: TDataSource;
    dtFornecedor: TIBTable;
    Shape2: TShape;
    qryPedidosORDEM_DE_COMPRA: TIBStringField;
    qryPedidosBONIFICACAO: TIBStringField;
    qryPedidosOBS: TIBStringField;
    dtItensGRADE: TIntegerField;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRLabel18: TQRLabel;
    QRShape24: TQRShape;
    QRLabel19: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRDBText7: TQRDBText;
    QRShape18: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRShape8: TQRShape;
    QRShape17: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel26: TQRLabel;
    empresa: TQRLabel;
    NOME: TQRLabel;
    QRShape11: TQRShape;
    lblvendedor: TQRLabel;
    endereco: TQRLabel;
    outros: TQRLabel;
    GroupFooterBand1: TQRBand;
    QRShape9: TQRShape;
    QRLabel14: TQRLabel;
    QRExpr2: TQRExpr;
    QRShape10: TQRShape;
    QRShape19: TQRShape;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRShape12: TQRShape;
    dtItensDESCONTO2: TFloatField;
    dtItensDESCONTO3: TFloatField;
    dtItensDESCONTO1: TFloatField;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    QRShape4: TQRShape;
    QRShape23: TQRShape;
    QRDBText13: TQRDBText;
    QRShape25: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    Image2: TImage;
    Label2: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    datainicial: TDateTimePicker;
    datafinal: TDateTimePicker;
    combocliente: TComboBox;
    combofornecedor: TComboBox;
    combovendedor: TComboBox;
    Shape4: TShape;
    Label22: TLabel;
    Label36: TLabel;
    Image3: TImage;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    QRLabel11: TQRLabel;
    QRDBText14: TQRDBText;
    QRShape26: TQRShape;
    QRLabel15: TQRLabel;
    QRShape29: TQRShape;
    QRDBText16: TQRDBText;
    QRShape31: TQRShape;
    QRLabel16: TQRLabel;
    QRDBText17: TQRDBText;
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
    procedure SpeedButton1Click(Sender: TObject);
    procedure dtItensCalcFields(DataSet: TDataSet);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure periodoClick(Sender: TObject);
    procedure VENDEDORClick(Sender: TObject);
    procedure CLIENTEClick(Sender: TObject);
    procedure FORNECEDORClick(Sender: TObject);
    procedure FORNECVENDEDORClick(Sender: TObject);
    procedure VENDEDORCLIENTEClick(Sender: TObject);
    procedure CLIENTEFORNECEDORClick(Sender: TObject);
    procedure TODOSClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatPedidos_FEITOS: TfrmRelatPedidos_FEITOS;
  total:string;

implementation

uses untMenu, untProcedures;

{$R *.dfm}

procedure TfrmRelatPedidos_FEITOS.SpeedButton1Click(Sender: TObject);
begin

{if datainicial.Date > datafinal.Date then
 begin
  messagedlg('Data inicial NÃO PODE ser maior que a Data final!',mterror,[mbok],0);
  datainicial.SetFocus;
  exit;
 end;}

if periodo.Checked = true then
 begin
   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblvendedor.Caption := '';
   qrypedidos.close;
   qrypedidos.sql.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.parambyname('pdataini').Value :=DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value :=DATETOSTR(DATAFINAL.Date);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' !',mterror,[mbok],0);
     datainicial.SetFocus;
     exit;
    end;

   dtfornecedor.open;
   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.Preview;
 end;

if vendedor.Checked = true then
 begin

   if combovendedor.Text = '' then
    begin
     messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
     combovendedor.SetFocus;
     exit;
    end;

   if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := 'VENDEDOR: '+combovendedor.Text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codvendedor = :pVen');
   qrypedidos.parambyname('pdataini').Value := DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value := DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pVen').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Vendedor: '+combovendedor.Text,mterror,[mbok],0);
     combovendedor.SetFocus;
     exit;
    end;

   dtfornecedor.open;
   dtitens.Open;
   dtprodutos.open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.Preview;
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

   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := 'CLIENTE: '+combocliente.Text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codCliente= :pCli');
   qrypedidos.parambyname('pdataini').Value := DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value := DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pCli').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Cliente: '+combocliente.Text,mterror,[mbok],0);
     combocliente.SetFocus;
     exit;
    end;

   dtfornecedor.open;
   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.Preview;
 end;

if fornecedor.Checked = true then
 begin

  if combofornecedor.Text = '' then
   begin
    messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

   if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;

   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := 'FORNECEDOR: '+combofornecedor.Text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codfornecedor = :pFor');
   qrypedidos.parambyname('pdataini').Value := DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value := DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pFor').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Fornecedor: '+combofornecedor.Text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.Preview;
 end;

if fornecvendedor.Checked = true then
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

   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := 'Vendedor: '+combovendedor.Text+'- Fornecedor: '+combofornecedor.text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codfornecedor = :pFor');
   qrypedidos.SQL.add('and codvendedor   = :pVen');
   qrypedidos.parambyname('pdataini').Value := DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value := DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pFor').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qrypedidos.ParamByName('pVen').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Vendedor: '+combovendedor.Text+ ' para o Fornecedor: '+combofornecedor.Text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.Preview;
 end;

 if vendedorcliente.Checked = true then
 begin

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
   if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := 'Cliente: '+combocliente.Text+ ' - Vendedor: '+combovendedor.text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codCLIENTE  = :pCli');
   qrypedidos.SQL.add('and codVENDEDOR = :pVen');
   qrypedidos.parambyname('pdataini').Value :=DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value :=DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pCli').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
   qrypedidos.ParamByName('pVen').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Cliente: '+combocliente.Text+ ' para o Vendedor: '+combovendedor.Text,mterror,[mbok],0);
     combovendedor.SetFocus;
     exit;
    end;

   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.Preview;
 end;

if CLIENTEFORNECEDOR.Checked = true then
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

   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := 'Cliente: '+combocliente.Text+ ' - Fornecedor: '+combofornecedor.text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codCLIENTE    = :pCli');
   qrypedidos.SQL.add('and codFORNECEDOR = :pFor');
   qrypedidos.parambyname('pdataini').Value := DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value := DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pCli').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
   qrypedidos.ParamByName('pFor').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Cliente: '+comboCliente.Text+ ' para o Fornecedor: '+combofornecedor.Text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   DTFORNECEDOR.Open; 
   qpedidos.Preview;
 end;

if TODOS.Checked = true then
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

   NOME.Caption        := 'RELATÓRIO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := combocliente.Text+ ' - '+combovendedor.text+' - '+combofornecedor.text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codCLIENTE    = :pCli');
   qrypedidos.SQL.add('and codFORNECEDOR = :pFor');
   qrypedidos.SQL.add('and codVENDEDOR   = :pVen');
   qrypedidos.parambyname('pdataini').Value := DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value := DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pCli').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
   qrypedidos.ParamByName('pFor').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qrypedidos.ParamByName('pVen').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qrypedidos.Open;

    if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Cliente: '+combocliente.Text+ ' do Vendedor: '+ combovendedor.Text + ' para o Fornecedor: '+combofornecedor.Text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.Preview;
 end;
end;

procedure TfrmRelatPedidos_FEITOS.dtItensCalcFields(DataSet: TDataSet);
begin
dtitenstotal.value:=((dtitensqtde.Value * dtitensvalor.Value) - (dtitensqtde.Value * dtitensvalor.Value * (dtitensdesconto1.value/100)));
dtitenstotal.value:=( (dtitenstotal.Value) - (dtitenstotal.Value * (dtitensdesconto2.value/100)));
dtitenstotal.value:=( (dtitenstotal.Value) - (dtitenstotal.Value * (dtitensdesconto3.value/100)));
end;

procedure TfrmRelatPedidos_FEITOS.SpeedButton3Click(Sender: TObject);
begin
qpedidos.PrinterSetup;
end;

procedure TfrmRelatPedidos_FEITOS.FormCreate(Sender: TObject);
begin
frmSYSProcedures.qryempresa.Open;
empresa.caption  := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
endereco.Caption := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('endereco').value +' - CEP: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cep').value+ ' - Fone: ' +frmSYSProcedures.qryEMPRESA.FIELDBYNAME('telefone').value;
outros.Caption   := 'FAX: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('fax').value + ' - E-mail: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('email').value + ' - ' + frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cidade').value + '-'+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('uf').value;
frmSYSProcedures.qryEMPRESA.close;

frmSYSProcedures.constroicombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
frmSYSProcedures.constroicombo('select * from clientes order by razao','razao',combocliente);

DATAFINAL.Date   := now;
datainicial.Date := incmonth (now,-1);

frmsysprocedures.combo(combovendedor,false);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,false);
end;

procedure TfrmRelatPedidos_FEITOS.FormKeyDown(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then SpeedButton1Click(self);
if key = vk_escape then close;
end;

procedure TfrmRelatPedidos_FEITOS.periodoClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,false);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,false);
datainicial.SetFocus;
end;

procedure TfrmRelatPedidos_FEITOS.VENDEDORClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,true);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,false);
Combovendedor.SetFocus;
end;

procedure TfrmRelatPedidos_FEITOS.CLIENTEClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,false);
frmsysprocedures.combo(combocliente,true);
frmsysprocedures.combo(combofornecedor,false);
Combocliente.SetFocus;
end;

procedure TfrmRelatPedidos_FEITOS.FORNECEDORClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,false);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,true);
Combofornecedor.SetFocus;
end;

procedure TfrmRelatPedidos_FEITOS.FORNECVENDEDORClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,true);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,true);
Combofornecedor.SetFocus;
end;

procedure TfrmRelatPedidos_FEITOS.VENDEDORCLIENTEClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,true);
frmsysprocedures.combo(combocliente,true);
frmsysprocedures.combo(combofornecedor,false);
Combovendedor.SetFocus;
end;

procedure TfrmRelatPedidos_FEITOS.CLIENTEFORNECEDORClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,false);
frmsysprocedures.combo(combocliente,true);
frmsysprocedures.combo(combofornecedor,true);
Combofornecedor.SetFocus;
end;

procedure TfrmRelatPedidos_FEITOS.TODOSClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,true);
frmsysprocedures.combo(combocliente,true);
frmsysprocedures.combo(combofornecedor,true);
ComboFornecedor.SetFocus;
end;

procedure TfrmRelatPedidos_FEITOS.SpeedButton2Click(Sender: TObject);
begin

{if datainicial.Date > datafinal.Date then
 begin
  messagedlg('Data inicial NÃO PODE ser maior que a Data final!',mterror,[mbok],0);
  datainicial.SetFocus;
  exit;
 end;}

if periodo.Checked = true then
 begin
   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblvendedor.Caption := '';
   qrypedidos.close;
   qrypedidos.sql.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.parambyname('pdataini').Value :=DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value :=DATETOSTR(DATAFINAL.Date);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' !',mterror,[mbok],0);
     datainicial.SetFocus;
     exit;
    end;

   dtfornecedor.open;
   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.print;
 end;

if vendedor.Checked = true then
 begin

   if combovendedor.Text = '' then
    begin
     messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
     combovendedor.SetFocus;
     exit;
    end;

   if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := 'VENDEDOR: '+combovendedor.Text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codvendedor = :pVen');
   qrypedidos.parambyname('pdataini').Value := DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value := DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pVen').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Vendedor: '+combovendedor.Text,mterror,[mbok],0);
     combovendedor.SetFocus;
     exit;
    end;

   dtfornecedor.open;
   dtitens.Open;
   dtprodutos.open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.print;
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

   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := 'CLIENTE: '+combocliente.Text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codCliente= :pCli');
   qrypedidos.parambyname('pdataini').Value := DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value := DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pCli').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Cliente: '+combocliente.Text,mterror,[mbok],0);
     combocliente.SetFocus;
     exit;
    end;

   dtfornecedor.open;
   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.print;
 end;

if fornecedor.Checked = true then
 begin

  if combofornecedor.Text = '' then
   begin
    messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

   if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;

   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := 'FORNECEDOR: '+combofornecedor.Text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codfornecedor = :pFor');
   qrypedidos.parambyname('pdataini').Value := DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value := DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pFor').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Fornecedor: '+combofornecedor.Text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.print;
 end;

if fornecvendedor.Checked = true then
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

   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := 'Vendedor: '+combovendedor.Text+'- Fornecedor: '+combofornecedor.text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codfornecedor = :pFor');
   qrypedidos.SQL.add('and codvendedor   = :pVen');
   qrypedidos.parambyname('pdataini').Value := DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value := DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pFor').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qrypedidos.ParamByName('pVen').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Vendedor: '+combovendedor.Text+ ' para o Fornecedor: '+combofornecedor.Text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.print;
 end;

 if vendedorcliente.Checked = true then
 begin

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
   if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := 'Cliente: '+combocliente.Text+ ' - Vendedor: '+combovendedor.text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codCLIENTE  = :pCli');
   qrypedidos.SQL.add('and codVENDEDOR = :pVen');
   qrypedidos.parambyname('pdataini').Value :=DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value :=DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pCli').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
   qrypedidos.ParamByName('pVen').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Cliente: '+combocliente.Text+ ' para o Vendedor: '+combovendedor.Text,mterror,[mbok],0);
     combovendedor.SetFocus;
     exit;
    end;

   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.print;
 end;

if CLIENTEFORNECEDOR.Checked = true then
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

   NOME.Caption        := 'HISTÓRICO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := 'Cliente: '+combocliente.Text+ ' - Fornecedor: '+combofornecedor.text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codCLIENTE    = :pCli');
   qrypedidos.SQL.add('and codFORNECEDOR = :pFor');
   qrypedidos.parambyname('pdataini').Value := DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value := DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pCli').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
   qrypedidos.ParamByName('pFor').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qrypedidos.Open;

   if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Cliente: '+comboCliente.Text+ ' para o Fornecedor: '+combofornecedor.Text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.print;
 end;

if TODOS.Checked = true then
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

   NOME.Caption        := 'RELATÓRIO DE PEDIDOS DE '+DATETOSTR(DATAINICIAL.DATE)+' ATÉ ' +DATETOSTR(DATAFINAL.DATE)+'.';
   lblVENDEDOR.Caption := combocliente.Text+ ' - '+combovendedor.text+' - '+combofornecedor.text;

   qrypedidos.close;
   qrypedidos.SQL.clear;
   qrypedidos.SQL.add('select * from Pedidos');
   qrypedidos.sql.add('Where Data between :pDataIni and :pDataFim');
   qrypedidos.SQL.add('and codCLIENTE    = :pCli');
   qrypedidos.SQL.add('and codFORNECEDOR = :pFor');
   qrypedidos.SQL.add('and codVENDEDOR   = :pVen');
   qrypedidos.parambyname('pdataini').Value := DATETOSTR(DATAINICIAL.Date);
   qrypedidos.parambyname('pdatafim').Value := DATETOSTR(DATAFINAL.Date);
   qrypedidos.ParamByName('pCli').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
   qrypedidos.ParamByName('pFor').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qrypedidos.ParamByName('pVen').value     :=  frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qrypedidos.Open;

    if qrypedidos.Eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos no Período de '+datetostr(datainicial.Date)+ ' até '+datetostr(datafinal.Date)+ ' do Cliente: '+combocliente.Text+ ' do Vendedor: '+ combovendedor.Text + ' para o Fornecedor: '+combofornecedor.Text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

   dtprodutos.open;
   dtitens.Open;
   dtpgto.Open;
   dtvendedor.Open;
   dtclientes.Open;
   qpedidos.print;
 end;
end;

end.
