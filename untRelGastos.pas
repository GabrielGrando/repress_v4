unit untRelGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, Grids, DBGrids, ibx.IBCustomDataSet, ibx.IbQuery, StdCtrls,
  ExtCtrls, ComCtrls, QRCtrls, QuickRpt;

type
  TfrmRelatGastos = class(TForm)
    Shape4: TShape;
    Shape2: TShape;
    Label22: TLabel;
    Label36: TLabel;
    Image3: TImage;
    GroupBox1: TGroupBox;
    chconta: TRadioButton;
    chperiodo: TRadioButton;
    qry: TIBQuery;
    ds: TDataSource;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Image2: TImage;
    GroupBox6: TGroupBox;
    chsim: TRadioButton;
    chnao: TRadioButton;
    Label6: TLabel;
    datafinal: TDateTimePicker;
    datainicial: TDateTimePicker;
    Label5: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    comboconta: TComboBox;
    qreport2: TQuickRep;
    QRSubDetail2: TQRSubDetail;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand1: TQRBand;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    lbldata: TQRLabel;
    lblnomerelat: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    qreport1: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand2: TQRBand;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape10: TQRShape;
    lbldata2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape11: TQRShape;
    QRLabel5: TQRLabel;
    QRShape12: TQRShape;
    QRLabel9: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel12: TQRLabel;
    QRShape16: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure chperiodoClick(Sender: TObject);
    procedure chcontaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatGastos: TfrmRelatGastos;

implementation

uses untProcedures;

{$R *.dfm}

procedure TfrmRelatGastos.SpeedButton1Click(Sender: TObject);
begin
if (chperiodo.Checked = true) and (chnao.Checked = true) then
 begin
  qry.close;
  qry.SQL.Clear;
  qry.SQL.add('select gastos.*,contas.* from gastos');
  qry.SQL.add('join contas on contas.codigo = gastos.conta');
  qry.SQL.add('where data_venc between :pini and :pfim');
  qry.ParamByName('pini').value := datetostr(datainicial.date);
  qry.ParamByName('pfim').value := datetostr(datafinal.date);
  qry.open;
  lbldata2.Caption := 'Período de ' +datetostr(datainicial.date)+ ' até ' +datetostr(datafinal.date);
  qreport1.Preview;
 end;

if (chconta.Checked = true) and (chnao.Checked = true) then
 begin
  qry.close;
  qry.SQL.Clear;
  qry.SQL.add('select gastos.*,contas.* from gastos');
  qry.SQL.add('join contas on contas.codigo = gastos.conta');
  qry.SQL.add('where data_venc between :pini and :pfim and conta =:pcod');
  qry.ParamByName('pcod').value :=  frmSYSProcedures.BuscaCombo('PESQUISA','CONTAS','DESCRICAO',comboconta.text,'CONTA','CODIGO','ENCONTRAR_CODIGO',comboconta,frmsysprocedures.dataset);
  qry.ParamByName('pini').value := datetostr(datainicial.date);
  qry.ParamByName('pfim').value := datetostr(datafinal.date);
  qry.open;
  lbldata2.Caption := 'Período de ' +datetostr(datainicial.date)+ ' até ' +datetostr(datafinal.date);
  qreport1.Preview;
 end;

if (chperiodo.Checked = true) and (chnao.Checked = false) then
 begin
  qry.close;
  qry.SQL.Clear;
  qry.SQL.add('select sum(gastos.valor),contas.descricao from gastos');
  qry.SQL.add('join contas on contas.codigo = gastos.conta');
  qry.SQL.add('where data_venc between :pini and :pfim');
  qry.SQL.add('group by contas.descricao');

  qry.ParamByName('pini').value := datetostr(datainicial.date);
  qry.ParamByName('pfim').value := datetostr(datafinal.date);
  qry.open;
  lbldata.Caption := 'Período de ' +datetostr(datainicial.date)+ ' até ' +datetostr(datafinal.date);
  qreport2.Preview;
 end;

if (chconta.Checked = true) and (chnao.Checked = false) then
 begin
  qry.close;
  qry.SQL.Clear;
  qry.SQL.add('select sum(gastos.valor),contas.descricao from gastos');
  qry.SQL.add('join contas on contas.codigo = gastos.conta');
  qry.SQL.add('where data_venc between :pini and :pfim and conta =:pcod');
  qry.SQL.add('group by contas.descricao');

  qry.ParamByName('pcod').value :=  frmSYSProcedures.BuscaCombo('PESQUISA','CONTAS','DESCRICAO',comboconta.text,'CONTA','CODIGO','ENCONTRAR_CODIGO',comboconta,frmsysprocedures.dataset);
  qry.ParamByName('pini').value := datetostr(datainicial.date);
  qry.ParamByName('pfim').value := datetostr(datafinal.date);
  qry.open;
  lbldata.Caption := 'Período de ' +datetostr(datainicial.date)+ ' até ' +datetostr(datafinal.date);
  qreport2.Preview;
 end;

