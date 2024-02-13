unit untPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ibx.IBCustomDataSet, Buttons, ExtCtrls,
  Grids, DBGrids;

type
  TfrmCADPagamento = class(TForm)
    dtPagamento: TIBDataSet;
    dtPagamentoCODIGO: TIntegerField;
    dtPagamentoPRAZOPRIMEIRA: TIntegerField;
    dtPagamentoQTDEPARCELAS: TIntegerField;
    dtPagamentoDESCRICAO: TIBStringField;
    dsPagamento: TDataSource;
    Shape1: TShape;
    cmdnovo: TSpeedButton;
    cmdgravar: TSpeedButton;
    cmdcancelar: TSpeedButton;
    cmdalterar: TSpeedButton;
    cmdexcluir: TSpeedButton;
    cmdgravaraltera: TSpeedButton;
    DBGrid1: TDBGrid;
    Image1: TImage;
    procedure cmdnovoClick(Sender: TObject);
    procedure cmdgravarClick(Sender: TObject);
    procedure cmdcancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmdgravaralteraClick(Sender: TObject);
    procedure cmdexcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdalterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtPagamentoBeforeInsert(DataSet: TDataSet);
    procedure dtPagamentoAfterPost(DataSet: TDataSet);
    procedure dtPagamentoAfterCancel(DataSet: TDataSet);
    procedure dtPagamentoBeforeEdit(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADPagamento: TfrmCADPagamento;
  vaceita:string;
implementation

uses untDM, untMenu;

{$R *.dfm}

procedure TfrmCADPagamento.cmdnovoClick(Sender: TObject);
begin
cmdexcluir.Enabled :=false;
cmdalterar.Enabled :=false;
cmdgravar.Enabled :=true;
cmdnovo.enabled:=false;
cmdcancelar.Enabled :=true;
dtpagamento.open;
dtpagamento.append;
dbgrid1.SetFocus;
end;

procedure TfrmCADPagamento.cmdgravarClick(Sender: TObject);
begin
vAceita:='TRUE';


try
 dtpagamento.Post;
 dtpagamento.Close;
except
 showmessage('Confira os dados! Algum campo est� preenchido incorretamente,ou voc� est� tentando cadastrar uma pagamento j� cadastrada!');
 vAceita:='FALSE';
end;

if vAceita = 'TRUE' THEN
 begin
  dtpagamento.Post;
  dtpagamento.Close;
  dm.transacao.commit;
  cmdgravar.Enabled :=false;
  cmdnovo.enabled:=true;
  cmdcancelar.Enabled :=false;
  cmdalterar.Enabled :=true;
  cmdexcluir.Enabled :=true;
 end;
end;

procedure TfrmCADPagamento.cmdcancelarClick(Sender: TObject);
begin
cmdalterar.Enabled :=true;
cmdexcluir.Enabled :=true;
cmdgravaraltera.enabled:=false;
cmdgravar.Enabled :=false;
cmdnovo.enabled:=true;
cmdcancelar.Enabled :=false;
dtpagamento.Cancel;
dtpagamento.open;
end;

procedure TfrmCADPagamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if cmdnovo.Enabled = false then
 begin
  canclose:=false;
  showmessage('Antes de fechar � necess�rio finalizar a opera��o clicando em Cancelar ou Gravar.');
 end;
end;

procedure TfrmCADPagamento.cmdgravaralteraClick(Sender: TObject);
begin
dtpagamento.applyupdates;
cmdgravaraltera.enabled:=false;
cmdcancelar.Enabled :=false;
cmdnovo.Enabled :=true;
cmdexcluir.Enabled :=true;
end;

procedure TfrmCADPagamento.cmdexcluirClick(Sender: TObject);
begin
 if messagedlg('Tem certeza que deseja excluir a forma de pagamento '+TRIM(dtpagamento.fieldbyname('descricao').Value)+'? Essa opera��o ir� excluir todos os produtos desta pagamento,inclusive os inclu�dos em pedidos!',mtinformation,[mbyes,mbno],0)=mryes then
  begin
   dtpagamento.Delete;
   dtpagamento.Close;
  end;
end;

procedure TfrmCADPagamento.FormShow(Sender: TObject);
begin
dtpagamento.open;
if dtpagamento.RecordCount > 0 then
 begin
  cmdalterar.Enabled :=true;
  cmdgravaraltera.Enabled :=false;
  cmdexcluir.Enabled :=true;
 end;
end;

procedure TfrmCADPagamento.cmdalterarClick(Sender: TObject);
begin
cmdcancelar.Enabled :=true;
cmdexcluir.Enabled :=false;
cmdnovo.Enabled :=false;
cmdgravaraltera.Enabled :=true;
dbgrid1.SetFocus;
end;

procedure TfrmCADPagamento.FormCreate(Sender: TObject);
begin
dtpagamento.open;
end;

procedure TfrmCADPagamento.dtPagamentoBeforeInsert(DataSet: TDataSet);
begin
cmdexcluir.Enabled :=false;
cmdalterar.Enabled :=false;
cmdgravar.Enabled :=true;
cmdnovo.enabled:=false;
cmdcancelar.Enabled :=true;
dbgrid1.SetFocus;
end;

procedure TfrmCADPagamento.dtPagamentoAfterPost(DataSet: TDataSet);
begin
cmdgravar.Enabled :=false;
cmdnovo.enabled:=true;
cmdcancelar.Enabled :=false;
cmdalterar.Enabled :=true;
cmdexcluir.Enabled :=true;
end;

procedure TfrmCADPagamento.dtPagamentoAfterCancel(DataSet: TDataSet);
begin
cmdalterar.Enabled :=true;
cmdexcluir.Enabled :=true;
cmdgravaraltera.enabled:=false;
cmdgravar.Enabled :=false;
cmdnovo.enabled:=true;
cmdcancelar.Enabled :=false;
end;

procedure TfrmCADPagamento.dtPagamentoBeforeEdit(DataSet: TDataSet);
begin
cmdcancelar.Enabled :=true;
cmdexcluir.Enabled :=false;
cmdnovo.Enabled :=false;
cmdgravaraltera.Enabled :=true;
end;

procedure TfrmCADPagamento.FormKeyPress(Sender: TObject; var Key: Char);
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
