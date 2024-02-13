unit untRelatGrafico3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, TeEngine, Series, Buttons, TeeProcs, Chart,
  DbChart, ComCtrls, DB, ibx.IBCustomDataSet, ibx.IbQuery, Grids, DBGrids;

type
  TfrmRelatGrafico3 = class(TForm)
    qryJoin: TIBQuery;
    qryJoinQTDE: TFloatField;
    qryJoinTOTAL: TFloatField;
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
    DBChart1: TDBChart;
    SpeedButton1: TSpeedButton;
    BarSeries1: TBarSeries;
    DBChart2: TDBChart;
    SpeedButton5: TSpeedButton;
    HorizBarSeries1: TBarSeries;
    Shape1: TShape;
    GroupBox1: TGroupBox;
    dtfim: TDateTimePicker;
    dtini: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    combovendedor: TComboBox;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Shape2: TShape;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatGrafico3: TfrmRelatGrafico3;
  z,i:integer;
implementation

uses untProcedures, untDM;

{$R *.dfm}

procedure TfrmRelatGrafico3.SpeedButton2Click(Sender: TObject);
begin

if combovendedor.Text = '' then
 begin
  messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
  combovendedor.SetFocus;
  exit;
 end;

if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

i:=0;

dt.open;
if dt.RecordCount > 0 then dt.delete;
dt.close;
dm.transaTotal.Commit;

z:=0;

while incmonth(dtini.Date,z) < dtfim.date do
 begin


  with qryJoin do
   begin
    close;
    sql.clear;
    sql.add('Select Sum(Itens.Qtde) as qtde,');
    sql.add('sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (itens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -');
    sql.add('((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desconto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/100))) as total');
    sql.add('From Pedidos,Itens');
    sql.add('Where Pedidos.codpedido = Itens.codpedido');
    sql.add('and Pedidos.Data Between :pDataIni and :pDataFim');
    sql.add('and pedidos.bonificacao = ''NAO''');
    sql.add('and pedidos.codvendedor = :pVen');
    ParamByName('pVen').Value     := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
    ParamByName('pDataini').value := incmonth(dtini.date,z);
    ParamByName('pDatafim').value := incmonth(dtini.date,z+1);
    open;
   end;

   dt.open;
   dt.append;
   if qryjoin.FieldByName('qtde').value =  0 then  dt.fieldbyname('qtde').value      := 0;
   if qryjoin.FieldByName('total').value = 0 then  dt.fieldbyname('total').value      := 0;
   dt.fieldbyname('qtde').value      := qryjoin.fieldbyname('qtde').value;
   dt.fieldbyname('total').value     := qryjoin.fieldbyname('total').value;
   dt.fieldbyname('data').value      := datetostr(incmonth(dtini.Date,z));
   dt.fieldbyname('codigo').value    := z+1;
   dt.post;
   dt.close;
   z:=z+1;
 end;
 dm.transaTotal.Commit;
 dbchart1.title.text.clear;
 dbchart1.title.text.add(Combovendedor.text);
 dbchart2.title.text.clear;
 dbchart2.title.text.add(Combovendedor.text);
 dt.open;
end;

procedure TfrmRelatGrafico3.FormCreate(Sender: TObject);
begin
dtini.Date := incmonth(now,-1);
dtfim.Date := now;
frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
end;

procedure TfrmRelatGrafico3.RadioButton1Click(Sender: TObject);
begin
dbchart2.Visible := false;
dbchart1.Visible := true;
end;

procedure TfrmRelatGrafico3.RadioButton2Click(Sender: TObject);
begin
dbchart2.Visible := true;
dbchart1.Visible := false;
end;

procedure TfrmRelatGrafico3.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
if key = vk_return then SpeedButton2Click(self);
if key = vk_escape then close;
end;

procedure TfrmRelatGrafico3.FormShow(Sender: TObject);
begin
RadioButton1Click(self);
combovendedor.SetFocus; 
end;

procedure TfrmRelatGrafico3.SpeedButton5Click(Sender: TObject);
begin
dbchart2.Print; 
end;

procedure TfrmRelatGrafico3.SpeedButton1Click(Sender: TObject);
begin
dbchart1.Print;
end;

end.