end;

procedure TfrmRelatGastos.FormCreate(Sender: TObject);
begin
datainicial.Date := incmonth(now,-1);
datafinal.Date := now;
frmSYSProcedures.constroicombo('select * from CONTAS order by descricao','descricao',comboconta);
end;

procedure TfrmRelatGastos.QRDBText4Print(sender: TObject;
  var Value: String);
begin
value:= 'R$ ' + FormatFloat('###,#0.00',strtofloat(value));
end;

procedure TfrmRelatGastos.QRDBText6Print(sender: TObject;
  var Value: String);
begin
value:= 'R$ ' + FormatFloat('###,#0.00',strtofloat(value));
end;

procedure TfrmRelatGastos.SpeedButton4Click(Sender: TObject);
begin
if (chperiodo.Checked = true) and (chnao.Checked = true) then
 begin
  qry.close;
  qry.SQL.Clear;
  qry.SQL.add('select gastos.*,contas.* from gastos');
  qry.SQL.add('join contas on contas.codigo = gastos.conta');
  qry.SQL.add('where data_venc between :pini and :pfim');
  qry.ParamByName('pini').value := datetostr(datainicial.date);
  qry.ParamByName('pfim').value := datetostr(datafinal.date);
  qry.open;
  lbldata2.Caption := 'Período de ' +datetostr(datainicial.date)+ ' até ' +datetostr(datafinal.date);
  qreport1.print;
 end;

if (chconta.Checked = true) and (chnao.Checked = true) then
 begin
  qry.close;
  qry.SQL.Clear;
  qry.SQL.add('select gastos.*,contas.* from gastos');
  qry.SQL.add('join contas on contas.codigo = gastos.conta');
  qry.SQL.add('where data_venc between :pini and :pfim and conta =:pcod');
  qry.ParamByName('pcod').value :=  frmSYSProcedures.BuscaCombo('PESQUISA','CONTAS','DESCRICAO',comboconta.text,'CONTA','CODIGO','ENCONTRAR_CODIGO',comboconta,frmsysprocedures.dataset);
  qry.ParamByName('pini').value := datetostr(datainicial.date);
  qry.ParamByName('pfim').value := datetostr(datafinal.date);
  qry.open;
  lbldata2.Caption := 'Período de ' +datetostr(datainicial.date)+ ' até ' +datetostr(datafinal.date);
  qreport1.print;
 end;

if (chperiodo.Checked = true) and (chnao.Checked = false) then
 begin
  qry.close;
  qry.SQL.Clear;
  qry.SQL.add('select sum(gastos.valor),contas.descricao from gastos');
  qry.SQL.add('join contas on contas.codigo = gastos.conta');
  qry.SQL.add('where data_venc between :pini and :pfim');
  qry.SQL.add('group by contas.descricao');

  qry.ParamByName('pini').value := datetostr(datainicial.date);
  qry.ParamByName('pfim').value := datetostr(datafinal.date);
  qry.open;
  lbldata.Caption := 'Período de ' +datetostr(datainicial.date)+ ' até ' +datetostr(datafinal.date);
  qreport2.print;
 end;

if (chconta.Checked = true) and (chnao.Checked = false) then
 begin
  qry.close;
  qry.SQL.Clear;
  qry.SQL.add('select sum(gastos.valor),contas.descricao from gastos');
  qry.SQL.add('join contas on contas.codigo = gastos.conta');
  qry.SQL.add('where data_venc between :pini and :pfim and conta =:pcod');
  qry.SQL.add('group by contas.descricao');

  qry.ParamByName('pcod').value :=  frmSYSProcedures.BuscaCombo('PESQUISA','CONTAS','DESCRICAO',comboconta.text,'CONTA','CODIGO','ENCONTRAR_CODIGO',comboconta,frmsysprocedures.dataset);
  qry.ParamByName('pini').value := datetostr(datainicial.date);
  qry.ParamByName('pfim').value := datetostr(datafinal.date);
  qry.open;
  lbldata.Caption := 'Período de ' +datetostr(datainicial.date)+ ' até ' +datetostr(datafinal.date);
  qreport2.print;
 end;

end;

procedure TfrmRelatGastos.SpeedButton3Click(Sender: TObject);
begin
if chnao.Checked   = true then qreport2.printersetup;
if chsim.Checked   = true then qreport1.printersetup;
end;

procedure TfrmRelatGastos.chperiodoClick(Sender: TObject);
begin
frmsysprocedures.combo(comboconta,false);
datainicial.SetFocus;
end;

procedure TfrmRelatGastos.chcontaClick(Sender: TObject);
begin
frmsysprocedures.combo(comboconta,true);
comboconta.SetFocus;
end;

procedure TfrmRelatGastos.FormShow(Sender: TObject);
begin
chperiodoClick(self);
end;

procedure TfrmRelatGastos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key= vk_escape then close;
if key = vk_return then SpeedButton1Click(self); 
end;

end.

