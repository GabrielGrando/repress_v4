unit untMorto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, ComCtrls, ExtCtrls, Buttons,
  IBQuery, Gauges, IBDatabase;

type
  TfrmMorto = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SpeedButton1: TSpeedButton;
    Shape1: TShape;
    INI: TDateTimePicker;
    FIM: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Shape2: TShape;
    prog: TGauge;
    qrybanco: TIBQuery;
    qrymorto: TIBQuery;
    MORTO: TIBDatabase;
    TRANSACAO: TIBTransaction;
    qryBancoItens: TIBQuery;
    qrymortoitens: TIBQuery;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMorto: TfrmMorto;

implementation

uses untDM, untMenu;

{$R *.dfm}

procedure TfrmMorto.SpeedButton1Click(Sender: TObject);
var
 dir,dir2:pchar;
 a:integer;
begin
dir:=pchar('c:\repress 1.0\banco');
dir2:=pchar('c:\repress 1.0\banco\morto');

for a:=0 to 1 do
 begin
  CopyFile(pchar(dir+'\'+ExtractFilename('vendas')),pchar(dir2+'\'+ExtractFilename('vendas')),true);
 end;

qrybanco.close;
qrybanco.parambyname('pdataini').value:=ini.date;
qrybanco.parambyname('pdatafim').value:=fim.date;
qrybanco.open;

while not qrybanco.Eof do
 begin
  qrybancoitens.close;
  qrybancoitens.ParamByName('pcodpedido').value:=qrybanco.fieldbyname('codpedido').Value;
  qrybancoitens.open;
  qrybanco.Next;
 end;

qrymorto.close;
qrymorto.parambyname('pdata').value:=fim.date;
qrymorto.open;

while not qrymorto.Eof do
 begin
  qrymortoitens.close;
  qrymortoitens.ParamByName('pcodpedido').value:=qrymorto.fieldbyname('codpedido').Value;
  qrymortoitens.open;
  qrymorto.Next;
 end;

dm.transacao.Commit;
transacao.Commit;

end;

end.
