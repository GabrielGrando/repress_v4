unit untMeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ibx.IBCustomDataSet, Buttons, ExtCtrls, DB, ibx.IbQuery,
  DBCtrls, StdCtrls;

type
  TfrmCADMetas = class(TForm)
    Label4: TLabel;
    Shape4: TShape;
    dsMetas: TDataSource;
    grid: TDBGrid;
    SpeedButton2: TSpeedButton;
    qry: TIBQuery;
    dtMetas: TIBDataSet;
    Shape1: TShape;
    dtMetasCODPRODUTO: TIBStringField;
    dtMetasCODVENDEDOR: TIBStringField;
    dtMetasMETA: TIntegerField;
    dtMetasPRODESCRICAO: TIBStringField;
    btnpesq: TSpeedButton;
    Shape2: TShape;
    Label1: TLabel;
    Shape3: TShape;
    Label8: TLabel;
    Image1: TImage;
    Label9: TLabel;
    combo: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure incluiproduto;
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnpesqClick(Sender: TObject);
    procedure dtMetasAfterPost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure comboKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADMetas: TfrmCADMetas;
  vexiste:boolean;
  vEntrada:boolean;

implementation

uses untDM, uPesquisar, untProcedures;

{$R *.dfm}

procedure TfrmCADMetas.Button1Click(Sender: TObject);
begin
dtmetas.Delete;
dtmetas.close;
dm.transacao.commit;
end;

procedure TfrmCADMetas.Button2Click(Sender: TObject);
begin
showmessage(inttostr(dtmetas.RecordCount));
end;

procedure Tfrmcadmetas.IncluiProduto;
begin
vEntrada := true;
dtmetas.Append;
dtmetas.FieldByName('prodescricao').value := qry.fieldbyname('prodescricao').value;
dtmetas.FieldByName('codproduto').value := qry.fieldbyname('procodigo').value;
dtmetas.FieldByName('codvendedor').value := frmSYSProcedures.BuscaCombo('PROCURA','FUNCIONARIOS','NOME',combo.text,'VENDEDOR','CODIGO','ENCONTRAR_CODIGO',combo,frmSYSProcedures.DATASET);
dtmetas.post;    
end;

procedure TfrmCADMetas.SpeedButton2Click(Sender: TObject);
begin
if frmSYSProcedures.BuscaCombo('PROCURA','FUNCIONARIOS','NOME',combo.text,'VENDEDOR','CODIGO','ENCONTRAR_CODIGO',combo,frmSYSProcedures.DATASET) = 0 then
 begin
  dtmetas.close;
  exit;
 end; 
dtmetas.close;
dtmetas.ParamByName('pcod').value := frmSYSProcedures.BuscaCombo('PROCURA','FUNCIONARIOS','NOME',combo.text,'VENDEDOR','CODIGO','ENCONTRAR_CODIGO',combo,frmSYSProcedures.DATASET);
dtmetas.open;

 if dtmetas.eof then
  begin
   qry.open;
   qry.First;
    while not qry.eof do
      begin
       incluiproduto;
       qry.Next;
      end;
   end;
btnpesq.enabled:=true;
end;

procedure TfrmCADMetas.btnpesqClick(Sender: TObject);
var
 resposta:string;
 atual:string;
begin
Resposta := InputBox('Pesquisa de Produtos', 'Código:',atual);
dtmetas.Locate('codproduto',resposta,[lopartialkey]);
end;

procedure TfrmCADMetas.dtMetasAfterPost(DataSet: TDataSet);
VAR
 REGISTRO:STRING;
begin
if vEntrada = false then
begin
REGISTRO := DTMETAS.FIELDBYNAME('CODPRODUTO').VALUE;
DTMETAS.ApplyUpdates;
DM.TRANSACAO.COMMIT;
DTMETAS.ParamByName('PCOD').VALUE := frmSYSProcedures.BuscaCombo('PROCURA','FUNCIONARIOS','NOME',combo.text,'VENDEDOR','CODIGO','ENCONTRAR_CODIGO',combo,frmSYSProcedures.DATASET);
DTMETAS.OPEN;
DTMETAS.Locate('CODPRODUTO',REGISTRO,[LOPARTIALKEY]);
end;
vEntrada := false;
end;

procedure TfrmCADMetas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key = vk_f2) and (btnpesq.Enabled = true) then btnpesqClick(self);
if key = vk_escape then close;
end;

procedure TfrmCADMetas.FormCreate(Sender: TObject);
begin
frmsysprocedures.ConstroiCombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combo); 
end;

procedure TfrmCADMetas.comboKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_return then SpeedButton2Click(self); 
end;

procedure TfrmCADMetas.FormShow(Sender: TObject);
begin
combo.SetFocus; 
end;

end.
