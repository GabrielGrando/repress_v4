unit untClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, DB, ibx.IBCustomDataSet,
  DBCtrls, Mask, ibx.IBQuery;

type
  TfrmCADClientes = class(TForm)
    pg: TPageControl;
    tab1: TTabSheet;
    tab2: TTabSheet;
    Shape2: TShape;
    dtClientes: TIBDataSet;
    dsClientes: TDataSource;
    DBEdit20: TDBEdit;
    Shape1: TShape;
    dtClientesCODIGO: TIntegerField;
    dtClientesRAZAO: TIBStringField;
    dtClientesFANTASIA: TIBStringField;
    dtClientesCNPJ: TIBStringField;
    dtClientesENDERECO: TIBStringField;
    dtClientesBAIRRO: TIBStringField;
    dtClientesCIDADE: TIBStringField;
    dtClientesUF: TIBStringField;
    dtClientesCEP: TIBStringField;
    dtClientesTELEFONE: TIBStringField;
    dtClientesFAX: TIBStringField;
    dtClientesCONTATO: TIBStringField;
    dtClientesBANCO: TIBStringField;
    dtClientesCONTA: TIBStringField;
    dtClientesAGENCIA: TIBStringField;
    dtClientesBANCOCIDADE: TIBStringField;
    dtClientesBANCOUF: TIBStringField;
    dtClientesBANCOTELEFONE: TIBStringField;
    dtClientesOBS: TIBStringField;
    box: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    memoobs: TMemo;
    GroupBox3: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    dtClientesINSC: TIBStringField;
    Image2: TImage;
    cmdpesq: TSpeedButton;
    cmdalterar: TSpeedButton;
    cmdexcluir: TSpeedButton;
    cmdgravaraltera: TSpeedButton;
    cmdCancelaAlt: TSpeedButton;
    Image1: TImage;
    cmdnovo: TSpeedButton;
    cmdcancelar: TSpeedButton;
    cmdgravar: TSpeedButton;
    qryVendedor: TIBQuery;
    qryEncontra: TIBQuery;
    Shape4: TShape;
    Label22: TLabel;
    Image3: TImage;
    Label36: TLabel;
    box2: TGroupBox;
    Label8: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    memoalt: TMemo;
    GroupBox4: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    Shape3: TShape;
    SpeedButton1: TSpeedButton;
    qryCli: TIBQuery;
    procedure cmdnovoClick(Sender: TObject);
    procedure cmdgravarClick(Sender: TObject);
    procedure cmdcancelarClick(Sender: TObject);
    procedure cmdpesqClick(Sender: TObject);
    procedure cmdgravaralteraClick(Sender: TObject);
    procedure cmdCancelaAltClick(Sender: TObject);
    procedure cmdexcluirClick(Sender: TObject);
    procedure cmdalterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure memoobsExit(Sender: TObject);
    procedure memoaltExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADClientes: TfrmCADClientes;
  vok:string;
implementation

uses untDM, untMenu, untFornecedores, uPesquisar,
  untVendedor_Cliente, untProcedures;

{$R *.dfm}

procedure TfrmCADClientes.cmdnovoClick(Sender: TObject);
begin
dtClientes.open;
dtClientes.append;
box.enabled         :=true;
cmdcancelar.enabled :=true;
cmdgravar.enabled   :=true;
cmdnovo.Enabled     :=false;
tab2.tabvisible     :=false;
dbedit23.setfocus;
end;

procedure TfrmCADClientes.cmdgravarClick(Sender: TObject);
var
 vCodigo:integer;
begin

if dbedit23.text = '' then
 begin
  messagedlg('Digite a RAZÃO SOCIAL!',mterror,[mbok],0);
  dbedit23.setfocus;
  exit;
 end;

if dbedit24.text = '' then
 begin
  messagedlg('Digite o NOME FANTASIA!',mterror,[mbok],0);
  dbedit24.setfocus;
  exit;
 end;

if dbedit25.text = '' then
 begin
  messagedlg('Digite o CNPJ!',mterror,[mbok],0);;
  dbedit25.setfocus;
  exit;
 end;

if dbedit26.text = '' then
 begin
  messagedlg('Digite a INSC. ESTADUAL!',mterror,[mbok],0);
  dbedit26.setfocus;
  exit;
 end;

if dbedit27.text = '' then
 begin
  messagedlg('Digite o ENDEREÇO!',mterror,[mbok],0);
  dbedit27.setfocus;
  exit;
 end;

if dbedit28.text = '' then
 begin
  messagedlg('Digite o BAIRRO!',mterror,[mbok],0);
  dbedit28.setfocus;
  exit;
 end;

if dbedit29.text = '' then
 begin
  messagedlg('Digite a CIDADE!',mterror,[mbok],0);
  dbedit29.setfocus;
  exit;
 end;

