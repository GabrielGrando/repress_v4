unit untSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TfrmSYSSobre = class(TForm)
    Label6: TLabel;
    lblempresa: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSYSSobre: TfrmSYSSobre;

implementation

uses untMenu;

{$R *.dfm}

procedure TfrmSYSSobre.SpeedButton1Click(Sender: TObject);
begin
close;
end;

end.
