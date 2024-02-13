unit untVisitasEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, QRCtrls, QuickRpt, ExtCtrls, Buttons, DB,
  ibx.IBCustomDataSet, ibx.IbQuery, DBClient, Grids, DBGrids, ComCtrls, Mask,
  ibx.IBTable, Gauges, DBCtrls;

type
  TfrmVISEntrada = class(TForm)
    dtVis: TIBDataSet;
    dtVisCODIGO: TIntegerField;
    dtVisCLIENTE: TIntegerField;
    dtVisVENDEDOR: TIntegerField;
    dtVisHORA: TIBStringField;
    dtVisDATA: TDateTimeField;
    dtVisVISITADO: TIntegerField;
    dsVis: TDataSource;
    dtVisDATA_ENTRADA: TDateTimeField;
    lblcliente: TLabel;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    combocliente: TComboBox;
    DBEdit1: TDBEdit;
    Shape34: TShape;
    Label22: TLabel;
    Image8: TImage;
    lblnomedia: TLabel;
    Image2: TImage;
    cmdcancelar: TSpeedButton;
    cmdgravar: TSpeedButton;
    cmdnovo: TSpeedButton;
    Panel2: TPanel;
    Label2: TLabel;
    Image3: TImage;
    Label3: TLabel;
    Shape1: TShape;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    dtIni: TMonthCalendar;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    qryData: TIBQuery;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    vData: TEdit;
    qryMax: TIBQuery;
    qryMaxMAX: TIntegerField;
    procedure cmdnovoClick(Sender: TObject);
    procedure cmdgravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cmdcancelarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure comboclienteExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure dtVisBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVISEntrada: TfrmVISEntrada;

implementation

uses untDM, untProcedures, untVisConsulta, Unit1, DateUtils;

{$R *.dfm}

procedure TfrmVISEntrada.cmdnovoClick(Sender: TObject);
begin
dtvis.Open;
dtvis.Append;
cmdnovo.enabled      := false;
cmdgravar.enabled    := true;
cmdCancelar.enabled  := true;
combocliente.Enabled := true;
dbedit1.Enabled      := true;
dbedit1.SetFocus;
end;

