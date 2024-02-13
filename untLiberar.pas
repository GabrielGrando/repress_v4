unit untLiberar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,inifiles, ExtCtrls;

type
  TfrmREGLiberar = class(TForm)
    edtcod: TEdit;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Image1: TImage;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmREGLiberar: TfrmREGLiberar;

implementation

uses untLogin;

{$R *.dfm}

procedure TfrmREGLiberar.SpeedButton1Click(Sender: TObject);
var
 arqini:tinifile;
begin
ArqIni := TIniFile.Create('c:\REPRESS\CONFIG');
ArqIni.Writestring('#$%#', '###', frmSYSlogin.EnDecryptString(edtcod.text,236));
ArqIni.Free;
showmessage('Registro criado com sucesso!');
close;
end;

end.
