unit untRelatComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, DBLocal, DBLocalI, ibx.IBCustomDataSet, ibx.IbQuery,
  QRCtrls, QuickRpt, ExtCtrls, Buttons, Grids, DBGrids, ibx.IBTable, StdCtrls,
  DBCtrls, Mask, ComCtrls;

type
  TfrmRelatComissao = class(TForm)
    REPORT: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText6: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    PageHeaderBand1: TQRBand;
    QRLabel26: TQRLabel;
    empresa: TQRLabel;
    NOME: TQRLabel;
    lblvendedor: TQRLabel;
    endereco: TQRLabel;
    GroupFooterBand1: TQRBand;
    qryACHADOS: TIBQuery;
    dsFORNECEDORES: TDataSource;
    dtFORNECEDOR: TIBTable;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRDBText7: TQRDBText;
    QRShape8: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape3: TQRShape;
    QRDBText8: TQRDBText;
    dtCLIENTES: TIBTable;
    QRDBText9: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape18: TQRShape;
    qryACHADOSCODFORNECEDOR: TIBStringField;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRBand2: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRShape12: TQRShape;
    GroupBox1: TGroupBox;
    de1: TEdit;
    de2: TEdit;
    de3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel10: TQRLabel;
    q0: TQRExpr;
    VE1: TQRLabel;
    VE2: TQRLabel;
    VE3: TQRLabel;
    d3: TQRLabel;
    d2: TQRLabel;
    d1: TQRLabel;
    QRShape19: TQRShape;
    qryVendedor: TIBQuery;
    dsVendedor: TDataSource;
    Shape4: TShape;
    v1: TMaskEdit;
    v2: TMaskEdit;
    v3: TMaskEdit;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    qryITENS_COMISSAO: TIBQuery;
    qryITENS_COMISSAOtotal: TCurrencyField;
    dsITENS_COMISSAO: TDataSource;
    dtFORNECEDORES: TIBDataSet;
    dtFORNECEDORESCODFORNECEDOR: TIBStringField;
    DTITENS: TIBDataSet;
    DTITENSSUM: TFloatField;
    total: TQRLabel;
    vendedor: TQRLabel;
    QRShape30: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    d4: TQRLabel;
    d5: TQRLabel;
    d6: TQRLabel;
    ve4: TQRLabel;
    ve5: TQRLabel;
    ve6: TQRLabel;
    QRLabel9: TQRLabel;
    qr: TQRLabel;
    d7: TQRLabel;
    ve7: TQRLabel;
    d8: TQRLabel;
    ve8: TQRLabel;
    de4: TEdit;
    v4: TMaskEdit;
    de5: TEdit;
    v5: TMaskEdit;
    de6: TEdit;
    v6: TMaskEdit;
    de7: TEdit;
    v7: TMaskEdit;
    de8: TEdit;
    v8: TMaskEdit;
    QRShape31: TQRShape;
    QRShape9: TQRShape;
    QRLabel14: TQRLabel;
    QRExpr2: TQRExpr;
    QRShape10: TQRShape;
    outros: TQRLabel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    qryITENS_COMISSAOCODPEDIDO: TIBStringField;
    qryITENS_COMISSAOCODCLIENTE: TIntegerField;
    qryITENS_COMISSAOCODVENDEDOR: TIBStringField;
    qryITENS_COMISSAOCODFORNECEDOR: TIBStringField;
    qryITENS_COMISSAOENTREGA: TDateTimeField;
    qryITENS_COMISSAODATA: TDateTimeField;
    qryITENS_COMISSAOCODPEDIDO1: TIBStringField;
    qryITENS_COMISSAONUM_NF: TIBStringField;
    qryITENS_COMISSAODATA_NF: TDateTimeField;
    qryITENS_COMISSAOVALOR_NF: TFloatField;
    qryITENS_COMISSAOCOMISSAO: TFloatField;
    qryITENS_COMISSAODATA_PGTO: TDateTimeField;
    Shape1: TShape;
    Label22: TLabel;
    Label36: TLabel;
    Image3: TImage;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    dtini: TDateTimePicker;
    dtfim: TDateTimePicker;
    Label6: TLabel;
    combovendedor: TComboBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure q0Print(sender: TObject; var Value: String);
    procedure qryITENS_COMISSAOCalcFields(DataSet: TDataSet);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure de1Enter(Sender: TObject);
    procedure de2Enter(Sender: TObject);
    procedure de3Enter(Sender: TObject);
    procedure de4Enter(Sender: TObject);
    procedure de5Enter(Sender: TObject);
    procedure de6Enter(Sender: TObject);
    procedure de7Enter(Sender: TObject);
    procedure de8Enter(Sender: TObject);
    procedure de1Exit(Sender: TObject);
    procedure de2Exit(Sender: TObject);
    procedure de3Exit(Sender: TObject);
    procedure de4Exit(Sender: TObject);
    procedure de5Exit(Sender: TObject);
    procedure de6Exit(Sender: TObject);
    procedure de7Exit(Sender: TObject);
    procedure de8Exit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Function transform(valor:real):string;
  end;

