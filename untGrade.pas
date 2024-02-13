unit untGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, StdCtrls, Mask, DBCtrls, ibx.IBCustomDataSet, ExtCtrls,
  Grids, DBGrids, ibx.IbQuery, ComCtrls;

type
  TfrmCADGrade = class(TForm)
    dtGrade: TIBDataSet;
    dsGrade: TDataSource;
    pg: TPageControl;
    tab1: TTabSheet;
    Shape1: TShape;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    box: TGroupBox;
    tab2: TTabSheet;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    dtGradeCODIGO: TIntegerField;
    dtGradeDESCRICAO: TIBStringField;
    dtGradeCODFORNECEDOR: TIBStringField;
    QRY: TIBQuery;
    Image1: TImage;
    cmdnovo: TSpeedButton;
    cmdgravar: TSpeedButton;
    cmdcancelar: TSpeedButton;
    Image2: TImage;
    cmdpesq: TSpeedButton;
    cmdalterar: TSpeedButton;
    cmdexcluir: TSpeedButton;
    cmdconfirmar: TSpeedButton;
    cmdcancelaralt: TSpeedButton;
    Shape4: TShape;
    Label22: TLabel;
    Label36: TLabel;
    Image3: TImage;
    Shape2: TShape;
    combofornecedor: TComboBox;
    box2: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    combofornecedor2: TComboBox;
    procedure cmdnovoClick(Sender: TObject);
    procedure cmdgravarClick(Sender: TObject);
    procedure cmdcancelarClick(Sender: TObject);
    procedure cmdconfirmarClick(Sender: TObject);
    procedure cmdexcluirClick(Sender: TObject);
    procedure cmdalterarClick(Sender: TObject);
    procedure dtGradeBeforeInsert(DataSet: TDataSet);
    procedure dtGradeAfterPost(DataSet: TDataSet);
    procedure dtGradeAfterCancel(DataSet: TDataSet);
    procedure dtGradeBeforeEdit(DataSet: TDataSet);
    procedure edtfornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure combofornecedor2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmdcancelaraltClick(Sender: TObject);
    procedure pgChange(Sender: TObject);
    procedure edtfornecEdor2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdpesqClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure combofornecedorExit(Sender: TObject);
    procedure combofornecedor2Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADGrade: TfrmCADGrade;

implementation

uses untDM, untMenu, untProcedures, uPesquisar;

{$R *.dfm}

procedure TfrmCADGrade.cmdnovoClick(Sender: TObject);
begin
dtgrade.open;
dtgrade.append;
box.Enabled         :=true;
cmdexcluir.Enabled  :=false;
cmdalterar.Enabled  :=false;
cmdgravar.Enabled   :=true;
cmdnovo.enabled     :=false;
cmdcancelar.Enabled :=true;
dbedit2.setfocus;
end;

procedure TfrmCADGrade.cmdgravarClick(Sender: TObject);
begin
if dbedit2.text = '' then
 begin
  messagedlg('Digite a DESCRIÇÃO!',mterror,[mbok],0);
  dbedit2.setfocus;
  exit;
 end;

if combofornecedor.text = '' then
 begin
  messagedlg('Digite o FORNECEDOR!',mterror,[mbok],0);
  combofornecedor.setfocus;
  exit;
 end;

with qry do
 begin
  close;
  sql.clear;
  sql.add('select * from fornecedores');
  sql.add('where forrazao = :prazao');
  parambyname('prazao').value := combofornecedor.Text;
  open;

  if eof then
   begin
    messagedlg('Fornecedor não cadastrado!',mterror,[mbok],0);
    combofornecedor.setfocus;
    exit;
   end;

 end;

dtgrade.FieldByName('codigo').value := frmsysprocedures.max('grade');
dtgrade.FieldByName('codfornecedor').value := qry.fieldbyname('forcodforn').value;
dtgrade.Post;
dtgrade.Close;
dm.transacao.commit;

combofornecedor.text:='';
box.Enabled         :=false;
cmdgravar.Enabled   :=false;
cmdnovo.enabled     :=true;
cmdcancelar.Enabled :=false;
cmdalterar.Enabled  :=true;
cmdexcluir.Enabled  :=true;
end;

procedure TfrmCADGrade.cmdcancelarClick(Sender: TObject);
begin
dtgrade.Cancel;
dtgrade.close;
combofornecedor.text :='';
cmdgravar.Enabled    :=false;
cmdnovo.enabled      :=true;
cmdcancelar.Enabled  :=false;
box.Enabled          :=false;
end;

