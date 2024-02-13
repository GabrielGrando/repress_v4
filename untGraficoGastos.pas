unit untGraficoGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBCustomDataSet, ibx.IbQuery, StdCtrls, ComCtrls, TeEngine,
  Series, Buttons, ExtCtrls, TeeProcs, Chart, DbChart, Grids, DBGrids;

type
  TfrmRelatGrafico6 = class(TForm)
    Shape1: TShape;
    DBChart2: TDBChart;
    SpeedButton5: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Shape2: TShape;
    SpeedButton2: TSpeedButton;
    dtfim: TDateTimePicker;
    dtini: TDateTimePicker;
    dtGastos: TIBDataSet;
    QRY: TIBQuery;
    QRYCODIGO: TIntegerField;
    QRYDESCRICAO: TIBStringField;
    dtGastosSUM: TFloatField;
    dtGastosCONTA: TIntegerField;
    dtGastosdescricao: TStringField;
    Series1: THorizBarSeries;
    Label3: TLabel;
    Label4: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure dtGastosCalcFields(DataSet: TDataSet);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatGrafico6: TfrmRelatGrafico6;

implementation

uses untDM;

{$R *.dfm}

procedure TfrmRelatGrafico6.SpeedButton2Click(Sender: TObject);
begin

dtgastos.Close;
dtgastos.ParamByName('pini').value := datetostr(dtini.Date);
dtgastos.ParamByName('pfim').value := datetostr(dtfim.Date);
dtgastos.Open;


dbchart2.title.text.clear;
dbchart2.title.text.add('Gráfico de Contas '+datetostr(dtini.date)+ ' até ' +datetostr(dtfim.date));end;

procedure TfrmRelatGrafico6.dtGastosCalcFields(DataSet: TDataSet);
begin
qry.close;
qry.parambyname('pcod').value := dtgastos.FieldByName('conta').value;
qry.open;
dtgastos.FieldByName('Descricao').value := qry.fieldbyname('descricao').value;
end;

procedure TfrmRelatGrafico6.SpeedButton5Click(Sender: TObject);
begin
DBCHART2.Print;
end;

procedure TfrmRelatGrafico6.FormCreate(Sender: TObject);
begin
dtini.Date := incmonth(now,-1);
dtfim.Date := now;
end;

procedure TfrmRelatGrafico6.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_return then SpeedButton2Click(self); 
if key = vk_escape then close;
end;

end.
