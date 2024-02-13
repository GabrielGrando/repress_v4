unit untFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, ibx.IBCustomDataSet, ExtCtrls, Buttons,
  ComCtrls, ibx.IBQuery;

type
  TfrmCADFuncionarios = class(TForm)
    pg: TPageControl;
    tab1: TTabSheet;
    tab2: TTabSheet;
    dtFuncionarios: TIBDataSet;
    dtFuncionariosCODIGO: TIBStringField;
    dtFuncionariosNOME: TIBStringField;
    dtFuncionariosENDERECO: TIBStringField;
    dtFuncionariosBAIRRO: TIBStringField;
    dtFuncionariosCIDADE: TIBStringField;
    dtFuncionariosUF: TIBStringField;
    dtFuncionariosRG: TIBStringField;
    dtFuncionariosCPF: TIBStringField;
    dtFuncionariosTELEFONE: TIBStringField;
    dtFuncionariosCELULAR: TIBStringField;
    dtFuncionariosFUNCAO: TIBStringField;
    dsFuncionarios: TDataSource;
    Shape1: TShape;
    box2: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit13: TDBEdit;
    GroupBox2: TGroupBox;
    rvendedor: TRadioButton;
    rdegustador: TRadioButton;
    rpromotor: TRadioButton;
    radmin: TRadioButton;
    Image2: TImage;
    cmdpesq: TSpeedButton;
    cmdalterar: TSpeedButton;
    cmdexcluir: TSpeedButton;
    cmdConfirmar: TSpeedButton;
    cmdcancelaralt: TSpeedButton;
    Image1: TImage;
    cmdnovo: TSpeedButton;
    cmdgravar: TSpeedButton;
    cmdcancelar: TSpeedButton;
    Shape2: TShape;
    Label8: TLabel;
    Image3: TImage;
    Label36: TLabel;
    Shape3: TShape;
    box: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    GroupBox3: TGroupBox;
    rvendedor2: TRadioButton;
    rdegustador2: TRadioButton;
    rpromotor2: TRadioButton;
    radmin2: TRadioButton;
    QUERY: TIBQuery;
    procedure cmdgravarClick(Sender: TObject);
    procedure cmdnovoClick(Sender: TObject);
    procedure cmdcancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pgChange(Sender: TObject);
    procedure cmdConfirmarClick(Sender: TObject);
    procedure cmdalterarClick(Sender: TObject);
    procedure cmdexcluirClick(Sender: TObject);
    procedure cmdcancelaraltClick(Sender: TObject);
    procedure cmdpesqClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GroupBox3Exit(Sender: TObject);
    procedure GroupBox2Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADFuncionarios: TfrmCADFuncionarios;
  vok:string;
implementation

uses untDM, untMenu,  uPesquisar, untProcedures;

{$R *.dfm}

procedure TfrmCADFuncionarios.cmdgravarClick(Sender: TObject);
begin
if dbedit13.Text = '' then
 begin
  messagedlg('Digite o NOME COMPLETO!',mterror,[mbok],0);
  dbedit13.SetFocus;
  exit;
 end;

if dbedit18.Text = '' then
 begin
  messagedlg('Digite o RG!',mterror,[mbok],0);
  dbedit18.SetFocus;
  exit;
 end;

if dbedit19.Text = '' then
 begin
  messagedlg('Digite o CPF!',mterror,[mbok],0);
  dbedit19.SetFocus;
  exit;
 end;

if dbedit14.Text = '' then
 begin
  MESSAGEDLG('Digite o ENDEREÇO!',mterror,[mbok],0);
  dbedit14.SetFocus;
  exit;
 end;

if dbedit15.Text = '' then
 begin
  messagedlg('Digite o BAIRRO!',mterror,[mbok],0);
  dbedit15.SetFocus;
  exit;
 end;

if dbedit16.Text = '' then
 begin
  messagedlg('Digite a CIDADE!',mterror,[mbok],0);
  dbedit16.SetFocus;
  exit;
 end;

