unit untInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, DBCtrls, ExtCtrls, DB, ibx.IBCustomDataSet;

type
  TfrmOUTRepresentacao = class(TForm)
    dtEmpresa: TIBDataSet;
    dsEmpresa: TDataSource;
    Shape1: TShape;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    dtEmpresaNOME: TIBStringField;
    dtEmpresaENDERECO: TIBStringField;
    dtEmpresaCIDADE: TIBStringField;
    dtEmpresaUF: TIBStringField;
    dtEmpresaCEP: TIBStringField;
    dtEmpresaTELEFONE: TIBStringField;
    dtEmpresaFAX: TIBStringField;
    dtEmpresaEMAIL: TIBStringField;
    Image1: TImage;
    speedbutton1: TSpeedButton;
    Shape4: TShape;
    Label22: TLabel;
    Image3: TImage;
    Label36: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOUTRepresentacao: TfrmOUTRepresentacao;

implementation

uses untDM, untMenu;

{$R *.dfm}

procedure TfrmOUTRepresentacao.SpeedButton1Click(Sender: TObject);
begin
dtempresa.ApplyUpdates;
messagedlg('Dados alterados com sucesso!',mtconfirmation,[mbok],0);
dm.transacao.commit;
CLOSE;
end;

procedure TfrmOUTRepresentacao.FormShow(Sender: TObject);
begin
dtempresa.open;
end;

procedure TfrmOUTRepresentacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
if key = vk_return then SpeedButton1Click(self); 
end;

end.