var
  frmRelatComissao: TfrmRelatComissao;
  aux0:string;
  aux1,aux2,aux3,aux4,aux5,aux6,aux7,aux8,totalreceber,tot:real;

implementation

uses untMenu, untProcedures;

{$R *.dfm}

procedure TfrmRelatComissao.SpeedButton1Click(Sender: TObject);
begin
if dtini.Date > dtfim.Date then
 begin
  messagedlg('Data Inicial NÃO PODE ser maior que a Data Final!',mterror,[mbok],0);
  dtini.SetFocus;
  exit;
 end;

if combovendedor.Text = '' then
 begin
  messagedlg('Selecione um VENDEDOR!',mterror,[mbok],0);
  combovendedor.SetFocus;
  exit;
 end;

if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

qryACHADOS.Close;
qryACHADOS.ParamByName('pini').Value := datetostr(dtini.Date);
qryACHADOS.parambyname('pfim').Value := datetostr(dtfim.Date);
qryACHADOS.parambyname('pcod').value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
qryACHADOS.open;

 if qryachados.Eof then
  begin
   messagedlg('Não foram encontradas NOTAS À RECEBER para o vendedor: '+combovendedor.text+' no período de '+datetostr(dtini.date)+ ' até ' +datetostr(dtfim.date)+ ' !',mterror,[mbok],0);
   dtini.SetFocus;
   exit;
  end else begin
   qryACHADOS.FIRST;

   dtfornecedores.Open;
   if dtfornecedores.RecordCount > 0 then   dtfornecedores.Delete;

   while not (qryAchados.eof) do
    begin
     dtFornecedores.Open;
     dtFornecedores.Append;
     dtFornecedores.FieldByName('CODFORNECEDOR').Value := qryAchados.fieldbyname('codfornecedor').Value;
     dtFornecedores.Post;
     dtFornecedores.CLOSE;
     qryAchados.next;
    END;

   vendedor.Caption := combovendedor.Text;
   dtFornecedores.Open;
   dtclientes.Open;
   dtfornecedor.Open;
   Report.Preview;
  end;
end;

procedure TfrmRelatComissao.q0Print(sender: TObject; var Value: String);
var
 i:integer;
begin
aux0:=value;
tot := strtofloat(aux0);

aux1:=strtofloat(v1.text);
aux2:=strtofloat(v2.text);
aux3:=strtofloat(v3.text);
aux4:=strtofloat(v4.text);
aux5:=strtofloat(v5.text);
aux6:=strtofloat(v6.text);
aux7:=strtofloat(v7.text);
aux8:=strtofloat(v8.text);

VE1.Caption := '( - ) ' +v1.text;
VE2.Caption := '( - ) ' +v2.text;
VE3.Caption := '( - ) ' +v3.text;
VE4.Caption := '( - ) ' +v4.text;
VE5.Caption := '( - ) ' +v5.text;
VE6.Caption := '( - ) ' +v6.text;
VE7.Caption := '( - ) ' +v7.text;
VE8.Caption := '( - ) ' +v8.text;

