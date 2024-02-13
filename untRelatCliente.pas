unit untRelatCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ibx.IBCustomDataSet, ibx.IbQuery, QuickRpt,
  QRCtrls, ExtCtrls, DBCtrls, ibx.IBTable, Grids, DBGrids;

type
  TfrmRelatCliente = class(TForm)
    qrClientes: TQuickRep;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape1: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText3: TQRDBText;
    GroupBox1: TGroupBox;
    relacao: TRadioButton;
    ficha: TRadioButton;
    qry: TIBQuery;
    lbl: TLabel;
    Shape2: TShape;
    QRCLIENTES2: TQuickRep;
    QRSubDetail3: TQRSubDetail;
    vendedor: TRadioButton;
    QRShape22: TQRShape;
    Image2: TImage;
    SpeedButton2: TSpeedButton;
    Button2: TSpeedButton;
    Button1: TSpeedButton;
    cidade: TRadioButton;
    cidadevendedor: TRadioButton;
    combocidade: TComboBox;
    Label3: TLabel;
    QRCLIENTES3: TQuickRep;
    QRBand3: TQRBand;
    QRLabel24: TQRLabel;
    qtde3: TQRLabel;
    data3: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText43: TQRDBText;
    QRLabel59: TQRLabel;
    QRDBText44: TQRDBText;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRShape63: TQRShape;
    QRLabel74: TQRLabel;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    dtClientes: TIBTable;
    dsCliVen: TDataSource;
    qryCliVen: TIBQuery;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape21: TQRShape;
    QRShape35: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape50: TQRShape;
    QRShape49: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRBand2: TQRBand;
    QRShape23: TQRShape;
    QRLabel25: TQRLabel;
    qtde: TQRLabel;
    data2: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape24: TQRShape;
    QRLabel48: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText42: TQRDBText;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    Label4: TLabel;
    combocliente: TComboBox;
    Label5: TLabel;
    combovendedor: TComboBox;
    qryClientes: TIBQuery;
    empresa2: TQRLabel;
    titulo: TQRLabel;
    QRLabel51: TQRLabel;
    empresa3: TQRLabel;
    titulo3: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    empresa1: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel47: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape5: TQRShape;
    Shape4: TShape;
    Label22: TLabel;
    Image3: TImage;
    Label36: TLabel;
    qClientes4: TQuickRep;
    QRSubDetail4: TQRSubDetail;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRDBText63: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText70: TQRDBText;
    QRBand4: TQRBand;
    QRShape20: TQRShape;
    QRLabel91: TQRLabel;
    qtde4: TQRLabel;
    data4: TQRLabel;
    QRLabel94: TQRLabel;
    TITULO4: TQRLabel;
    QRLabel96: TQRLabel;
    QRShape37: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText21: TQRDBText;
    simples: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure fichaClick(Sender: TObject);
    procedure relacaoClick(Sender: TObject);
    procedure vendedorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cidadeClick(Sender: TObject);
    procedure cidadevendedorClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure comboclienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure combovendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure combocidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure relacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatCliente: TfrmRelatCliente;

implementation

uses untMenu, untProcedures;

{$R *.dfm}

