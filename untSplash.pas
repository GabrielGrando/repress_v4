unit untSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Gauges, StdCtrls, Buttons, jpeg, DB, ibx.IBCustomDataSet,
  ibx.IBQuery;

type
  TfrmSYSSplash = class(TForm)
    Timer1: TTimer;
    Label2: TLabel;
    Gauge1: TGauge;
    qryEMPRESA: TIBQuery;
    qryEMPRESANOME: TIBStringField;
    qryEMPRESAENDERECO: TIBStringField;
    qryEMPRESACIDADE: TIBStringField;
    qryEMPRESAUF: TIBStringField;
    qryEMPRESACEP: TIBStringField;
    qryEMPRESATELEFONE: TIBStringField;
    qryEMPRESAFAX: TIBStringField;
    qryEMPRESAEMAIL: TIBStringField;
    Image2: TImage;
    Image5: TImage;
    Image4: TImage;
    Image6: TImage;
    Shape1: TShape;
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSYSSplash: TfrmSYSSplash;

implementation

uses untLogin;

{$R *.dfm}

procedure TfrmSYSSplash.Timer1Timer(Sender: TObject);
begin
gauge1.Progress := gauge1.Progress + 1;

if gauge1.Progress = 100 then
 begin
  frmSYSsplash.Visible :=false;
  timer1.enabled:=false;
  frmSYSlogin:=tfrmSYSlogin.create(self);
  frmSYSlogin.showmodal;
  frmSYSlogin.free;
 end;

end;

procedure TfrmSYSSplash.SpeedButton1Click(Sender: TObject);
begin
application.terminate;
end;

procedure TfrmSYSSplash.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if gauge1.Progress < 100 then canclose := false;
end;

end.