totalreceber:=tot;

tot := totalreceber - aux1- aux2-aux3- aux4- aux5-aux6- aux7- aux8;

qr.caption:= FloatToStrf(tot,ffcurrency,18,2);

d1.Caption := de1.text+':';
d2.Caption := de2.text+':';
d3.Caption := de3.text+':';
d4.Caption := de4.text+':';
d5.Caption := de5.text+':';
d6.Caption := de6.text+':';
d7.Caption := de7.text+':';
d8.Caption := de8.text+':';
VALUE := FloatToStrf(strtofloat(value),ffcurrency,18,2);
end;

procedure TfrmRelatComissao.qryITENS_COMISSAOCalcFields(DataSet: TDataSet);
begin
qryITENS_COMISSAOtotal.value:=(qryITENS_COMISSAOvalor_nf.value * (qryITENS_COMISSAOcomissao.value /100));
end;

procedure TfrmRelatComissao.DetailBand1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
WITH qryITENS_COMISSAO DO
 begin
  close;
  parambyname('pini').Value := datetostr(dtini.Date);
  parambyname('pfim').Value := datetostr(dtfim.Date);
  parambyname('pfor').value := dtFornecedores.fieldbyname('codfornecedor').value;
  parambyname('pcod').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
  open;
 end;
end;


procedure TfrmRelatComissao.QRSubDetail1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
dtitens.close;
dtitens.ParamByName('pcod').Value := qryitens_comissao.fieldbyname('codpedido').value;
dtitens.Open;
total.Caption := FloatToStrf(dtitens.fieldbyname('sum').Value,ffcurrency,18,2);
end;

procedure TfrmRelatComissao.de1Enter(Sender: TObject);
begin
if de1.Text = '---------------------------------------------------------------------------------' then de1.Text := '';
end;

procedure TfrmRelatComissao.de2Enter(Sender: TObject);
begin
if de2.Text = '---------------------------------------------------------------------------------' then de2.Text := '';
end;

procedure TfrmRelatComissao.de3Enter(Sender: TObject);
begin
if de3.Text = '---------------------------------------------------------------------------------' then de3.Text := '';
end;

procedure TfrmRelatComissao.de4Enter(Sender: TObject);
begin
if de4.Text = '---------------------------------------------------------------------------------' then de4.Text := '';
end;

procedure TfrmRelatComissao.de5Enter(Sender: TObject);
begin
if de5.Text = '---------------------------------------------------------------------------------' then de5.Text := '';
end;

procedure TfrmRelatComissao.de6Enter(Sender: TObject);
begin
if de6.Text = '---------------------------------------------------------------------------------' then de6.Text := '';
end;

procedure TfrmRelatComissao.de7Enter(Sender: TObject);
begin
if de7.Text = '---------------------------------------------------------------------------------' then de7.Text := '';
end;

procedure TfrmRelatComissao.de8Enter(Sender: TObject);
begin
if de8.Text = '---------------------------------------------------------------------------------' then de8.Text := '';
end;

procedure TfrmRelatComissao.de1Exit(Sender: TObject);
begin
if de1.Text = '' then de1.Text := '---------------------------------------------------------------------------------';
end;

procedure TfrmRelatComissao.de2Exit(Sender: TObject);
begin
if de2.Text = '' then de2.Text := '---------------------------------------------------------------------------------';
end;

procedure TfrmRelatComissao.de3Exit(Sender: TObject);
begin
if de3.Text = '' then de3.Text := '---------------------------------------------------------------------------------';
end;

procedure TfrmRelatComissao.de4Exit(Sender: TObject);
begin
 if de4.Text = '' then de4.Text := '---------------------------------------------------------------------------------';
end;

procedure TfrmRelatComissao.de5Exit(Sender: TObject);
begin
if de5.Text = '' then de5.Text := '---------------------------------------------------------------------------------';
end;

