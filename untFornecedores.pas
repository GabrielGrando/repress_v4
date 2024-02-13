unit untFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBTables, ComCtrls, Grids, DBGrids, StdCtrls, Mask,
  DBCtrls, Buttons, ExtCtrls, ibx.IBCustomDataSet, ibx.IBQuery;

type
  TfrmCADFornecedores = class(TForm)
    dsFornecedores: TDataSource;
    pg: TPageControl;
    tab1: TTabSheet;
    Shape1: TShape;
    tab2: TTabSheet;
    Shape4: TShape;
    box2: TGroupBox;
    Label17: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    DBEdit17: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit6: TDBEdit;
    memoobs: TMemo;
    DBEdit7: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    DBEdit23: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    Image1: TImage;
    cmdpesq: TSpeedButton;
    cmdalterar: TSpeedButton;
    cmdexcluir: TSpeedButton;
    cmdConfirmar: TSpeedButton;
    cmdcancelaraltera: TSpeedButton;
    Image2: TImage;
    cmdnovo: TSpeedButton;
    cmdgravar: TSpeedButton;
    cmdcancelar: TSpeedButton;
    Shape2: TShape;
    Label8: TLabel;
    Image3: TImage;
    Label41: TLabel;
    box: TGroupBox;
    Label11: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    memoalt: TMemo;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    GroupBox3: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label37: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit34: TDBEdit;
    dtFornecedor: TIBDataSet;
    query: TIBQuery;
    dtFornecedorFORCODFORN: TIBStringField;
    dtFornecedorFORDATACAD: TDateTimeField;
    dtFornecedorFORRAZAO: TIBStringField;
    dtFornecedorFORENDERECO: TIBStringField;
    dtFornecedorFORBAIRRO: TIBStringField;
    dtFornecedorFORCIDADE: TIBStringField;
    dtFornecedorFORUF: TIBStringField;
    dtFornecedorFORCEP: TIBStringField;
    dtFornecedorFORCGC: TIBStringField;
    dtFornecedorFORINSC: TIBStringField;
    dtFornecedorFORTEL: TIBStringField;
    dtFornecedorFORFAX: TIBStringField;
    dtFornecedorFORCONTATO: TIBStringField;
    dtFornecedorFOROBS: TIBStringField;
    dtFornecedorCONTA: TIBStringField;
    dtFornecedorAGENCIA: TIBStringField;
    dtFornecedorBANCO: TIBStringField;
    dtFornecedorCIDADE: TIBStringField;
    dtFornecedorUF: TIBStringField;
    dtFornecedorTELEFONE: TIBStringField;
    dtFornecedorCODIGO: TIntegerField;
    procedure cmdnovoClick(Sender: TObject);
    procedure cmdgravarClick(Sender: TObject);
    procedure cmdcancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmdConfirmarClick(Sender: TObject);
    procedure cmdpesqClick(Sender: TObject);
    procedure pgChange(Sender: TObject);
    procedure cmdalterarClick(Sender: TObject);
    procedure cmdcancelaralteraClick(Sender: TObject);
    procedure cmdexcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure memoobsExit(Sender: TObject);
    procedure MemoaltExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADFornecedores: TfrmCADFornecedores;
  vOk:string;

implementation

uses untDM, untMenu, uPesquisar, untProcedures;

{$R *.dfm}

procedure TfrmCADFornecedores.cmdnovoClick(Sender: TObject);
begin
box2.Enabled        :=true;
cmdcancelar.enabled :=true;
cmdgravar.enabled   :=true;
cmdnovo.Enabled     :=false;
tab2.tabvisible     :=false;
dbedit17.setfocus;
dtfornecedor.open;
dtfornecedor.append;
end;

procedure TfrmCADFornecedores.cmdgravarClick(Sender: TObject);
begin

if dbedit17.Text = '' then
 begin
  messagedlg('Digite a RAZ�O SOCIAL!',mterror,[mbok],0);
  dbedit17.setfocus;
  exit;
 end;

if dbedit6.Text = '' then
 begin
  messagedlg('Digite o CNPJ!',mterror,[mbok],0);
  dbedit6.setfocus;
  exit;
 end;

