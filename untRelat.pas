unit untRelat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ibx.IBCustomDataSet, ibx.IbQuery, StdCtrls,
  QRCtrls, Buttons, DBCtrls;

type
  TfrmRelatFornecedor = class(TForm)
    qrFornecedor: TQuickRep;
    QRBand1: TQRBand;
    empresa1: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape21: TQRShape;
    QRLabel24: TQRLabel;
    data: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    qrfornecedor2: TQuickRep;
    QRSubDetail3: TQRSubDetail;
    QRLabel47: TQRLabel;
    QRDBText28: TQRDBText;
    GroupBox1: TGroupBox;
    relacao: TRadioButton;
    ficha: TRadioButton;
    Shape2: TShape;
    QRLabel26: TQRLabel;
    QRShape24: TQRShape;
    Image2: TImage;
    Button1: TSpeedButton;
    Button2: TSpeedButton;
    SpeedButton2: TSpeedButton;
    QRBand3: TQRBand;
    empresa2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape1: TQRShape;
    QRLabel27: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape12: TQRShape;
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
    dsFornecedor: TDataSource;
    Label7: TLabel;
    combofornecedor: TComboBox;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    Shape4: TShape;
    Label22: TLabel;
    Label36: TLabel;
    Image3: TImage;
    procedure Button2Click(Sender: TObject);
    procedure fichaClick(Sender: TObject);
    procedure relacaoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure combofornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure relacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatFornecedor: TfrmRelatFornecedor;
  soma:integer;

implementation

uses untMenu, untProcedures;

{$R *.dfm}

procedure TfrmRelatFornecedor.Button2Click(Sender: TObject);
begin
if relacao.Checked = true then
 begin
  qryfornecedor.close;
  qryfornecedor.SQL.clear;
  qryfornecedor.SQL.add('select * from fornecedores');
  qryfornecedor.open;

  if qryfornecedor.Eof then
   begin
    messagedlg('N�o existem FORNECEDORES cadastrados!',mterror,[mbok],0);
    exit;
   end;
  qrfornecedor2.print;
 end;

if ficha.Checked = true then
 begin
  if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,FRMSYSPROCEDURES.dATASET) = 0 then exit;
  if combofornecedor.Text = '' then
   begin
    messagedlg('Digite um FORNECEDOR!',mterror,[mbok],0);
    COMBOfornecedor.SetFocus;
    exit;
   end;

  qryfornecedor.close;
  qryfornecedor.sql.clear;
  qryfornecedor.SQL.Add('select * from fornecedores');
  qryfornecedor.SQL.Add('where forcodforn =:pcod');
  qryfornecedor.ParamByName('pcod').value:=frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,FRMSYSPROCEDURES.dATASET);
  qryfornecedor.Open;

  data.Caption :=datetostr(now);
  qrfornecedor.Print;
 end;

end;

procedure TfrmRelatFornecedor.fichaClick(Sender: TObject);
begin
combofornecedor.enabled:=true;
combofornecedor.Color := clwhite;
combofornecedor.setfocus;
end;

procedure TfrmRelatFornecedor.relacaoClick(Sender: TObject);
begin
combofornecedor.enabled:=false;
combofornecedor.Color := clsilver;
end;

procedure TfrmRelatFornecedor.Button1Click(Sender: TObject);
begin

if relacao.Checked = true then
 begin
  qryfornecedor.close;
  qryfornecedor.SQL.clear;
  qryfornecedor.SQL.add('select * from fornecedores');
  qryfornecedor.open;

  if qryfornecedor.Eof then
   begin
    messagedlg('N�o existem FORNECEDORES cadastrados!',mterror,[mbok],0);
    exit;
   end;
  qrfornecedor2.Preview;
 end;

if ficha.Checked = true then
 begin
  if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,FRMSYSPROCEDURES.dATASET) = 0 then exit;
  if combofornecedor.Text = '' then
   begin
    messagedlg('Digite um FORNECEDOR!',mterror,[mbok],0);
    COMBOfornecedor.SetFocus;
    exit;
   end;

  qryfornecedor.close;
  qryfornecedor.sql.clear;
  qryfornecedor.SQL.Add('select * from fornecedores');
  qryfornecedor.SQL.Add('where forcodforn =:pcod');
  qryfornecedor.ParamByName('pcod').value:=frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,FRMSYSPROCEDURES.dATASET);
  qryfornecedor.Open;

  data.Caption :=datetostr(now);
  qrfornecedor.Preview;
 end;
end;

procedure TfrmRelatFornecedor.SpeedButton2Click(Sender: TObject);
begin
if relacao.Checked = true then qrfornecedor2.PrinterSetup;
if ficha.Checked   = true then qrfornecedor.PrinterSetup;
end;

procedure TfrmRelatFornecedor.FormShow(Sender: TObject);
begin
relacaoClick(self);
end;

procedure TfrmRelatFornecedor.FormCreate(Sender: TObject);
begin
frmSYSprocedures.qryempresa.Open;
empresa1.caption:= frmSYSprocedures.qryEMPRESA.FIELDBYNAME('nome').value;
empresa2.caption:= frmSYSprocedures.qryEMPRESA.FIELDBYNAME('nome').value;
frmSYSprocedures.qryEMPRESA.close;
frmsysprocedures.ConstroiCombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
end;

procedure TfrmRelatFornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

procedure TfrmRelatFornecedor.combofornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then Button1Click(self); 
end;

procedure TfrmRelatFornecedor.relacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then Button1Click(self); 
end;

end.