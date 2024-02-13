unit untgrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, DB, ibx.IBCustomDataSet, ExtCtrls, TeeProcs,
  Chart, DbChart, TeeFunci, StdCtrls, ComCtrls, QuickRpt, QRCtrls, ibx.IbQuery,
  ibx.IBTable, Grids, DBGrids, Buttons, Mask, DBCtrls;

type
  TfrmRelatGrafico1 = class(TForm)
    edt2: TEdit;
    qryQtde: TIBQuery;
    Label2: TLabel;
    dt: TIBDataSet;
    dtCODPRODUTO: TIBStringField;
    dtCODFORNECEDOR: TIBStringField;
    dtCODVENDEDOR: TIBStringField;
    dtCODCLIENTE: TIBStringField;
    dtCODGRADE: TIBStringField;
    dtQTDE: TIntegerField;
    dtTOTAL: TFloatField;
    dtDESCRICAO: TIBStringField;
    dtCODIGO: TIntegerField;
    dtDATA: TDateTimeField;
    qryBanco: TIBQuery;
    qryTotal: TIBQuery;
    dtCliente: TIBTable;
    dsCliVen: TDataSource;
    qryCliVen: TIBQuery;
    qryCliVenCODVENDEDOR: TIBStringField;
    qryCliVenCODCLIENTE: TIBStringField;
    dtVendedor: TIBTable;
    dsPedidos: TDataSource;
    dtItens: TIBTable;
    qryPedidos: TIBQuery;
    dtItensCODPEDIDO: TIBStringField;
    dtItensCODPRODUTO: TIBStringField;
    dtItensQTDE: TFloatField;
    dtItensVALOR: TFloatField;
    dtItensDESCONTO1: TFloatField;
    dtItensGRADE: TIntegerField;
    dtItensDESCONTO2: TFloatField;
    dtItensDESCONTO3: TFloatField;
    dtD1: TFloatField;
    dtD2: TFloatField;
    dtD3: TFloatField;
    dsClientes: TDataSource;
    tree: TTreeView;
    Panel1: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    Panel3: TPanel;
    Label23: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Label30: TLabel;
    edtrazao: TEdit;
    edtendereco: TEdit;
    edtbairro: TEdit;
    edtcidade: TEdit;
    edtuf: TEdit;
    edttelefone: TEdit;
    edtcontato: TEdit;
    tree2: TTreeView;
    Panel4: TPanel;
    DBChart2: TDBChart;
    qry: TIBQuery;
    qryGrafico: TIBQuery;
    IBStringField1: TIBStringField;
    StringField1: TStringField;
    HorizBarSeries1: THorizBarSeries;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    combovendedor: TComboBox;
    Label6: TLabel;
    dtfim: TDateTimePicker;
    dtini: TDateTimePicker;
    Label5: TLabel;
    Shape2: TShape;
    button1: TSpeedButton;
    qryGraficoTOT: TFloatField;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    SpeedButton5: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure treeClick(Sender: TObject);
    procedure tree2Click(Sender: TObject);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure treeChange(Sender: TObject; Node: TTreeNode);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatGrafico1: TfrmRelatGrafico1;
  z,i:integer;

implementation

uses untMenu, untRelatPedidos2, untDM, frmRelatGrafico_Itens,
  untProcedures;

{$R *.dfm}

procedure TfrmRelatGrafico1.Button1Click(Sender: TObject);
var
Node1, Node2: TTreeNode;
begin
if combovendedor.Text = '' then
 begin
  messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
  combovendedor.SetFocus;
  exit;
 end;

if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

Tree.Items.Clear;