if dbedit7.Text = '' then
 begin
  messagedlg('Digite a INSC. ESTADUAL!',mterror,[mbok],0);
  dbedit7.setfocus;
  exit;
 end;

if dbedit1.Text = '' then
 begin
  messagedlg('Digite o ENDERE�O!',mterror,[mbok],0);
  dbedit1.setfocus;
  exit;
 end;

dtfornecedor.FieldByName('fordatacad').Value :=now;
dtfornecedor.FieldByName('forobs').Value     :=memoobs.Text;

query.close;
query.SQL.clear;
query.sql.add('select max(CODIGO) from fornecedores');
query.open;

if query.Eof then
 begin
  dtfornecedor.fieldbyname('CODIGO').value := 1
 end else begin
  dtfornecedor.fieldbyname('forcodforn').value := query.fieldbyname('max').value +1;
  dtfornecedor.fieldbyname('CODIGO').value     := query.fieldbyname('max').value +1;
 end;

query.close;
query.SQL.clear;
query.sql.add('update transportadoras set codfornecedor = :pcod');
query.ParamByName('pcod').Value :=dtfornecedor.fieldbyname('forcodforn').value;
query.open;

dtfornecedor.Post;
dtfornecedor.Close;


dm.transacao.commit;

box2.Enabled        := false;
TAb2.TabVisible     := true;
cmdgravar.Enabled   := false;
cmdnovo.Enabled     := true;
cmdcancelar.Enabled := false;
memoobs.Text        := '';
end;

procedure TfrmCADFornecedores.cmdcancelarClick(Sender: TObject);
begin
box2.Enabled        :=false;
cmdgravar.Enabled   :=false;
cmdcancelar.Enabled :=false;
cmdnovo.Enabled     :=true;
tab2.TabVisible     :=true;
memoobs.Text        :='';
dtfornecedor.Cancel;
dtfornecedor.Close;
tab1.SetFocus;
end;

procedure TfrmCADFornecedores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if cmdnovo.Enabled = false then
 begin
  canclose:=false;
  messagedlg('Antes de fechar � necess�rio finalizar a opera��o clicando em Cancelar ou Gravar',mterror,[mbok],0);
 end;

if ((cmdalterar.Enabled = false) and (cmdcancelaraltera.enabled = true)) then
 begin
  canclose:=false;
  messagedlg('Antes de fechar � necess�rio finalizar a opera��o clicando em Cancelar ou Confirmar altera��o',mterror,[mbok],0);
 end;
end;

procedure TfrmCADFornecedores.cmdConfirmarClick(Sender: TObject);
begin

dtfornecedor.FieldByName('forobs').Value :=memoalt.text;
dtfornecedor.applyupdates;
dtfornecedor.close;
dm.TRANSACAO.Commit;

box.Enabled               :=false;
cmdConfirmar.Enabled      :=false;
cmdcancelaraltera.Enabled :=false;
cmdalterar.Enabled        :=false;
cmdpesq.enabled           :=true;
tab1.TabVisible           :=true;
memoalt.text              :='';
end;

procedure TfrmCADFornecedores.cmdpesqClick(Sender: TObject);
begin
cmdalterar.Enabled :=false;
cmdexcluir.Enabled :=false;

 with frmSYSPesquisar do
  begin
    bancodedados := 'fornecedores';
    Titulo := 'Localizar Fornecedor';
    Campos := 'forcodforn,forrazao,forcgc,forinsc';
    GridTitulo := 'C�digo,Raz�o Social,CNPJ,Insc. Estadual';
    GridTamanho := '4,40';
    PesqSize := '500';
    NoAutoUpdate := true;
    showmodal;
    if retorno then
     begin
       with frmCADfornecedores do
         begin
          cmdalterar.enabled:=true;
          cmdexcluir.enabled:=true;
          dtfornecedor.close;
          dtfornecedor.ParamByName('pcod').value := valor;
          dtfornecedor.Open;
          if (dtfornecedor.fieldbyname('forobs').value <> '') and (dtfornecedor.fieldbyname('forobs').value <> null)  then memoalt.Text := dtfornecedor.Fieldbyname('forobs').value;
        end;
     end;
  end;

