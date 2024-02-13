unit untRelatGrafico5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ibx.IbQuery, DB, ibx.IBCustomDataSet, ExtCtrls,
  TeeProcs, Chart, DbChart, Buttons;

type
  TfrmRelatGrafico5 = class(TForm)
    DBChart2: TDBChart;
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
    dtRAZAO: TStringField;
    qry: TIBQuery;
    Series1: TAreaSeries;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatGrafico5: TfrmRelatGrafico5;

implementation

{$R *.dfm}

procedure TfrmRelatGrafico5.SpeedButton5Click(Sender: TObject);
begin
dbchart2.print;
end;

end.