procedure TfrmRelatCliente.Button1Click(Sender: TObject);
begin
 if cidade.checked = true then
  begin
   qryclientes.close;
   qryclientes.SQL.clear;
   qryclientes.SQL.add('select * from clientes');
   qryclientes.SQL.add('where cidade = :pcidade');
   qryclientes.ParamByName('pcidade').value:=combocidade.text;
   qryclientes.open;

   if qryclientes.eof then
    begin
     messagedlg('Não foram encontrados CLIENTES para a CIDADE escolhida!',mterror,[mbok],0);
     combocidade.setfocus;
     exit;
    end;

   qry.close;
   qry.SQL.Clear;
   qry.sql.add('select count(codigo) from clientes');
   qry.SQL.add('where cidade =:pcidade');
   qry.ParamByName('pcidade').value:=combocidade.text;
   qry.Open;
   TITULO.Caption :='Listagem: CLIENTES DA CIDADE: '+ Combocidade.text;
   data2.Caption:=datetostr(now);
   qtde.caption:=inttostr(qry.fieldbyname('count').value);
   qrClientes2.preview;
  end;

 if vendedor.checked = true then
  begin
   qrclientes3.DataSet := qrycliven;
   qryCliven.close;
   qrycliven.sql.clear;
   qrycliven.sql.add('select * from cli_ven');
   qrycliven.sql.add('where codvendedor = :pcod');
   qryCliven.ParamByName('pcod').value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qryCliven.open;

   if qrycliven.eof then
    begin
     messagedlg('Não foram encontrados CLIENTES para o VENDEDOR escolhido!',mterror,[mbok],0);
     combovendedor.setfocus;
     exit;
    end;

   qry.close;
   qry.SQL.Clear;
   qry.sql.add('select count(codvendedor) from cli_ven');
   qry.sql.add('where codvendedor = :pcod');
   qry.ParamByName('pcod').value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qry.Open;

   dtclientes.open;

   TITULO3.Caption :='Listagem: CLIENTES DO VENDEDOR: '+combovendedor.text;
   data3.Caption:=datetostr(now);
   qtde3.caption:=inttostr(qry.fieldbyname('count').value);
   qrClientes3.preview;
  end;

 if cidadevendedor.checked = true then
  begin
   qrclientes3.DataSet := dtclientes;
   qryCliven.close;
   qrycliven.sql.clear;
   qrycliven.sql.add('select clientes.codigo,clientes.cidade,cli_ven.* from cli_ven');
   qrycliven.sql.add('join clientes on clientes.codigo = cli_ven.codcliente');
   qrycliven.sql.add('where cli_ven.codvendedor = :pcod  and clientes.cidade = :pcity');
   qryCliven.ParamByName('pcod').value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qryCliven.ParamByName('pcity').value := trim(combocidade.text);
   qryCliven.open;

   if qrycliven.eof then
    begin
     messagedlg('Não foram encontrados CLIENTES para o VENDEDOR e CIDADE escolhida!',mterror,[mbok],0);
     combovendedor.setfocus;
     exit;
    end;

   dtclientes.open;
   TITULO3.Caption :='Listagem: CLIENTES DO VENDEDOR: '+ combovendedor.text +'  CIDADE: ' + combocidade.text;
   data3.Caption:=datetostr(now);
   qtde3.caption:=inttostr(qrycliven.recordcount);
   qrClientes3.preview;
  end;

 if relacao.Checked = true then
  begin
   qryclientes.close;
   qryclientes.SQL.clear;
   qryclientes.SQL.add('select * from clientes');
   qryclientes.open;

   if qryclientes.eof then
    begin
     messagedlg('Não existem CLIENTES cadastrados!',mterror,[mbok],0);
     exit;
    end;

   qry.close;
   qry.SQL.Clear;
   qry.sql.add('select count(codigo) from clientes');
   qry.Open;
   data2.Caption:=datetostr(now);
   qtde.caption:=inttostr(qry.fieldbyname('count').value);
   qrClientes2.preview;
  end;

  if simples.Checked = true then
  begin
   qryclientes.close;
   qryclientes.SQL.clear;
   qryclientes.SQL.add('select * from clientes');
   qryclientes.SQL.add('where cidade = :pcidade');
   qryclientes.ParamByName('pcidade').value:=combocidade.text;
   qryclientes.open;

   if qryclientes.eof then
    begin
     messagedlg('Não foram encontrados CLIENTES para a CIDADE escolhida!',mterror,[mbok],0);
     combocidade.setfocus;
     exit;
    end;

   qry.close;
   qry.SQL.Clear;
   qry.sql.add('select count(codigo) from clientes');
   qry.SQL.add('where cidade =:pcidade');
   qry.ParamByName('pcidade').value:=combocidade.text;
   qry.Open;
   TITULO4.Caption :='Listagem: CLIENTES DA CIDADE: '+ Combocidade.text;
   data4.Caption:=datetostr(now);
   qtde4.caption:=inttostr(qry.fieldbyname('count').value);
   qClientes4.preview;
  end;

 if ficha.Checked = true then
  begin
   if combocliente.Text = '' then
    begin
     messagedlg('Digite o CLIENTE!',mterror,[mbok],0);
     combocliente.SetFocus;
     exit;
    end;

  qryclientes.close;
  qryclientes.sql.clear;
  qryclientes.SQL.Add('select * from clientes');
  qryclientes.SQL.Add('where RAZAO = :prazao');
  qryclientes.ParamByName('prazao').value:=combocliente.text;
  qryclientes.Open;

   if qryclientes.eof then
    begin
     messagedlg('Campo CLIENTE preenchido com valor não cadastrado!',mterror,[mbok],0);
     combocliente.SetFocus;
     exit;
    end;

  qrClientes.preview;
 end;
end;

procedure TfrmRelatCliente.fichaClick(Sender: TObject);
begin
combocliente.Text     :='';
combocliente.Color    :=clwhite;
combocliente.Enabled  :=true;

