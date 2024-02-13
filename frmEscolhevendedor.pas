unit frmEscolhevendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TfrmVISVendedor = class(TForm)
    Shape1: TShape;
    Shape4: TShape;
    Image2: TImage;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label22: TLabel;
    Image3: TImage;
    Label36: TLabel;
    box: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    combovendedor: TComboBox;
    edtdata: TMaskEdit;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVISVendedor: TfrmVISVendedor;

implementation

uses Unit1, untProcedures;

{$R *.dfm}

procedure TfrmVISVendedor.SpeedButton3Click(Sender: TObject);
begin
frmVISAgendamento                     := tfrmVISAgendamento.create(self);
frmVISAgendamento.lblvendedor.caption := inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset));
frmVISAgendamento.lbldata.caption     := edtdata.text;
frmVISAgendamento.montarmapa;

if edtdata.Text[1] + edtdata.Text[2] = '01' then frmVISAgendamento.label10.Caption := 'Calendário de Visitas - JANEIRO/' +edtdata.text[4]+edtdata.text[5]+edtdata.text[6]+edtdata.text[7];
if edtdata.Text[1] + edtdata.Text[2] = '02' then frmVISAgendamento.label10.Caption := 'Calendário de Visitas - FEVEREIRO/' +edtdata.text[4]+edtdata.text[5]+edtdata.text[6]+edtdata.text[7];
if edtdata.Text[1] + edtdata.Text[2] = '03' then frmVISAgendamento.label10.Caption := 'Calendário de Visitas - MARÇO/' +edtdata.text[4]+edtdata.text[5]+edtdata.text[6]+edtdata.text[7];
if edtdata.Text[1] + edtdata.Text[2] = '04' then frmVISAgendamento.label10.Caption := 'Calendário de Visitas - ABRIL/' +edtdata.text[4]+edtdata.text[5]+edtdata.text[6]+edtdata.text[7];
if edtdata.Text[1] + edtdata.Text[2] = '05' then frmVISAgendamento.label10.Caption := 'Calendário de Visitas - MAIO/' +edtdata.text[4]+edtdata.text[5]+edtdata.text[6]+edtdata.text[7];
if edtdata.Text[1] + edtdata.Text[2] = '06' then frmVISAgendamento.label10.Caption := 'Calendário de Visitas - JUNHO/' +edtdata.text[4]+edtdata.text[5]+edtdata.text[6]+edtdata.text[7];
if edtdata.Text[1] + edtdata.Text[2] = '07' then frmVISAgendamento.label10.Caption := 'Calendário de Visitas - JULHO/' +edtdata.text[4]+edtdata.text[5]+edtdata.text[6]+edtdata.text[7];
if edtdata.Text[1] + edtdata.Text[2] = '08' then frmVISAgendamento.label10.Caption := 'Calendário de Visitas - AGOSTO/' +edtdata.text[4]+edtdata.text[5]+edtdata.text[6]+edtdata.text[7];
if edtdata.Text[1] + edtdata.Text[2] = '09' then frmVISAgendamento.label10.Caption := 'Calendário de Visitas - SETEMBRO/' +edtdata.text[4]+edtdata.text[5]+edtdata.text[6]+edtdata.text[7];if edtdata.Text[1] + edtdata.Text[2] = '01' then frmVISAgendamento.label10.Caption := 'Calendário de Visitas - Mês: JANEIRO/' +edtdata.text[4]+edtdata.text[5]+edtdata.text[6]+edtdata.text[7];
if edtdata.Text[1] + edtdata.Text[2] = '10' then frmVISAgendamento.label10.Caption := 'Calendário de Visitas - OUTUBRO/' +edtdata.text[4]+edtdata.text[5]+edtdata.text[6]+edtdata.text[7];
if edtdata.Text[1] + edtdata.Text[2] = '11' then frmVISAgendamento.label10.Caption := 'Calendário de Visitas - NOVEMBRO/' +edtdata.text[4]+edtdata.text[5]+edtdata.text[6]+edtdata.text[7];
if edtdata.Text[1] + edtdata.Text[2] = '12' then frmVISAgendamento.label10.Caption := 'Calendário de Visitas - DEZEMBRO/' +edtdata.text[4]+edtdata.text[5]+edtdata.text[6]+edtdata.text[7];

frmvisvendedor.Visible
:= false;
frmvisagendamento.Caption  := 'Vendedor: ' +combovendedor.text;
frmVISAgendamento.showmodal;
frmVISAgendamento.free;
end;

procedure TfrmVISVendedor.SpeedButton4Click(Sender: TObject);
begin
close;
end;

procedure TfrmVISVendedor.FormCreate(Sender: TObject);
begin
frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
end;

procedure TfrmVISVendedor.FormShow(Sender: TObject);
begin
combovendedor.setfocus;
end;

procedure TfrmVISVendedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
if key = vk_return then SpeedButton3Click(self); 
end;

end.
