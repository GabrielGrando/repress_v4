unit untMedidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBCustomDataSet, Buttons, StdCtrls, Mask, DBCtrls, ExtCtrls,
  Grids, DBGrids;

type
  TfrmCADUnidades = class(TForm)
    dtMedida: TIBDataSet;
    dsmedida: TDataSource;
    Shape1: TShape;
    DBGrid1: TDBGrid;
    cmdnovo: TSpeedButton;
    cmdgravar: TSpeedButton;
    cmdcancelar: TSpeedButton;
    cmdalterar: TSpeedButton;
    cmdexcluir: TSpeedButton;
    cmdgravaraltera: TSpeedButton;
    Image1: TImage;
    procedure cmdnovoClick(Sender: TObject);
    procedure cmdcancelarClick(Sender: TObject);
    procedure cmdgravarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmdgravaralteraClick(Sender: TObject);
    procedure cmdexcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdalterarClick(Sender: TObject);
    procedure dtMedidaBeforeInsert(DataSet: TDataSet);
    procedure dtMedidaBeforePost(DataSet: TDataSet);
    procedure dtMedidaAfterCancel(DataSet: TDataSet);
    procedure dtMedidaBeforeEdit(DataSet: TDataSet);
    procedure dtMedidaAfterPost(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADUnidades: TfrmCADUnidades;
  vaceita:string;
implementation

uses untDM, untMenu;

{$R *.dfm}

procedure TfrmCADUnidades.cmdnovoClick(Sender: TObject);
begin
cmdexcluir.Enabled :=false;
cmdalterar.Enabled :=false;
cmdgravar.Enabled :=true;
cmdnovo.enabled:=false;
cmdcancelar.Enabled :=true;
dtmedida.open;
dtmedida.append;
dbgrid1.SetFocus;
end;

procedure TfrmCADUnidades.cmdcancelarClick(Sender: TObject);
begin
cmdalterar.Enabled :=true;
cmdexcluir.Enabled :=true;
cmdgravaraltera.enabled:=false;
cmdgravar.Enabled :=false;
cmdnovo.enabled:=true;
cmdcancelar.Enabled :=false;
dtmedida.Cancel;
dtmedida.open;
end;

procedure TfrmCADUnidades.cmdgravarClick(Sender: TObject);
begin
vAceita:='TRUE';


try
 dtMedida.Post;
 dtmedida.Close;
except
 showmessage('Confira os dados! Algum campo está preenchido incorretamente,ou você está tentando cadastrar uma medida já cadastrada!');
 vAceita:='FALSE';
end;

if vAceita = 'TRUE' THEN
 begin
  dm.transacao.commit;
  cmdgravar.Enabled :=false;
  cmdnovo.enabled:=true;
  cmdcancelar.Enabled :=false;
  cmdalterar.Enabled :=true;
  cmdexcluir.Enabled :=true;
  dtmedida.open;
 end;
end;

procedure TfrmCADUnidades.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if cmdnovo.Enabled = false then
 begin
  canclose:=false;
  showmessage('Antes de fechar é necessário finalizar a operação clicando em Cancelar ou Gravar.');
 end;
end;

procedure TfrmCADUnidades.cmdgravaralteraClick(Sender: TObject);
begin
dtmedida.applyupdates;
cmdgravaraltera.enabled:=false;
cmdcancelar.Enabled :=false;
cmdnovo.Enabled :=true;
cmdexcluir.Enabled :=true;
end;

procedure TfrmCADUnidades.cmdexcluirClick(Sender: TObject);
begin
 if messagedlg('Tem certeza que deseja excluir a medida '+TRIM(dtmedida.fieldbyname('descricao').Value)+'? Essa operação irá excluir todos os produtos desta medida,inclusive os incluídos em pedidos!',mtinformation,[mbyes,mbno],0)=mryes then
  begin
   dtmedida.Delete;
   dtmedida.Close;
   dtmedida.open;
  end;
end;

procedure TfrmCADUnidades.FormShow(Sender: TObject);
begin
dtmedida.open;
if dtmedida.RecordCount > 0 then
 begin
  cmdalterar.Enabled :=true;
  cmdgravaraltera.Enabled :=false;
  cmdexcluir.Enabled :=true;
 end;
end;

procedure TfrmCADUnidades.cmdalterarClick(Sender: TObject);
begin
cmdcancelar.Enabled :=true;
cmdexcluir.Enabled :=false;
cmdnovo.Enabled :=false;
cmdgravaraltera.Enabled :=true;
dbgrid1.SetFocus;
end;

procedure TfrmCADUnidades.dtMedidaBeforeInsert(DataSet: TDataSet);
begin
cmdexcluir.Enabled :=false;
cmdalterar.Enabled :=false;
cmdgravar.Enabled :=true;
cmdnovo.enabled:=false;
cmdcancelar.Enabled :=true;
dbgrid1.SetFocus;
end;

procedure TfrmCADUnidades.dtMedidaBeforePost(DataSet: TDataSet);
begin
cmdgravar.Enabled :=false;
cmdnovo.enabled:=true;
cmdcancelar.Enabled :=false;
cmdalterar.Enabled :=true;
cmdexcluir.Enabled :=true;
end;

procedure TfrmCADUnidades.dtMedidaAfterCancel(DataSet: TDataSet);
begin
cmdalterar.Enabled :=true;
cmdexcluir.Enabled :=true;
cmdgravaraltera.enabled:=false;
cmdgravar.Enabled :=false;
cmdnovo.enabled:=true;
cmdcancelar.Enabled :=false;
end;

procedure TfrmCADUnidades.dtMedidaBeforeEdit(DataSet: TDataSet);
begin
cmdcancelar.Enabled :=true;
cmdexcluir.Enabled :=false;
cmdnovo.Enabled :=false;
cmdgravaraltera.Enabled :=true;
end;

procedure TfrmCADUnidades.dtMedidaAfterPost(DataSet: TDataSet);
begin
cmdgravaraltera.enabled:=false;
cmdcancelar.Enabled :=false;
cmdnovo.Enabled :=true;
cmdexcluir.Enabled :=true;
end;

procedure TfrmCADUnidades.FormKeyPress(Sender: TObject; var Key: Char);
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
