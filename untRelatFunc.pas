unit untRelatFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, StdCtrls, DB, ibx.IBCustomDataSet,
  ibx.IbQuery, Buttons;

type
  TfrmRelatFuncionario = class(TForm)
    qryFuncionario: TIBQuery;
    qrFuncionario: TQuickRep;
    QRBand4: TQRBand;
    QRSubDetail6: TQRSubDetail;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape55: TQRShape;
    QRLabel63: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    GroupBox1: TGroupBox;
    V: TRadioButton;
    P: TRadioButton;
    D: TRadioButton;
    A: TRadioButton;
    QRShape2: TQRShape;
    Shape2: TShape;
    QRLabel27: TQRLabel;
    empresa: TQRLabel;
    LBLNOME: TQRLabel;
    QRShape1: TQRShape;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Button3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    f: TRadioButton;
    Shape4: TShape;
    Label22: TLabel;
    Label36: TLabel;
    Image3: TImage;
    Label4: TLabel;
    combovendedor: TComboBox;
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VClick(Sender: TObject);
    procedure PClick(Sender: TObject);
    procedure DClick(Sender: TObject);
    procedure AClick(Sender: TObject);
    procedure fClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatFuncionario: TfrmRelatFuncionario;

implementation

uses untMenu, untProcedures;

{$R *.dfm}

procedure TfrmRelatFuncionario.Button3Click(Sender: TObject);
begin

if f.checked = true then
 begin
   if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

   with qryfuncionario do
    begin
     close;
     sql.clear;
     sql.add('select * from funcionarios where codigo = :pcod');
     parambyname('pcod').value  := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     open;
     lblNome.Caption:= 'Relatório: FUNCIONÁRIO - '  +combovendedor.Text;
     qrFuncionario.Print;
     exit;
    end;
  end;

qryfuncionario.close;
qryfuncionario.sql.clear;
qryfuncionario.SQL.add('select * from funcionarios where Funcao = :pFunc');

if v.checked = true then qryfuncionario.ParamByName('pfunc').value:='VENDEDOR';
if p.checked = true then qryfuncionario.ParamByName('pfunc').value:='PROMOTOR';
if d.checked = true then qryfuncionario.ParamByName('pfunc').value:='DEGUSTADOR';
if a.checked = true then qryfuncionario.ParamByName('pfunc').value:='ADMINISTRATIVA';

qryfuncionario.open;

if qryfuncionario.Eof then
 begin
  messagedlg('NÃO FORAM ENCONTRADOS funcionários nesta função!',mterror,[mbok],0);
  exit;
 end;

lblNome.Caption:= 'Relatório: FUNCIONÁRIOS - '  +qryfuncionario.Parambyname('pfunc').value ;
qrFuncionario.Print;
end;

procedure TfrmRelatFuncionario.SpeedButton1Click(Sender: TObject);
begin
if f.checked = true then
 begin
   if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

   with qryfuncionario do
    begin
     close;
     sql.clear;
     sql.add('select * from funcionarios where codigo = :pcod');
     parambyname('pcod').value  := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     open;
     lblNome.Caption:= 'Relatório: FUNCIONÁRIO - '  +combovendedor.Text;
     qrFuncionario.Preview;
     exit;
    end;
  end;

qryfuncionario.close;
qryfuncionario.sql.clear;
qryfuncionario.SQL.add('select * from funcionarios where Funcao = :pFunc');

if v.checked = true then qryfuncionario.ParamByName('pfunc').value:='VENDEDOR';
if p.checked = true then qryfuncionario.ParamByName('pfunc').value:='PROMOTOR';
if d.checked = true then qryfuncionario.ParamByName('pfunc').value:='DEGUSTADOR';
if a.checked = true then qryfuncionario.ParamByName('pfunc').value:='ADMINISTRATIVA';

qryfuncionario.open;

if qryfuncionario.Eof then
 begin
  messagedlg('NÃO FORAM ENCONTRADOS funcionários nesta função!',mterror,[mbok],0);
  exit;
 end;

lblNome.Caption:= 'Relatório: FUNCIONÁRIOS - '  +qryfuncionario.Parambyname('pfunc').value ;
qrFuncionario.Preview;
end;

procedure TfrmRelatFuncionario.FormCreate(Sender: TObject);
begin
frmSYSProcedures.qryempresa.Open;
empresa.caption := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
frmSYSProcedures.qryEMPRESA.close;

frmSYSProcedures.constroicombo('select * from funcionarios order by nome','nome',combovendedor);
end;

procedure TfrmRelatFuncionario.VClick(Sender: TObject);
begin
combovendedor.Enabled := false;
combovendedor.Color := clmedgray;
end;

procedure TfrmRelatFuncionario.PClick(Sender: TObject);
begin
combovendedor.Enabled := false;
combovendedor.Color := clmedgray;
end;

procedure TfrmRelatFuncionario.DClick(Sender: TObject);
begin
combovendedor.Enabled := false;
combovendedor.Color := clmedgray;
end;

procedure TfrmRelatFuncionario.AClick(Sender: TObject);
begin
combovendedor.Enabled := false;
combovendedor.Color := clmedgray;
end;

procedure TfrmRelatFuncionario.fClick(Sender: TObject);
begin
combovendedor.Enabled := true;
combovendedor.Color := clwhite;
combovendedor.setfocus;
end;

procedure TfrmRelatFuncionario.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
if key = vk_return then SpeedButton1Click(self);
if key = vk_escape then close;

end;

procedure TfrmRelatFuncionario.FormShow(Sender: TObject);
begin
VClick(self);
end;

end.