if dbedit30.text = '' then
 begin
  messagedlg('Digite o UF!',mterror,[mbok],0);
  dbedit30.setfocus;
  exit;
 end;

if dbedit31.text = '' then
 begin
  messagedlg('Digite o CEP!',mterror,[mbok],0);
  dbedit31.setfocus;
  exit;
 end;

if dbedit32.text = '' then
 begin
  messagedlg('Digite o TELEFONE!',mterror,[mbok],0);
  dbedit32.setfocus;
  exit;
 end;

if dbedit34.text = '' then
 begin
  messagedlg('Digite o CONTATO!',mterror,[mbok],0);
  dbedit34.setfocus;
  exit;
 end;

if memoobs.Text = '' then dtclientes.FieldByName('obs').Value := 'NENHUMA OBSERVAÇÃO' else dtclientes.FieldByName('obs').Value :=memoobs.Text;
IF frmsysprocedures.TestaChave('razao','clientes',dbedit23.text,'CLIENTE') = 1 then
 begin
  dbedit23.setfocus;
  exit;
 end;

dtclientes.FieldByName('codigo').Value := frmsysprocedures.Max('clientes');
vCodigo := dtclientes.FieldByName('codigo').Value;
dtclientes.Post;

frmOUTCliVen:=tfrmOUTCliVen.create(self);
frmOUTCliVen.lblcliente.caption:=inttostr(vCodigo);
frmOUTCliVen.showmodal;
frmOUTCliVen.free;

cmdgravar.Enabled   := false;
cmdnovo.Enabled     := true;
cmdcancelar.Enabled := false;
box.enabled         := false;
tab2.TabVisible     := true;
memoobs.Text        :='';
tab1.SetFocus;
dm.transacao.commit;
end;

procedure TfrmCADClientes.cmdcancelarClick(Sender: TObject);
begin
box.enabled         :=false;
cmdgravar.Enabled   :=false;
cmdcancelar.Enabled :=false;
cmdnovo.Enabled     :=true;
tab2.TabVisible     :=true;
memoobs.Text        :='';
tab1.SetFocus;
dtclientes.Cancel;
dtclientes.Close;
end;

procedure TfrmCADClientes.cmdpesqClick(Sender: TObject);
begin
memoalt.clear;
cmdalterar.Enabled :=false;
cmdexcluir.Enabled :=false;

 with frmSYSPesquisar do
  begin
    bancodedados := 'clientes';
    Titulo := 'Localizar Clientes';
    Campos := 'codigo,razao,fantasia,cnpj,insc';
    GridTitulo := 'Código,Razão Social,Fantasia,CNPJ,Insc. Estadual';
    GridTamanho := '4,40';
    PesqSize := '500';
    NoAutoUpdate := true;
    showmodal;
    if retorno then
     begin
        with frmCADclientes do
         begin
          dtclientes.close;
          dtclientes.parambyname('pcod').value:= valor;
          dtclientes.Open;
          cmdalterar.enabled:=true;
          cmdexcluir.enabled:=true;
          if (frmcadclientes.dtclientes.fieldbyname('obs').value <> '') and(frmcadclientes.dtclientes.fieldbyname('obs').value <> null)  then frmCADclientes.memoalt.Text := frmCADclientes.dtclientes.Fieldbyname('obs').value;
         end;
     end;
  end;

end;

procedure TfrmCADClientes.cmdgravaralteraClick(Sender: TObject);
begin

if dbedit21.text = '' then
 begin
  messagedlg('Digite a RAZÃO SOCIAL!',mterror,[mbok],0);
  dbedit21.setfocus;
  exit;
 end;

if dbedit22.text = '' then
 begin
  messagedlg('Digite o NOME FANTASIA!',mterror,[mbok],0);
  dbedit22.setfocus;
  exit;
 end;

if dbedit41.text = '' then
 begin
  messagedlg('Digite o CNPJ!',mterror,[mbok],0);;
  dbedit41.setfocus;
  exit;
 end;

if dbedit42.text = '' then
 begin
  messagedlg('Digite a INSC. ESTADUAL!',mterror,[mbok],0);
  dbedit42.setfocus;
  exit;
 end;

if dbedit43.text = '' then
 begin
  messagedlg('Digite o ENDEREÇO!',mterror,[mbok],0);
  dbedit43.setfocus;
  exit;
 end;

if dbedit44.text = '' then
 begin
  messagedlg('Digite o BAIRRO!',mterror,[mbok],0);
  dbedit44.setfocus;
  exit;
 end;

if dbedit45.text = '' then
 begin
  messagedlg('Digite a CIDADE!',mterror,[mbok],0);
  dbedit45.setfocus;
  exit;
 end;

if dbedit46.text = '' then
 begin
  messagedlg('Digite o UF!',mterror,[mbok],0);
  dbedit46.setfocus;
  exit;
 end;

