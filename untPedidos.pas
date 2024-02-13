unit untPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBCustomDataSet, StdCtrls, Mask, DBCtrls, ibx.IbQuery, Buttons,
  ExtCtrls, ComCtrls, Grids, DBGrids, Menus,DBITYPES, jpeg, ibx.IBTable;

type
  TfrmCADPedidos = class(TForm)
    dtPedidos: TIBDataSet;
    dsPedidos: TDataSource;
    qryVendedor: TIBQuery;
    dtPedidosCODPEDIDO: TIBStringField;
    dtPedidosCODCLIENTE: TIntegerField;
    dtPedidosCODVENDEDOR: TIBStringField;
    dtPedidosCODFORNECEDOR: TIBStringField;
    dtPedidosCODTRANS: TIBStringField;
    dtPedidosTIPO_FRETE: TIBStringField;
    dtPedidosPRAZO_PGTO: TIntegerField;
    dtPedidosENTREGA: TDateTimeField;
    dtPedidosDATA: TDateTimeField;
    pg: TPageControl;
    tab1: TTabSheet;
    tab2: TTabSheet;
    box1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    fob: TRadioButton;
    cif: TRadioButton;
    dataentrega: TDateTimePicker;
    DBEdit8: TDBEdit;
    Shape1: TShape;
    DBEdit9: TDBEdit;
    dtItens: TIBDataSet;
    dsItens: TDataSource;
    LBLPEDIDO: TLabel;
    Timer1: TTimer;
    qryItens: TIBQuery;
    qryItensCODPEDIDO: TIBStringField;
    qryItensCODPRODUTO: TIBStringField;
    Pop: TPopupMenu;
    Excluiritem1: TMenuItem;
    Shape4: TShape;
    Shape5: TShape;
    boxbot: TGroupBox;
    boxalt: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit10: TDBEdit;
    GroupBox3: TGroupBox;
    fob2: TRadioButton;
    cif2: TRadioButton;
    DBEdit12: TDBEdit;
    Shape2: TShape;
    boxbotoes: TGroupBox;
    boxaltera: TGroupBox;
    Shape7: TShape;
    qryVendedorCODIGO: TIBStringField;
    qry: TIBQuery;
    dataentrega2: TDateTimePicker;
    DBEdit11: TDBEdit;
    Timer2: TTimer;
    qryVendedorNOME: TIBStringField;
    dtPedidosORDEM_DE_COMPRA: TIBStringField;
    dtPedidosBONIFICACAO: TIBStringField;
    dtPedidosOBS: TIBStringField;
    Label26: TLabel;
    DBEdit13: TDBEdit;
    Label34: TLabel;
    DBEdit15: TDBEdit;
    GroupBox2: TGroupBox;
    SIM2: TRadioButton;
    NAO2: TRadioButton;
    GroupBox4: TGroupBox;
    sim: TRadioButton;
    nao: TRadioButton;
    DBEdit16: TDBEdit;
    Label32: TLabel;
    DBEdit17: TDBEdit;
    Label35: TLabel;
    dtItensCODPEDIDO: TIBStringField;
    dtItensCODPRODUTO: TIBStringField;
    dtItensQTDE: TFloatField;
    dtItensVALOR: TFloatField;
    dtItensDESCONTO2: TFloatField;
    dtItensDESCONTO3: TFloatField;
    dtItensDESCONTO1: TFloatField;
    dtItensGRADE: TIntegerField;
    dtItensPRODESCRICAO: TIBStringField;
    dtItensPROUNIDADE: TIBStringField;
    dtItensPROGRADE: TIntegerField;
    dtItensTOTAL: TCurrencyField;
    dtItensdesconto: TCurrencyField;
    dbgrid2: TDBGrid;
    Image2: TImage;
    Image1: TImage;
    cmdnovo: TSpeedButton;
    cmdgravar: TSpeedButton;
    cmdcancelar: TSpeedButton;
    Image4: TImage;
    Label29: TLabel;
    Label30: TLabel;
    Bevel5: TBevel;
    lblitens2: TLabel;
    Bevel4: TBevel;
    lbltotal2: TLabel;
    SpeedButton6: TSpeedButton;
    fechar2: TSpeedButton;
    Image5: TImage;
    Label33: TLabel;
    edtcod: TEdit;
    cmdpesq: TSpeedButton;
    cmdalterar: TSpeedButton;
    cmdexcluir: TSpeedButton;
    cmdconfirmar: TSpeedButton;
    cmdcancelaralt: TSpeedButton;
    cmditens: TSpeedButton;
    Image6: TImage;
    Label23: TLabel;
    boxpedido: TGroupBox;
    Shape3: TShape;
    Label24: TLabel;
    Image3: TImage;
    Label25: TLabel;
    Bevel1: TBevel;
    lbltotal: TLabel;
    Label27: TLabel;
    lblitens: TLabel;
    Bevel3: TBevel;
    SpeedButton1: TSpeedButton;
    cmdterminar: TSpeedButton;
    DBGrid1: TDBGrid;
    Image7: TImage;
    lbl: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label36: TLabel;
    combofornecedor: TComboBox;
    combopagamento: TComboBox;
    combocliente: TComboBox;
    combovendedor: TComboBox;
    combocliente2: TComboBox;
    combovendedor2: TComboBox;
    combofornecedor2: TComboBox;
    combopagamento2: TComboBox;
    qryProdutos: TIBQuery;
    Shape6: TShape;
    Label22: TLabel;
    Image8: TImage;
    Label10: TLabel;
    qryProdutosPROCODIGO: TIBStringField;
    qryProdutosPRODESCRICAO: TIBStringField;
    qryProdutosPROFORNECEDOR: TIBStringField;
    qryProdutosPROUNIDADE: TIBStringField;
    qryProdutosPROGRADE: TIntegerField;
    qryProdutosCODBARRA: TIBStringField;
    Label2: TLabel;
    Label4: TLabel;
    dtPedidos2: TIBTable;
    dtItens2: TIBTable;
    dtPedidos2CODPEDIDO: TIBStringField;
    dtPedidos2CODCLIENTE: TIntegerField;
    dtPedidos2CODVENDEDOR: TIBStringField;
    dtPedidos2CODFORNECEDOR: TIBStringField;
    dtPedidos2CODTRANS: TIBStringField;
    dtPedidos2TIPO_FRETE: TIBStringField;
    dtPedidos2PRAZO_PGTO: TIntegerField;
    dtPedidos2ENTREGA: TDateTimeField;
    dtPedidos2DATA: TDateTimeField;
    dtPedidos2ORDEM_DE_COMPRA: TIBStringField;
    dtPedidos2BONIFICACAO: TIBStringField;
    dtPedidos2OBS: TIBStringField;
    dtItens2CODPEDIDO: TIBStringField;
    dtItens2CODPRODUTO: TIBStringField;
    dtItens2QTDE: TFloatField;
    dtItens2VALOR: TFloatField;
    dtItens2DESCONTO1: TFloatField;
    dtItens2GRADE: TIntegerField;
    dtItens2DESCONTO2: TFloatField;
    dtItens2DESCONTO3: TFloatField;
    chEnter: TCheckBox;
    SpeedButton2: TSpeedButton;
    procedure cmdnovoClick(Sender: TObject);
    procedure cmdgravarClick(Sender: TObject);
    procedure cmdcancelarClick(Sender: TObject);
    procedure dataentregaChange(Sender: TObject);
    procedure dtItensCODPRODUTOChange(Sender: TField);
    procedure Novo1Click(Sender: TObject);
    procedure Gravar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtItensAfterPost(DataSet: TDataSet);
    procedure dtItensBeforePost(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure Excluiritem1Click(Sender: TObject);
    procedure cmdterminarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dtItensCalcFields(DataSet: TDataSet);
    procedure dtItensAfterDelete(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cmdpesqClick(Sender: TObject);
    procedure cmdalterarClick(Sender: TObject);
    procedure cmditensClick(Sender: TObject);
    procedure cmdconfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgChange(Sender: TObject);
    procedure cmdcancelaraltClick(Sender: TObject);
    procedure fechar2Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dbgrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcodChange(Sender: TObject);
    procedure DBEdit10KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit17Exit(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure limpar;
    procedure dtItensAfterOpen(DataSet: TDataSet);

 private
    { Private declarations }
  public
    vHerancaEspelho : boolean;
    Function CalculaTotal :Integer;
  end;

var
  frmCADPedidos: TfrmCADPedidos;
  vControle:boolean;
  Desconto:real;
  Total:Real;
  Altera:Boolean;
  Aux:Real;
  vCodigoItem : string;

implementation

uses untMenu, untDM,
  untPesqProdutos, untProcedures, untExcel;

{$R *.dfm}

procedure TfrmCADPedidos.cmdnovoClick(Sender: TObject);
begin
dtPedidos.Open;
dtPedidos.Append;

box1.Enabled        := true;
dbedit9.text        := datetostr(date);
cmdnovo.Enabled     := false;
cmdgravar.enabled   := true;
cmdcancelar.Enabled := true;
tab2.tabVisible     := false;
dbedit1.SetFocus;
end;

procedure TfrmCADPedidos.cmdgravarClick(Sender: TObject);
begin

if dbedit1.text = '' then
 begin
  Messagedlg('Digite o C�DIGO DO PEDIDO!',mterror,[mbok],0);
  dbedit1.setfocus;
  exit;
 end;

if Combocliente.Text = '' then
 begin
  messagedlg('Digite o CLIENTE!',mterror,[mbok],0);
  combocliente.setfocus;
  exit;
 end;

if combovendedor.text = '' then
 begin
  messagedlg('Digite o VENDEDOR!',mterror,[mbok],0);
  COMBOVENDEDOR.setfocus;
  exit;
 end;

if combofornecedor.text = '' then
 begin
  messagedlg('Digite o FORNECEDOR!',mterror,[mbok],0);
  COMBOfornecedor.setfocus;
  exit;
 end;

if combopagamento.text = '' then
 begin
  messagedlg('Digite a FORMA DE PAGAMENTO!',mterror,[mbok],0);
  COMBOpagamento.setfocus;
  exit;
 end;

if dbedit8.text = '' then
 begin
  messagedlg('Digite a DATA DE ENTREGA!',mterror,[mbok],0);
  dbedit8.SetFocus;
  exit;
 end;

if dbedit9.text = '' then
 begin
  messagedlg('Digite a DATA DO CADASTRO!',mterror,[mbok],0);
  dbedit9.SetFocus;
  exit;
 end;

if strtodate(dbedit8.Text) < strtodate(dbedit9.text) then
 begin
  MESSAGEDLG('DATA DE ENTREGA n�o pode ser menor que a DATA DO CADASTRO!',mterror,[mbok],0);
  dbedit8.setfocus;
  exit;
 end;

if frmSYSProcedures.BuscaCombo('DATASET','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,dtPedidos) = 0 then exit;
if frmSYSProcedures.BuscaCombo('DATASET','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,dtPedidos) = 0 then exit;
if frmSYSProcedures.BuscaCombo('DATASET','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,dtPedidos) = 0 then exit;
if frmSYSProcedures.BuscaCombo('DATASET','PAGAMENTO','DESCRICAO',combopagamento.text,'FORMA DE PAGAMENTO','PRAZO_PGTO','ENCONTRAR_CODIGO',combopagamento,dtPedidos) = 0 then exit;

if sim.Checked = true then dtpedidos.FieldByName('bonificacao').Value := 'SIM' else dtpedidos.FieldByName('bonificacao').Value := 'NAO';
if fob.Checked = true then dtpedidos.FieldByName('tipo_frete').Value  := 'FOB' else dtpedidos.FieldByName('tipo_frete').Value  := 'CIF';

dtpedidos.FieldByName('codtrans').value      := 1;
dtpedidos.FieldByName('codvendedor').value   := frmSYSProcedures.BuscaCombo('DATASET','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,dtPedidos);
dtpedidos.FieldByName('codfornecedor').value := frmSYSProcedures.BuscaCombo('DATASET','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,dtPedidos);
dtpedidos.FieldByName('codcliente').value    := frmSYSProcedures.BuscaCombo('DATASET','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,dtPedidos);
dtpedidos.FieldByName('prazo_pgto').value    := frmSYSProcedures.BuscaCombo('DATASET','PAGAMENTO','DESCRICAO',combopagamento.text,'FORMA DE PAGAMENTO','PRAZO_PGTO','ENCONTRAR_CODIGO',combopagamento,dtPedidos);

IF frmsysprocedures.TestaChave('codpedido','pedidos',dbedit1.text,'PEDIDO') = 1 then
 begin
  dbedit1.setfocus;
  exit;
 end;

if messagedlg('Tem certeza que deseja incluir o pedido?',mtinformation,[mbyes,mbno],0)=mryes then
 begin
  lblpedido.caption:= dbedit1.text;
  lbl.caption:= 'Itens do Pedido N�'+lblpedido.Caption;

  dtpedidos.Post;
  dtpedidos.close;
  dm.transacao.commit;

  Altera:=FALSE;
  boxpedido.Enabled   :=true;
  boxbot.Enabled      :=false;
  box1.Enabled        :=false;
  cmdnovo.Enabled     :=true;
  cmdgravar.enabled   :=false;
  cmdcancelar.enabled :=false;
  cmdterminar.Enabled :=true;

  dtitens.Open;
  dtitens.Append;
  dbgrid1.SelectedIndex := 0;
  dbgrid1.SetFocus;
 end;
end;

procedure TfrmCADPedidos.cmdcancelarClick(Sender: TObject);
begin
cmdgravar.Enabled   := false;
cmdcancelar.Enabled := false;
cmdnovo.Enabled     := true;
box1.enabled        := false;
tab2.TabVisible     := true;

dtPedidos.Cancel;
dtPedidos.Close;
dm.transacao.Rollback;
limpar;
end;

procedure TfrmCADPedidos.dataentregaChange(Sender: TObject);
begin
dbedit8.Text :=datetostr(dataentrega.date);
end;

procedure TfrmCADPedidos.dtItensCODPRODUTOChange(Sender: TField);
begin
qryItens.Close;
qryItens.ParamByName('pProd').value := dtitensCODPRODUTO.value;
qryItens.ParamByName('pCod').value  := lblPedido.caption;
qryItens.Open;

qryProdutos.Close;
qryProdutos.ParamByName('pCodigo').value := dtitensCODPRODUTO.value;
if pg.ActivePage = tab1 then qryProdutos.ParamByName('pFor').value    := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,dtPedidos) else qryProdutos.ParamByName('pFor').value    := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor2.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor2,dtPedidos);
qryProdutos.Open;

if qryProdutos.Eof then
 begin
  vControle := FALSE;
  EXIT;
 end else begin
  vcontrole := TRUE;
  dtitensPRODESCRICAO.VALUE := qryProdutos.fieldbyname('PRODESCRICAO').VALUE;
  dtitensPROUNIDADE.VALUE   := qryProdutos.fieldbyname('PROUNIDADE').VALUE;
 end;
end;

procedure TfrmCADPedidos.Novo1Click(Sender: TObject);
begin
dtitens.Open;
dtitens.Append;
dbgrid1.SelectedIndex :=0;
end;

procedure TfrmCADPedidos.Gravar1Click(Sender: TObject);
begin
dtitens.post;
frmsysprocedures.EncontraRegistro(dtitens,lblpedido.caption);
end;


procedure TfrmCADPedidos.FormCreate(Sender: TObject);
begin
with frmsysprocedures do
 begin
  constroicombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
  constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
  constroicombo('select * from clientes order by razao','razao',combocliente);
  constroicombo('select * from pagamento order by descricao','descricao',combopagamento);
  constroicombo('select * from fornecedores order by forrazao','forrazao',combofornecedor2);
  constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor2);
  constroicombo('select * from clientes order by razao','razao',combocliente2);
  constroicombo('select * from pagamento order by descricao','descricao',combopagamento2);
 end;

dbgrid2.SelectedIndex := 4;
dbgrid1.SelectedIndex := 4;
application.OnException :=frmsysprocedures.Trataerros;
aux:=0;
vHerancaEspelho := false;
end;

procedure TfrmCADPedidos.dtItensAfterPost(DataSet: TDataSet);
begin
CalculaTotal;
dtitens.Close;
dm.TRANSACAO.commit;

frmsysprocedures.EncontraRegistro(dtitens,lblpedido.caption);
lblitens.caption:=inttostr(dtitens.RecordCount);
desconto:=0;
end;

procedure TfrmCADPedidos.dtItensBeforePost(DataSet: TDataSet);
begin
dtitens.FieldByName('codpedido').Value :=lblpedido.Caption;
qryItens.Close;
qryItens.ParamByName('pProd').value    := dtitensCODPRODUTO.value;
qryItens.ParamByName('pCod').value     := lblPedido.caption;
qryItens.Open;

qryProdutos.Close;
qryProdutos.ParamByName('pCodigo').value := dtitensCODPRODUTO.value;
if pg.ActivePage = tab1 then qryProdutos.ParamByName('pFor').value    := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,dtPedidos) else qryProdutos.ParamByName('pFor').value    := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor2.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor2,dtPedidos);
qryProdutos.Open;

if qryProdutos.Eof then
 begin
  vControle := FALSE;
  EXIT;
 end else begin
  vControle := TRUE;
  dtitensPRODESCRICAO.VALUE := qryProdutos.fieldbyname('PRODESCRICAO').VALUE;
  dtitensPROUNIDADE.VALUE   := qryProdutos.fieldbyname('PROUNIDADE').VALUE;
 end;

dtitens.FieldByName('grade').value:=qryprodutos.fieldbyname('prograde').value;
vCodigoItem := dtItensCodProduto.value;
end;

procedure TfrmCADPedidos.Timer1Timer(Sender: TObject);
begin
 if not(qryitens.Eof)  and (dbgrid1.SelectedIndex = 3) then
  begin
   timer1.Enabled :=false;
   messagedlg('PRODUTO j� inclu�do nesse pedido!',mterror,[mbok],0);
   dtitens.Cancel;
   qryitens.Close;
   dtitens.Append;
   dbgrid1.selectedindex:=0;
   timer1.Enabled := true;
  end;

 if (dbgrid1.SelectedIndex = 3) and (vControle =  FALSE) then
  begin
   timer1.Enabled :=false;
   messagedlg('Produto n�o inclu�do porque n�o pertence ao FORNECEDOR escolhido ou N�O FOI CADASTRADO!',mterror,[mbok],0);
   dbgrid1.selectedindex:=0;
   dtitens.Cancel;
   dtitens.Append;
   vControle:=TRUE;
   timer1.Enabled :=true;
  end;
end;

procedure TfrmCADPedidos.Excluiritem1Click(Sender: TObject);
begin
dtitens.Delete;
dm.TRANSACAO.Commit;
frmsysprocedures.EncontraRegistro(dtitens,lblpedido.caption);
end;

procedure TfrmCADPedidos.cmdterminarClick(Sender: TObject);
begin
dm.transacao.Commit;
dtitens.close;
dtpedidos.Close;

NAO.Checked         := true;
boxbot.Enabled      := true;
tab2.Tabvisible     := true;
box1.Enabled        := true;
boxpedido.Enabled   := false;
cmdterminar.Enabled := false;

lbltotal.caption    := 'R$ 0';
lblitens.caption    := '0';
lbl.Caption         := 'Itens do Pedido';
TOTAL               := 0;
limpar;
end;

procedure TfrmCADPedidos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if cmdnovo.Enabled = false then
 begin
  canclose:=false;
  messagedlg('Antes de fechar � necess�rio finalizar a opera��o clicando em Cancelar ou Gravar',mterror,[mbok],0);
 end;

if ((cmdalterar.Enabled = false) and (cmdcancelaralt.enabled = true)) then
 begin
  canclose:=false;
  messagedlg('Antes de fechar � necess�rio finalizar a opera��o clicando em Cancelar ou Confirmar altera��o',mterror,[mbok],0);
 end;

if boxpedido.Enabled = true then
 begin
  canclose:=false;
  messagedlg('Antes de finalizar � necess�rio Fechar o pedido!',mterror,[mbok],0);
 end;

if boxaltera.Enabled = true then
 begin
  canclose:=false;
  messagedlg('Antes de finalizar � necess�rio Fechar o pedido!',mterror,[mbok],0);
 end;
end;

procedure TfrmCADPedidos.dtItensCalcFields(DataSet: TDataSet);
begin
dtitenstotal.value:=((dtitensqtde.Value * dtitensvalor.Value) - (dtitensqtde.Value * dtitensvalor.Value * (dtitensdesconto1.value/100)));
dtitenstotal.value:=((dtitenstotal.Value) - (dtitenstotal.Value * (dtitensdesconto2.value/100)));
dtitenstotal.value:=((dtitenstotal.Value) - (dtitenstotal.Value * (dtitensdesconto3.value/100)));
end;

procedure TfrmCADPedidos.dtItensAfterDelete(DataSet: TDataSet);
begin
dm.TRANSACAO.Commit;
lblitens.Caption:=inttostr(dtitens.recordcount);
CalculaTotal;
cmdpesqClick(self);
end;

Function TfrmCADPedidos.CalculaTotal :integer;
Var
  VarTot:Real;
  VarPonto:Integer;
Begin
VarTot:=0;
VarPonto:=0;
dtitens.open;
dtItens.First;

While Not dtItens.eof do
  begin
   VarTot:=VarTot+dtItensTotal.Value;
   dtItens.Next;
  end;

  if Altera = FALSE THEN
   begin
    lblitens.caption:=inttostr(dtitens.RecordCount);
    lbltotal.Caption:=FloatToStrf(VarTot,ffcurrency,18,2);
    Result:=VarPonto;
   end else begin
    lbltotal2.Caption:=FloatToStrf(VarTot,ffcurrency,18,2);
    lblitens2.caption:=inttostr(dtitens.RecordCount);
   end;
end;

procedure TfrmCADPedidos.SpeedButton1Click(Sender: TObject);
begin
frmEXPExcel := tfrmEXPExcel.create(self);
frmEXPExcel.edtcod.Text :=  edtcod.text;
frmEXPExcel.showmodal;
frmEXPExcel.free;
end;

procedure TfrmCADPedidos.cmdpesqClick(Sender: TObject);
begin
DTPEDIDOS.CLOSE;
DTPEDIDOS.ParamByName('PCOD').VALUE := EDTCOD.TEXT;
DTPEDIDOS.Open;

if dtPedidos.eof then
 begin

  cmdalterar.enabled:=false;
  cmdexcluir.Enabled :=false;
  messagedlg('Pedido n�o cadastrado!',mterror,[mbok],0);
  edtcod.SetFocus;
 end else begin
  frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','CODIGO',dtpedidos.fieldbyname('codcliente').value,'REGISTRO CORROMPIDO','RAZAO','ENCONTRAR_DESCRICAO',comboCliente2,dtPedidos);
  frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','CODIGO',dtpedidos.fieldbyname('codvendedor').value,'REGISTRO CORROMPIDO','NOME','ENCONTRAR_DESCRICAO',combovendedor2,dtPedidos);
  frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORCODFORN',dtpedidos.fieldbyname('codfornecedor').value,'REGISTRO CORROMPIDO','FORRAZAO','ENCONTRAR_DESCRICAO',combofornecedor2,dtPedidos);
  frmSYSProcedures.BuscaCombo('PESQUISA','PAGAMENTO','CODIGO',dtpedidos.fieldbyname('prazo_pgto').value,'REGISTRO CORROMPIDO','DESCRICAO','ENCONTRAR_DESCRICAO',combopagamento2,dtPedidos);

  if dtpedidos.FieldByName('tipo_frete').Value =  'FOB' then fob2.checked :=true else cif2.checked:=true;
  if dtpedidos.FieldByName('bonificacao').Value = 'SIM' then SIM2.checked :=true else NAO2.checked:=true;

  frmsysprocedures.EncontraRegistro(dtitens,dtpedidos.fieldbyname('codpedido').value);

  Altera             := true;
  cmdalterar.enabled := true;
  cmdexcluir.Enabled := true;
  cmditens.Enabled   := true;
  label23.caption    := 'Itens do Pedido N� '+dtpedidos.fieldbyname('codpedido').value;
  boxalt.Enabled     := false;
  calculatotal;
 end;
end;

procedure TfrmCADPedidos.cmdalterarClick(Sender: TObject);
begin
cmditens.Enabled       := false;
boxalt.Enabled         := true;
cmdalterar.Enabled     := false;
cmdexcluir.enabled     := false;
cmdConfirmar.Enabled   := true;
cmdcancelaralt.Enabled := true;
cmdpesq.Enabled        := false;
tab1.TabVisible        := false;
dbedit10.Enabled       := true;
try
dbedit10.SetFocus;
except
end;
dtpedidos.Edit;
end;

procedure TfrmCADPedidos.cmditensClick(Sender: TObject);
begin
lblpedido.Caption     := dtpedidos.fieldbyname('codpedido').value;
tab1.tabVisible       := false;
boxbotoes.Enabled     := false;
boxaltera.Enabled     := true;
boxalt.Enabled        := false;
cmditens.Enabled      := false;
fechar2.enabled       := true;

dbgrid2.SelectedIndex := 0;
dbgrid2.SetFocus;
end;

procedure TfrmCADPedidos.cmdconfirmarClick(Sender: TObject);
begin
if Combocliente2.Text = '' then
 begin
  messagedlg('Digite o CLIENTE!',mterror,[mbok],0);
  combocliente2.setfocus;
  exit;
 end;

if combovendedor2.text = '' then
 begin
  messagedlg('Digite o VENDEDOR!',mterror,[mbok],0);
  COMBOVENDEDOR2.setfocus;
  exit;
 end;

if combopagamento2.text = '' then
 begin
  messagedlg('Digite a FORMA DE PAGAMENTO!',mterror,[mbok],0);
  COMBOpagamento2.setfocus;
  exit;
 end;

if dbedit11.text = '' then
 begin
  messagedlg('Digite a DATA DE ENTREGA!',mterror,[mbok],0);
  dbedit11.SetFocus;
  exit;
 end;

if dbedit12.text = '' then
 begin
  messagedlg('Digite a DATA DO CADASTRO!',mterror,[mbok],0);
  dbedit12.SetFocus;
  exit;
 end;

if strtodate(dbedit11.Text) < strtodate(dbedit12.text) then
 begin
  MESSAGEDLG('DATA DE ENTREGA n�o pode ser menor que a DATA DO CADASTRO!',mterror,[mbok],0);
  dbedit11.setfocus;
  exit;
 end;

if frmSYSProcedures.BuscaCombo('DATASET','CLIENTES','RAZAO',combocliente2.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente2,dtPedidos) = 0 then exit;
if frmSYSProcedures.BuscaCombo('DATASET','FUNCIONARIOS','NOME',combovendedor2.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor2,dtPedidos) = 0 then exit;
if frmSYSProcedures.BuscaCombo('DATASET','FORNECEDORES','FORRAZAO',combofornecedor2.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor2,dtPedidos) = 0 then exit;
if frmSYSProcedures.BuscaCombo('DATASET','PAGAMENTO','DESCRICAO',combopagamento2.text,'FORMA DE PAGAMENTO','PRAZO_PGTO','ENCONTRAR_CODIGO',combopagamento2,dtPedidos) = 0 then exit;


if messagedlg('Tem certeza que deseja atualizar o pedido?',mtinformation,[mbyes,mbno],0)=mryes then
 begin
  if sim2.Checked = true then dtpedidos.FieldByName('bonificacao').Value := 'SIM' else dtpedidos.FieldByName('bonificacao').Value := 'NAO';
  if fob2.Checked = true then dtpedidos.FieldByName('tipo_frete').Value  := 'FOB' else dtpedidos.FieldByName('tipo_frete').Value  := 'CIF';

  dtpedidos.FieldByName('codtrans').value      := 1;
  dtpedidos.FieldByName('codvendedor').value   := frmSYSProcedures.BuscaCombo('DATASET','FUNCIONARIOS','NOME',combovendedor2.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor2,dtPedidos);
  dtpedidos.FieldByName('codfornecedor').value := frmSYSProcedures.BuscaCombo('DATASET','FORNECEDORES','FORRAZAO',combofornecedor2.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor2,dtPedidos);
  dtpedidos.FieldByName('codcliente').value    := frmSYSProcedures.BuscaCombo('DATASET','CLIENTES','RAZAO',combocliente2.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente2,dtPedidos);
  dtpedidos.FieldByName('prazo_pgto').value    := frmSYSProcedures.BuscaCombo('DATASET','PAGAMENTO','DESCRICAO',combopagamento2.text,'FORMA DE PAGAMENTO','PRAZO_PGTO','ENCONTRAR_CODIGO',combopagamento2,dtPedidos);

  dtpedidos.ApplyUpdates;
  dtpedidos.close;
  dm.TRANSACAO.commit;

  cmdconfirmar.Enabled   := false;
  cmdcancelaralt.Enabled := false;
  cmdalterar.Enabled     := false;
  cmdpesq.enabled        := true;
  tab1.TabVisible        := true;
  edtcod.enabled         := true;
  boxalt.enabled         := false;
  lbltotal2.Caption      := 'R$ 0';
  lblitens2.Caption      := '0';
  cmdpesqClick(self);
  edtcod.SetFocus;
 end;
end;



procedure TfrmCADPedidos.FormShow(Sender: TObject);
begin
frmcadpedidos.Caption := 'Entrada de pedidos - '+datetostr(now);
pg.ActivePage := tab1;

if vHerancaEspelho = true then
 begin
  cmdpesqClick(self);
  cmdalterarClick(self);
 end;

end;

procedure TfrmCADPedidos.pgChange(Sender: TObject);
begin
dbgrid2.SelectedIndex := 4;

if pg.ActivePage = tab2 then edtcod.SetFocus;

cmdalterar.Enabled :=false;
cmdexcluir.Enabled :=false;
cmditens.Enabled   :=false;

label23.Caption    :='Itens do Pedido';
lbltotal2.Caption  :='R$ 0';
lbltotal.Caption   :='R$ 0';
lblitens2.Caption  :='0';
lblitens.Caption   :='0';

if dtitens.active= true    then dtitens.close;
if dtpedidos.active = true then dtpedidos.close;
vControle := true;
limpar;
end;

procedure TfrmCADPedidos.cmdcancelaraltClick(Sender: TObject);
begin
dtpedidos.Cancel;
dtpedidos.close;
dtitens.close;

cmdconfirmar.enabled   :=false;
cmdcancelaralt.enabled :=false;
cmdalterar.enabled     :=false;
cmdpesq.enabled        :=true;
tab1.TabVisible        :=true;
boxalt.enabled         :=false;

lbltotal2.Caption      :='R$ 0';
lblitens2.Caption      :='0';
label23.caption        :='Itens do Pedido';
limpar;

edtcod.SetFocus;
end;

procedure TfrmCADPedidos.fechar2Click(Sender: TObject);
begin
dtitens.close;
dtpedidos.close;

cmdconfirmar.enabled := false;
cmdalterar.enabled   := false;
cmdexcluir.enabled   := false;
boxaltera.Enabled    := false;
tab1.tabVisible      := true;
fechar2.Enabled      := false;
boxbotoes.enabled    := true;
boxalt.enabled       := false;

dbgrid2.SelectedIndex := 4;
label23.caption       := 'Itens do Pedido';
lbltotal2.Caption     := 'R$ 0';
lblitens2.Caption     := '0';
limpar;

edtcod.SetFocus;
end;

procedure TfrmCADPedidos.Timer2Timer(Sender: TObject);
begin
if not(qryitens.Eof)  and (dbgrid2.SelectedIndex = 3) then
  begin
   timer2.Enabled :=false;
   messagedlg('PRODUTO j� inclu�do nesse pedido!',mterror,[mbok],0);
   dtitens.Cancel;
   qryitens.Close;
   dtitens.Append;
   dbgrid2.selectedindex:=0;
   timer2.Enabled := true;
  end;

 if (dbgrid2.SelectedIndex = 3) and (vControle =  FALSE) then
  begin
   timer2.Enabled :=false;
   messagedlg('Produto n�o inclu�do porque n�o pertence ao FORNECEDOR escolhido ou N�O FOI CADASTRADO!',mterror,[mbok],0);
   dbgrid2.selectedindex:=0;
   dtitens.Cancel;
   dtitens.Append;
   vControle:=TRUE;
   timer2.Enabled :=true;
  end;
end;

procedure TfrmCADPedidos.SpeedButton2Click(Sender: TObject);
begin
if Messagedlg('Tem certeza que deseja excluir o Pedido N�'+dbedit10.text+' ?',mtconfirmation,[mbyes,mbno],0) = mryes then
 begin
  if dtitens.RecordCount > 0 then dtitens.Delete;
  frmsysprocedures.EncontraRegistro(dtpedidos,edtcod.text);
  qry.close;
  qry.SQL.clear;
  qry.sql.add('delete from itens_comissao where codpedido = :pcod');
  qry.ParamByName('pcod').value := dtpedidos.fieldbyname('codpedido').value;
  qry.open;
  frmsysprocedures.EncontraRegistro(dtpedidos,edtcod.text);
  dtpedidos.Delete;
  dm.transacao.commit;

  edtcod.SetFocus;
  cmditens.Enabled := false;
  limpar;
 end;
end;

procedure TfrmCADPedidos.dbgrid2KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
  with TDBGrid(ActiveControl) do
   begin
    if selectedindex = 7 then
     begin
      selectedindex := 8;
      if chEnter.Checked = true then  dtitens.Append;
      selectedindex:=0;
      exit;
     end;
    if selectedindex = 7 then selectedindex := 8;
    if selectedindex = 6 then selectedindex := 7;
    if selectedindex = 5 then selectedindex := 6;
    if selectedindex = 4 then selectedindex := 5;
    if selectedindex = 3 then selectedindex := 4;
    if selectedindex = 2 then selectedindex :=3;
    if selectedindex = 1 then selectedindex :=3;
    if selectedindex = 0 then selectedindex:= 3;
  end;
end;
end;

procedure TfrmCADPedidos.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
  with TDBGrid(ActiveControl) do
   begin
    if selectedindex = 7 then
     begin
      selectedindex := 8;
      dtitens.Append;
      selectedindex:=0;
      exit;
     end;
    if selectedindex = 7 then selectedindex := 8;
    if selectedindex = 6 then selectedindex := 7;
    if selectedindex = 5 then selectedindex := 6;
    if selectedindex = 4 then selectedindex := 5;
    if selectedindex = 3 then selectedindex := 4;
    if selectedindex = 2 then selectedindex :=3;
    if selectedindex = 1 then selectedindex :=3;
    if selectedindex = 0 then selectedindex:= 3;
  end;
end;
end;

procedure TfrmCADPedidos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (key = vk_f4) and ((dbgrid1.SelectedIndex = 0) or (dbgrid2.SelectedIndex = 0)) then
  begin
   frmPesqProdutos:=tfrmPesqProdutos.create(self);
   dtitens.Edit;
   frmPesqProdutos.showmodal;
   frmPesqProdutos.free;
  end;

 if (key = vk_f1)     and (cmdgravar.Enabled = false) and (pg.ActivePage = tab1) then cmdnovoClick(self);
 if (key = vk_f2)     and (cmdnovo.Enabled = false)   and (pg.ActivePage = tab1) then cmdgravarClick(self);
 if (key = vk_f3)     and (cmdgravar.Enabled = true)  and (pg.ActivePage = tab1) then cmdcancelarClick(self);
 if (key = vk_escape) and (boxpedido.Enabled = true)  and (pg.ActivePage = tab1) then cmdterminarClick(self);

 if (key = vk_return) and (boxbotoes.Enabled = true)      and (cmdpesq.Enabled = true)   and (pg.ActivePage = tab2)     then cmdpesqClick(self);
 if (key = vk_f1)     and (cmdalterar.Enabled = true)     and (boxbotoes.Enabled = true) and (pg.ActivePage = tab2)     then cmdalterarClick(self);
 if (key = vk_delete) and (cmdexcluir.Enabled = true)     and (boxbotoes.Enabled = true) and (pg.ActivePage = tab2)     then SpeedButton2Click(self);
 if (key = vk_f5)     and (cmdconfirmar.Enabled = true)   and (pg.ActivePage = tab2)     and (boxbotoes.Enabled = true) then cmdconfirmarClick(self);
 if (key = vk_f6)     and (cmdcancelaralt.Enabled = true) and (pg.ActivePage = tab2)     and (boxbotoes.Enabled = true) then cmdcancelaraltClick(self);
 if (key = vk_f7)     and (cmditens.Enabled = true)       and (pg.ActivePage = tab2)     and (boxbotoes.Enabled = true) then cmditensClick(self);
 if (key = vk_escape) and (boxaltera.Enabled = true)      and (pg.ActivePage = tab2)                                    then fechar2Click(self);
end;

procedure TfrmCADPedidos.edtcodChange(Sender: TObject);
begin
dtpedidos.Cancel;
dtpedidos.close;
dtitens.close;

cmdconfirmar.enabled   := false;
cmdcancelaralt.enabled := false;
cmdalterar.enabled     := false;
cmdpesq.enabled        := true;
tab1.TabVisible        := true;
cmdexcluir.Enabled     := false;
cmditens.Enabled       := false;
boxalt.enabled         := false;

lbltotal2.Caption      := 'R$ 0';
lblitens2.Caption      := '0';
label23.caption        := 'Itens do Pedido';
limpar;

//edtcod.SetFocus;
end;

procedure TfrmCADPedidos.DBEdit10KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 begin
  if not (ActiveControl is TDBGrid) then
    begin
     key := #0;
     Perform(WM_NEXTDLGCTL, 0, 0);
    end else begin
     if (ActiveControl is TDBGrid) then  if TDBGrid(ActiveControl).selectedindex < (TDBGrid(ActiveControl).fieldcount -1) then  TDBGrid(ActiveControl).selectedindex := TDBGrid(ActiveControl).selectedindex +1 else TDBGrid(ActiveControl).selectedindex := 0;
   end;
 end;
end;

procedure TfrmCADPedidos.DBEdit17Exit(Sender: TObject);
begin
dbedit1.SetFocus;
end;

procedure TfrmCADPedidos.DBEdit15Exit(Sender: TObject);
begin
dbedit13.SetFocus;
end;

procedure tfrmcadpedidos.Limpar;
begin
combocliente.text     := '';
combofornecedor.text  := '';
combovendedor.text    := '';
combopagamento.text   := '';
combocliente2.text    := '';
combofornecedor2.text := '';
combovendedor2.text   := '';
combopagamento2.text  := '';
end;


procedure TfrmCADPedidos.dtItensAfterOpen(DataSet: TDataSet);
begin
dtitens.LocateNext('CODPRODUTO',vCodigoItem, [lopartialkey]);
end;

end.
