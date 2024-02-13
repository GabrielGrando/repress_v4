unit untMensagens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmOUTSair = class(TForm)
    Image1: TImage;
    lbl: TLabel;
    BITBTN1: TSpeedButton;
    Shape1: TShape;
    Shape2: TShape;
    SpeedButton1: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOUTSair: TfrmOUTSair;

implementation

uses untMenu;

{$R *.dfm}

procedure TfrmOUTSair.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TfrmOUTSair.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_return then BitBtn1Click(self); 
end;

procedure TfrmOUTSair.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmSYSmenu.lblsair.caption:='NAO';
end;

procedure TfrmOUTSair.SpeedButton1Click(Sender: TObject);
begin
frmSYSmenu.lblsair.caption:='NAO';
frmOUTSair.Close;
end;

end.
