unit untVerificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Gauges;

type
  TfrmOUTVerificacao = class(TForm)
    SpeedButton1: TSpeedButton;
    Timer1: TTimer;
    Shape2: TShape;
    lbl: TLabel;
    pb: TGauge;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOUTVerificacao: TfrmOUTVerificacao;
  erro:boolean;
implementation

uses untDM, untMenu;

{$R *.dfm}

procedure TfrmOUTVerificacao.Timer1Timer(Sender: TObject);
begin
if pb.progress = 0  then lbl.caption:='Verificando arquivos.';
if pb.progress = 20 then lbl.caption:='Verificando arquivos..';
if pb.progress = 40 then lbl.caption:='Verificando arquivos...';
if pb.progress = 60 then lbl.caption:='Verificando arquivos..';
if pb.progress = 80 then lbl.caption:='Verificando arquivos.';
if pb.progress = 90 then lbl.caption:='Verificando arquivos..';


pb.Progress :=pb.Progress +1;

if pb.progress = 99 then
 begin

  try
   dm.banco.connected:=false;
   dm.banco.connected:=true;
   dm.TOTAL.Connected :=false;
   dm.TOTAL.Connected :=true;
  except
   messagedlg('PROBLEMAS AO CONECTAR com o banco de dados!',mterror,[mbok],0);
   timer1.Enabled :=false;
   exit;
  end;

  if erro = true then
   begin
    messagedlg('FALTAM ARQUIVOS do banco de dados do sistema!',mterror,[mbok],0);
    erro:=false;
    timer1.Enabled :=false;
    exit;
   end;
 end;

 if (pb.progress = 100) and (erro = false) then
  begin
   timer1.Enabled :=false;
   messagedlg('Sistema funcionando sem problemas.',mtconfirmation,[mbok],0);
   if pb.progress = 90 then lbl.caption:='Verificação concluída.';
   close;
   exit;
  end;

end;

procedure TfrmOUTVerificacao.SpeedButton1Click(Sender: TObject);
begin
timer1.Enabled := true;
end;

procedure TfrmOUTVerificacao.FormCreate(Sender: TObject);
begin
erro:=false;
end;

procedure TfrmOUTVerificacao.FormShow(Sender: TObject);
begin
pb.Progress :=0;
lbl.caption:= 'Andamento da verificação';
end;

end.
