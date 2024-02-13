unit untPrepedido2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls,oledb,COMOBJ, OleServer, Excel97,
  Grids, DB, ibx.IBCustomDataSet, ibx.IbQuery, DBGrids, ibx.IBTable,INIFILES, QuickRpt,
  QRCtrls;

type
  TfrmPrePedido_ESPELHO = class(TForm)
    report: TQuickRep;
    QRBand1: TQRBand;
    QRShape10: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape11: TQRShape;
    QRLabel29: TQRLabel;
    QRShape17: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape22: TQRShape;
    QRLabel35: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel36: TQRLabel;
    QRDBText21: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRShape9: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    PageFooterBand1: TQRBand;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape38: TQRShape;
    QRShape40: TQRShape;
    QRShape34: TQRShape;
    QRShape39: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape41: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    dtItens: TIBTable;
    dtItensCODPEDIDO: TIBStringField;
    dtItensCODPRODUTO: TIBStringField;
    dtItensQTDE: TFloatField;
    dtItensVALOR: TFloatField;
    dtItenstotal: TCurrencyField;
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
    qryPedidosORDEM_DE_COMPRA: TIBStringField;
    qryPedidosBONIFICACAO: TIBStringField;
    qryPedidosOBS: TIBStringField;
    dsPedidos: TDataSource;
    dtProdutos: TIBTable;
    dsItens: TDataSource;
    dtClientes: TIBTable;
    dtFornecedor: TIBTable;
    dtVendedor: TIBTable;
    dsListar: TDataSource;
    qryListar: TIBQuery;
    qryListarCODPEDIDO: TIBStringField;
    qryListarENTREGA: TDateTimeField;
    qryListarDATA: TDateTimeField;
    dsListarItens: TDataSource;
    dtListarItens: TIBTable;
    dtListarItensCODPRODUTO: TIBStringField;
    dtListarItensQTDE: TFloatField;
    dtListarItensVALOR: TFloatField;
    dtListarItensDESCONTO2: TFloatField;
    dtListarItensDESCONTO3: TFloatField;
    dtListarItensDESCONTO1: TFloatField;
    dtListarItenstotal: TCurrencyField;
    dtListarItensdescricao: TStringField;
    qryProd: TIBQuery;
    box: TGroupBox;
    DBGrid2: TDBGrid;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    qryListarTIPO_FRETE: TIBStringField;
    qryListarBONIFICACAO: TIBStringField;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRShape6: TQRShape;
    QRShape47: TQRShape;
    dtItensDESCONTO2: TFloatField;
    dtItensDESCONTO3: TFloatField;
    dtItensDESCONTO1: TFloatField;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRLabel22: TQRLabel;
    qryGrade: TIBQuery;
    qryGradePROCODIGO: TIBStringField;
    qryGradePRODESCRICAO: TIBStringField;
    qryGradePROFORNECEDOR: TIBStringField;
    qryGradePROUNIDADE: TIBStringField;
    qryGradePROGRADE: TIntegerField;
    dtRelatorio: TIBDataSet;
    dtRelatorioCODIGO: TIBStringField;
    dtRelatorioDESCRICAO: TIBStringField;
    dtRelatorioEMB: TIBStringField;
    dtRelatorioQTDE: TFloatField;
    dtRelatorioVALOR: TFloatField;
    dtRelatorioD1: TFloatField;
    dtRelatorioD2: TFloatField;
    dtRelatorioD3: TFloatField;
    QRShape1: TQRShape;
    empresa: TQRLabel;
    endereco: TQRLabel;
    outros: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape44: TQRShape;
    QRShape16: TQRShape;
    PESQUISA: TLabel;
    lbl: TLabel;
    Image2: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    button1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    QRShape14: TQRShape;
    QRShape28: TQRShape;
    Shape4: TShape;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    botao: TSpeedButton;
    dtini: TDateTimePicker;
    dtfim: TDateTimePicker;
    Label3: TLabel;
    combocliente: TComboBox;
    Label1: TLabel;
    combofornecedor: TComboBox;
    Label2: TLabel;
    combovendedor: TComboBox;
    Shape1: TShape;
    Label4: TLabel;
    Shape2: TShape;
    Label9: TLabel;
    Image3: TImage;
    Label41: TLabel;
    lblTot: TLabel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    dtItensPedido: TIBDataSet;
    dtItensPedidoCODPEDIDO: TIBStringField;
    dtItensPedidoCODPRODUTO: TIBStringField;
    dtItensPedidoQTDE: TFloatField;
    dtItensPedidoVALOR: TFloatField;
    dtItensPedidoDESCONTO1: TFloatField;
    dtItensPedidoGRADE: TIntegerField;
    dtItensPedidoDESCONTO2: TFloatField;
    dtItensPedidoDESCONTO3: TFloatField;
    dtItensPedidoESTOQUE: TIntegerField;
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
    dtFornecedorCODIGO: TIntegerField;
    dtClientesCODIGO: TIntegerField;
    dtClientesRAZAO: TIBStringField;
    dtClientesFANTASIA: TIBStringField;
    dtClientesCNPJ: TIBStringField;
    dtClientesINSC: TIBStringField;
    dtClientesENDERECO: TIBStringField;
    dtClientesBAIRRO: TIBStringField;
    dtClientesCIDADE: TIBStringField;
    dtClientesUF: TIBStringField;
    dtClientesCEP: TIBStringField;
    dtClientesTELEFONE: TIBStringField;
    dtClientesFAX: TIBStringField;
    dtClientesCONTATO: TIBStringField;
    dtClientesBANCO: TIBStringField;
    dtClientesCONTA: TIBStringField;
    dtClientesAGENCIA: TIBStringField;
    dtClientesBANCOCIDADE: TIBStringField;
    dtClientesBANCOUF: TIBStringField;
    dtClientesBANCOTELEFONE: TIBStringField;
    dtClientesOBS: TIBStringField;
    dtVendedorCODIGO: TIBStringField;
    dtVendedorNOME: TIBStringField;
    dtVendedorENDERECO: TIBStringField;
    dtVendedorBAIRRO: TIBStringField;
    dtVendedorCIDADE: TIBStringField;
    dtVendedorUF: TIBStringField;
    dtVendedorRG: TIBStringField;
    dtVendedorCPF: TIBStringField;
    dtVendedorTELEFONE: TIBStringField;
    dtVendedorCELULAR: TIBStringField;
    dtVendedorFUNCAO: TIBStringField;
    dtProdutosPROCODIGO: TIBStringField;
    dtProdutosPRODESCRICAO: TIBStringField;
    dtProdutosPROFORNECEDOR: TIBStringField;
    dtProdutosPROUNIDADE: TIBStringField;
    dtProdutosPROGRADE: TIntegerField;
    dtProdutosCODBARRA: TIBStringField;
    qryProdPROCODIGO: TIBStringField;
    qryProdPRODESCRICAO: TIBStringField;
    qryProdPROFORNECEDOR: TIBStringField;
    qryProdPROUNIDADE: TIBStringField;
    qryProdPROGRADE: TIntegerField;
    qryProdCODBARRA: TIBStringField;
    BitBtn1: TSpeedButton;
    dtpedidos: TIBDataSet;
    dtpedidosCODPEDIDO: TIBStringField;
    dtpedidosCODCLIENTE: TIntegerField;
    dtpedidosCODVENDEDOR: TIBStringField;
    dtpedidosCODFORNECEDOR: TIBStringField;
    dtpedidosCODTRANS: TIBStringField;
    dtpedidosTIPO_FRETE: TIBStringField;
    dtpedidosPRAZO_PGTO: TIntegerField;
    dtpedidosENTREGA: TDateTimeField;
    dtpedidosDATA: TDateTimeField;
    dtpedidosORDEM_DE_COMPRA: TIBStringField;
    dtpedidosBONIFICACAO: TIBStringField;
    dtpedidosOBS: TIBStringField;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure botaoClick(Sender: TObject);
    procedure dtListarItensCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtiniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtfimKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure combofornecedorChange(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Function CalculaTotal :integer;
  end;

var
  frmPrePedido_ESPELHO: TfrmPrePedido_ESPELHO;
  vsalva:boolean;
  aux:string;

implementation

uses untMenu, untPrePedido, untDM, untComissao, untProcedures, untPedidos;

{$R *.dfm}

procedure TfrmPrePedido_ESPELHO.Button1Click(Sender: TObject);
begin
qrypedidos.Close;
qrypedidos.ParamByName('pcod').value:=qrylistar.FieldByName('codpedido').Value;
qrypedidos.open;

if qrypedidos.eof then
 begin
  messagedlg('SELECIONE um Pedido!',mterror,[mbok],0);
  dbgrid1.setfocus;
  exit;
 end;

dtitens.Open;
dtitens.First;
dtprodutos.open;

dtRelatorio.Open;
if dtRelatorio.recordcount > 0 then dtRelatorio.delete;

while not dtitens.Eof do
 begin
  with dtRelatorio do
   begin
     open;
     append;
     fieldbyname('codigo').value     :=dtitens.fieldbyname('codproduto').value;
     fieldbyname('descricao').value  :=dtprodutos.fieldbyname('prodescricao').value;
     fieldbyname('emb').value        :=dtprodutos.fieldbyname('prounidade').value;
     fieldbyname('qtde').value       :=dtitens.fieldbyname('qtde').value;
     fieldbyname('valor').value      :=dtitens.fieldbyname('valor').value;
     fieldbyname('d1').value         :=dtitens.fieldbyname('desconto1').value;
     fieldbyname('d2').value         :=dtitens.fieldbyname('desconto2').value;
     fieldbyname('d3').value         :=dtitens.fieldbyname('desconto3').value;
     post;
     close;
    end;
   dtitens.Next;
 end;


if qrygrade.SQL.Text <> '' then
 begin
  qrygrade.open;
  qrygrade.First;
  dtitens.Open;

  while not qrygrade.Eof do
   begin
    dtitens.First;

     while not dtitens.Eof do
      begin
       aux:=trim(qrygrade.FieldByName('procodigo').value);

        if dtitens.FieldByName('codproduto').value = aux then
          begin
           vsalva:=FALSE;
           break;
          end else begin
           vsalva := true;
          end;

       dtitens.Next;
      end;

     if vsalva = true then
      begin

       with dtRelatorio do
        begin
         open;
         append;
         fieldbyname('codigo').value    :=qrygrade.fieldbyname('procodigo').value;
         fieldbyname('descricao').value :=qrygrade.fieldbyname('prodescricao').value;
         fieldbyname('emb').value       :=qrygrade.fieldbyname('prounidade').value;
         post;
         close;
        end;
      end;
    qrygrade.next;
  end;
end;

dtfornecedor.open;
dtvendedor.open;
dtclientes.open;
dtRelatorio.Open;
report.preview;
qrygrade.SQL.Text := '';
end;

procedure TfrmPrePedido_ESPELHO.SpeedButton4Click(Sender: TObject);
begin
qrypedidos.Close;
qrypedidos.ParamByName('pcod').value:=qrylistar.FieldByName('codpedido').Value;
qrypedidos.open;

if qrypedidos.eof then
 begin
  messagedlg('SELECIONE um Pedido!',mterror,[mbok],0);
  dbgrid1.setfocus;
  exit;
 end;

dtitens.Open;
dtitens.First;
dtprodutos.open;

dtRelatorio.Open;
if dtRelatorio.recordcount > 0 then dtRelatorio.delete;

while not dtitens.Eof do
 begin
  with dtRelatorio do
   begin
     open;
     append;
     fieldbyname('codigo').value     :=dtitens.fieldbyname('codproduto').value;
     fieldbyname('descricao').value  :=dtprodutos.fieldbyname('prodescricao').value;
     fieldbyname('emb').value        :=dtprodutos.fieldbyname('prounidade').value;
     fieldbyname('qtde').value       :=dtitens.fieldbyname('qtde').value;
     fieldbyname('valor').value      :=dtitens.fieldbyname('valor').value;
     fieldbyname('d1').value         :=dtitens.fieldbyname('desconto1').value;
     fieldbyname('d2').value         :=dtitens.fieldbyname('desconto2').value;
     fieldbyname('d3').value         :=dtitens.fieldbyname('desconto3').value;
     fieldbyname('estoque').value    :=dtitens.fieldbyname('estoque').value;
     post;
     close;
    end;
   dtitens.Next;
 end;


if qrygrade.SQL.Text <> '' then
 begin
  qrygrade.open;
  qrygrade.First;
  dtitens.Open;

  while not qrygrade.Eof do
   begin
    dtitens.First;

     while not dtitens.Eof do
      begin
       aux:=trim(qrygrade.FieldByName('procodigo').value);

        if dtitens.FieldByName('codproduto').value = aux then
          begin
           vsalva:=FALSE;
           break;
          end else begin
           vsalva := true;
          end;

       dtitens.Next;
      end;

     if vsalva = true then
      begin

       with dtRelatorio do
        begin
         open;
         append;
         fieldbyname('codigo').value    :=qrygrade.fieldbyname('procodigo').value;
         fieldbyname('descricao').value :=qrygrade.fieldbyname('prodescricao').value;
         fieldbyname('emb').value       :=qrygrade.fieldbyname('prounidade').value;
         post;
         close;
        end;
      end;
    qrygrade.next;
  end;
end;

dtfornecedor.open;
dtvendedor.open;
dtclientes.open;
dtRelatorio.Open;
report.print;
qrygrade.SQL.Text := '';
end;

procedure TfrmPrePedido_ESPELHO.botaoClick(Sender: TObject);
begin

if PESQUISA.CAPTION = 'PESQUISA' THEN
 begin
  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

  if combofornecedor.Text = '' then
   begin
    messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;

  with qryListar do
   begin
    close;
    SQL.CLEAR;
    SQL.ADD('select * from pedidos');
    SQL.ADD('where codfornecedor = :pfor and');
    SQL.ADD('codcliente = :pcli  and Data between :pIni and :pFim');
    ParamByName('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
    ParamByName('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
    ParamByName('pini').Value := datetostr(dtini.Date);
    ParamByName('pfim').Value := datetostr(dtfim.Date);
    open;
    if eof then messagedlg('NÃO FORAM encontrados Pedidos com os dados: Cliente: '+combocliente.text+ ' Fornecedor: ' +combofornecedor.Text+ ' entre '+datetostr(dtini.Date) + ' e '+datetostr(dtfim.Date),mterror,[mbok],0);
   end;
  exit;
end;

if combocliente.Text = '' then
  begin
   messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
   combocliente.SetFocus;
   exit;
  end;

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

 if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
 if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
 if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

 with qrylistar do
  begin
   close;
   ParamByName('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   ParamByName('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   ParamByName('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
   ParamByName('pini').Value := datetostr(dtini.Date);
   ParamByName('pfim').Value := datetostr(dtfim.Date);
   open;
   if eof then
    begin
     messagedlg('NÃO FORAM encontrados Pedidos com os dados: Cliente: '+combocliente.text+ ' Fornecedor: ' +combofornecedor.Text+ ' Vendedor: '+combovendedor.text+ ' entre '+datetostr(dtini.Date) + ' e '+datetostr(dtfim.Date),mterror,[mbok],0);
     combocliente.setfocus;
    end;

  end;
end;

procedure TfrmPrePedido_ESPELHO.dtListarItensCalcFields(DataSet: TDataSet);
begin
qryprod.close;
qryprod.parambyname('pcod').value:=dtlistaritens.fieldbyname('codproduto').value;
qryprod.open;

dtlistaritensdescricao.Value :=  qryprod.fieldbyname('prodescricao').value;
dtLISTARitenstotal.value     := ((dtLISTARitensqtde.Value * dtLISTARitensvalor.Value) - (dtLISTARitensqtde.Value * dtLISTARitensvalor.Value * (dtLISTARitensdesconto1.value/100)));
dtLISTARitenstotal.value     := ((dtLISTARitenstotal.Value) - (dtLISTARitenstotal.Value * (dtLISTARitensdesconto2.value/100)));
dtLISTARitenstotal.value     := ((dtLISTARitenstotal.Value) - (dtLISTARitenstotal.Value * (dtLISTARitensdesconto3.value/100)));
label8.Caption := 'Itens do Pedido Nº'+ qrylistar.fieldbyname('codpedido').value;
end;

procedure TfrmPrePedido_ESPELHO.FormShow(Sender: TObject);
begin
if combocliente.Enabled = true then combocliente.SetFocus else combofornecedor.SetFocus;
dtListarItens.OPEN;
dtitens.close;
qrylistar.close;


label8.Caption := 'Itens do Pedido Nº';
end;

procedure TfrmPrePedido_ESPELHO.SpeedButton2Click(Sender: TObject);
begin
report.PrinterSetup;
end;

procedure TfrmPrePedido_ESPELHO.SpeedButton3Click(Sender: TObject);
begin

if combofornecedor.Text = '' then
 begin
  messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
  combofornecedor.SetFocus;
  exit;
 end;

 if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;

frmprepedido_grade:=tfrmprepedido_grade.create(self);
 with frmprepedido_grade do
  begin
   box.visible   := false;
   btn1.Visible  := false;
   btn2.Visible  := false;
   btn3.Visible  := false;
   img.Visible   := false;
   btn.visible   := true;
   height        := 516;
   shape4.height := 405;
   btn.visible   :=true;

   combofornecedor.Text       := frmprepedido_espelho.combofornecedor.Text;
   combofornecedor.Color      := clsilver;
   combofornecedor.Enabled    := false;
   combofornecedor.Font.Color := clwhite;

   qrygrade.close;
   qrygrade.ParamByName('Pcod').value:= frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qrygrade.open;

   if qrygrade.eof then
    begin
     messagedlg('Fornecedor não possui LINHAS cadastradas!',mterror,[mbok],0);
     exit;
    end;

   ShowModal;
   free;
 end;

end;

procedure TfrmPrePedido_ESPELHO.DBGrid1DblClick(Sender: TObject);
begin
if pesquisa.caption = 'PESQUISA' then
 begin
  frmCADcomissao.edtcod.text:=qrylistar.fieldbyname('codpedido').value;
  frmCADcomissao.SpeedButton1Click(self);
  close;
 end;

end;

procedure TfrmPrePedido_ESPELHO.FormCreate(Sender: TObject);
begin
Shortdateformat:= ('dd/mm/yyyy');

dtlistaritens.close;
frmSYSProcedures.qryempresa.Open;
empresa.caption  := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
endereco.Caption := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('endereco').value +' - CEP: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cep').value+ ' - Fone: ' +frmSYSProcedures.qryEMPRESA.FIELDBYNAME('telefone').value;
outros.Caption   := 'FAX: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('fax').value + ' - E-mail: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('email').value + ' - ' + frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cidade').value + '-'+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('uf').value;
frmSYSProcedures.qryEMPRESA.close;

dtini.Date := incmonth(date,-1);
dtfim.Date := date;
frmSYSProcedures.constroicombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
frmSYSProcedures.constroicombo('select * from clientes order by razao','razao',combocliente);

dtini.date := incmonth(now,-1);
dtfim.date := incmonth(now);
end;

procedure TfrmPrePedido_ESPELHO.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
//if key = vk_down    then dbgrid1.SetFocus;
if (key = vk_return)  and (dbgrid1.Focused = false) then botaoClick(self);
if key = vk_escape  then close;
end;

procedure TfrmPrePedido_ESPELHO.DBGrid1KeyDown(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
if (key = vk_down) or (key = vk_up) then calculatotal;

if key = vk_return then DBGrid1DblClick(self);
end;

procedure TfrmPrePedido_ESPELHO.dtiniKeyDown(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
if key = vk_down then dbgrid1.SetFocus;
end;

procedure TfrmPrePedido_ESPELHO.dtfimKeyDown(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
if key = vk_down then dbgrid1.SetFocus;
end;

procedure TfrmPrePedido_ESPELHO.combofornecedorChange(Sender: TObject);
begin
dtRelatorio.Open;
if dtRelatorio.recordcount > 0 then dtRelatorio.delete;
dtRelatorio.close;
qryGrade.SQL.Clear;
end;

Function TfrmPrePedido_ESPELHO.CalculaTotal :integer;
Var
 VarTot:Real;
 VarPonto:Integer;
Begin

VarTot:=0;
VarPonto:=0;
dtListarItens.open;
dtListarItens.First;

While Not dtListarItens.eof do
  begin
   VarTot:=VarTot+dtListarItensTotal.Value;
   dtListarItens.Next;
  end;

 lblTot.Caption:='Total: '+FloatToStrf(VarTot,ffcurrency,18,2);
end;

procedure TfrmPrePedido_ESPELHO.DBGrid1Enter(Sender: TObject);
begin
calculatotal;
end;

procedure TfrmPrePedido_ESPELHO.DBGrid1CellClick(Column: TColumn);
begin
calculatotal;
end;

procedure TfrmPrePedido_ESPELHO.SpeedButton1Click(Sender: TObject);
var
Excel : Variant;
Linha:Integer;
numpedido:string;
tot1:string;
tot2:string;
i:integer;
nomearq:string;
soma:string;
ARQINI:TINIFILE;
resposta:string;
NOMEEXCEL:STRING;

begin

qrypedidos.Close;
qrypedidos.ParamByName('pcod').value:=qrylistar.FieldByName('codpedido').Value;
qrypedidos.open;

if qrypedidos.eof then
 begin
  messagedlg('SELECIONE um Pedido!',mterror,[mbok],0);
  dbgrid1.setfocus;
  exit;
 end;

dtitens.Open;
dtitens.First;
dtprodutos.open;

dtRelatorio.Open;
if dtRelatorio.recordcount > 0 then dtRelatorio.delete;

while not dtitens.Eof do
 begin
  with dtRelatorio do
   begin
     open;
     append;
     fieldbyname('codigo').value     :=dtitens.fieldbyname('codproduto').value;
     fieldbyname('descricao').value  :=dtprodutos.fieldbyname('prodescricao').value;
     fieldbyname('emb').value        :=dtprodutos.fieldbyname('prounidade').value;
     fieldbyname('qtde').value       :=dtitens.fieldbyname('qtde').value;
     fieldbyname('valor').value      :=dtitens.fieldbyname('valor').value;
     fieldbyname('d1').value         :=dtitens.fieldbyname('desconto1').value;
     fieldbyname('d2').value         :=dtitens.fieldbyname('desconto2').value;
     fieldbyname('d3').value         :=dtitens.fieldbyname('desconto3').value;
     post;
     close;
    end;
   dtitens.Next;
 end;


if qrygrade.SQL.Text <> '' then
 begin
  qrygrade.open;
  qrygrade.First;
  dtitens.Open;

  while not qrygrade.Eof do
   begin
    dtitens.First;

     while not dtitens.Eof do
      begin
       aux:=trim(qrygrade.FieldByName('procodigo').value);

        if dtitens.FieldByName('codproduto').value = aux then
          begin
           vsalva:=FALSE;
           break;
          end else begin
           vsalva := true;
          end;

       dtitens.Next;
      end;

     if vsalva = true then
      begin

       with dtRelatorio do
        begin
         open;
         append;
         fieldbyname('codigo').value    :=qrygrade.fieldbyname('procodigo').value;
         fieldbyname('descricao').value :=qrygrade.fieldbyname('prodescricao').value;
         fieldbyname('emb').value       :=qrygrade.fieldbyname('prounidade').value;
         post;
         close;
        end;
      end;
    qrygrade.next;
  end;
end;

dtrelatorio.Close;
dtrelatorio.Open;
dtfornecedor.open;
dtvendedor.open;
dtclientes.open;
dtRelatorio.Open;

  if dtrelatorio.eof then
   begin
    messagedlg('NENHUM item selecionado!',mterror,[mbok],0);
    exit;
   end;

 ArqIni := tIniFile.Create(extractfilepath(application.exename)+'\config');
 repeat
  Resposta := InputBox('NOME DO ARQUIVO', 'Digite o nome do arquivo:',nomearq);
  if resposta = '' then exit;
 until Resposta <> '';
  NOMEEXCEL := (ArqIni.Readstring('SALVAR', 'PASTA','')+resposta+'.xls');
  ArqIni.Free;

Excel := CreateOleObject('Excel.Application');
Excel.Visible :=True;
Excel.WorkBooks.Open('c:\repress\Excel\Pedidos.xls'); //CAMINHO ARQUIVO EXCEL
Excel.WorkBooks[1].Sheets[1].Cells[7,2] :='';
Excel.WorkBooks[1].Sheets[1].Cells[7,4] :='';
Excel.WorkBooks[1].Sheets[1].Cells[7,7] :=datetostr(date);
Excel.WorkBooks[1].Sheets[1].Cells[7,10]:='';
Excel.WorkBooks[1].Sheets[1].Cells[8,2] :=dtfornecedor.fieldbyname('forrazao').value;
Excel.WorkBooks[1].Sheets[1].Cells[9,2] :=dtVENDEDOR.fieldbyname('nome').value;
Excel.WorkBooks[1].Sheets[1].Cells[10,2]:=dtclientes.fieldbyname('razao').value;
Excel.WorkBooks[1].Sheets[1].Cells[11,2]:=qrypedidos.FieldByName('tipo_frete').value;;
Excel.WorkBooks[1].Sheets[1].Cells[11,5]:='';
Excel.WorkBooks[1].Sheets[1].Cells[12,2]:='';


linha:=16;
tot1:='=((((((K16:K100*J16:J100-(K16:K100*J16:J100*(L16:L100/100)))))-((((K16:K100*J16:J100-(K16:K100*J16:J100*(L16:L100/100)))))*(M16:M100/100)))) - (((((K16:K100*J16:J100-';
tot2:='(K16:K100*J16:J100*(L16:L100/100)))))-((((K16:K100*J16:J100-(K16:K100*J16:J100*(L16:L100/100)))))*(M16:M100/100))) * (N16:N100/100)) )';

while not dtrelatorio.eof do
 begin
  Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:=dtrelatorio.fieldbyname('codigo').value;
  Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:=dtrelatorio.fieldbyname('descricao').value;
  Excel.WorkBooks[1].Sheets[1].Cells[linha,5]:=dtrelatorio.fieldbyname('qtde').value;
  excel.WorkBooks[1].Sheets[1].Cells[linha,6]:=dtrelatorio.fieldbyname('valor').value;
  Excel.WorkBooks[1].Sheets[1].Cells[linha,7]:=dtrelatorio.fieldbyname('d1').value;
  Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:=dtrelatorio.fieldbyname('d2').value;
  Excel.WorkBooks[1].Sheets[1].Cells[linha,9]:=dtrelatorio.fieldbyname('d3').value;
  Excel.WorkBooks[1].Sheets[1].Cells[linha,15]:= tot1+tot2;
  linha:=linha+1;
  dtrelatorio.Next;
 end;


soma:='';
soma:= '=(';

for i := 16 to linha-1 do
 begin
   if i < linha -1 then soma:= soma +'O'+ inttostr(i)+ '+' else soma:= soma +'O'+ inttostr(i)+')';
 end;


Excel.WorkBooks[1].Sheets[1].Cells[linha,15]:= soma;
Excel.WorkBooks[1].SaveAs(NOMEEXCEL);

qrygrade.SQL.Text := '';


end;

procedure TfrmPrePedido_ESPELHO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Shortdateformat:= ('dddd, dd" de "mmmm" de "yyyy');
end;

procedure TfrmPrePedido_ESPELHO.BitBtn1Click(Sender: TObject);
var
Excel : Variant;
Linha:Integer;
numpedido:string;
tot1:string;
tot2:string;
i:integer;
vCodPedido : integer;

begin
qrypedidos.Close;
qrypedidos.ParamByName('pcod').value:=qrylistar.FieldByName('codpedido').Value;
qrypedidos.open;

if qrypedidos.eof then
 begin
  messagedlg('SELECIONE um Pedido!',mterror,[mbok],0);
  dbgrid1.setfocus;
  exit;
 end;

dtitens.Open;
dtitens.First;
dtprodutos.open;

dtRelatorio.Open;
if dtRelatorio.recordcount > 0 then dtRelatorio.delete;

while not dtitens.Eof do
 begin
  with dtRelatorio do
   begin
     open;
     append;
     fieldbyname('codigo').value     :=dtitens.fieldbyname('codproduto').value;
     fieldbyname('descricao').value  :=dtprodutos.fieldbyname('prodescricao').value;
     fieldbyname('emb').value        :=dtprodutos.fieldbyname('prounidade').value;
     fieldbyname('qtde').value       :=dtitens.fieldbyname('qtde').value;
     fieldbyname('valor').value      :=dtitens.fieldbyname('valor').value;
     fieldbyname('d1').value         :=dtitens.fieldbyname('desconto1').value;
     fieldbyname('d2').value         :=dtitens.fieldbyname('desconto2').value;
     fieldbyname('d3').value         :=dtitens.fieldbyname('desconto3').value;
     post;
     close;
    end;
   dtitens.Next;
 end;


if qrygrade.SQL.Text <> '' then
 begin
  qrygrade.open;
  qrygrade.First;
  dtitens.Open;

  while not qrygrade.Eof do
   begin
    dtitens.First;

     while not dtitens.Eof do
      begin
       aux:=trim(qrygrade.FieldByName('procodigo').value);

        if dtitens.FieldByName('codproduto').value = aux then
          begin
           vsalva:=FALSE;
           break;
          end else begin
           vsalva := true;
          end;

       dtitens.Next;
      end;

     if vsalva = true then
      begin

       with dtRelatorio do
        begin
         open;
         append;
         fieldbyname('codigo').value    :=qrygrade.fieldbyname('procodigo').value;
         fieldbyname('descricao').value :=qrygrade.fieldbyname('prodescricao').value;
         fieldbyname('emb').value       :=qrygrade.fieldbyname('prounidade').value;
         fieldbyname('qtde').value      :=0;
         fieldbyname('valor').value     :=0;
         fieldbyname('d1').value        :=0;
         fieldbyname('d2').value        :=0;
         fieldbyname('d3').value        :=0;
         post;
         close;
        end;
      end;
    qrygrade.next;
  end;
end;

dtrelatorio.Close;
dtrelatorio.Open;
dtfornecedor.open;
dtvendedor.open;
dtclientes.open;
dtRelatorio.Open;



if dtrelatorio.eof then
 begin
  messagedlg('NENHUM item selecionado!',mterror,[mbok],0);
  exit;
 end;

 dtPedidos.Open;
 dtpedidos.last;


 vCodPedido := dtPedidos.RecordCount + 100000;

 dtPedidos.Append;
 dtPedidosCODPEDIDO.AsInteger := vCodPedido;
 dtPedidosDATA.AsDateTime     := date;
 dtPedidosENTREGA.AsDateTime  := date + 1;
 dtPedidosCODCLIENTE.Value    := dtClientesCODIGO.Value;
 dtPedidosCODFORNECEDOR.Value := dtFornecedorCODIGO.AsString;
 dtPedidosCODVENDEDOR.Value   := dtVendedorCODIGO.Value;
 dtPedidosTIPO_FRETE.Value    := qryPedidosTIPO_FRETE.Value;
 dtPedidosPRAZO_PGTO.Value    := qryPedidosPRAZO_PGTO.Value;
 dtPedidosCODTRANS.Value      := '1';
 dtPedidosBONIFICACAO.Value   := qryPedidosBONIFICACAO.Value;
 vCodPedido                   := dtPedidosCODPEDIDO.AsInteger;
 dtPedidos.Post;
 dtPedidos.close;

 dtItensPedido.open;

while not dtrelatorio.eof do
 begin

  qryProd.Close;
  qryProd.ParamByName('pCod').value := dtRelatorioCODIGO.Value;
  qryProd.Open;

  if not qryProd.eof then
   begin
    dtItensPedido.Append;
    dtItensPedidoCODPEDIDO.AsInteger := vCodPedido;
    dtItensPedidoCODPRODUTO.Value := dtrelatorio.fieldbyname('codigo').value;
    dtItensPedidoQTDE.Value := dtrelatorio.fieldbyname('qtde').value;
    dtItensPedidoVALOR.Value := dtrelatorio.fieldbyname('valor').value;
    dtItensPedidoGRADE.Value := qryProdPROGRADE.Value;
    dtItensPedidoDESCONTO1.Value := dtrelatorio.fieldbyname('d1').value;
    dtItensPedidoDESCONTO2.Value := dtrelatorio.fieldbyname('d2').value;
    dtItensPedidoDESCONTO3.Value := dtrelatorio.fieldbyname('d3').value;
    dtItensPedido.Post;
  end;

   dtrelatorio.Next;
 end;

 dtItensPedido.Close;
 dm.TRANSACAO.Commit;
 qrygrade.SQL.Text := '';

 Shortdateformat:= ('dd/MM/yyyy');
 frmCADpedidos:= tfrmCADpedidos.create(self);
 frmCADPedidos.edtcod.Text := inttostr(vCodPedido);
 frmCADPedidos.vHerancaEspelho := true;
 frmCADpedidos.showmodal;
 frmCADpedidos.free;

end;

end.
