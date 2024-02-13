unit untGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBCustomDataSet, StdCtrls, Grids, DBGrids, ibx.IbQuery, Buttons,
  Mask, ExtCtrls;

type
  TfrmCADGastos = class(TForm)
    DBGrid1: TDBGrid;
    Label2: TLabel;
    dtGastos: TIBDataSet;
    dsGastos: TDataSource;
    QRY: TIBQuery;
    QRYCODIGO: TIntegerField;
    QRYDESCRICAO: TIBStringField;
    SpeedButton1: TSpeedButton;
    dtGastosCODIGO: TIntegerField;
    dtGastosCONTA: TIntegerField;
    dtGastosVALOR: TFloatField;
    dtGastosDATA: TDateTimeField;
    dtGastosDATA_VENC: TDateTimeField;
    dtGastosNOTA: TIBStringField;
    dtGastosDESCRICAO: TIBStringField;
    edtdata: TMaskEdit;
    Shape4: TShape;
    Label22: TLabel;
    Label36: TLabel;
    Image3: TImage;
    Shape2: TShape;
    Image4: TImage;
    Label1: TLabel;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dtGastosAfterPost(DataSet: TDataSet);
    procedure dtGastosBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtdataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADGastos: TfrmCADGastos;

implementation

uses uPesquisar, untDM, untProcedures;

{$R *.dfm}

procedure TfrmCADGastos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  concatena:string;
  data:string;
begin

if dtgastos.Active = false then  exit;
if key = vk_f1 then
 begin
   frmcadgastos.Visible := false;
 with frmSYSPesquisar do
  begin
    bancodedados := 'contas';
    Titulo := 'Localizar Contas';
    Campos := 'codigo,descricao';
    GridTitulo := 'Código,Descrição';
    GridTamanho := '4,40';
    PesqSize := '500';
    NoAutoUpdate := true;
    showmodal;
    if retorno then
     begin
        with frmCADGastos do
         begin

          concatena:='';
          concatena:= edtdata.text[1]+edtdata.text[2];

          if concatena = '01' then data := '31/';
          if concatena = '02' then data := '28/';
          if concatena = '03' then data := '31/';
          if concatena = '04' then data := '30/';
          if concatena = '05' then data := '31/';
          if concatena = '06' then data := '30/';
          if concatena = '07' then data := '31/';
          if concatena = '08' then data := '31/';
          if concatena = '09' then data := '30/';
          if concatena = '10' then data := '31/';
          if concatena = '11' then data := '30/';
          if concatena = '12' then data := '31/';

          dtgastos.Close;
          dtgastos.ParamByName('pini').value := '01/'+edtdata.text;
          dtgastos.ParamByName('pfim').value := data+edtdata.text;
          dtgastos.Open;
          dtgastos.append;
          dtGastos.FIELDBYNAME('CONTA').value:= valor;
          qry.close;
          qry.parambyname('pcod').value := valor;
          qry.open;
          dtgastos.FieldByName('Descricao').value := qry.fieldbyname('descricao').value;
          dbgrid1.SelectedIndex := 2;
          DBGRID1.SetFocus;
         end;
     end else begin
          SpeedButton1Click(self);
     end;
  end;


 end;

if key = vk_delete then
 begin
  if messagedlg('Tem certeza que deseja excluir a conta: ' + dtgastos.fieldbyname('descricao').value+ ' ?',mtwarning,[mbyes,mbno],0) = mryes then
   begin
    dtgastos.delete;
    dm.TRANSACAO.Commit;
    SpeedButton1Click(self);
   end;
 end;
frmcadgastos.Visible := true;
DBGRID1.SetFocus;
end;

procedure TfrmCADGastos.SpeedButton1Click(Sender: TObject);
var
data:string;
concatena:string;
begin

if  trim(edtdata.text[1])= '' then exit;
if  trim(edtdata.text[2])= '' then exit;
if  trim(edtdata.text[3])= '' then exit;
if  trim(edtdata.text[4])= '' then exit;
if  trim(edtdata.text[5])= '' then exit;
if  trim(edtdata.text[6])= '' then exit;
if  trim(edtdata.text[7])= '' then exit;

concatena:='';
concatena:= edtdata.text[1]+edtdata.text[2];

if concatena = '01' then data := '31/';
if concatena = '02' then data := '28/';
if concatena = '03' then data := '31/';
if concatena = '04' then data := '30/';
if concatena = '05' then data := '31/';
if concatena = '06' then data := '30/';
if concatena = '07' then data := '31/';
if concatena = '08' then data := '31/';
if concatena = '09' then data := '30/';
if concatena = '10' then data := '31/';
if concatena = '11' then data := '30/';
if concatena = '12' then data := '31/';


dtgastos.Close;
dtgastos.ParamByName('pini').value := '01/'+edtdata.text;
dtgastos.ParamByName('pfim').value := data+edtdata.text;
dtgastos.Open;

if dtgastos.Eof then messagedlg('Por enquanto nenhuma nota lançada no período!',mtwarning,[mbok],0);

dtgastos.Append;
dbgrid1.SetFocus;
end;

procedure TfrmCADGastos.dtGastosAfterPost(DataSet: TDataSet);
var
data,concatena:string;
begin
dm.TRANSACAO.commit;

concatena:='';
concatena:= edtdata.text[1]+edtdata.text[2];

if concatena = '01' then data := '31/';
if concatena = '02' then data := '28/';
if concatena = '03' then data := '31/';
if concatena = '04' then data := '30/';
if concatena = '05' then data := '31/';
if concatena = '06' then data := '30/';
if concatena = '07' then data := '31/';
if concatena = '08' then data := '31/';
if concatena = '09' then data := '30/';
if concatena = '10' then data := '31/';
if concatena = '11' then data := '30/';
if concatena = '12' then data := '31/';

dtgastos.ParamByName('pini').value := '01/'+edtdata.text;
dtgastos.ParamByName('pfim').value := data+edtdata.text;
dtgastos.open;
dtgastos.append;

end;

procedure TfrmCADGastos.dtGastosBeforePost(DataSet: TDataSet);
begin
dtgastos.FieldByName('codigo').value := frmsysprocedures.max('gastos');
end;

procedure TfrmCADGastos.FormShow(Sender: TObject);
begin
edtdata.SetFocus; 
end;

procedure TfrmCADGastos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;

end;

procedure TfrmCADGastos.edtdataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_return then SpeedButton1Click(self); 
end;

procedure TfrmCADGastos.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 begin
  with TDBGrid(ActiveControl) do
   begin
    if selectedindex = 5 then
     begin
      selectedindex := 0;
      dtgastos.Append;
      exit;
     end;
    if selectedindex = 4 then selectedindex := 5;
    if selectedindex = 3 then selectedindex := 4;
    if selectedindex = 2 then selectedindex :=3;
//    if selectedindex = 1 then selectedindex :=2;
    if selectedindex = 0 then selectedindex:= 2;
   end;
 end;
end;

procedure TfrmCADGastos.SpeedButton2Click(Sender: TObject);
begin
  if messagedlg('Tem certeza que deseja excluir a conta: ' + dtgastos.fieldbyname('descricao').value+ ' ?',mtwarning,[mbyes,mbno],0) = mryes then
   begin
    dtgastos.delete;
    dm.TRANSACAO.Commit;
    SpeedButton1Click(self);
   end;
end;

end.
