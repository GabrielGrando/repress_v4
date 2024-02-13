unit untUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, ibx.IBCustomDataSet, Buttons, ComCtrls,
  ExtCtrls, jpeg;

type
  TfrmCADUsuarios = class(TForm)
    Shape1: TShape;
    Label8: TLabel;
    Image1: TImage;
    Label9: TLabel;
    pg: TPageControl;
    tabnovo: TTabSheet;
    Image2: TImage;
    cmdnovo: TSpeedButton;
    cmdgravar: TSpeedButton;
    cmdcancelar: TSpeedButton;
    Shape2: TShape;
    tabalt: TTabSheet;
    Shape3: TShape;
    Image3: TImage;
    cmdPesquisar: TSpeedButton;
    cmdAlterar: TSpeedButton;
    cmdExcluir: TSpeedButton;
    cmdConfirmar: TSpeedButton;
    cmdCancelarAlt: TSpeedButton;
    dtUsuarios: TIBDataSet;
    dtUsuariosLGNNOMEUSUARIO: TIBStringField;
    dtUsuariosLGNIDUSUARIO: TIBStringField;
    dtUsuariosLGNSENHA: TIBStringField;
    dsUsuarios: TDataSource;
    boxnovo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    edtconfirmar1: TEdit;
    boxalterar: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    edtconfirmar2: TEdit;
    procedure cmdnovoClick(Sender: TObject);
    procedure cmdgravarClick(Sender: TObject);
    procedure cmdcancelarClick(Sender: TObject);
    procedure cmdPesquisarClick(Sender: TObject);
    procedure cmdAlterarClick(Sender: TObject);
    procedure cmdExcluirClick(Sender: TObject);
    procedure cmdConfirmarClick(Sender: TObject);
    procedure cmdCancelarAltClick(Sender: TObject);
    procedure pgChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtconfirmar2Exit(Sender: TObject);
    procedure edtconfirmar1Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADUsuarios: TfrmCADUsuarios;
  vCampo:string;

implementation

uses untProcedures, uPesquisar, untMenu, untLogin;

{$R *.dfm}

procedure TfrmCADUsuarios.cmdnovoClick(Sender: TObject);
begin
frmSYSProcedures.Cadastro('NOVO',dtUsuarios,dbedit1,tabalt,boxnovo,cmdnovo,cmdGravar,cmdCancelar,cmdPesquisar,cmdAlterar,cmdConfirmar,cmdCancelarAlt,cmdExcluir,frmCadUsuarios);
end;

procedure TfrmCADUsuarios.cmdgravarClick(Sender: TObject);
begin
if dbedit1.Text = '' then
 begin
  messagedlg('Campo NOME COMPLETO est� em branco!',mterror,[mbok],0);
  dbedit1.setfocus;
  exit;
 end;

if dbedit2.Text = '' then
 begin
  messagedlg('Campo ID DO USU�RIO est� em branco!',mterror,[mbok],0);
  dbedit2.setfocus;
  exit;
 end;

if dbedit3.Text = '' then
 begin
  messagedlg('Campo SENHA est� em branco!',mterror,[mbok],0);
  dbedit3.setfocus;
  exit;
 end;


if frmSYSProcedures.TestaChave('lgnidusuario','login',dbedit2.text,'Usu�rio') = 1 then
begin
dbedit2.setfocus;
exit;
end;

if edtconfirmar1.Text <> dbedit3.Text then
 begin
  messagedlg('Confirme a senha corretamente!',mterror,[mbok],0);
  edtconfirmar1.text:='';
  edtconfirmar1.setfocus;
  exit;
 end;

dbedit3.text:=frmSYSLogin.EnDecryptString(dbedit3.text, 236);
frmSYSProcedures.Cadastro('GRAVAR',dtusuarios,dbedit1,tabalt,boxnovo,cmdnovo,cmdGravar,cmdCancelar,cmdPesquisar,cmdAlterar,cmdConfirmar,cmdCancelarAlt,cmdExcluir,frmCadUsuarios);
frmSYSProcedures.LimpaEdit(frmcadusuarios);
end;

procedure TfrmCADUsuarios.cmdcancelarClick(Sender: TObject);
begin
frmSYSProcedures.Cadastro('CANCELAR',dtusuarios,dbedit1,tabalt,boxnovo,cmdnovo,cmdGravar,cmdCancelar,cmdPesquisar,cmdAlterar,cmdConfirmar,cmdCancelarAlt,cmdExcluir,frmCadUsuarios);
end;

procedure TfrmCADUsuarios.cmdPesquisarClick(Sender: TObject);
begin
frmSYSProcedures.LimpaEdit(frmcadusuarios);
frmSYSProcedures.Cadastro('PESQUISAR',dtusuarios,dbedit4,tabNOVO,boxalterar,cmdnovo,cmdGravar,cmdCancelar,cmdPesquisar,cmdAlterar,cmdConfirmar,cmdCancelarAlt,cmdExcluir,frmCadUsuarios);

