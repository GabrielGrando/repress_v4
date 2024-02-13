unit untRelDevolucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ibx.IBCustomDataSet, ibx.IBTable, ibx.IbQuery, StdCtrls,
  ComCtrls, QRCtrls, QuickRpt, ExtCtrls, Buttons;

type
  TfrmRelatDevolucao = class(TForm)
    Shape4: TShape;
    Image2: TImage;
    Shape2: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label22: TLabel;
    Label36: TLabel;
    GroupBox1: TGroupBox;
    fornecedor: TRadioButton;
    vendedor: TRadioButton;
    cliente: TRadioButton;
    Report: TQuickRep;
    QRSubDetail9: TQRSubDetail;
    QRDBText63: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand23: TQRBand;
    QRLabel105: TQRLabel;
    EMPRESA: TQRLabel;
    PERIODO: TQRLabel;
    QRShape204: TQRShape;
    QRLabel115: TQRLabel;
    QRShape207: TQRShape;
    QRShape208: TQRShape;
    QRShape210: TQRShape;
    QRShape211: TQRShape;
    QRLabel118: TQRLabel;
    QRShape213: TQRShape;
    TITULO: TQRLabel;
    QRShape214: TQRShape;
    INICIAL: TQRLabel;
    QRShape215: TQRShape;
    QRShape216: TQRShape;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    FINAL: TQRLabel;
    QRShape220: TQRShape;
    QRLabel127: TQRLabel;
    TEXTO2: TQRLabel;
    TEXTO3: TQRLabel;
    TEXTO4: TQRLabel;
    DB2: TQRLabel;
    DB3: TQRLabel;
    DB4: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel91: TQRLabel;
    QRExpr9: TQRExpr;
    QRBand24: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRShape205: TQRShape;
    datainicial: TDateTimePicker;
    datafinal: TDateTimePicker;
    combocliente: TComboBox;
    combofornecedor: TComboBox;
    combovendedor: TComboBox;
    qryConsulta: TIBQuery;
    qryConsultaCODPEDIDO: TIBStringField;
    qryConsultaNUM_NOTA: TIBStringField;
    qryConsultaEMISSAO: TDateTimeField;
    qryConsultaVENCIMENTO: TDateTimeField;
    qryConsultaPGTO: TIntegerField;
    qryConsultaVALOR: TFloatField;
    qryConsultaCODPEDIDO1: TIBStringField;
    qryConsultaCODCLIENTE: TIntegerField;
    qryConsultaCODVENDEDOR: TIBStringField;
    qryConsultaCODFORNECEDOR: TIBStringField;
    qryConsultaCODTRANS: TIBStringField;
    qryConsultaTIPO_FRETE: TIBStringField;
    qryConsultaPRAZO_PGTO: TIntegerField;
    qryConsultaENTREGA: TDateTimeField;
    qryConsultaDATA: TDateTimeField;
    qryConsultaORDEM_DE_COMPRA: TIBStringField;
    qryConsultaBONIFICACAO: TIBStringField;
    qryConsultaOBS: TIBStringField;
    QRDBText2: TQRDBText;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    Image3: TImage;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure vendedorClick(Sender: TObject);
    procedure clienteClick(Sender: TObject);
    procedure fornecedorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatDevolucao: TfrmRelatDevolucao;

implementation

uses untProcedures;

{$R *.dfm}

procedure TfrmRelatDevolucao.SpeedButton1Click(Sender: TObject);
begin
if vendedor.Checked = true then
 begin
   db2.Caption     := '---';
   db3.Caption     := '---';
   db4.Caption     := combovendedor.text;
   inicial.Caption := datetostr(datainicial.date);
   final.Caption   := datetostr(datafinal.date);

   with qryConsulta do
    begin
     close;
     sql.clear;
     sql.add('select devolucao.*,pedidos.* from devolucao');
     sql.add('join pedidos on pedidos.codpedido = devolucao.codpedido');
     sql.add('where devolucao.Vencimento between :pini and :pfim');
     sql.add('and pedidos.codvendedor = :pven');
     parambyname('pini').value := datetostr(datainicial.date);
     parambyname('pfim').value := datetostr(datafinal.date);
     ParamByName('pVen').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     open;
    end;

   if qryConsulta.eof then
    begin
     messagedlg('Nenhum registro encontrado!',mterror,[mbok],0);
     exit;
    end;

   report.Preview;
  end;

