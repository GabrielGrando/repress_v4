unit untPrePedido4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibx.IBCustomDataSet, DB, ibx.IBTable, ibx.IbQuery, Grids, DBGrids, StdCtrls,
  ComCtrls, DBCtrls, Buttons, ExtCtrls, QRCtrls, QuickRpt;

type
  TfrmPrepedido_FORNECEDOR = class(TForm)
    Shape4: TShape;
    dsClientes: TDataSource;
    dsFornecedor: TDataSource;
    qryCliente: TIBQuery;
    qryFornecedor: TIBQuery;
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
    dsVendedor: TDataSource;
    qryVendedor: TIBQuery;
    report: TQuickRep;
    qryProdutos: TIBQuery;
    QRBand2: TQRBand;
    QRShape6: TQRShape;
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
    QRShape54: TQRShape;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel85: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
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
    QRShape55: TQRShape;
    QRShape1: TQRShape;
    QRDBText13: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRBand3: TQRBand;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRShape83: TQRShape;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRShape76: TQRShape;
    QRLabel89: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    Image2: TImage;
    button1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Shape2: TShape;
    Label9: TLabel;
    Image3: TImage;
    Label41: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    combocliente: TComboBox;
    combofornecedor: TComboBox;
    combovendedor: TComboBox;
    Label4: TLabel;
    procedure button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtclienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtfornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtvendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrepedido_FORNECEDOR: TfrmPrepedido_FORNECEDOR;

implementation

uses untMenu, untProcedures;



{$R *.dfm}

procedure TfrmPrepedido_FORNECEDOR.button1Click(Sender: TObject);
begin
qrycliente.Close;
qryfornecedor.close;
qryvendedor.close;

 if combocliente.Text <> '' then
  begin
   if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
   qrycliente.close;
   qrycliente.ParamByName('pcod').value   := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
   qrycliente.open;
  end;

 if combovendedor.Text <> '' then
  begin
   if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;
   qryvendedor.close;
   qryvendedor.ParamByName('pcod').value  := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qryvendedor.open;
  end;


 if combofornecedor.Text = '' then
  begin
   messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
   combofornecedor.setfocus;
   exit;
  end else begin
   if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
   qryfornecedor.close;
   qryfornecedor.ParamByName('pcod').value:= frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qryfornecedor.open;
  end;

 qryprodutos.Close;
 qryprodutos.ParamByName('pcod').value:=qryfornecedor.fieldbyname('forcodforn').value;
 qryprodutos.open;

 if qryprodutos.Eof then
  begin
   messagedlg('Não foram encontrados PRODUTOS!',mterror,[mbok],0);
   combofornecedor.SetFocus;
   exit;
  end else begin
   report.Preview;
  end;
end;

procedure TfrmPrepedido_FORNECEDOR.SpeedButton2Click(Sender: TObject);
begin
report.Printersetup;
end;

procedure TfrmPrepedido_FORNECEDOR.edtclienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = vk_down then combocliente.SetFocus;  
end;

procedure TfrmPrepedido_FORNECEDOR.edtfornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = vk_down then combofornecedor.SetFocus;
end;

procedure TfrmPrepedido_FORNECEDOR.edtvendedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = vk_down then combovendedor.SetFocus;
end;

procedure TfrmPrepedido_FORNECEDOR.FormCreate(Sender: TObject);
begin
frmSYSProcedures.qryempresa.Open;
empresa.caption  := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
endereco.Caption := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('endereco').value +' - CEP: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cep').value+ ' - Fone: ' +frmSYSProcedures.qryEMPRESA.FIELDBYNAME('telefone').value;
outros.Caption   := 'FAX: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('fax').value + ' - E-mail: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('email').value + ' - ' + frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cidade').value + '-'+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('uf').value;
frmSYSProcedures.qryEMPRESA.close;

frmSYSProcedures.constroicombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
frmSYSProcedures.constroicombo('select * from clientes order by razao','razao',combocliente);
end;

procedure TfrmPrepedido_FORNECEDOR.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_escape then close;
if key = vk_return then button1Click(self); 
end;

procedure TfrmPrepedido_FORNECEDOR.SpeedButton4Click(Sender: TObject);
begin
qrycliente.Close;
qryfornecedor.close;
qryvendedor.close;

 if combocliente.Text <> '' then
  begin
   if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
   qrycliente.close;
   qrycliente.ParamByName('pcod').value   := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
   qrycliente.open;
  end;

 if combovendedor.Text <> '' then
  begin
   if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;
   qryvendedor.close;
   qryvendedor.ParamByName('pcod').value  := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qryvendedor.open;
  end;


 if combofornecedor.Text = '' then
  begin
   messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
   combofornecedor.setfocus;
   exit;
  end else begin
   if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
   qryfornecedor.close;
   qryfornecedor.ParamByName('pcod').value:= frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qryfornecedor.open;
  end;

 qryprodutos.Close;
 qryprodutos.ParamByName('pcod').value:=qryfornecedor.fieldbyname('forcodforn').value;
 qryprodutos.open;

 if qryprodutos.Eof then
  begin
   messagedlg('Não foram encontrados PRODUTOS!',mterror,[mbok],0);
   combofornecedor.SetFocus;
   exit;
  end else begin
   report.Print;
  end;
end;

procedure TfrmPrepedido_FORNECEDOR.FormShow(Sender: TObject);
begin
combofornecedor.setfocus;
end;

end.