with frmSYSPesquisar do
 begin
  bancodedados := 'LOGIN';
  Titulo := 'Localizar Usu�rios';
  Campos := 'lgnnomeusuario,lgnidusuario';
  GridTitulo := 'Nome Completo,Id Usu�rio';
  GridTamanho := '40,15';
  PesqSize := '500';
  NoAutoUpdate := true;
  showmodal;
   if retorno then
    begin
     cmdalterar.Enabled := true;
     cmdexcluir.Enabled :=true;
     frmSYSProcedures.EncontraRegistro(dtusuarios,valor2);
     dbedit6.text:=frmSYSLogin.EnDecryptString(dbedit6.text, 236);
     edtconfirmar2.text:=dbedit6.text;
    end;
 end;


end;

procedure TfrmCADUsuarios.cmdAlterarClick(Sender: TObject);
begin
frmSYSProcedures.Cadastro('ALTERAR',dtusuarios,dbedit4,tabNOVO,boxalterar,cmdnovo,cmdGravar,cmdCancelar,cmdPesquisar,cmdAlterar,cmdConfirmar,cmdCancelarAlt,cmdExcluir,frmCadUsuarios);
vcampo:=dbedit5.text;
dtusuarios.fieldbyname('lgnsenha').value:=frmSYSLogin.EnDecryptString(dtusuarios.fieldbyname('lgnsenha').value, 236);
end;

procedure TfrmCADUsuarios.cmdExcluirClick(Sender: TObject);
begin
frmSYSProcedures.Cadastro('EXCLUIR',dtusuarios,dbedit4,tabNOVO,boxalterar,cmdnovo,cmdGravar,cmdCancelar,cmdPesquisar,cmdAlterar,cmdConfirmar,cmdCancelarAlt,cmdExcluir,frmCadUsuarios);
end;

procedure TfrmCADUsuarios.cmdConfirmarClick(Sender: TObject);
begin
if dbedit4.Text = '' then
 begin
  messagedlg('Campo NOME COMPLETO est� em branco!',mterror,[mbok],0);
  dbedit4.setfocus;
  exit;
 end;

if dbedit5.Text = '' then
 begin
  messagedlg('Campo ID DO USU�RIO est� em branco!',mterror,[mbok],0);
  dbedit5.setfocus;
  exit;
 end;

if dbedit6.Text = '' then
 begin
  messagedlg('Campo SENHA est� em branco!',mterror,[mbok],0);
  dbedit6.setfocus;
  exit;
 end;

if vCampo <> dbedit5.text then
if frmSYSProcedures.TestaChave('lgnidusuario','login',dbedit5.text,'Usu�rio') = 1 then
 begin
  dbedit5.Text := vcampo;
  exit;
 end;

if edtconfirmar2.Text <> dbedit6.Text then
 begin
  messagedlg('Confirme a senha corretamente!',mterror,[mbok],0);
  edtconfirmar2.text:='';
  edtconfirmar2.setfocus;
  exit;
 end;


dtusuarios.FieldByName('lgnsenha').Value :=frmSYSLogin.EnDecryptString(dbedit6.text, 236);
frmSYSProcedures.Cadastro('CONFIRMAR',dtusuarios,dbedit4,tabNOVO,boxalterar,cmdnovo,cmdGravar,cmdCancelar,cmdPesquisar,cmdAlterar,cmdConfirmar,cmdCancelarAlt,cmdExcluir,frmCadUsuarios);
frmSYSProcedures.LimpaEdit(frmcadusuarios);
end;

procedure TfrmCADUsuarios.cmdCancelarAltClick(Sender: TObject);
begin
frmSYSProcedures.Cadastro('CANCELARALTERAR',dtusuarios,dbedit4,tabNOVO,boxalterar,cmdnovo,cmdGravar,cmdCancelar,cmdPesquisar,cmdAlterar,cmdConfirmar,cmdCancelarAlt,cmdExcluir,frmCadUsuarios);
end;

procedure TfrmCADUsuarios.pgChange(Sender: TObject);
begin
DTUsuarios.CLOSE;
frmSYSProcedures.LimpaEdit(frmcadusuarios);
cmdalterar.Enabled := false;
cmdexcluir.Enabled := false;
end;

procedure TfrmCADUsuarios.FormCreate(Sender: TObject);
begin
pg.ActivePage := tabnovo;
end;

procedure TfrmCADUsuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

procedure TfrmCADUsuarios.edtconfirmar2Exit(Sender: TObject);
begin
dbedit4.SetFocus;
end;

procedure TfrmCADUsuarios.edtconfirmar1Exit(Sender: TObject);
begin
dbedit1.SetFocus;
end;

procedure TfrmCADUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
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
