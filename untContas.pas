unit untContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibx.IbQuery, DB, ibx.IBCustomDataSet, StdCtrls, Mask, DBCtrls, Buttons,
  ComCtrls, ExtCtrls;

type
  TfrmCADContas = class(TForm)
    Shape4: TShape;
    Label22: TLabel;
    Label36: TLabel;
    Image3: TImage;
    pg: TPageControl;
    tab1: TTabSheet;
    Shape1: TShape;
    Image1: TImage;
    cmdnovo: TSpeedButton;
    cmdgravar: TSpeedButton;
    cmdcancelar: TSpeedButton;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    box: TGroupBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    tab2: TTabSheet;
    Shape2: TShape;
    Image2: TImage;
    cmdpesq: TSpeedButton;
    cmdalterar: TSpeedButton;
    cmdexcluir: TSpeedButton;
    cmdconfirmar: TSpeedButton;
    cmdcancelaralt: TSpeedButton;
    box2: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dtGrade: TIBDataSet;
    dsGrade: TDataSource;
    QRY: TIBQuery;
    dtGradeCODIGO: TIntegerField;
    dtGradeDESCRICAO: TIBStringField;
    procedure cmdnovoClick(Sender: TObject);
    procedure cmdgravarClick(Sender: TObject);
    procedure cmdcancelarClick(Sender: TObject);
    procedure cmdpesqClick(Sender: TObject);
    procedure cmdalterarClick(Sender: TObject);
    procedure cmdexcluirClick(Sender: TObject);
    procedure cmdconfirmarClick(Sender: TObject);
    procedure cmdcancelaraltClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADContas: TfrmCADContas;

implementation

uses untProcedures, untDM, uPesquisar;

{$R *.dfm}

procedure TfrmCADContas.cmdnovoClick(Sender: TObject);
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

procedure TfrmCADContas.cmdgravarClick(Sender: TObject);
begin
if dbedit2.text = '' then
 begin
  messagedlg('Digite a DESCRIÇÃO!',mterror,[mbok],0);
  dbedit2.setfocus;
  exit;
 end;


dtgrade.FieldByName('codigo').value := frmsysprocedures.max('contas');
dtgrade.Post;
dtgrade.Close;
dm.transacao.commit;

box.Enabled         :=false;
cmdgravar.Enabled   :=false;
cmdnovo.enabled     :=true;
cmdcancelar.Enabled :=false;
cmdalterar.Enabled  :=true;
cmdexcluir.Enabled  :=true;
end;

procedure TfrmCADContas.cmdcancelarClick(Sender: TObject);
begin
dtgrade.Cancel;
dtgrade.close;
cmdgravar.Enabled    :=false;
cmdnovo.enabled      :=true;
cmdcancelar.Enabled  :=false;
box.Enabled          :=false;
end;

procedure TfrmCADContas.cmdpesqClick(Sender: TObject);
begin
cmdalterar.Enabled :=false;
cmdexcluir.Enabled :=false;

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
        with frmCADContas do
         begin
          dtgrade.close;
          dtgrade.parambyname('pcod').value:= valor;
          dtgrade.Open;
          cmdalterar.enabled:=true;
          cmdexcluir.enabled:=true;
         end;
     end;
  end;
end;

procedure TfrmCADContas.cmdalterarClick(Sender: TObject);
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

procedure TfrmCADContas.cmdexcluirClick(Sender: TObject);
begin
 if messagedlg('Tem certeza que deseja excluir a conta: '+TRIM(dtgrade.fieldbyname('descricao').Value)+'? Essa operação irá excluir todos os lançamentos dessa conta!',mtinformation,[mbyes,mbno],0)=mryes then
  begin
   dtgrade.Delete;
   dtgrade.Close;
   cmdalterar.Enabled    :=false;
   cmdexcluir.Enabled    :=false;
   box2.Enabled :=false;
   dm.TRANSACAO.Commit;
  end;
end;

procedure TfrmCADContas.cmdconfirmarClick(Sender: TObject);
begin
if dbedit1.text = '' then
 begin
  messagedlg('Digite a DESCRIÇÃO!',mterror,[mbok],0);
  dbedit1.setfocus;
  exit;
 end;

dtgrade.applyupdates;
dtgrade.close;
dm.transacao.commit;

cmdconfirmar.enabled   :=false;
cmdcancelaralt.Enabled :=false;
cmdpesq.Enabled        :=true;
cmdexcluir.Enabled     :=false;
cmdalterar.Enabled     :=false;
box2.Enabled           :=false;
end;

procedure TfrmCADContas.cmdcancelaraltClick(Sender: TObject);
begin
dtgrade.Cancel;
dtgrade.close;
cmdcancelaralt.enabled :=false;
cmdalterar.Enabled     :=false;
cmdconfirmar.enabled   :=false;
cmdexcluir.Enabled     :=false;
cmdpesq.Enabled        :=true;
box2.Enabled           :=false;
end;

procedure TfrmCADContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

procedure TfrmCADContas.FormKeyPress(Sender: TObject; var Key: Char);
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