if dbedit17.Text = '' then
 begin
  messagedlg('Digite o UF!',mterror,[mbok],0);
  dbedit17.SetFocus;
  exit;
 end;

if rvendedor.Checked    = true then dtfuncionarios.FieldByName('funcao').value := 'VENDEDOR';
if rdegustador.Checked  = true then dtfuncionarios.FieldByName('funcao').value := 'DEGUSTADOR';
if rpromotor.Checked    = true then dtfuncionarios.FieldByName('funcao').value := 'PROMOTOR';
if radmin.Checked       = true then dtfuncionarios.FieldByName('funcao').value := 'ADMINISTRATIVA';

query.close;
query.SQL.clear;
query.sql.add('select * from transportadoras');
query.open;
dtfuncionarios.FieldByName('codigo').value := QUERY.FIELDBYNAME('CODFUNCIONARIO').VALUE + 1;

query.close;
query.SQL.clear;
query.sql.add('update transportadoras set codFUNCIONARIO = :pcod');
query.ParamByName('pcod').Value :=dtfuncionarios.FieldByName('codigo').value;
query.open;

dtfuncionarios.Post;
dtfuncionarios.Close;
dm.transacao.commit;

groupbox2.Enabled   := false;
box2.enabled        := false;
tab2.TabVisible     := true;
cmdgravar.Enabled   := false;
cmdnovo.Enabled     := true;
cmdcancelar.Enabled := false;
tab1.SetFocus;
end;

procedure TfrmCADFuncionarios.cmdnovoClick(Sender: TObject);
begin
dtFuncionarios.open;
dtfuncionarios.append;
box2.enabled        := true;
groupbox2.Enabled   := true;
cmdcancelar.enabled := true;
cmdgravar.enabled   := true;
cmdnovo.Enabled     := false;
tab2.tabvisible     := false;
dbedit13.setfocus;
end;

procedure TfrmCADFuncionarios.cmdcancelarClick(Sender: TObject);
begin
dtfuncionarios.Cancel;
dtfuncionarios.Close;
box2.Enabled        := false;
groupbox2.Enabled   := false;
cmdgravar.Enabled   := false;
cmdcancelar.Enabled := false;
cmdnovo.Enabled     := true;
tab2.TabVisible     := true;
tab1.SetFocus;
end;

procedure TfrmCADFuncionarios.FormShow(Sender: TObject);
begin
pg.ActivePage:=tab1;
end;

