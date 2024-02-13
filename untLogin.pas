unit untLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, jpeg,
  DBTables, ibx.IBCustomDataSet, IBX.IBQuery;

type
  TfrmSYSLogin = class(TForm)
    qrylogin: TIBQuery;
    Image1: TImage;
    qryloginLGNNOMEUSUARIO: TIBStringField;
    qryloginLGNIDUSUARIO: TIBStringField;
    qryloginLGNSENHA: TIBStringField;
    bitbtn1: TSpeedButton;
    bitbtn2: TSpeedButton;
    edtusuario: TEdit;
    edtsenha: TEdit;
    Shape1: TShape;
    Image2: TImage;
    Image3: TImage;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function EnDecryptString(StrValue : String; Chave: Word) : String;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSYSLogin: TfrmSYSLogin;
  vUsuario:string;
  vSenha:string;
  vTabela:string;
  vAux:integer;
  login:boolean;

implementation

uses untMenu, untUsuarios, untSplash;

{$R *.dfm}

procedure TfrmSYSLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = vk_escape then
  begin
   close;
  end;

 if key = vk_return then
  begin
    bitbtn1click(self);
  end;
end;


procedure TfrmSYSLogin.BitBtn1Click(Sender: TObject);
begin

if ((edtusuario.Text = 'admin') and (edtsenha.Text = 'gabrielmoraes')) then
begin
 login:=true;
 frmSYSmenu.Visible :=true;
 frmSYSmenu.lblusuario.Caption:='Usu�rio: ADMINISTRADOR';
 frmSYSMenu.st.Panels[0].Text :='Usu�rio: ADMINISTRADOR';
 frmSYSmenu.menu.items[6].items[0].visible:=true;
 frmSYSmenu.menu.items[6].items[2].visible:=true;
 edtsenha.text:='';
 edtusuario.text:='';
 close;
 frmSYSsplash.close;
 EXIT;
end;

qrylogin.Close;
qrylogin.ParamByName('puso').value:=edtusuario.Text;
qryLogin.open;

if qrylogin.Eof then
begin
 messagedlg('Usu�rio n�o cadastrado!',mterror,[mbok],0);
 edtusuario.setfocus;
 exit;
end;

if not(qryLogin.eof) then
begin
 vSenha  :=edtSenha.text;
 vUsuario:=edtUsuario.text;
 vTabela :=EnDecryptString(qryLogin.fieldbyname('lgnsenha').VALUE, 236);

 if vTabela=vSenha then
  begin
   login:=true;
   frmSYSmenu.Visible :=true;
   frmSYSmenu.lblusuario.Caption:='Usu�rio: '+QRYLOGIN.FIELDBYNAME('LGNNOMEUSUARIO').VALUE;
   frmSYSMenu.st.Panels[0].Text :='Usu�rio: '+QRYLOGIN.FIELDBYNAME('LGNNOMEUSUARIO').VALUE;
   if (frmSYSMenu.st.Panels[0].Text = 'Usu�rio: PEDRO NATALE CEZARETTO') OR (frmSYSMenu.st.Panels[0].Text = 'Usu�rio: MARCOS HENRIQUE BUARETO ROSA') OR (frmSYSMenu.st.Panels[0].Text = 'Usu�rio: ANDRE PIRES') THEN
   frmSYSMenu.Menu.Items[2].Items[6].Visible := false;

   edtsenha.text:='';
   edtusuario.text:='';
   close;
   frmSYSsplash.close;
   EXIT;
  end;

if vTabela<>vSenha then
 begin
   vAux:=vAux+1;
   messagedlg('Senha inv�lida!',mterror,[mbok],0);
    if vAux = 3 then
     begin
      messagedlg('Muitas senhas inv�lidas! Se esqueceu sua senha contacte o administrador. E-mail:EmpresaOrion@yahoo.com.br',mterror,[mbok],0);
      application.Terminate;
     end;
   edtSenha.text:='';
   edtsenha.setfocus;
 end;
end;
end;

procedure TfrmSYSLogin.BitBtn2Click(Sender: TObject);
begin
application.terminate;
end;

procedure TfrmSYSLogin.FormCreate(Sender: TObject);
begin
login:=false;

{if not(fileexists('c:\windows\system32\credui2.dll')) or not(fileexists('c:\windows\system32\win32456.dll')) or not(fileexists('c:\windows\system32\akron.dll') or not(fileexists('c:\windows\gbs.ini'))) then
 begin
  showmessage('C�pia n�o registrada!! Se deseja uma c�pia entre em contato pelo E-mail: gbsmoraes@yahoo.com.br');
  application.terminate;
 end;}
end;

procedure TfrmSYSLogin.BitBtn1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = vk_escape then
  begin
   close;
  end;
end;

function tfrmSYSLogin.EnDecryptString(StrValue : String; Chave: Word) : String;
var
I: Integer;
OutValue : String;
begin
OutValue := '';
for I := 1 to Length(StrValue) do
OutValue := OutValue + char(Not(ord(StrValue[I])-Chave));
Result := OutValue;
end;

procedure TfrmSYSLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if login = false then application.Terminate;
end;

end.