procedure TfrmVISEntrada.cmdgravarClick(Sender: TObject);
begin

  if trim(dbedit1.Text) = ':' then
   begin
    messagedlg('SELECIONE um Horário!',mterror,[mbok],0);
    dbedit1.SetFocus;
    exit;
   end;

  qryData.Close;
  qryData.ParamByName('pData').value := frmvisConsulta.lbldia.Caption + frmvisagendamento.LBLDATA.caption;
  qryData.ParamByName('pHora').value := dbedit1.text;
  qryData.ParamByName('pVen').value  := frmvisagendamento.LBLVENDEDOR.caption;
  qryData.open;

  if not(qrydata.eof) then
   begin
    messagedlg('Já existe uma visita marcada neste horário!',mterror,[mbok],0);
    dbedit1.setfocus;
    exit;
   end;

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('dataset','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,dtvis) = 0 then exit;

  qryMax.Close;
  qryMax.Open;

  if qryMax.fieldbyname('max').value = 0 then dtvis.fieldbyname('codigo').value := 1 else dtvis.fieldbyname('codigo').value := qryMax.fieldbyname('max').value + 1;
  
  dtvis.FieldByName('cliente').value      := frmSYSProcedures.BuscaCombo('DATASET','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CLIENTE','ENCONTRAR_CODIGO',comboCliente,dtVis);
  dtvis.fieldbyname('data').value         := frmvisConsulta.lbldia.Caption + frmvisagendamento.LBLDATA.caption;
  dtvis.fieldbyname('vendedor').value     := frmvisagendamento.LBLvendedor.caption;
  dtvis.fieldbyname('data_entrada').value := now;
  dtvis.fieldbyname('visitado').value     := 0;
  messagedlg('Visita Marcada com Sucesso! ' + ' Cliente: ' +combocliente.Text+' no dia: ' +datetostr(dtvis.fieldbyname('data').value)+ ' às ' +dbedit1.text + '!',mtwarning,[mbok],0);
  dtvis.post;
  dtvis.close;
  dm.TRANSACAO.commit;

  close;
end;

procedure TfrmVISEntrada.FormCreate(Sender: TObject);
var
vParam:string;
begin
vParam := '''' + frmvisagendamento.LBLVENDEDOR.caption + '''';
frmSYSProcedures.constroicombo('select cli_ven.*,clientes.* from cli_ven  join clientes on cli_ven.codcliente = clientes.codigo where codvendedor = '+vParam,'razao',combocliente);
dtIni.date := now;
Shortdateformat:= ('dd/mm/yyyy');
end;

procedure TfrmVISEntrada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmVISConsulta.qryconsulta.close;
frmVISConsulta.qryConsulta.parambyname('pData').value := frmvisconsulta.lbldia.Caption +frmvisagendamento.lbldata.caption;
frmVISConsulta.qryConsulta.parambyname('pVen').value  := frmvisagendamento.lblvendedor.Caption;
frmVISConsulta.qryconsulta.open;
Shortdateformat:= ('dddd, dd" de "mmmm" de "yyyy');

frmVISConsulta.visible := true;
end;

procedure TfrmVISEntrada.SpeedButton3Click(Sender: TObject);
begin
dtvis.Open;
dtvis.Append;
dbedit4.Enabled := true;
dtini.Enabled   := true;
dbedit4.SetFocus;
groupbox3.Enabled := true;
speedbutton3.enabled := false;
speedbutton2.Enabled := true;
speedbutton1.Enabled := true;
end;

procedure TfrmVISEntrada.SpeedButton2Click(Sender: TObject);
begin

  if trim(dbedit4.Text) = ':' then
   begin
    messagedlg('SELECIONE um Horário!',mterror,[mbok],0);
    dbedit4.SetFocus;
    exit;
   end;

  qryData.Close;
  qryData.ParamByName('pData').value := datetostr(dtini.Date);
  qryData.ParamByName('pHora').value := dbedit4.text;
  qryData.ParamByName('pVen').value  := frmvisagendamento.LBLVENDEDOR.caption;
  qryData.open;

  if not(qrydata.eof) then
   begin
    messagedlg('Já existe uma visita marcada neste horário!',mterror,[mbok],0);
    dbedit4.setfocus;
    exit;
   end;

  qryMax.Close;
  qryMax.Open;

  if qryMax.fieldbyname('max').value = 0 then dtvis.fieldbyname('codigo').value := 1 else dtvis.fieldbyname('codigo').value := qryMax.fieldbyname('max').value + 1;

  dtvis.FieldByName('cliente').value       := lblcliente.Caption;
  dtvis.fieldbyname('vendedor').value      := frmvisagendamento.LBLvendedor.caption;
  dtvis.fieldbyname('visitado').value      := 0;
  dtvis.fieldbyname('data_entrada').value  := date;
  dtvis.fieldbyname('data').value          := dtini.Date;
  messagedlg('Visita Marcada com Sucesso! ' + ' Cliente: ' +frmVisConsulta.qryConsulta.fieldbyname('nome_cli').value+' no dia: ' +datetostr(dtvis.fieldbyname('data').value)+ ' às ' +dbedit4.text + '!',mtwarning,[mbok],0);
  dtvis.post;
  dtvis.close;
  dm.TRANSACAO.commit;
  close;
end;

procedure TfrmVISEntrada.cmdcancelarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmVISEntrada.SpeedButton1Click(Sender: TObject);
begin
Close;
end;

procedure TfrmVISEntrada.DBEdit1Exit(Sender: TObject);
begin
combocliente.SetFocus; 
end;

procedure TfrmVISEntrada.comboclienteExit(Sender: TObject);
begin
dbedit1.SetFocus;
end;

procedure TfrmVISEntrada.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;


if (key = vk_return) and (cmdgravar.Enabled = true)    then cmdgravarClick(self);
if (key = vk_return) and (speedbutton2.Enabled = true) then speedbutton2Click(self);

if (key = vk_return) and (cmdnovo.Enabled = true)      then cmdnovoClick(self);
if (key = vk_return) and (speedbutton3.Enabled = true) then speedbutton3Click(self);
end;

procedure TfrmVISEntrada.RadioButton4Click(Sender: TObject);
begin
dtini.date := IncDay(frmvisagendamento.data2,7);
end;

procedure TfrmVISEntrada.RadioButton2Click(Sender: TObject);
begin
dtini.date := IncDay(frmvisagendamento.data2,15);
end;

procedure TfrmVISEntrada.RadioButton1Click(Sender: TObject);
begin
dtini.date := IncDay(frmvisagendamento.data2,21);
end;

procedure TfrmVISEntrada.RadioButton3Click(Sender: TObject);
begin
dtini.date := IncDay(frmvisagendamento.data2,30);
end;

procedure TfrmVISEntrada.dtVisBeforePost(DataSet: TDataSet);
begin
vData.text := dtvis.fieldbyname('data').value;
dtvis.fieldbyname('data').value := vData.text[1] + vData.text[2] + vData.text[3] + vData.text[4] + vData.text[5] + vData.text[6] + vData.text[7] + vData.text[8] + vData.text[9] + vData.text[10];
vData.text := datetostr(date);
dtvis.fieldbyname('data_entrada').value := vData.text[1] + vData.text[2] + vData.text[3] + vData.text[4] + vData.text[5] + vData.text[6] + vData.text[7] + vData.text[8] + vData.text[9] + vData.text[10];
end;

end.

