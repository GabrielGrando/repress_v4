unit frmRelatGrafico_Itens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBCustomDataSet, ibx.IbQuery, Grids, DBGrids, ibx.IBTable, ExtCtrls,
  StdCtrls, TeEngine, Series, Buttons, TeeProcs, Chart, DbChart;

type
  TfrmRelatGrafico2 = class(TForm)
    ds: TDataSource;
    DBGrid1: TDBGrid;
    qry: TIBQuery;
    qryCODIGO: TIntegerField;
    qryCODPRODUTO: TIBStringField;
    qryCODFORNECEDOR: TIBStringField;
    qryCODVENDEDOR: TIBStringField;
    qryCODCLIENTE: TIBStringField;
    qryCODGRADE: TIBStringField;
    qryQTDE: TIntegerField;
    qryTOTAL: TFloatField;
    qryDESCRICAO: TIBStringField;
    qryDATA: TDateTimeField;
    qryD1: TFloatField;
    qryD2: TFloatField;
    qryD3: TFloatField;
    qrySOMA: TFloatField;
    qryNOME: TStringField;
    Shape2: TShape;
    Shape6: TShape;
    Label22: TLabel;
    Image8: TImage;
    Label10: TLabel;
    Bevel1: TBevel;
    lbltotal: TLabel;
    Image3: TImage;
    Bevel2: TBevel;
    lblitens: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    qryGrafico: TIBQuery;
    DBChart1: TDBChart;
    Series2: TFastLineSeries;
    qryGraficoCODIGO: TIntegerField;
    qryGraficoCODPRODUTO: TIBStringField;
    qryGraficoCODFORNECEDOR: TIBStringField;
    qryGraficoCODVENDEDOR: TIBStringField;
    qryGraficoCODCLIENTE: TIBStringField;
    qryGraficoCODGRADE: TIBStringField;
    qryGraficoQTDE: TIntegerField;
    qryGraficoTOTAL: TFloatField;
    qryGraficoDESCRICAO: TIBStringField;
    qryGraficoDATA: TDateTimeField;
    qryGraficoD1: TFloatField;
    qryGraficoD2: TFloatField;
    qryGraficoD3: TFloatField;
    qryProdutos: TIBQuery;
    SpeedButton5: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    Function  CalculaTotal :integer;
    procedure qryAfterOpen(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatGrafico2: TfrmRelatGrafico2;

implementation

{$R *.dfm}

procedure TfrmRelatGrafico2.FormShow(Sender: TObject);
begin
qry.Close;
qry.open;
qry.First;
DBGrid1DblClick(self);
end;

procedure TfrmRelatGrafico2.qryCalcFields(DataSet: TDataSet);
begin
qrysoma.value:=((qryqtde.Value * qrytotal.Value) - (qryqtde.Value * qrytotal.Value * (qryd1.value/100)));
qrysoma.value:=((qrysoma.Value) - (qrysoma.Value * (qryd2.value/100)));
qrysoma.value:=((qrysoma.Value) - (qrysoma.Value * (qryd3.value/100)));

qryprodutos.close;
qryprodutos.parambyname('pcod').value := qry.fieldbyname('codproduto').value;
qryprodutos.open;

qrynome.Value := qryprodutos.fieldbyname('prodescricao').Value;
end;

procedure TfrmRelatGrafico2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

Function TfrmRelatGrafico2.CalculaTotal :integer;
Var
  VarTot:Real;
  VarPonto:Integer;
Begin
VarTot:=0;
VarPonto:=0;
qry.open;
qry.First;

While Not qry.eof do
  begin
   VarTot:=VarTot+qrysoma.Value;
   qry.Next;
  end;

lbltotal.Caption:=FloatToStrf(VarTot,ffcurrency,18,2);

VarTot:=0;
qry.First;

While Not qry.eof do
  begin
   VarTot:=VarTot+qryQtde.Value;
   qry.Next;
  end;

lblitens.caption:=floattostr(Vartot);
Result:=VarPonto;

end;

procedure TfrmRelatGrafico2.qryAfterOpen(DataSet: TDataSet);
begin
calculatotal;
end;

procedure TfrmRelatGrafico2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key = vk_down) then
 begin
  qrygrafico.close;
  qry.Next;
  if qrygrafico.ParamByName('pcod').Value <> qry.fieldbyname('codproduto').Value then
   begin
    qrygrafico.ParamByName('pcod').Value := qry.fieldbyname('codproduto').Value;
   end;
  qrygrafico.open;
  dbchart1.Title.Text.Clear;
  dbchart1.Title.Text.Add('Compras do Produto: ' + qry.fieldbyname('nome').asstring);
  qry.Prior;
 end;

if (key = vk_up) then
 begin
  qrygrafico.close;
  qry.Prior;
  if qrygrafico.ParamByName('pcod').Value <> qry.fieldbyname('codproduto').Value then
   begin
    qrygrafico.ParamByName('pcod').Value := qry.fieldbyname('codproduto').Value;
   end;
  qrygrafico.open;
  dbchart1.Title.Text.Clear;
  dbchart1.Title.Text.Add('Compras do Produto: ' + qry.fieldbyname('nome').asstring);
  qry.Next;  
 end;
end;

procedure TfrmRelatGrafico2.DBGrid1DblClick(Sender: TObject);
begin
qrygrafico.close;
qrygrafico.ParamByName('pcod').Value := qry.fieldbyname('codproduto').Value;
qrygrafico.open;
dbchart1.Title.Text.Clear;
dbchart1.Title.Text.Add('Compras do Produto: ' + qry.fieldbyname('nome').asstring);
end;

procedure TfrmRelatGrafico2.DBGrid1CellClick(Column: TColumn);
begin
qrygrafico.close;
qrygrafico.ParamByName('pcod').Value := qry.fieldbyname('codproduto').Value;
qrygrafico.open;
dbchart1.Title.Text.Clear;
dbchart1.Title.Text.Add('Vendas do Produto: ' + qry.fieldbyname('nome').asstring);
end;

procedure TfrmRelatGrafico2.SpeedButton5Click(Sender: TObject);
begin
dbchart1.print;
end;

end.