procedure TfrmRelatComissao.de6Exit(Sender: TObject);
begin
if de6.Text = '' then de6.Text := '---------------------------------------------------------------------------------';
end;

procedure TfrmRelatComissao.de7Exit(Sender: TObject);
begin
if de7.Text = '' then de7.Text := '---------------------------------------------------------------------------------';
end;

procedure TfrmRelatComissao.de8Exit(Sender: TObject);
begin
if de8.Text = '' then de8.Text := '---------------------------------------------------------------------------------';
end;

procedure TfrmRelatComissao.SpeedButton2Click(Sender: TObject);
begin
report.PrinterSetup;
end;

procedure TfrmRelatComissao.FormCreate(Sender: TObject);
begin
frmSYSProcedures.qryempresa.Open;
empresa.caption  := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
endereco.Caption := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('endereco').value +' - CEP: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cep').value+ ' - Fone: ' +frmSYSProcedures.qryEMPRESA.FIELDBYNAME('telefone').value;
outros.Caption   := 'FAX: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('fax').value + ' - E-mail: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('email').value + ' - ' + frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cidade').value + '-'+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('uf').value;
frmSYSProcedures.qryEMPRESA.close;

frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
dtini.Date := incmonth(now,-1);
dtfim.date := now;
end;

procedure TfrmRelatComissao.QRExpr2Print(sender: TObject;  var Value: String);
var
x:string;
begin
x:=transform(strtofloat(value));
value := 'R$' + x;
end;

Function tfrmrelatcomissao.transform(valor:real):string;
var
txt:string;
begin
txt:=' '+formatfloat('##,###,##0.00',valor);
transform:=copy(txt,length(txt)-13,14);
end;

procedure TfrmRelatComissao.QRDBText2Print(sender: TObject;  var Value: String);
begin
value:= FormatFloat('###,#0.00',strtofloat(value));
end;

procedure TfrmRelatComissao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if key = vk_escape then close;
if key = vk_return then speedbutton1click(self);
end;

procedure TfrmRelatComissao.SpeedButton4Click(Sender: TObject);
begin
if dtini.Date > dtfim.Date then
 begin
  messagedlg('Data Inicial NÃO PODE ser maior que a Data Final!',mterror,[mbok],0);
  dtini.SetFocus;
  exit;
 end;

if combovendedor.Text = '' then
 begin
  messagedlg('Selecione um VENDEDOR!',mterror,[mbok],0);
  combovendedor.SetFocus;
  exit;
 end;

if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

qryACHADOS.Close;
qryACHADOS.ParamByName('pini').Value := datetostr(dtini.Date);
qryACHADOS.parambyname('pfim').Value := datetostr(dtfim.Date);
qryACHADOS.parambyname('pcod').value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
qryACHADOS.open;

 if qryachados.Eof then
  begin
   messagedlg('Não foram encontradas NOTAS À RECEBER para o vendedor: '+combovendedor.text+' no período de '+datetostr(dtini.date)+ ' até ' +datetostr(dtfim.date)+ ' !',mterror,[mbok],0);
   dtini.SetFocus;
   exit;
  end else begin
   qryACHADOS.FIRST;

   dtfornecedores.Open;
   if dtfornecedores.RecordCount > 0 then   dtfornecedores.Delete;

   while not (qryAchados.eof) do
    begin
     dtFornecedores.Open;
     dtFornecedores.Append;
     dtFornecedores.FieldByName('CODFORNECEDOR').Value := qryAchados.fieldbyname('codfornecedor').Value;
     dtFornecedores.Post;
     dtFornecedores.CLOSE;
     qryAchados.next;
    END;

   vendedor.Caption := combovendedor.Text;
   dtFornecedores.Open;
   dtclientes.Open;
   dtfornecedor.Open;
   Report.Print;
  end;
end;

procedure TfrmRelatComissao.FormShow(Sender: TObject);
begin
combovendedor.SetFocus;
end;

end.

