unit untRelatgrafico4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBCustomDataSet, ibx.IbQuery, TeEngine, Series, ExtCtrls,
  TeeProcs, Chart, DbChart, Buttons;

type
  TfrmRelatGrafico4 = class(TForm)
    DBChart1: TDBChart;
    qryJoin: TIBQuery;
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
    dtD1: TFloatField;
    dtD2: TFloatField;
    dtD3: TFloatField;
    qryJoinCODIGO: TIntegerField;
    qryJoinQTDE: TFloatField;
    qryJoinTOTAL: TFloatField;
    qry: TIBQuery;
    dtRAZAO: TStringField;
    DBChart2: TDBChart;
    BarSeries2: THorizBarSeries;
    BarSeries1: THorizBarSeries;
    SpeedButton5: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure dtCalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    vMenu :string;
  end;

var
  frmRelatGrafico4: TfrmRelatGrafico4;

implementation

uses untDM;

{$R *.dfm}

procedure TfrmRelatGrafico4.FormShow(Sender: TObject);
var
 i:integer;
begin

dt.open;
if dt.RecordCount > 0 then dt.delete;
dm.TRANSATOTAL.Commit;

if vMenu = 'QTDE' then
 begin
  with qryjoin do
   begin
    close;
    sql.clear;
    sql.add('Select clientes.codigo,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100))) as total');
    sql.add('From Pedidos,Itens,clientes');
    sql.add('Where Pedidos.codpedido  =   Itens.codpedido');
    sql.add('and pedidos.bonificacao  =   ''NAO''');
    sql.add('and pedidos.codcliente   = clientes.codigo');
    sql.Add('group by clientes.codigo');
    sql.add('order by sum(Itens.qtde) desc');
    open;
    first;
   end;

  i:=1;
  dt.open;
  while i <= 10 do
   begin
    dt.Append;
    dt.FieldByName('codcliente').Value := qryjoin.fieldbyname('codigo').value;
    dt.FieldByName('qtde').Value       := qryjoin.fieldbyname('qtde').value;
    dt.FieldByName('total').Value      := qryjoin.fieldbyname('total').value;
    dt.FieldByName('codigo').Value     := i;
    dt.post;
    qryjoin.Next;
    i:=i+1;
   end;
  dt.close;
  dm.transatotal.commit;
 end else begin
  with qryjoin do
   begin
    close;
    sql.clear;
    sql.add('Select clientes.codigo,Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100))) as total');
    sql.add('From Pedidos,Itens,clientes');
    sql.add('Where Pedidos.codpedido  =   Itens.codpedido');
    sql.add('and pedidos.bonificacao  =   ''NAO''');
    sql.add('and pedidos.codcliente   = clientes.codigo');
    sql.Add('group by clientes.codigo');
    sql.add('order by sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100)))desc');
    open;
    first;
   end;

  i:=1;
  dt.open;

  while i <= 10 do
   begin
    dt.Append;
    dt.FieldByName('codcliente').Value := qryjoin.fieldbyname('codigo').value;
    dt.FieldByName('qtde').Value       := qryjoin.fieldbyname('qtde').value;
    dt.FieldByName('total').Value      := qryjoin.fieldbyname('total').value;
    dt.FieldByName('codigo').Value     := i;
    dt.post;
    qryjoin.Next;
    i:=i+1;
   end;
  dt.close;
  dm.transatotal.commit;
 end;
dt.open;
end;

procedure TfrmRelatGrafico4.dtCalcFields(DataSet: TDataSet);
begin
 qry.close;
 qry.sql.clear;
 qry.sql.add('select * from clientes where codigo = :pcod');
 qry.parambyname('pcod').value := dt.fieldbyname('codcliente').value;
 qry.open;
 if not qry.eof then dtrazao.value := qry.fieldbyname('razao').value;

end;

procedure TfrmRelatGrafico4.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

procedure TfrmRelatGrafico4.SpeedButton5Click(Sender: TObject);
begin
dbchart2.Print;
end;

procedure TfrmRelatGrafico4.SpeedButton1Click(Sender: TObject);
begin
dbchart1.Print;
end;

end.
