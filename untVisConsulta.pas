unit untVisConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBCustomDataSet, ibx.IbQuery, Grids, DBGrids, Buttons, ExtCtrls,
  StdCtrls, jpeg, QRCtrls, QuickRpt;

type
  TfrmVISConsulta = class(TForm)
    dsConsulta: TDataSource;
    cmdgravaraltera: TSpeedButton;
    cmdCancelaAlt: TSpeedButton;
    cmdexcluir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    lbldia: TLabel;
    qry: TIBQuery;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Shape34: TShape;
    Label22: TLabel;
    Image8: TImage;
    lblnomedia: TLabel;
    qryConsulta: TIBDataSet;
    qryConsultaCODIGO: TIntegerField;
    qryConsultaCLIENTE: TIntegerField;
    qryConsultaVENDEDOR: TIntegerField;
    qryConsultaHORA: TIBStringField;
    qryConsultaDATA: TDateTimeField;
    qryConsultaVISITADO: TIntegerField;
    qryConsultaDATA_ENTRADA: TDateTimeField;
    qryConsultaNOME_CLI: TStringField;
    SpeedButton3: TSpeedButton;
    grid: TDBGrid;
    qryConsultaSIT: TStringField;
    SpeedButton4: TSpeedButton;
    Shape1: TShape;
    SpeedButton5: TSpeedButton;
    Shape2: TShape;
    SpeedButton6: TSpeedButton;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    qReport1: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qreport2: TQuickRep;
    QRSubDetail2: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel26: TQRLabel;
    empresa: TQRLabel;
    QRShape11: TQRShape;
    lblnomevendedor: TQRLabel;
    lblVisitas: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    lblnomevendedor2: TQRLabel;
    lblnomerelat: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    lblnomecliente: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    qry2: TIBQuery;
    procedure cmdgravaralteraClick(Sender: TObject);
    procedure cmdCancelaAltClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryConsultaCalcFields(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cmdexcluirClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVISConsulta: TfrmVISConsulta;

implementation

uses untVisitasEntrada, Unit1, untDM, untPrepedido2, frmEscolhevendedor;

{$R *.dfm}

procedure TfrmVISConsulta.cmdgravaralteraClick(Sender: TObject);
begin
frmVISEntrada:= tfrmVISEntrada.create(self);
frmVisentrada.panel1.Top   := 0;
frmVisentrada.panel1.Left  := 0;
frmVisentrada.caption      := 'NOVA VISITA para:   ' + lblnomedia.Caption;
frmVisentrada.height       := 173;
frmVisentrada.width        := 581;
frmVisentrada.cmdnovo.Enabled := true;
frmVISConsulta.visible := false;
frmVISEntrada.showmodal;
frmVISEntrada.free;
end;

procedure TfrmVISConsulta.cmdCancelaAltClick(Sender: TObject);
begin
CLOSE;
end;

procedure TfrmVISConsulta.SpeedButton2Click(Sender: TObject);
begin
if (qryConsulta.eof) then
 begin
  messagedlg('Nenhum cliente selecionado!',mterror,[mbok],0);
   if not qryconsulta.Bof then  exit;
 end;

frmVISEntrada                    := tfrmVISEntrada.create(self);
frmvisentrada.dtIni.Date         := frmvisagendamento.data2;
FRMvisentrada.lblcliente.Caption := qryConsulta.fieldbyname('cliente').value;
FRMvisentrada.Caption            := 'Cliente: '+qryConsulta.fieldbyname('Nome_cli').value;
frmVisentrada.panel2.Top         := 0;
frmVisentrada.panel2.Left        := 0;
frmVisentrada.height             := 290;
frmVisentrada.width              := 471;
frmVISConsulta.visible           := false;
frmVisentrada.speedbutton3.Enabled := true;
frmVISEntrada.showmodal;
frmVISEntrada.free;
end;

procedure TfrmVISConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmvisagendamento.MontarMapa;
frmvisagendamento.Visible := true;
Shortdateformat:= ('dd/mm/yyyy');
end;

procedure TfrmVISConsulta.qryConsultaCalcFields(DataSet: TDataSet);
begin

with qry do
 begin
  close;
  sql.clear;
  sql.add('select * from clientes where codigo = :pcli');
  parambyname('pcli').value := qryconsulta.fieldbyname('cliente').value;
  open;
  qryconsulta.FieldByName('nome_cli').Value := fieldbyname('razao').value;
 end;
IF qryconsulta.FieldByName('visitado').Value = 0 then qryconsulta.FieldByName('Sit').Value := 'NÃO' ELSE qryconsulta.FieldByName('Sit').Value := 'SIM';  
end;

procedure TfrmVISConsulta.SpeedButton1Click(Sender: TObject);
begin
If qryconsulta.eof then
 begin
  messagedlg('Nenhum cliente selecionado!',mterror,[mbok],0);
  exit;
 end;

If qryconsulta.fieldbyname('visitado').Value = 1 then
 begin
  messagedlg('Cliente já está MARCADO COMO VISITADO!',mterror,[mbok],0);
  exit;
 end;

 if messagedlg('Tem certeza que deseja MARCAR COMO VISITADO o cliente: '+uppercase(qryconsulta.fieldbyname('nome_cli').value)+ '?',mtERROR,[mbyes,mbno],0)=mryes then
  begin
   qryConsulta.Edit;
   qryConsulta.fieldbyname('visitado').value := 1;
   qryConsulta.post;

   dm.transacao.commit;

   frmVISConsulta.qryconsulta.close;
   frmVISConsulta.qryConsulta.parambyname('pData').value := frmvisconsulta.lbldia.Caption +frmvisagendamento.lbldata.caption;
   frmVISConsulta.qryConsulta.parambyname('pVen').value  := frmvisagendamento.lblvendedor.Caption;
   frmVISConsulta.qryconsulta.open;
  end;

end;

procedure TfrmVISConsulta.SpeedButton3Click(Sender: TObject);
begin

If qryconsulta.eof then
 begin
  messagedlg('Nenhum cliente selecionado!',mterror,[mbok],0);
  exit;
 end;

If qryconsulta.fieldbyname('visitado').Value = 0 then
 begin
  messagedlg('O cliente já está marcado como NÃO VISITADO!',mterror,[mbok],0);
  exit;
 end;

 if messagedlg('Tem certeza que deseja MARCAR COMO NÃO VISITADO o cliente: '+uppercase(qryconsulta.fieldbyname('nome_cli').value)+ '?',mtWarning,[mbyes,mbno],0)=mryes then
  begin
   qryConsulta.Edit;
   qryConsulta.fieldbyname('visitado').value := 0;
   qryConsulta.post;

   dm.transacao.commit;

   frmVISConsulta.qryconsulta.close;
   frmVISConsulta.qryConsulta.parambyname('pData').value := frmvisconsulta.lbldia.Caption +frmvisagendamento.lbldata.caption;
   frmVISConsulta.qryConsulta.parambyname('pVen').value  := frmvisagendamento.lblvendedor.Caption;
   frmVISConsulta.qryconsulta.open;
  end;

end;

procedure TfrmVISConsulta.cmdexcluirClick(Sender: TObject);
begin
If qryconsulta.eof then
 begin
  messagedlg('Nenhum cliente selecionado!',mterror,[mbok],0);
  exit;
 end;

 if messagedlg('Tem certeza que deseja EXCLUIR A VISITA no cliente: '+uppercase(qryconsulta.fieldbyname('nome_cli').value)+ '?',mtWarning,[mbyes,mbno],0)=mryes then
  begin
    qryconsulta.Delete;
    dm.TRANSACAO.commit;

    frmVISConsulta.qryconsulta.close;
    frmVISConsulta.qryConsulta.parambyname('pData').value := frmvisconsulta.lbldia.Caption +frmvisagendamento.lbldata.caption;
    frmVISConsulta.qryConsulta.parambyname('pVen').value  := frmvisagendamento.lblvendedor.Caption;
    frmVISConsulta.qryconsulta.open;
  end;

end;

procedure TfrmVISConsulta.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
If qryConsulta.fieldbyname('visitado').Value = 1 then
 begin
  grid.Canvas.BRUSH.Color:= $0082C0FF;
  grid.Canvas.FONT.Color := clblack;
  grid.DefaultDrawDataCell(Rect, grid.columns[datacol].field, State);
 end;
end;

procedure TfrmVISConsulta.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
if key = vk_f1 then cmdgravaralteraClick(self);
if key = vk_delete then cmdexcluirClick(self);
if key = vk_return then SpeedButton1Click(self);
end;

procedure TfrmVISConsulta.FormCreate(Sender: TObject);
begin
Shortdateformat:= ('dddd, dd" de "mmmm" de "yyyy');
Shortdateformat:= ('dd/mm/yyyy');
end;

procedure TfrmVISConsulta.SpeedButton4Click(Sender: TObject);
begin
frmprepedido_ESPELHO:= tfrmprepedido_ESPELHO.create(self);
frmprepedido_ESPELHO.combocliente.Text := qryconsulta.fieldbyname('nome_cli').value;
frmprepedido_ESPELHO.combocliente.enabled := false;
frmprepedido_ESPELHO.combovendedor.Text := frmvisvendedor.combovendedor.text;
frmprepedido_ESPELHO.combovendedor.enabled := false;
frmprepedido_ESPELHO.showmodal;
frmprepedido_ESPELHO.free;
end;

procedure TfrmVISConsulta.SpeedButton6Click(Sender: TObject);
var
  data:string;
  data2:tdate;
begin


frmVISConsulta.qryconsulta.close;
frmVISConsulta.qryConsulta.parambyname('pData').value := lbldia.Caption+frmvisagendamento.lbldata.caption;
frmVISConsulta.qryConsulta.parambyname('pVen').value  := frmvisagendamento.lblvendedor.Caption;
frmVISConsulta.qryconsulta.open;
lblvisitas.Caption      := 'Visitas à fazer no dia: '+lblnomedia.Caption;
lblnomevendedor.Caption := 'Vendedor: ' + frmvisvendedor.combovendedor.text; 

qreport1.preview;
end;

procedure TfrmVISConsulta.SpeedButton5Click(Sender: TObject);
begin
qry2.close;
qry2.sql.clear;
qry2.sql.add('select * from visitas where vendedor = :pven and cliente = :pcli');
qry2.ParamByName('pcli').value := qryConsulta.fieldbyname('cliente').value;
qry2.ParamByName('pven').value := frmvisagendamento.LBLVENDEDOR.caption;
qry2.open;
lblnomevendedor2.Caption := 'Vendedor: ' + frmvisvendedor.combovendedor.text;
lblnomecliente.Caption := 'Cliente: '  + qryConsulta.fieldbyname('nome_cli').value;;
qreport2.preview;
end;

end.