procedure TfrmCADGrade.cmdconfirmarClick(Sender: TObject);
begin
if dbedit1.text = '' then
 begin
  messagedlg('Digite a DESCRIÇÃO!',mterror,[mbok],0);
  dbedit1.setfocus;
  exit;
 end;

if combofornecedor2.text = '' then
 begin
  messagedlg('Digite o FORNECEDOR!',mterror,[mbok],0);
  combofornecedor2.setfocus;
  exit;
 end;

with qry do
 begin
  close;
  sql.clear;
  sql.add('select * from fornecedores');
  sql.add('where forrazao = :prazao');
  parambyname('prazao').value := combofornecedor2.Text;
  open;

  if eof then
   begin
    messagedlg('Fornecedor não cadastrado!',mterror,[mbok],0);
    combofornecedor2.setfocus;
    exit;
   end;

 end;

dtgrade.FieldByName('codfornecedor').value := qry.fieldbyname('forcodforn').value;

dtgrade.applyupdates;
dtgrade.close;
dm.transacao.commit;

cmdconfirmar.enabled   :=false;
cmdcancelaralt.Enabled :=false;
cmdpesq.Enabled        :=true;
cmdexcluir.Enabled     :=false;
cmdalterar.Enabled     :=false;
box2.Enabled           :=false;
combofornecedor2.Text  := '';
end;

procedure TfrmCADGrade.cmdexcluirClick(Sender: TObject);
begin
 if messagedlg('Tem certeza que deseja excluir a grade '+TRIM(dtgrade.fieldbyname('descricao').Value)+'? Essa operação irá excluir todos os produtos desta grade,inclusive os incluídos em pedidos!',mtinformation,[mbyes,mbno],0)=mryes then
  begin
   dtgrade.Delete;
   dtgrade.Close;
   cmdalterar.Enabled    :=false;
   cmdexcluir.Enabled    :=false;
   combofornecedor2.text :='';
   box2.Enabled :=false;
   dm.TRANSACAO.Commit;
  end;

end;

procedure TfrmCADGrade.cmdalterarClick(Sender: TObject);
begin
cmdpesq.Enabled        := false;
box2.Enabled           := true;
cmdcancelaralt.Enabled := true;
cmdexcluir.Enabled     := false;
cmdalterar.Enabled     := false;
cmdconfirmar.Enabled   := true;
dtgrade.Edit;
dbedit1.setfocus;
end;

procedure TfrmCADGrade.dtGradeBeforeInsert(DataSet: TDataSet);
begin
cmdexcluir.Enabled :=false;
cmdalterar.Enabled :=false;
cmdgravar.Enabled :=true;
cmdnovo.enabled:=false;
cmdcancelar.Enabled :=true;
end;

procedure TfrmCADGrade.dtGradeAfterPost(DataSet: TDataSet);
begin
cmdgravar.Enabled :=false;
cmdnovo.enabled:=true;
cmdcancelar.Enabled :=false;
cmdalterar.Enabled :=true;
cmdexcluir.Enabled :=true;
end;

procedure TfrmCADGrade.dtGradeAfterCancel(DataSet: TDataSet);
begin
cmdalterar.Enabled :=true;
cmdexcluir.Enabled :=true;
cmdconfirmar.enabled:=false;
cmdgravar.Enabled :=false;
cmdnovo.enabled:=true;
cmdcancelar.Enabled :=false;
end;

procedure TfrmCADGrade.dtGradeBeforeEdit(DataSet: TDataSet);
begin
cmdcancelar.Enabled :=true;
cmdexcluir.Enabled :=false;
cmdnovo.Enabled :=false;
cmdconfirmar.Enabled :=true;
end;

procedure TfrmCADGrade.edtfornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = vk_down then combofornecedor.SetFocus;
end;

procedure TfrmCADGrade.combofornecedor2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = vk_down then combofornecedor.SetFocus;
end;

procedure TfrmCADGrade.cmdcancelaraltClick(Sender: TObject);
begin
dtgrade.Cancel;
dtgrade.close;
cmdcancelaralt.enabled :=false;
cmdalterar.Enabled     :=false;
cmdconfirmar.enabled   :=false;
cmdexcluir.Enabled     :=false;
cmdpesq.Enabled        :=true;
box2.Enabled           :=false;
combofornecedor2.text  :='';
end;

procedure TfrmCADGrade.pgChange(Sender: TObject);
begin
dtgrade.close;
end;

