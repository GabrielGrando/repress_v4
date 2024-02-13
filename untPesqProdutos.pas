unit untPesqProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBCustomDataSet, ibx.IbQuery, Grids, DBGrids, StdCtrls, ExtCtrls,
  jpeg;

type
  TfrmPesqProdutos = class(TForm)
    Label1: TLabel;
    edt: TEdit;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    qry: TIBQuery;
    dsQry: TDataSource;
    qryPROCODIGO: TIBStringField;
    qryPRODESCRICAO: TIBStringField;
    qryPROFORNECEDOR: TIBStringField;
    qryPROUNIDADE: TIBStringField;
    qryPROGRADE: TIntegerField;
    Panel1: TPanel;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqProdutos: TfrmPesqProdutos;

implementation

uses untProdutos, untPedidos, untProcedures;

{$R *.dfm}

procedure TfrmPesqProdutos.DBGrid1DblClick(Sender: TObject);
begin
frmcadpedidos.dtItens.FieldByName('codproduto').Value:= qry.fieldbyname('procodigo').value;
frmcadpedidos.dbgrid1.SelectedIndex := 3;
frmcadpedidos.dbgrid2.selectedindex:= 3;
frmpesqprodutos.close;
end;

procedure TfrmPesqProdutos.edtChange(Sender: TObject);
begin
qry.close;
qry.parambyname('pProd').value:= '%' + edt.text + '%';
qry.open;
end;

procedure TfrmPesqProdutos.FormShow(Sender: TObject);
begin
qry.close;
qry.sql.clear;
qry.SQL.add('select * from produtos');
if frmcadpedidos.pg.activepage = frmcadpedidos.tab1
 then qry.SQL.add('where profornecedor =' +inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',frmcadpedidos.combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',frmcadpedidos.combofornecedor,frmcadpedidos.dtPedidos))+ 'and PRODESCRICAO like :pprod') else qry.SQL.add('where profornecedor =' +inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',frmcadpedidos.combofornecedor2.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',frmcadpedidos.combofornecedor2,frmcadpedidos.dtPedidos))+ 'and PRODESCRICAO like :pprod');
qry.SQL.add('order by prodescricao');
end;

procedure TfrmPesqProdutos.DBGrid1KeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin

if key = vk_return then DBGrid1DblClick(self);
end;

procedure TfrmPesqProdutos.edtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_down then dbgrid1.SetFocus; 
end;

end.
