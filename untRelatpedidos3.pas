unit untRelatpedidos3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBTable, ibx.IBCustomDataSet, ibx.IbQuery, QRCtrls, QuickRpt,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmRelatPedidos_PEDIDO = class(TForm)
    Shape2: TShape;
    qr: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRShape3: TQRShape;
    pedido: TQRLabel;
    QRShape26: TQRShape;
    QRShape25: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel18: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape18: TQRShape;
    QRShape24: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText14: TQRDBText;
    QRShape31: TQRShape;
    QRLabel19: TQRLabel;
    QRDBText15: TQRDBText;
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
    GroupFooterBand1: TQRBand;
    QRShape9: TQRShape;
    QRLabel14: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRShape12: TQRShape;
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
    qryPedidosORDEM_DE_COMPRA: TIBStringField;
    qryPedidosBONIFICACAO: TIBStringField;
    qryPedidosOBS: TIBStringField;
    dtItens: TIBTable;
    dtItensCODPEDIDO: TIBStringField;
    dtItensCODPRODUTO: TIBStringField;
    dtItensQTDE: TFloatField;
    dtItensVALOR: TFloatField;
    dtItenstotal: TCurrencyField;
    dtClientes: TIBTable;
    dtVendedor: TIBTable;
    dtTrans: TIBTable;
    dtPgto: TIBTable;
    dsVendedor: TDataSource;
    qryVendedor: TIBQuery;
    qryCliente: TIBQuery;
    dsCliente: TDataSource;
    dtProdutos: TIBTable;
    dsItens: TDataSource;
    dsFornecedor: TDataSource;
    qryFornecedor: TIBQuery;
    dtFornecedor: TIBTable;
    QRExpr2: TQRExpr;
    QRBand1: TQRBand;
    QRLabel21: TQRLabel;
    empresa: TQRLabel;
    nome: TQRLabel;
    QRShape32: TQRShape;
    endereco: TQRLabel;
    outros: TQRLabel;
    Label1: TLabel;
    edtcod: TEdit;
    QRShape1: TQRShape;
    QRShape11: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText8: TQRDBText;
    dtItensGRADE: TIntegerField;
    dtItensDESCONTO2: TFloatField;
    dtItensDESCONTO3: TFloatField;
    dtItensDESCONTO1: TFloatField;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    qryFornecedorFORCODFORN: TIBStringField;
    qryFornecedorFORDATACAD: TDateTimeField;
    qryFornecedorFORRAZAO: TIBStringField;
    qryFornecedorFORENDERECO: TIBStringField;
    qryFornecedorFORBAIRRO: TIBStringField;
    qryFornecedorFORCIDADE: TIBStringField;
    qryFornecedorFORUF: TIBStringField;
    qryFornecedorFORCEP: TIBStringField;
    qryFornecedorFORCGC: TIBStringField;
    qryFornecedorFORINSC: TIBStringField;
    qryFornecedorFORTEL: TIBStringField;
    qryFornecedorFORFAX: TIBStringField;
    qryFornecedorFORCONTATO: TIBStringField;
    qryFornecedorFOROBS: TIBStringField;
    qryFornecedorCONTA: TIBStringField;
    qryFornecedorAGENCIA: TIBStringField;
    qryFornecedorBANCO: TIBStringField;
    qryFornecedorCIDADE: TIBStringField;
    qryFornecedorUF: TIBStringField;
    qryFornecedorTELEFONE: TIBStringField;
    QRShape4: TQRShape;
    QRShape19: TQRShape;
    QRShape27: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape23: TQRShape;
    Image2: TImage;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Shape4: TShape;
    Label22: TLabel;
    Image3: TImage;
    Label36: TLabel;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure dtItensCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatPedidos_PEDIDO: TfrmRelatPedidos_PEDIDO;

implementation

uses untMenu, untProcedures;

{$R *.dfm}

procedure TfrmRelatPedidos_PEDIDO.SpeedButton4Click(Sender: TObject);
begin
dtclientes.Open;
dtpgto.Open;
dtvendedor.Open;
dtprodutos.Open;
dttrans.Open;
dtitens.Open;
dtfornecedor.Open;

NOME.Caption := 'Pedido Nº'+qrypedidos.fieldbyname('codpedido').value;
qrypedidos.Close;
qrypedidos.ParamByName('pcod').value:=edtcod.text;
qrypedidos.Open;

if qrypedidos.eof then
 begin
  messagedlg('Pedido NÃO ENCONTRADO!',mterror,[mbok],0);
  edtcod.Text := '';
  edtcod.SetFocus;
  exit;
 end;
 
qr.print;
end;

procedure TfrmRelatPedidos_PEDIDO.SpeedButton1Click(Sender: TObject);
begin
dtclientes.Open;
dtpgto.Open;
dtvendedor.Open;
dtprodutos.Open;
dttrans.Open;
dtitens.Open;
dtfornecedor.Open;

qrypedidos.Close;
qrypedidos.ParamByName('pcod').value:=edtcod.text;
qrypedidos.Open;

if qrypedidos.eof then
 begin
  messagedlg('Pedido NÃO ENCONTRADO!',mterror,[mbok],0);
  edtcod.Text := '';
  edtcod.SetFocus;
  exit;
 end;

NOME.Caption := 'Pedido Nº'+qrypedidos.fieldbyname('codpedido').value;
qr.preview;
end;

procedure TfrmRelatPedidos_PEDIDO.SpeedButton3Click(Sender: TObject);
begin
qr.printersetup;
end;

procedure TfrmRelatPedidos_PEDIDO.dtItensCalcFields(DataSet: TDataSet);
begin
dtitenstotal.value:=((dtitensqtde.Value * dtitensvalor.Value) - (dtitensqtde.Value * dtitensvalor.Value * (dtitensdesconto1.value/100)));
dtitenstotal.value:=((dtitenstotal.Value) - (dtitenstotal.Value * (dtitensdesconto2.value/100)));
dtitenstotal.value:=((dtitenstotal.Value) - (dtitenstotal.Value * (dtitensdesconto3.value/100)));
end;

procedure TfrmRelatPedidos_PEDIDO.FormCreate(Sender: TObject);
begin
frmSYSProcedures.qryempresa.Open;
empresa.caption:= frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
endereco.Caption := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('endereco').value +' - CEP: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cep').value+ ' - Fone: ' +frmSYSProcedures.qryEMPRESA.FIELDBYNAME('telefone').value;
outros.Caption := 'FAX: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('fax').value + ' - E-mail: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('email').value + ' - ' + frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cidade').value + '-'+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('uf').value;
frmSYSProcedures.qryEMPRESA.close;
end;

procedure TfrmRelatPedidos_PEDIDO.FormShow(Sender: TObject);
begin
edtcod.SetFocus; 
end;

procedure TfrmRelatPedidos_PEDIDO.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_escape then close;
if key = vk_return then SpeedButton1Click(self); 
end;

end.