procedure TfrmCADGrade.edtfornecEdor2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = vk_down then combofornecedor2.SetFocus;
end;

procedure TfrmCADGrade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if cmdnovo.Enabled = false then
 begin
  canclose:=false;
  messagedlg('Antes de fechar é necessário finalizar a operação clicando em Cancelar ou Gravar',mterror,[mbok],0);
 end;

if ((cmdalterar.Enabled = false) and (cmdcancelaralt.enabled = true)) then
 begin
  canclose:=false;
  messagedlg('Antes de fechar é necessário finalizar a operação clicando em Cancelar ou Confirmar alteração',mterror,[mbok],0);
 end;
end;

procedure TfrmCADGrade.FormCreate(Sender: TObject);
begin
frmsysprocedures.ConstroiCombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
frmsysprocedures.ConstroiCombo('select * from fornecedores order by forrazao','forrazao',combofornecedor2);
end;

procedure TfrmCADGrade.FormShow(Sender: TObject);
begin
pg.ActivePage := tab1;
end;

procedure TfrmCADGrade.cmdpesqClick(Sender: TObject);
begin
cmdalterar.Enabled :=false;
cmdexcluir.Enabled :=false;

 with frmSYSPesquisar do
  begin
    bancodedados := 'grade';
    Titulo := 'Localizar Linha de Produtos';
    Campos := 'codigo,descricao';
    GridTitulo := 'Código,Descrição';
    GridTamanho := '4,40';
    PesqSize := '500';
    NoAutoUpdate := true;
    showmodal;
    if retorno then
     begin
        with frmCADGrade do
         begin
          dtgrade.close;
          dtgrade.parambyname('pcod').value:= valor;
          dtgrade.Open;
          cmdalterar.enabled:=true;
          cmdexcluir.enabled:=true;
          qry.close;
          qry.SQL.clear;
          qry.sql.add('select * from fornecedores');
          qry.sql.add('where forcodforn = :pcod');
          qry.ParamByName('pcod').value := dtgrade.fieldbyname('codfornecedor').value;
          qry.open;
          combofornecedor2.text := qry.fieldbyname('forrazao').value;
         end;
     end;
  end;
end;

procedure TfrmCADGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

procedure TfrmCADGrade.combofornecedorExit(Sender: TObject);
begin
dbedit2.SetFocus; 
end;

procedure TfrmCADGrade.combofornecedor2Exit(Sender: TObject);
begin
dbedit1.SetFocus;
end;

procedure TfrmCADGrade.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key= '\' then key:=#0;   
if key= '/' then key:=#0;
if key= ';' then key:=#0;
if key= '[' then key:=#0;
if key= ']' then key:=#0;
if key= '~' then key:=#0;
if key= '.' then key:=#0;
if key= '´' then key:=#0;
if key= 'á' then key:='a';
if key= 'é' then key:='e';
if key= 'í' then key:='i';
if key= 'ó' then key:='o';
if key= 'ú' then key:='u';
if key= 'à' then key:='a';
if key= 'è' then key:='e';
if key= 'ì' then key:='i';
if key= 'ò' then key:='o';
if key= 'ù' then key:='u';
if key= 'â' then key:='a';
if key= 'ê' then key:='e';
if key= 'î' then key:='i';
if key= 'ô' then key:='o';
if key= 'û' then key:='u';
if key= 'ä' then key:='a';
if key= 'ë' then key:='e';
if key= 'ï' then key:='i';
if key= 'ö' then key:='o';
if key= 'ü' then key:='u';
if key= 'ã' then key:='a';
if key= 'ã' then key:='a';
if key= 'õ' then key:='o';
if key= 'ñ' then key:='n';
if key= 'ç' then key:='c';
if key= 'Á' then key:='A';
if key= 'É' then key:='E';
if key= 'Í' then key:='I';
if key= 'Ó' then key:='O';
if key= 'Ú' then key:='U';
if key= 'À' then key:='A';
if key= 'È' then key:='E';
if key= 'Ì' then key:='I';
if key= 'Ò' then key:='O';
if key= 'Ù' then key:='U';
if key= 'Â' then key:='A';
if key= 'Ê' then key:='E';
if key= 'Î' then key:='I';
if key= 'Ô' then key:='O';
if key= 'Ä' then key:='A';
if key= 'Ë' then key:='E';
if key= 'Ï' then key:='I';
if key= 'Ö' then key:='O';
if key= 'Ñ' then key:='N';
if key= 'Ç' then key:='C';

end;

end.