procedure TfrmCADFuncionarios.FormCloseQuery(Sender: TObject;
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

procedure TfrmCADFuncionarios.pgChange(Sender: TObject);
begin
dtfuncionarios.close;
end;

procedure TfrmCADFuncionarios.cmdConfirmarClick(Sender: TObject);
begin

if dbedit9.Text = '' then
 begin
  messagedlg('Digite o NOME COMPLETO!',mterror,[mbok],0);
  dbedit9.SetFocus;
  exit;
 end;

if dbedit4.Text = '' then
 begin
  messagedlg('Digite o RG!',mterror,[mbok],0);
  dbedit4.SetFocus;
  exit;
 end;

if dbedit3.Text = '' then
 begin
  messagedlg('Digite o CPF!',mterror,[mbok],0);
  dbedit3.SetFocus;
  exit;
 end;

if dbedit8.Text = '' then
 begin
  MESSAGEDLG('Digite o ENDEREÇO!',mterror,[mbok],0);
  dbedit8.SetFocus;
  exit;
 end;

if dbedit5.Text = '' then
 begin
  messagedlg('Digite o BAIRRO!',mterror,[mbok],0);
  dbedit5.SetFocus;
  exit;
 end;

if dbedit6.Text = '' then
 begin
  messagedlg('Digite a CIDADE!',mterror,[mbok],0);
  dbedit6.SetFocus;
  exit;
 end;

if dbedit7.Text = '' then
 begin
  messagedlg('Digite o UF!',mterror,[mbok],0);
  dbedit7.SetFocus;
  exit;
 end;

if rvendedor2.Checked   = true then dtfuncionarios.fieldbyname('funcao').value := 'VENDEDOR';
if rdegustador2.Checked = true then dtfuncionarios.fieldbyname('funcao').value  := 'DEGUSTADOR';
if rpromotor2.Checked   = true then dtfuncionarios.fieldbyname('funcao').value  := 'PROMOTOR';
if radmin2.Checked      = true then dtfuncionarios.fieldbyname('funcao').value  := 'ADMINISTRATIVA';

dtfuncionarios.ApplyUpdates;
dtfuncionarios.close;
dm.TRANSACAO.Commit;

cmdconfirmar.Enabled   :=false;
cmdcancelaralt.Enabled :=false;
cmdalterar.Enabled     :=false;
cmdpesq.enabled        :=true;
tab1.TabVisible        :=true;
end;

procedure TfrmCADFuncionarios.cmdalterarClick(Sender: TObject);
begin
dtfuncionarios.Edit;
box.Enabled            :=true;
groupbox3.Enabled      :=true;
tab1.TabVisible        :=false;
cmdpesq.Enabled        :=false;
cmdalterar.enabled     :=false;
cmdconfirmar.enabled   :=true;
cmdcancelaralt.enabled :=true;
CMDEXCLUIR.Enabled     :=false;
dbedit9.SetFocus;
end;

procedure TfrmCADFuncionarios.cmdexcluirClick(Sender: TObject);
begin
 if messagedlg('Tem certeza que deseja excluir o funcionário '+TRIM(dtfuncionarios.fieldbyname('nome').Value)+'?',mtinformation,[mbyes,mbno],0)=mryes then
  begin
   dtfuncionarios.Delete;
   dtfuncionarios.Close;
   dm.transacao.commit;
   cmdalterar.enabled:=false;
   cmdexcluir.enabled:=false;
  end;
end;

procedure TfrmCADFuncionarios.cmdcancelaraltClick(Sender: TObject);
begin
dtFuncionarios.Cancel;
dtFuncionarios.close;
box.Enabled            :=false;
groupbox3.Enabled      :=false;
cmdconfirmar.enabled   :=false;
cmdcancelaralt.enabled :=false;
cmdalterar.enabled     :=false;
cmdpesq.enabled        :=true;
tab1.TabVisible        :=true;
end;

procedure TfrmCADFuncionarios.cmdpesqClick(Sender: TObject);
begin
cmdalterar.Enabled :=false;
cmdexcluir.Enabled :=false;

 with frmSYSPesquisar do
  begin
    bancodedados := 'funcionarios';
    Titulo := 'Localizar Funcionário';
    Campos := 'codigo,nome,funcao,rg';
    GridTitulo := 'Código,Nome,Função,RG';
    GridTamanho := '4,40';
    PesqSize := '500';
    NoAutoUpdate := true;
    showmodal;
    if retorno then
     begin
      with frmCADfuncionarios do
       begin
        dtfuncionarios.close;
        dtfuncionarios.parambyname('pcod').value:=valor;
        dtfuncionarios.open;
        cmdalterar.enabled:=true;
        cmdexcluir.Enabled :=true;
        if dtfuncionarios.fieldbyname('funcao').value = 'VENDEDOR'       then rvendedor2.checked   := true;
        if dtfuncionarios.fieldbyname('funcao').value = 'PROMOTOR'       then rpromotor2.checked   := true;
        if dtfuncionarios.fieldbyname('funcao').value = 'DEGUSTADOR'     then rdegustador2.checked := true;
        if dtfuncionarios.fieldbyname('funcao').value = 'ADMINISTRATIVA' then radmin2.checked      := true;
       end;
     end;
  end;

end;

procedure TfrmCADFuncionarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

procedure TfrmCADFuncionarios.GroupBox3Exit(Sender: TObject);
begin
dbedit9.setfocus;
end;

procedure TfrmCADFuncionarios.GroupBox2Exit(Sender: TObject);
begin
dbedit13.setfocus;
end;

procedure TfrmCADFuncionarios.FormKeyPress(Sender: TObject; var Key: Char);
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