if dbedit47.text = '' then
 begin
  messagedlg('Digite o CEP!',mterror,[mbok],0);
  dbedit47.setfocus;
  exit;
 end;

if dbedit48.text = '' then
 begin
  messagedlg('Digite o TELEFONE!',mterror,[mbok],0);
  dbedit48.setfocus;
  exit;
 end;

if dbedit50.text = '' then
 begin
  messagedlg('Digite o CONTATO!',mterror,[mbok],0);
  dbedit50.setfocus;
  exit;
 end;

if memoALT.Text = '' then dtclientes.FieldByName('obs').Value := 'NENHUMA OBSERVAÇÃO' else dtclientes.FieldByName('obs').Value :=memoalt.Text;

dtclientes.ApplyUpdates;
dtclientes.close;
dm.TRANSACAO.Commit;

cmdgravaraltera.Enabled   :=false;
cmdCancelaAlt.Enabled     :=false;
cmdalterar.Enabled        :=false;
cmdpesq.enabled           :=true;
box2.enabled              :=false;
tab1.TabVisible           :=true;
memoalt.text              :='';
end;

procedure TfrmCADClientes.cmdCancelaAltClick(Sender: TObject);
begin
dtclientes.Cancel;
dtclientes.close;
box2.enabled              :=false;
cmdgravaraltera.enabled   :=false;
cmdCancelaAlt.enabled     :=false;
cmdalterar.enabled        :=false;
cmdpesq.enabled           :=true;
tab1.TabVisible           :=true;
memoalt.text              :='';
end;

procedure TfrmCADClientes.cmdexcluirClick(Sender: TObject);
begin
 if messagedlg('Tem certeza que deseja excluir o cliente '+TRIM(dtclientes.fieldbyname('razao').Value)+'?',mtinformation,[mbyes,mbno],0)=mryes then
  begin
   cmdalterar.enabled :=false;
   cmdexcluir.enabled :=false;
   memoalt.text       :='';
   qryCli.close;
   qryCli.ParamByName('pcli').Value := dtclientes.fieldbyname('codigo').value;
   qryCli.open;
   dtclientes.Delete;
   dtclientes.Close;
   dm.transacao.Commit;
  end;
end;

procedure TfrmCADClientes.cmdalterarClick(Sender: TObject);
begin
box2.enabled             :=true;
tab1.TabVisible          :=false;
cmdpesq.Enabled          :=false;
cmdalterar.enabled       :=false;
cmdgravaraltera.enabled  :=true;
cmdCancelaAlt.enabled    :=true;
CMDEXCLUIR.Enabled       :=false;
dbedit21.SetFocus;
dtClientes.Edit;
end;

procedure TfrmCADClientes.FormShow(Sender: TObject);
begin
pg.ActivePage := tab1;
end;

procedure TfrmCADClientes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if cmdnovo.Enabled = false then
 begin
  canclose:=false;
  messagedlg('Antes de fechar é necessário finalizar a operação clicando em Cancelar ou Gravar',mterror,[mbok],0);
 end;

if ((cmdalterar.Enabled = false) and (cmdCancelaAlt.enabled = true)) then
 begin
  canclose:=false;
  messagedlg('Antes de fechar é necessário finalizar a operação clicando em Cancelar ou Confirmar alteração',mterror,[mbok],0);
 end;
end;

procedure TfrmCADClientes.SpeedButton1Click(Sender: TObject);
var
 i:integer;
begin
frmoutcliven:=tfrmoutcliven.create(self);
frmoutcliven.lblcliente.Caption := dtclientes.fieldbyname('codigo').value;

qryEncontra.close;
qryEncontra.sql.clear;
qryEncontra.sql.add('select * from cli_ven');
qryEncontra.sql.add('where codcliente = :pcod');
qryEncontra.parambyname('pcod').value := dtclientes.fieldbyname('codigo').value;
qryEncontra.open;
qryEncontra.first;
i:=0;

 while not qryEncontra.eof do
  begin
   qryVendedor.close;
   qryvendedor.parambyname('pcod').value := qryEncontra.fieldbyname('codvendedor').value;
   qryvendedor.open;
   frmoutcliven.vetor[i]:=qryEncontra.fieldbyname('codvendedor').value;
   frmoutcliven.lista.items.Add(qryvendedor.fieldbyname('nome').value);
   qryEncontra.next;
   i:=i+1;
  end;

frmoutcliven.i:=i;
frmoutcliven.ShowModal;
frmoutcliven.free;
end;

procedure TfrmCADClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

procedure TfrmCADClientes.memoobsExit(Sender: TObject);
begin
dbedit23.setfocus;
end;

procedure TfrmCADClientes.memoaltExit(Sender: TObject);
begin
dbedit21.setfocus;
end;

procedure TfrmCADClientes.FormKeyPress(Sender: TObject; var Key: Char);
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