if cliente.Checked = true then
 begin
   db2.Caption     := '---';
   db3.Caption     := combocliente.text;
   db4.Caption     := '---';
   inicial.Caption := datetostr(datainicial.date);
   final.Caption   := datetostr(datafinal.date);

   with qryConsulta do
    begin
     close;
     sql.clear;
     sql.add('select devolucao.*,pedidos.* from devolucao');
     sql.add('join pedidos on pedidos.codpedido = devolucao.codpedido');
     sql.add('where devolucao.Vencimento between :pini and :pfim');
     sql.add('and pedidos.codcliente = :pcli');
     parambyname('pini').value := datetostr(datainicial.date);
     parambyname('pfim').value := datetostr(datafinal.date);
     ParamByName('pCli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     open;
    end;

   if qryConsulta.eof then
    begin
     messagedlg('Nenhum registro encontrado!',mterror,[mbok],0);
     exit;
    end;

   report.Preview;
  end;

if fornecedor.Checked = true then
 begin
   db2.Caption     := combofornecedor.text;
   db3.Caption     := '---';
   db4.Caption     := '---';
   inicial.Caption := datetostr(datainicial.date);
   final.Caption   := datetostr(datafinal.date);

   with qryConsulta do
    begin
     close;
     sql.clear;
     sql.add('select devolucao.*,pedidos.* from devolucao');
     sql.add('join pedidos on pedidos.codpedido = devolucao.codpedido');
     sql.add('where devolucao.Vencimento between :pini and :pfim');
     sql.add('and pedidos.codfornecedor = :pfor');
     parambyname('pini').value := datetostr(datainicial.date);
     parambyname('pfim').value := datetostr(datafinal.date);
     ParamByName('pFor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     open;
    end;

   if qryConsulta.eof then
    begin
     messagedlg('Nenhum registro encontrado!',mterror,[mbok],0);
     exit;
    end;

   report.Preview;
  end;

end;

procedure TfrmRelatDevolucao.FormCreate(Sender: TObject);
begin
datainicial.Date := incmonth(now,-1);
datafinal.Date := now;
frmSYSProcedures.constroicombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
frmSYSProcedures.constroicombo('select * from clientes order by razao','razao',combocliente);
end;

procedure TfrmRelatDevolucao.vendedorClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,true);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,false);
Combovendedor.SetFocus;
end;

procedure TfrmRelatDevolucao.clienteClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,false);
frmsysprocedures.combo(combocliente,true);
frmsysprocedures.combo(combofornecedor,false);
Combocliente.SetFocus;
end;

procedure TfrmRelatDevolucao.fornecedorClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,false);
frmsysprocedures.combo(combocliente,false);
frmsysprocedures.combo(combofornecedor,true);
Combofornecedor.SetFocus;
end;

procedure TfrmRelatDevolucao.FormShow(Sender: TObject);
begin
vendedorClick(self); 
end;

procedure TfrmRelatDevolucao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
if key = vk_return then SpeedButton1Click(self); 
end;

procedure TfrmRelatDevolucao.SpeedButton4Click(Sender: TObject);
begin
if vendedor.Checked = true then
 begin
   db2.Caption     := '---';
   db3.Caption     := '---';
   db4.Caption     := combovendedor.text;
   inicial.Caption := datetostr(datainicial.date);
   final.Caption   := datetostr(datafinal.date);

   with qryConsulta do
    begin
     close;
     sql.clear;
     sql.add('select devolucao.*,pedidos.* from devolucao');
     sql.add('join pedidos on pedidos.codpedido = devolucao.codpedido');
     sql.add('where devolucao.Vencimento between :pini and :pfim');
     sql.add('and pedidos.codvendedor = :pven');
     parambyname('pini').value := datetostr(datainicial.date);
     parambyname('pfim').value := datetostr(datafinal.date);
     ParamByName('pVen').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     open;
    end;

   if qryConsulta.eof then
    begin
     messagedlg('Nenhum registro encontrado!',mterror,[mbok],0);
     exit;
    end;

   report.print;
  end;

if cliente.Checked = true then
 begin
   db2.Caption     := '---';
   db3.Caption     := combocliente.text;
   db4.Caption     := '---';
   inicial.Caption := datetostr(datainicial.date);
   final.Caption   := datetostr(datafinal.date);

   with qryConsulta do
    begin
     close;
     sql.clear;
     sql.add('select devolucao.*,pedidos.* from devolucao');
     sql.add('join pedidos on pedidos.codpedido = devolucao.codpedido');
     sql.add('where devolucao.Vencimento between :pini and :pfim');
     sql.add('and pedidos.codcliente = :pcli');
     parambyname('pini').value := datetostr(datainicial.date);
     parambyname('pfim').value := datetostr(datafinal.date);
     ParamByName('pCli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     open;
    end;

   if qryConsulta.eof then
    begin
     messagedlg('Nenhum registro encontrado!',mterror,[mbok],0);
     exit;
    end;

   report.print;
  end;

if fornecedor.Checked = true then
 begin
   db2.Caption     := combofornecedor.text;
   db3.Caption     := '---';
   db4.Caption     := '---';
   inicial.Caption := datetostr(datainicial.date);
   final.Caption   := datetostr(datafinal.date);

   with qryConsulta do
    begin
     close;
     sql.clear;
     sql.add('select devolucao.*,pedidos.* from devolucao');
     sql.add('join pedidos on pedidos.codpedido = devolucao.codpedido');
     sql.add('where devolucao.Vencimento between :pini and :pfim');
     sql.add('and pedidos.codfornecedor = :pfor');
     parambyname('pini').value := datetostr(datainicial.date);
     parambyname('pfim').value := datetostr(datafinal.date);
     ParamByName('pFor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     open;
    end;

   if qryConsulta.eof then
    begin
     messagedlg('Nenhum registro encontrado!',mterror,[mbok],0);
     exit;
    end;

   report.print;
  end;

end;

procedure TfrmRelatDevolucao.SpeedButton3Click(Sender: TObject);
begin
report.PrinterSetup; 
end;

end.

