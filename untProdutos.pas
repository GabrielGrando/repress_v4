unit untProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,
  ComCtrls, DB, ibx.IBCustomDataSet, ibx.IbQuery, jpeg;

type
  TfrmCADProdutos = class(TForm)
    pg: TPageControl;
    tab1: TTabSheet;
    tab2: TTabSheet;
    Shape1: TShape;
    dtProdutos: TIBDataSet;
    dsProdutos: TDataSource;
    DBEdit5: TDBEdit;
    dtProdutosPROCODIGO: TIBStringField;
    dtProdutosPRODESCRICAO: TIBStringField;
    dtProdutosPROFORNECEDOR: TIBStringField;
    dtProdutosPROUNIDADE: TIBStringField;
    Shape2: TShape;
    box2: TGroupBox;
    Label6: TLabel;
    Label13: TLabel;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    dtProdutosPROGRADE: TIntegerField;
    Label15: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Image1: TImage;
    cmdpesq: TSpeedButton;
    cmdalterar: TSpeedButton;
    cmdexcluir: TSpeedButton;
    cmdconfirmar: TSpeedButton;
    cmdcancelaralt: TSpeedButton;
    Image2: TImage;
    cmdnovo: TSpeedButton;
    cmdgravar: TSpeedButton;
    cmdcancelar: TSpeedButton;
    dtProdutosCODBARRA: TIBStringField;
    Label16: TLabel;
    DBEdit11: TDBEdit;
    qryMeta: TIBQuery;
    qryDistinto: TIBQuery;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    lblfornecedor: TLabel;
    lblgrade: TLabel;
    combofornecedor2: TComboBox;
    combounidade2: TComboBox;
    combograde2: TComboBox;
    box: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    combofornecedor: TComboBox;
    combounidade: TComboBox;
    combograde: TComboBox;
    Shape4: TShape;
    Label22: TLabel;
    Label36: TLabel;
    Image4: TImage;
    procedure cmdnovoClick(Sender: TObject);
    procedure cmdgravarClick(Sender: TObject);
    procedure cmdcancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pgChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdalterarClick(Sender: TObject);
    procedure cmdexcluirClick(Sender: TObject);
    procedure cmdconfirmarClick(Sender: TObject);
    procedure cmdcancelaraltClick(Sender: TObject);
    procedure cmdpesqClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure combograde2Exit(Sender: TObject);
    procedure combogradeExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADProdutos: TfrmCADProdutos;
  vaceita:string;
  vbd:string;
  vok:string;
  grade:string;
  fornecedor:string;
  pesq:boolean;
implementation

uses untDM, untFornecedores, untMenu, untPesqProdutos, uPesquisar,
  untProcedures;

{$R *.dfm}

procedure TfrmCADProdutos.cmdnovoClick(Sender: TObject);
begin
dtprodutos.open;
dtprodutos.append;
box.enabled         :=true;
cmdcancelar.enabled :=true;
cmdgravar.enabled   :=true;
cmdnovo.Enabled     :=false;
tab2.tabvisible     :=false;
dbedit1.setfocus;
end;

procedure TfrmCADProdutos.cmdgravarClick(Sender: TObject);
var
 vCodigo,vDescricao : string;
begin

if dbedit1.text = '' then
 begin
  messagedlg('Digite o CÓDIGO!',mterror,[mbok],0);
  dbedit1.setfocus;
  exit;
 end;

if dbedit2.text = '' then
 begin
  messagedlg('Digite a DESCRIÇÃO!',mterror,[mbok],0);
  dbedit2.setfocus;
  exit;
 end;

if combofornecedor.text = '' then
 begin
  MESSAGEDLG('Digite o FORNECEDOR!',mterror,[mbok],0);
  combofornecedor.setfocus;
  exit;
 end;

 if combounidade.text = '' then
 begin
  MESSAGEDLG('Escolha a UNIDADE DE MEDIDA!',mterror,[mbok],0);
  combounidade.setfocus;
  exit;
 end;

 if combograde.text = '' then
 begin
  MESSAGEDLG('Escolha a GRADE!',mterror,[mbok],0);
  combograde.setfocus;
  exit;
 end;