qrycliven.close;
qrycliven.ParamByName('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
qryCliven.open;

if qrycliven.Eof then
 begin
  messagedlg('O Vendedor: '+combovendedor.text+ ' não possui clientes!',mterror,[mbok],0);
  combovendedor.SetFocus;
  exit;
 end;

dtcliente.Open;
dtvendedor.open;

 while not qrycliven.eof do
  begin
    node1.ImageIndex := 37;
    if dtcliente.fieldbyname('razao').value <> null then
     begin
    if dtcliente.fieldbyname('razao').value <> '' then  Node1 := Tree.Items.Add(nil, dtcliente.fieldbyname('razao').value);
     end;


    node1.ImageIndex := 37;
    qrycliven.Next;
  end;

tree.SetFocus;
end;

procedure TfrmRelatGrafico1.treeClick(Sender: TObject);
var
Node1, Node2: TTreeNode;
vCod:string;
begin
 screen.Cursor := -11;
 dt.Open;
 if dt.RecordCount > 0 then dt.Delete;
 dm.TRANSATOTAL.Commit;

  with qryBanco do
   begin
    close;
    sql.clear;
    sql.add('select * from clientes where razao = :prazao');
    parambyname('prazao').Value := tree.Selected.Text;
    open;

    dtitens.close;

    try
     edtrazao.Text    := fieldbyname('razao').value;
     edttelefone.Text := fieldbyname('telefone').value;
     edtendereco.Text := fieldbyname('endereco').value;
     edtuf.Text       := fieldbyname('uf').value;
     edtcontato.Text  := fieldbyname('contato').value;
     edtbairro.Text   := fieldbyname('bairro').value;
     edtcidade.Text   := fieldbyname('cidade').value;
    except
    end;

    vCod:= fieldbyname('codigo').value;
   end;

  with qryPedidos do
   begin
    close;
    sql.Clear;
    sql.add('select * from pedidos where codcliente = :pcli and codvendedor = :pVen');
    sql.add('and data between :pIni and :pFIm');
    parambyname('pcli').Value := vCod;
    parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
    ParamByName('pini').value := datetostr(dtini.date);
    ParamByName('pfim').value := datetostr(dtfim.date);
    open;
    dtItens.open;
    dt.open;
    i:=1;

  while not qrypedidos.Eof do
   begin
    while not dtitens.Eof do
     begin
      dt.Append;
      dt.FieldByName('codigo').value         := i;
      dt.FieldByName('codproduto').value     := dtitens.fieldbyname('codproduto').value;
      dt.FieldByName('qtde').value           := dtitens.fieldbyname('qtde').value;
      dt.FieldByName('total').value          := dtitens.fieldbyname('valor').value;
      dt.FieldByName('d1').value             := dtitens.fieldbyname('desconto1').value;
      dt.FieldByName('d2').value             := dtitens.fieldbyname('desconto2').value;
      dt.FieldByName('d3').value             := dtitens.fieldbyname('desconto3').value;
      dt.FieldByName('data').Value           := qrypedidos.fieldbyname('data').Value;
      dt.FieldByName('codfornecedor').Value  := qrypedidos.fieldbyname('codfornecedor').Value;
      dt.post;
      dtitens.Next;
      i:=i+1;
     end;
    dtitens.close;
    qrypedidos.next;
    dtitens.open;
   end;
   dt.close;
   dm.TRANSATOTAL.Commit;
  end;

  with qryBanco do
   begin
    close;
    sql.clear;
    sql.add('select distinct(codfornecedor),forrazao from pedidos,fornecedores join fornecedores on fornecedores.forcodforn = pedidos.codfornecedor where codcliente = :pcli and codvendedor = :pVen and pedidos.data between :pini and :pfim');
    ParamByName('pini').value := datetostr(dtini.date);
    ParamByName('pfim').value := datetostr(dtfim.date);
    parambyname('pcli').Value := vCod;
    parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
    open;
    Tree2.Items.Clear;

    if eof then
     begin
      Node1 := Tree2.Items.Add(nil,'Não Possui compras.');
      node1.ImageIndex := 13;
      screen.Cursor := 0;
      exit;
     end;

  while not Eof do
    begin
     Node1 := Tree2.Items.Add(nil,fieldbyname('forrazao').value);
     node1.ImageIndex := 3;
     next;
    end;
  end;
 screen.Cursor := 0;
 qrygrafico.Open;
 dbchart2.Title.Text.Clear;
 dbchart2.Title.Text.Add('Compra de cada Fornecedor (R$) - ' + edtrazao.text);
end;

procedure TfrmRelatGrafico1.tree2Click(Sender: TObject);
begin
if tree2.Selected.Text = 'Não Possui compras.' then exit;
 
 with qrybanco do
  begin
   close;
   sql.clear;
   sql.add('select * from fornecedores where forrazao = :prazao');
   parambyname('prazao').value := tree2.Selected.Text;
   open;
  end;

  frmrelatgrafico2:=tfrmrelatgrafico2.create(self);
  frmrelatgrafico2.qry.parambyname('pcod').value := trim(qrybanco.fieldbyname('forcodforn').value);
  frmrelatgrafico2.qry.open;
  frmrelatgrafico2.showmodal;
  frmrelatgrafico2.free;
end;

procedure TfrmRelatGrafico1.qryCalcFields(DataSet: TDataSet);
begin
with qry do
 begin
  close;
  sql.clear;
  sql.add('SELECT * FROM FORNECEDORES WHERE FORCODFORN = :PCOD');
  parambyname('pcod').Value := qryGrafico.fieldbyname('codfornecedor').Value;
  open;
  qrygrafico.FieldByName('razao').Value := qry.Fieldbyname('forrazao').Value;
 end;
end;

procedure TfrmRelatGrafico1.FormCreate(Sender: TObject);
begin
dtini.date := incmonth(now,-1);
dtfim.Date := now;
frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
end;

procedure TfrmRelatGrafico1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if key = vk_return then Button1Click(self);
if key = vk_escape then close;
end;

procedure TfrmRelatGrafico1.FormShow(Sender: TObject);
begin
combovendedor.SetFocus;
end;

procedure TfrmRelatGrafico1.treeChange(Sender: TObject; Node: TTreeNode);
begin
treeClick(self);
end;

procedure TfrmRelatGrafico1.SpeedButton5Click(Sender: TObject);
begin
dbchart2.print;
end;

end.

