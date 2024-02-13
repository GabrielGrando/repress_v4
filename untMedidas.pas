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
 showmessage('Confira os dados! Algum campo est� preenchido incorretamente,ou voc� est� tentando cadastrar uma medida j� cadastrada!');
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
  showmessage('Antes de fechar � necess�rio finalizar a opera��o clicando em Cancelar ou Gravar.');
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
 if messagedlg('Tem certeza que deseja excluir a medida '+TRIM(dtmedida.fieldbyname('descricao').Value)+'? Essa opera��o ir� excluir todos os produtos desta medida,inclusive os inclu�dos em pedidos!',mtinformation,[mbyes,mbno],0)=mryes then
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