combovendedor.text    :='';
combovendedor.Color   :=clmedgray;
combovendedor.Enabled :=false;

combocidade.Text      :='';
combocidade.Color     := clmedgray;
combocidade.Enabled   := false;

combocliente.SetFocus;
end;

procedure TfrmRelatCliente.relacaoClick(Sender: TObject);
begin
combocliente.Text     := '';
combocliente.Enabled  := false;
combocliente.Color    := clmedgray;

combovendedor.Text    := '';
combovendedor.Enabled := false;
combovendedor.Color   := clmedgray;

combocidade.Text      := '';
combocidade.Color     := clwhite;
combocidade.Enabled   := true;
combocidade.SetFocus;
end;

procedure TfrmRelatCliente.vendedorClick(Sender: TObject);
begin
combocliente.Text     := '';
comboCLIENTE.Enabled  := false;
combocliente.Color    := clmedgray;

combovendedor.Text    := '';
comboVENDEDOR.Enabled := true;
combovendedor.Color   := clwhite;

combocidade.Text      := '';
combocidade.Color     := clmedgray;
combocidade.Enabled   := false;
combovendedor.SetFocus;
end;

procedure TfrmRelatCliente.FormShow(Sender: TObject);
begin
relacaoClick(self);
end;

procedure TfrmRelatCliente.SpeedButton2Click(Sender: TObject);
begin
if relacao.Checked = true then qrclientes2.PrinterSetup;
if ficha.Checked = true then qrclientes.printersetup;
end;

procedure TfrmRelatCliente.FormCreate(Sender: TObject);
begin
frmSYSProcedures.qryempresa.Open;
empresa1.caption:= frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
empresa2.caption:= frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
empresa3.caption:= frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
frmSYSProcedures.qryEMPRESA.close;

frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
frmSYSProcedures.constroicombo('select * from clientes order by razao','razao',combocliente);
frmSYSProcedures.constroicombo('select distinct(cidade) from clientes order by cidade','cidade',combocidade);
end;

procedure TfrmRelatCliente.cidadeClick(Sender: TObject);
begin
combocliente.Text     := '';
combocliente.Enabled  := false;
combocliente.Color    := clmedgray;

combovendedor.Text    := '';
combovendedor.Enabled := false;
combovendedor.Color   := clmedgray;

combocidade.Text      := '';
combocidade.Color     := clwhite;
combocidade.Enabled   := true;
combocidade.SetFocus;
end;

procedure TfrmRelatCliente.cidadevendedorClick(Sender: TObject);
begin
combocliente.Text     := '';
combocliente.Enabled  := false;
combocliente.Color    := clmedgray;

combovendedor.Text    := '';
combovendedor.Enabled := true;
combovendedor.Color   := clwhite;

combocidade.Text      := '';
combocidade.Color     := clwhite;
combocidade.Enabled   := true;
combovendedor.SetFocus;
end;

