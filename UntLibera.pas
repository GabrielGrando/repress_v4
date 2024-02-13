unit UntLibera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmREGCodigo = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Button1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    Function SerialNum(FDrive:String) :String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmREGCodigo: TfrmREGCodigo;

implementation

{$R *.dfm}

procedure TfrmREGCodigo.Button1Click(Sender: TObject);
begin
edit1.text:=serialnum(edit2.text);
end;


Function tfrmREGCodigo.SerialNum(FDrive:String) :String;
Var
Serial:DWord;
DirLen,Flags: DWord;
DLabel : Array[0..11] of Char;
begin
Try GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
Result := IntToHex(Serial,8);
Except Result :='';
end;
end;


end.