if frmSYSProcedures.BuscaCombo('DATASET','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','PROFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,dtProdutos) = 0 then exit;
if frmSYSProcedures.BuscaCombo('DATASET','GRADE','DESCRICAO',combograde.text,'LINHA DO PRODUTO','prograde','ENCONTRAR_CODIGO',combograde,dtProdutos) = 0 then exit;

qrydistinto.Close;
qrydistinto.SQL.clear;
qrydistinto.SQL.add('select * from medidas where simbolo = :psim');
qrydistinto.ParamByName('psim').Value := combounidade.Text;
qrydistinto.open;

if qrydistinto.eof then
 begin
  messagedlg('Campo UNIDADE DE MEDIDA está preenchido com um valor não cadastrado!',mterror,[mbok],0);
  combounidade.SetFocus;
  exit;
 end;

dtprodutos.FieldByName('prodescricao').value  := trim(dbedit2.text);
dtprodutos.FieldByName('profornecedor').value := frmSYSProcedures.BuscaCombo('DATASET','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','PROFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,dtProdutos);
dtprodutos.FieldByName('prograde').value      := frmSYSProcedures.BuscaCombo('DATASET','GRADE','DESCRICAO',combograde.text,'LINHA DO PRODUTO','prograde','ENCONTRAR_CODIGO',combograde,dtProdutos);
dtprodutos.FieldByName('prounidade').value    := combounidade.Text;

IF dbedit3.text = '' THEN dbedit3.text := 'NÃO CADASTRADO';

vCodigo    :=dbedit1.text;
vDescricao :=dbedit2.text;

dtProdutos.Post;
dtProdutos.close;
dm.transacao.commit;

qryDistinto.close;
qryDistinto.sql.clear;
qryDistinto.sql.add('select distinct (codvendedor) from metas');
qryDistinto.open;

qrymeta.close;
qrymeta.sql.clear;
qrymeta.sql.add('insert into metas (codproduto,prodescricao,codvendedor,meta)');
qrymeta.sql.add('values (:pcod,:pdescricao,:pvendedor,:pmeta)');

while not qryDistinto.eof do
 begin
  qrymeta.ParamByName('pcod').value       := vCodigo;
  qrymeta.ParamByName('pdescricao').value := vDescricao;
  qrymeta.ParamByName('pvendedor').value  := qrydistinto.fieldbyname('codvendedor').value;
  qrymeta.ParamByName('pmeta').value      := NULL;
  qrymeta.open;
  qryDistinto.next;
 end;

dm.transacao.commit;
frmsysprocedures.LimpaEdit(frmcadprodutos);
box.enabled         := false;
tab2.TabVisible     := true;
cmdgravar.Enabled   := false;
cmdnovo.Enabled     := true;
cmdcancelar.Enabled := false;

end;


procedure TfrmCADProdutos.cmdcancelarClick(Sender: TObject);
begin
dtProdutos.Cancel;
dtProdutos.Close;
box.enabled         :=false;
cmdgravar.Enabled   :=false;
cmdcancelar.Enabled :=false;
cmdnovo.Enabled     :=true;
tab2.TabVisible     :=true;
frmsysprocedures.LimpaEdit(frmcadprodutos);
end;

procedure TfrmCADProdutos.FormCloseQuery(Sender: TObject;
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

procedure TfrmCADProdutos.pgChange(Sender: TObject);
begin
cmdexcluir.Enabled := false;
cmdalterar.Enabled := false;
frmsysprocedures.LimpaEdit(frmcadprodutos);
dtprodutos.Close;
end;

procedure TfrmCADProdutos.FormShow(Sender: TObject);
begin
pg.ActivePage:=tab1;
end;

procedure TfrmCADProdutos.cmdalterarClick(Sender: TObject);
begin
box2.enabled           := true;
tab1.TabVisible        := false;
cmdpesq.Enabled        := false;
cmdalterar.enabled     := false;
cmdconfirmar.enabled   := true;
cmdcancelaralt.enabled := true;
CMDEXCLUIR.Enabled     := false;
dbedit9.SetFocus;
dtProdutos.Edit;
end;

procedure TfrmCADProdutos.cmdexcluirClick(Sender: TObject);
begin
if messagedlg('Tem certeza que deseja excluir o produto '+TRIM(dtprodutos.fieldbyname('prodescricao').Value)+'?',mtinformation,[mbyes,mbno],0)=mryes then
  begin
   cmdexcluir.enabled :=false;
   cmdalterar.enabled :=false;
   dtprodutos.Delete;
   dtprodutos.Close;
   DM.TRANSACAO.COMMIT;
   frmsysprocedures.LimpaEdit(frmcadprodutos);
  end;
end;

procedure TfrmCADProdutos.cmdconfirmarClick(Sender: TObject);
begin
if dbedit6.text = '' then
 begin
  messagedlg('Digite o CÓDIGO!',mterror,[mbok],0);
  dbedit6.setfocus;
  exit;
 end;

if dbedit9.text = '' then
 begin
  messagedlg('Digite a DESCRIÇÃO!',mterror,[mbok],0);
  dbedit9.setfocus;
  exit;
 end;

if combofornecedor2.text = '' then
 begin
  MESSAGEDLG('Digite o FORNECEDOR!',mterror,[mbok],0);
  combofornecedor2.setfocus;
  exit;
 end;

 if combounidade2.text = '' then
 begin
  MESSAGEDLG('Escolha a UNIDADE DE MEDIDA!',mterror,[mbok],0);
  combounidade2.setfocus;
  exit;
 end;

 if combograde2.text = '' then
 begin
  MESSAGEDLG('Escolha a GRADE!',mterror,[mbok],0);
  combograde2.setfocus;
  exit;
 end;


if frmSYSProcedures.BuscaCombo('DATASET','FORNECEDORES','FORRAZAO',combofornecedor2.text,'FORNECEDOR','PROFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor2,dtProdutos) = 0 then exit;
if frmSYSProcedures.BuscaCombo('DATASET','GRADE','DESCRICAO',combograde2.text,'LINHA DO PRODUTO','prograde','ENCONTRAR_CODIGO',combograde2,dtProdutos) = 0 then exit;

qrydistinto.Close;
qrydistinto.SQL.clear;
qrydistinto.SQL.add('select * from medidas where simbolo = :psim');
qrydistinto.ParamByName('psim').Value := trim(combounidade2.Text);
qrydistinto.open;

if qrydistinto.eof then
 begin
  messagedlg('Campo UNIDADE DE MEDIDA está preenchido com um valor não cadastrado!',mterror,[mbok],0);
  combounidade2.SetFocus;
  exit;
 end;

dtprodutos.FieldByName('prodescricao').value  := trim(dbedit2.text);
dtprodutos.FieldByName('profornecedor').value := frmSYSProcedures.BuscaCombo('DATASET','FORNECEDORES','FORRAZAO',combofornecedor2.text,'FORNECEDOR','PROFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor2,dtProdutos);
dtprodutos.FieldByName('prograde').value      := frmSYSProcedures.BuscaCombo('DATASET','GRADE','DESCRICAO',combograde2.text,'LINHA DO PRODUTO','prograde','ENCONTRAR_CODIGO',combograde2,dtProdutos);
dtprodutos.FieldByName('prounidade').value    := trim(combounidade2.Text);

qrymeta.Close;
qrymeta.sql.clear;
qrymeta.sql.add('update metas');
qrymeta.sql.add('set prodescricao = :pDesc');
qrymeta.sql.add('where codproduto = :pcod');
qrymeta.ParamByName('pdesc').value :=dbedit9.text;
qrymeta.ParamByName('pcod').value  :=dbedit6.text;
qrymeta.open;

dtprodutos.applyupdates;
dtprodutos.close;
dm.TRANSACAO.commit;

box2.enabled           := false;
cmdconfirmar.Enabled   := false;
cmdcancelaralt.Enabled := false;
cmdalterar.Enabled     := false;
cmdpesq.enabled        := true;
tab1.TabVisible        := true;
frmsysprocedures.LimpaEdit(frmcadprodutos);
end;

procedure TfrmCADProdutos.cmdcancelaraltClick(Sender: TObject);
begin
dtprodutos.Cancel;
dtprodutos.close;

cmdconfirmar.enabled   := false;
cmdcancelaralt.enabled := false;
cmdalterar.enabled     := false;
cmdpesq.enabled        := true;
box2.Enabled           := false;
tab1.TabVisible        := true;

frmsysprocedures.LimpaEdit(frmcadprodutos);
end;

procedure TfrmCADProdutos.cmdpesqClick(Sender: TObject);
begin
frmsysprocedures.LimpaEdit(frmcadprodutos);
cmdalterar.Enabled :=false;
cmdexcluir.Enabled :=false;

 with frmSYSPesquisar do
  begin
    frmproduto:=true;
    bancodedados := 'produtos';
    Titulo := 'Localizar Produto';
    Campos := 'procodigo,prodescricao,codbarra,prounidade';
    GridTitulo := 'Código,Descrição,Cód.Barra,Unidade';
    GridTamanho := '4,40';
    PesqSize := '500';
    NoAutoUpdate := true;
    showmodal;

    if retorno then
     begin
      cmdalterar.enabled:=true;
      cmdexcluir.enabled:=true;
      frmsysprocedures.EncontraRegistro(dtprodutos,valor);

      with frmsysprocedures.QUERY do
       begin
        close;
        sql.Clear;
        sql.add('select * from fornecedores where forcodforn = :pcod');
        parambyname('pcod').value := dtprodutos.fieldbyname('profornecedor').Value;
        open;
        combofornecedor2.Text := fieldbyname('forrazao').Value;

        close;
        sql.Clear;
        sql.add('select * from grade where codigo = :pcod');
        parambyname('pcod').value := dtprodutos.fieldbyname('prograde').Value;
        open;
        combograde2.Text := fieldbyname('descricao').Value;
       end;
        combounidade2.Text := dtprodutos.fieldbyname('prounidade').Value
      end;
  end;
end;

procedure TfrmCADProdutos.FormCreate(Sender: TObject);
begin
frmsysprocedures.ConstroiCombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
frmsysprocedures.ConstroiCombo('select * from fornecedores order by forrazao','forrazao',combofornecedor2);
frmsysprocedures.ConstroiCombo('select * from grade order by descricao','descricao',combograde);
frmsysprocedures.ConstroiCombo('select * from grade order by descricao','descricao',combograde2);
frmsysprocedures.ConstroiCombo('select * from medidas order by simbolo','simbolo',combounidade);
frmsysprocedures.ConstroiCombo('select * from medidas order by simbolo','simbolo',combounidade2);

end;

procedure TfrmCADProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key = vk_f1) and (pg.activepage = tab1) and (cmdnovo.enabled = true) then
 begin
  cmdnovoClick(self);
  exit;
 end;

if (key = vk_f2) and (pg.activepage = tab1) and (cmdgravar.enabled = true) then
 begin
  cmdgravarClick(self);
  exit;
 end;

if (key = vk_f3) and (pg.activepage = tab1) and (cmdcancelar.enabled = true) then
 begin
  cmdcancelarClick(self);
  exit;
 end;



if key = vk_escape then close;
end;

procedure TfrmCADProdutos.combograde2Exit(Sender: TObject);
begin
dbedit9.SetFocus;
end;

procedure TfrmCADProdutos.combogradeExit(Sender: TObject);
begin
dbedit1.SetFocus;
end;

procedure TfrmCADProdutos.FormKeyPress(Sender: TObject; var Key: Char);
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