procedure TfrmRelatCliente.Button2Click(Sender: TObject);
begin

 if simples.Checked = true then
  begin
   qryclientes.close;
   qryclientes.SQL.clear;
   qryclientes.SQL.add('select * from clientes');
   qryclientes.SQL.add('where cidade = :pcidade');
   qryclientes.ParamByName('pcidade').value:=combocidade.text;
   qryclientes.open;

   if qryclientes.eof then
    begin
     messagedlg('Não foram encontrados CLIENTES para a CIDADE escolhida!',mterror,[mbok],0);
     combocidade.setfocus;
     exit;
    end;

   qry.close;
   qry.SQL.Clear;
   qry.sql.add('select count(codigo) from clientes');
   qry.SQL.add('where cidade =:pcidade');
   qry.ParamByName('pcidade').value:=combocidade.text;
   qry.Open;
   TITULO4.Caption :='Listagem: CLIENTES DA CIDADE: '+ Combocidade.text;
   data4.Caption:=datetostr(now);
   qtde4.caption:=inttostr(qry.fieldbyname('count').value);
   qClientes4.Print;
  end;


 if cidade.checked = true then
  begin
   qryclientes.close;
   qryclientes.SQL.clear;
   qryclientes.SQL.add('select * from clientes');
   qryclientes.SQL.add('where cidade = :pcidade');
   qryclientes.ParamByName('pcidade').value:=combocidade.text;
   qryclientes.open;

   if qryclientes.eof then
    begin
     messagedlg('Não foram encontrados CLIENTES para a CIDADE escolhida!',mterror,[mbok],0);
     combocidade.setfocus;
     exit;
    end;

   qry.close;
   qry.SQL.Clear;
   qry.sql.add('select count(codigo) from clientes');
   qry.SQL.add('where cidade =:pcidade');
   qry.ParamByName('pcidade').value:=combocidade.text;
   qry.Open;
   TITULO.Caption :='Listagem: CLIENTES DA CIDADE: '+ Combocidade.text;
   data2.Caption:=datetostr(now);
   qtde.caption:=inttostr(qry.fieldbyname('count').value);
   qrClientes2.print;
  end;

 if vendedor.checked = true then
  begin
   qrclientes3.DataSet := qrycliven;
   qryCliven.close;
   qrycliven.sql.clear;
   qrycliven.sql.add('select * from cli_ven');
   qrycliven.sql.add('where codvendedor = :pcod');
   qryCliven.ParamByName('pcod').value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qryCliven.open;

   if qrycliven.eof then
    begin
     messagedlg('Não foram encontrados CLIENTES para o VENDEDOR escolhido!',mterror,[mbok],0);
     combovendedor.setfocus;
     exit;
    end;

   qry.close;
   qry.SQL.Clear;
   qry.sql.add('select count(codvendedor) from cli_ven');
   qry.sql.add('where codvendedor = :pcod');
   qry.ParamByName('pcod').value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qry.Open;

   dtclientes.open;

   TITULO3.Caption :='Listagem: CLIENTES DO VENDEDOR: '+combovendedor.text;
   data3.Caption:=datetostr(now);
   qtde3.caption:=inttostr(qry.fieldbyname('count').value);
   qrClientes3.print;
  end;

 if cidadevendedor.checked = true then
  begin
   qrclientes3.DataSet := dtclientes;
   qryCliven.close;
   qrycliven.sql.clear;
   qrycliven.sql.add('select clientes.*,cli_ven.* from cli_ven');
   qrycliven.sql.add('join clientes on clientes.codigo = cli_ven.codcliente');
   qrycliven.sql.add('where cli_ven.codvendedor = :pcod and clientes.cidade = :pcity');
   qryCliven.ParamByName('pcod').value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
   qryCliven.ParamByName('pcity').value := combocidade.text;
   qryCliven.open;

   if qrycliven.eof then
    begin
     messagedlg('Não foram encontrados CLIENTES para o VENDEDOR e CIDADE escolhida!',mterror,[mbok],0);
     combovendedor.setfocus;
     exit;
    end;

   dtclientes.open;
   TITULO3.Caption :='Listagem: CLIENTES DO VENDEDOR: '+ combovendedor.text +'  CIDADE: ' + combocidade.text;
   data3.Caption:=datetostr(now);
   qtde3.caption:=inttostr(dtclientes.recordcount);
   qrClientes3.print;
  end;

 if relacao.Checked = true then
  begin
   qryclientes.close;
   qryclientes.SQL.clear;
   qryclientes.SQL.add('select * from clientes');
   qryclientes.open;

   if qryclientes.eof then
    begin
     messagedlg('Não existem CLIENTES cadastrados!',mterror,[mbok],0);
     exit;
    end;

   qry.close;
   qry.SQL.Clear;
   qry.sql.add('select count(codigo) from clientes');
   qry.Open;
   data2.Caption:=datetostr(now);
   qtde.caption:=inttostr(qry.fieldbyname('count').value);
   qrClientes2.print;
  end;

 if ficha.Checked = true then
  begin
   if combocliente.Text = '' then
    begin
     messagedlg('Digite o CLIENTE!',mterror,[mbok],0);
     combocliente.SetFocus;
     exit;
    end;

  qryclientes.close;
  qryclientes.sql.clear;
  qryclientes.SQL.Add('select * from clientes');
  qryclientes.SQL.Add('where RAZAO = :prazao');
  qryclientes.ParamByName('prazao').value:=combocliente.text;
  qryclientes.Open;

   if qryclientes.eof then
    begin
     messagedlg('Campo CLIENTE preenchido com valor não cadastrado!',mterror,[mbok],0);
     combocliente.SetFocus;
     exit;
    end;

  qrClientes.print;
 end;
end;

procedure TfrmRelatCliente.comboclienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then Button1Click(self);
end;

procedure TfrmRelatCliente.combovendedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then Button1Click(self);
end;

procedure TfrmRelatCliente.combocidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then Button1Click(self);
end;

procedure TfrmRelatCliente.relacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_return then Button1Click(self);
end;

procedure TfrmRelatCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

end.