end;

procedure TfrmCADFornecedores.pgChange(Sender: TObject);
begin
dtfornecedor.Close;
memoalt.Text       :='';
cmdexcluir.enabled :=false;
cmdalterar.Enabled :=false;
end;

procedure TfrmCADFornecedores.cmdalterarClick(Sender: TObject);
begin
box.Enabled               :=true;
tab1.TabVisible           :=false;
cmdpesq.Enabled           :=false;
cmdalterar.enabled        :=false;
cmdConfirmar.enabled      :=true;
cmdcancelaraltera.enabled :=true;
CMDEXCLUIR.Enabled        :=false;
dbedit8.SetFocus;
dtfornecedor.Edit;
end;

procedure TfrmCADFornecedores.cmdcancelaralteraClick(Sender: TObject);
begin
box.Enabled               :=false;
cmdConfirmar.enabled      :=false;
cmdcancelaraltera.enabled :=false;
cmdalterar.enabled        :=false;
cmdpesq.enabled           :=true;
memoalt.text              := '';
tab1.TabVisible           :=true;
dtfornecedor.Cancel;
dtfornecedor.close;
end;

procedure TfrmCADFornecedores.cmdexcluirClick(Sender: TObject);
begin
 if messagedlg('Tem certeza que deseja excluir o fornecedor '+TRIM(dtfornecedor.fieldbyname('forrazao').Value)+'?',mtinformation,[mbyes,mbno],0)=mryes then
  begin
   dtfornecedor.Delete;
   DM.TRANSACAO.COMMIT;
   cmdalterar.enabled:=false;
   cmdexcluir.enabled:=false;
   memoalt.Text :='';
  end;
end;

procedure TfrmCADFornecedores.FormShow(Sender: TObject);
begin
dtfornecedor.Close;
pg.ActivePage      :=tab1;
end;

procedure TfrmCADFornecedores.memoobsExit(Sender: TObject);
begin
dbedit17.SetFocus;
end;

procedure TfrmCADFornecedores.MemoaltExit(Sender: TObject);
begin
dbedit8.setfocus;
end;

procedure TfrmCADFornecedores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF KEY = VK_ESCAPE THEN CLOSE;
end;

procedure TfrmCADFornecedores.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key= '\' then key:=#0;   
if key= '/' then key:=#0;
if key= ';' then key:=#0;
if key= '[' then key:=#0;
if key= ']' then key:=#0;
if key= '~' then key:=#0;
if key= '.' then key:=#0;
if key= '�' then key:=#0;
if key= '�' then key:='a';
if key= '�' then key:='e';
if key= '�' then key:='i';
if key= '�' then key:='o';
if key= '�' then key:='u';
if key= '�' then key:='a';
if key= '�' then key:='e';
if key= '�' then key:='i';
if key= '�' then key:='o';
if key= '�' then key:='u';
if key= '�' then key:='a';
if key= '�' then key:='e';
if key= '�' then key:='i';
if key= '�' then key:='o';
if key= '�' then key:='u';
if key= '�' then key:='a';
if key= '�' then key:='e';
if key= '�' then key:='i';
if key= '�' then key:='o';
if key= '�' then key:='u';
if key= '�' then key:='a';
if key= '�' then key:='a';
if key= '�' then key:='o';
if key= '�' then key:='n';
if key= '�' then key:='c';
if key= '�' then key:='A';
if key= '�' then key:='E';
if key= '�' then key:='I';
if key= '�' then key:='O';
if key= '�' then key:='U';
if key= '�' then key:='A';
if key= '�' then key:='E';
if key= '�' then key:='I';
if key= '�' then key:='O';
if key= '�' then key:='U';
if key= '�' then key:='A';
if key= '�' then key:='E';
if key= '�' then key:='I';
if key= '�' then key:='O';
if key= '�' then key:='A';
if key= '�' then key:='E';
if key= '�' then key:='I';
if key= '�' then key:='O';
if key= '�' then key:='N';
if key= '�' then key:='C';

end;

end.
