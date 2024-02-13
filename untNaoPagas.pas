unit untNaoPagas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, ibx.IBCustomDataSet, StdCtrls, ExtCtrls, ComCtrls,
  ibx.IbQuery, QRCtrls, QuickRpt, ibx.IBTable;

type
  TfrmComissaoNaoPaga = class(TForm)
    qryPedidos: TIBQuery;
    qryComissao: TIBQuery;
    Label5: TLabel;
    dtini: TDateTimePicker;
    Label6: TLabel;
    dtfim: TDateTimePicker;
    Label2: TLabel;
    combovendedor: TComboBox;
    Shape4: TShape;
    Label22: TLabel;
    Image3: TImage;
    Label36: TLabel;
    GroupBox1: TGroupBox;
    periodo: TRadioButton;
    CLIENTE: TRadioButton;
    dt: TIBDataSet;
    dtCODPRODUTO: TIBStringField;
    dtCODFORNECEDOR: TIBStringField;
    dtCODVENDEDOR: TIBStringField;
    dtCODCLIENTE: TIBStringField;
    dtCODGRADE: TIBStringField;
    dtQTDE: TIntegerField;
    dtTOTAL: TFloatField;
    dtDESCRICAO: TIBStringField;
    dtCODIGO: TIntegerField;
    dtDATA: TDateTimeField;
    dtD1: TFloatField;
    dtD2: TFloatField;
    dtD3: TFloatField;
    Button1: TSpeedButton;
    Button2: TSpeedButton;
    Image2: TImage;
    SpeedButton2: TSpeedButton;
    qREPORT: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel26: TQRLabel;
    empresa: TQRLabel;
    NOME: TQRLabel;
    lblvendedor: TQRLabel;
    endereco: TQRLabel;
    outros: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRShape12: TQRShape;
    QRDBText10: TQRDBText;
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    dtitens: TIBTable;
    dtitensCODPEDIDO: TIBStringField;
    dtitensCODPRODUTO: TIBStringField;
    dtitensQTDE: TFloatField;
    dtitensVALOR: TFloatField;
    dtitensDESCONTO1: TFloatField;
    dtitensGRADE: TIntegerField;
    dtitensDESCONTO2: TFloatField;
    dtitensDESCONTO3: TFloatField;
    dtitensTOTAL: TCurrencyField;
    dsDt: TDataSource;
    QRDBText1: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure periodoClick(Sender: TObject);
    procedure CLIENTEClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dtitensCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComissaoNaoPaga: TfrmComissaoNaoPaga;

implementation

uses untDM, untProcedures;

{$R *.dfm}

procedure TfrmComissaoNaoPaga.Button1Click(Sender: TObject);
var
cont:integer;
begin

 if dtini.Date > dtfim.Date then
 begin
  messagedlg('Data Inicial NÃO PODE ser maior que a Data Final!',mterror,[mbok],0);
  dtini.SetFocus;
  exit;
 end;

if periodo.checked = true then
 begin
  lblvendedor.Caption := 'Pedidos Pendentes: TODOS';
  dt.open;
  if dt.recordcount > 0 then dt.delete;
  dt.close;
  dm.transatotal.commit;

  cont:=1;
  qrypedidos.close;
  qrypedidos.SQL.clear;
  qrypedidos.sql.add('select * from pedidos');
  qrypedidos.sql.add('where bonificacao = ''NAO''');
  qrypedidos.sql.add('and data between :pini and :pfim');
  qrypedidos.ParamByName('pini').value := datetostr(dtini.date);
  qrypedidos.ParamByName('pfim').value := datetostr(dtfim.date);
  qrypedidos.Open;
  dt.Close;
  dt.open;

  while not qrypedidos.eof do
   begin
    qrycomissao.close;
    qrycomissao.parambyname('pcod').value := qrypedidos.fieldbyname('codpedido').value;
    qrycomissao.open;

    if qrycomissao.eof then
     Begin
      dt.Append;
      dt.fieldbyname('codigo').value     := cont;
      dt.fieldbyname('codproduto').value := (qrypedidos.fieldbyname('codpedido').Value);
      dt.post;
      cont:=cont+1;
     end;
    qrypedidos.next;
   end;

  dt.close;
  dm.transatotal.commit;
  dt.open;
  dtitens.open;
  qreport.preview;
 end;

if cliente.checked = true then
 begin
  lblvendedor.Caption := 'Pedidos Pendentes: '+combovendedor.text;
  if combovendedor.Text = '' then
   begin
    messagedlg('Selecione um VENDEDOR!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

  dt.open;
  if dt.recordcount > 0 then dt.delete;
  dt.close;
  dm.transatotal.commit;

  cont:=1;
  qrypedidos.close;
  qrypedidos.SQL.clear;
  qrypedidos.sql.add('select * from pedidos');
  qrypedidos.sql.add('where bonificacao = ''NAO''');
  qrypedidos.sql.add('and data between :pini and :pfim');
  qrypedidos.sql.add('and codvendedor = :pcod');
  qrypedidos.ParamByName('pcod').value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
  qrypedidos.ParamByName('pini').value := datetostr(dtini.date);
  qrypedidos.ParamByName('pfim').value := datetostr(dtfim.date);
  qrypedidos.Open;
  dt.Close;
  dt.open;

  while not qrypedidos.eof do
   begin
    qrycomissao.close;
    qrycomissao.parambyname('pcod').value := qrypedidos.fieldbyname('codpedido').value;
    qrycomissao.open;

    if qrycomissao.eof then
     Begin
      dt.Append;
      dt.fieldbyname('codigo').value     := cont;
      dt.fieldbyname('codproduto').value := (qrypedidos.fieldbyname('codpedido').Value);
      dt.post;
      cont:=cont+1;
     end;
    qrypedidos.next;
   end;

  dt.close;
  dm.transatotal.commit;
  dt.open;
  dtitens.open;
  qreport.preview;
 end;

end;


procedure TfrmComissaoNaoPaga.FormCreate(Sender: TObject);
begin
frmSYSProcedures.qryempresa.Open;
empresa.caption  := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
endereco.Caption := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('endereco').value +' - CEP: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cep').value+ ' - Fone: ' +frmSYSProcedures.qryEMPRESA.FIELDBYNAME('telefone').value;
outros.Caption   := 'FAX: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('fax').value + ' - E-mail: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('email').value + ' - ' + frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cidade').value + '-'+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('uf').value;
frmSYSProcedures.qryEMPRESA.close;

frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
dtini.date := incmonth(now,-1);
dtfim.date := now;
end;

procedure TfrmComissaoNaoPaga.periodoClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,false);
end;

procedure TfrmComissaoNaoPaga.CLIENTEClick(Sender: TObject);
begin
frmsysprocedures.combo(combovendedor,true);
combovendedor.SetFocus;
end;

procedure TfrmComissaoNaoPaga.FormShow(Sender: TObject);
begin
periodoclick(self);
end;

procedure TfrmComissaoNaoPaga.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
if key = vk_return then Button1Click(self);
if key = vk_escape then close;
end;

procedure TfrmComissaoNaoPaga.Button2Click(Sender: TObject);
var
cont:integer;
begin

 if dtini.Date > dtfim.Date then
 begin
  messagedlg('Data Inicial NÃO PODE ser maior que a Data Final!',mterror,[mbok],0);
  dtini.SetFocus;
  exit;
 end;

if periodo.checked = true then
 begin
  lblvendedor.Caption := 'Pedidos Pendentes: TODOS';
  dt.open;
  if dt.recordcount > 0 then dt.delete;
  dt.close;
  dm.transatotal.commit;

  cont:=1;
  qrypedidos.close;
  qrypedidos.SQL.clear;
  qrypedidos.sql.add('select * from pedidos');
  qrypedidos.sql.add('where bonificacao = ''NAO''');
  qrypedidos.sql.add('and data between :pini and :pfim');
  qrypedidos.ParamByName('pini').value := datetostr(dtini.date);
  qrypedidos.ParamByName('pfim').value := datetostr(dtfim.date);
  qrypedidos.Open;
  dt.Close;
  dt.open;

  while not qrypedidos.eof do
   begin
    qrycomissao.close;
    qrycomissao.parambyname('pcod').value := qrypedidos.fieldbyname('codpedido').value;
    qrycomissao.open;

    if qrycomissao.eof then
     Begin
      dt.Append;
      dt.fieldbyname('codigo').value     := cont;
      dt.fieldbyname('codproduto').value := (qrypedidos.fieldbyname('codpedido').Value);
      dt.post;
      cont:=cont+1;
     end;
    qrypedidos.next;
   end;

  dt.close;
  dm.transatotal.commit;
  dt.open;
  dtitens.open;
  qreport.print;
 end;

if cliente.checked = true then
 begin
  lblvendedor.Caption := 'Pedidos Pendentes: '+combovendedor.text;
  if combovendedor.Text = '' then
   begin
    messagedlg('Selecione um VENDEDOR!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

  dt.open;
  if dt.recordcount > 0 then dt.delete;
  dt.close;
  dm.transatotal.commit;

  cont:=1;
  qrypedidos.close;
  qrypedidos.SQL.clear;
  qrypedidos.sql.add('select * from pedidos');
  qrypedidos.sql.add('where bonificacao = ''NAO''');
  qrypedidos.sql.add('and data between :pini and :pfim');
  qrypedidos.sql.add('and codvendedor = :pcod');
  qrypedidos.ParamByName('pcod').value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
  qrypedidos.ParamByName('pini').value := datetostr(dtini.date);
  qrypedidos.ParamByName('pfim').value := datetostr(dtfim.date);
  qrypedidos.Open;
  dt.Close;
  dt.open;

  while not qrypedidos.eof do
   begin
    qrycomissao.close;
    qrycomissao.parambyname('pcod').value := qrypedidos.fieldbyname('codpedido').value;
    qrycomissao.open;

    if qrycomissao.eof then
     Begin
      dt.Append;
      dt.fieldbyname('codigo').value     := cont;
      dt.fieldbyname('codproduto').value := (qrypedidos.fieldbyname('codpedido').Value);
      dt.post;
      cont:=cont+1;
     end;
    qrypedidos.next;
   end;

  dt.close;
  dm.transatotal.commit;
  dt.open;
  dtitens.open;
  qreport.print;
 end;

end;


procedure TfrmComissaoNaoPaga.SpeedButton2Click(Sender: TObject);
begin
qreport.PrinterSetup;
end;

procedure TfrmComissaoNaoPaga.dtitensCalcFields(DataSet: TDataSet);
begin
dtitenstotal.value:=((dtitensqtde.Value * dtitensvalor.Value) - (dtitensqtde.Value * dtitensvalor.Value * (dtitensdesconto1.value/100)));
dtitenstotal.value:=((dtitenstotal.Value) - (dtitenstotal.Value * (dtitensdesconto2.value/100)));
dtitenstotal.value:=((dtitenstotal.Value) - (dtitenstotal.Value * (dtitensdesconto3.value/100)));
end;

end.
