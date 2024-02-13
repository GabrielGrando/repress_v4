unit untTotalizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, ibx.IBCustomDataSet, ibx.IbQuery, ComCtrls,
  ExtCtrls, QuickRpt, Buttons, QRCtrls, DBCtrls, jpeg;

type
  TfrmRelatTotalizacao = class(TForm)
    Button1: TButton;
    qrySomaMes: TIBQuery;
    qryLancados: TIBQuery;
    dtSalvarLancados: TIBDataSet;
    dtSaveSoma: TIBDataSet;
    GroupBox1: TGroupBox;
    CLIENTE: TRadioButton;
    VENDEDOR: TRadioButton;
    FORNECEDOR: TRadioButton;
    CLIENTEVENDEDOR: TRadioButton;
    CLIENTEFORNECEDOR: TRadioButton;
    TODOS: TRadioButton;
    report: TQuickRep;
    QRBand1: TQRBand;
    QRLabel21: TQRLabel;
    empresa: TQRLabel;
    QRShape32: TQRShape;
    endereco: TQRLabel;
    outros: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    GroupFooterBand1: TQRBand;
    QRShape28: TQRShape;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel14: TQRLabel;
    QRBand24: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRShape205: TQRShape;
    Shape2: TShape;
    QRLabel18: TQRLabel;
    QRShape29: TQRShape;
    QRDBText14: TQRDBText;
    QRShape14: TQRShape;
    QRDBText13: TQRDBText;
    QRShape15: TQRShape;
    QRDBText12: TQRDBText;
    QRShape16: TQRShape;
    QRDBText11: TQRDBText;
    QRShape17: TQRShape;
    QRDBText10: TQRDBText;
    QRShape18: TQRShape;
    QRDBText9: TQRDBText;
    QRShape19: TQRShape;
    QRDBText8: TQRDBText;
    QRShape20: TQRShape;
    QRDBText7: TQRDBText;
    QRShape21: TQRShape;
    QRDBText6: TQRDBText;
    QRShape22: TQRShape;
    QRDBText5: TQRDBText;
    QRShape23: TQRShape;
    QRDBText4: TQRDBText;
    QRShape25: TQRShape;
    QRDBText3: TQRDBText;
    QRShape26: TQRShape;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    s1: TQRShape;
    l1: TQRLabel;
    s3: TQRShape;
    s2: TQRShape;
    l2: TQRLabel;
    l3: TQRLabel;
    QRShape27: TQRShape;
    BitBtn1: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    edtano: TEdit;
    Image2: TImage;
    Bevel1: TBevel;
    Label1: TLabel;
    combofornecedor: TComboBox;
    Label3: TLabel;
    combovendedor: TComboBox;
    Label4: TLabel;
    combocliente: TComboBox;
    Label5: TLabel;
    Shape4: TShape;
    Label22: TLabel;
    Label36: TLabel;
    Image3: TImage;
    n1: TQRLabel;
    n2: TQRLabel;
    n3: TQRLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure reportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VENDEDORClick(Sender: TObject);
    procedure CLIENTEClick(Sender: TObject);
    procedure FORNECEDORClick(Sender: TObject);
    procedure CLIENTEFORNECEDORClick(Sender: TObject);
    procedure CLIENTEVENDEDORClick(Sender: TObject);
    procedure TODOSClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure GroupBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatTotalizacao: TfrmRelatTotalizacao;
  MesIni:string;
  MesFim:string;
  Jan:real;
  Fev:real;
  Mar:real;
  Abr:real;
  Mai:real;
  Jun:real;
  Jul:real;
  Ago:real;
  Sept:real;
  Outb:real;
  Nov:real;
  Dez:real;

implementation

uses untDM, untMenu, untProcedures;

{$R *.dfm}

procedure TfrmRelatTotalizacao.BitBtn1Click(Sender: TObject);
begin
screen.Cursor := -11;

try
 strtoint(edtano.text);
except
 messagedlg('No campo ANO só é admitido Números! [0123456789]',mterror,[mbok],0);
 screen.Cursor := 0;
 edtano.SetFocus;
 exit;
end;

if (strtoint(edtano.text) < 1980) or (strtoint(EDTANO.TEXT) > 2100) then
 begin
  Messagedlg('SELECIONE um ano entre 1980 e 2100!',mterror,[mbok],0);
  edtano.setfocus;
  exit;
 end;
if vendedor.Checked = true then
begin

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

  dtSalvarLancados.open;
  if dtsalvarlancados.RecordCount > 0 then dtSalvarLancados.Delete;
  dtsalvarlancados.close;

  dtsavesoma.open;
  if dtsavesoma.RecordCount > 0 then dtsavesoma.delete;
  dtsavesoma.close;

  with qrylancados do
   begin
    close;
    SQL.CLEAR;
    sql.add('select produtos.prodescricao,itens.codproduto,ITENS.codpedido,pedidos.*,produtos.procodigo From pedidos');
    sql.add('Join itens on itens.codpedido = pedidos.codpedido');
    sql.add('join produtos on produtos.procodigo = itens.codproduto');
    sql.add('Where pedidos.codvendedor = :pven and pedidos.bonificacao = ''NAO''');
    sql.add('order by produtos.prodescricao');
    parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
    open;
    First;
   end;

   if qrylancados.Eof then
    begin
     messagedlg('NÃO FORAM  encontradas VENDAS do Vendedor: '+combovendedor.text+ ' no Ano de: '+edtano.text,mterror,[mbok],0);
     comboVENDEDOR.SetFocus;
     exit;
    end;

    l1.Caption    := 'Vendedor: ';
    n1.caption    := combovendedor.text;
    s1.Pen.Style  := pssolid;

    l2.Caption    := '';
    n2.caption    := '';
    s2.Pen.Style  := psclear;

    l3.Caption    := '';
    n3.caption    := '';
    s3.Pen.Style  := psclear;

   while not qryLancados.eof do
    begin
    dtSalvarLancados.open;
    dtSalvarLancados.append;
    dtSalvarLancados.fieldbyname('produto').value := qryLancados.fieldbyname('prodescricao').value;
    dtSalvarLancados.fieldbyname('codigo').value  := qryLancados.fieldbyname('proCodigo').value;
    dtSalvarLancados.post;
    dtSalvarLancados.close;
    qryLancados.next;
   end;

   with qrySomaMes do
    begin
     close;
     sql.Clear;
     sql.add('select produtos.prodescricao,sum(itens.qtde) from fornecedores a, pedidos b, itens c, produtos d, clientes e');
     sql.add('where a.forcodforn = b.codfornecedor');
     sql.add('and b.codpedido = c.codpedido');
     sql.add('and c.codproduto = d.procodigo');
     sql.add('and e.codigo = b.codcliente');
     sql.add('and b.codvendedor   = :pven');
     sql.add('and c.codproduto    = :pCod');
     sql.add('and b.data between :pini and :pfim');
     SQL.ADD('and B.bonificacao   = ''NAO''');
     sql.add('group by d.prodescricao');
    end;

  dtSalvarLancados.open;
  dtSalvarLancados.first;

  while not dtSalvarLancados.Eof do
   begin
    MesIni:= '01/01/'+edtano.text;
    MesFim:= '31/01/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').AsDate := strtodate(MesIni);
     ParamByName('pfim').AsDate := strtodate(MesFim);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pCod').value :=  dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jan :=qrySomaMes.fieldbyname('sum').value else Jan:=0;

    MesIni:= '01/02/'+edtano.text;
    MesFim:= '28/02/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value  := MesIni;
     ParamByName('pfim').value  := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pCod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Fev :=qrySomaMes.fieldbyname('sum').value else Fev:=0;

   MesIni:= '01/03/'+edtano.text;
   MesFim:= '31/03/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Mar :=qrySomaMes.fieldbyname('sum').value else Mar:=0;

   MesIni:= '01/04/'+edtano.text;
   MesFim:= '30/04/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Abr :=qrySomaMes.fieldbyname('sum').value else Abr:=0;

   MesIni:= '01/05/'+edtano.text;
   MesFim:= '31/05/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Mai :=qrySomaMes.fieldbyname('sum').value else Mai:=0;

   MesIni:= '01/06/'+edtano.text;
   MesFim:= '30/06/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jun :=qrySomaMes.fieldbyname('sum').value else Jun:=0;

   MesIni:= '01/07/'+edtano.text;
   MesFim:= '31/07/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Jul :=qrySomaMes.fieldbyname('sum').value else Jul:=0;

   MesIni:= '01/08/'+edtano.text;
   MesFim:= '31/08/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Ago :=qrySomaMes.fieldbyname('sum').value else Ago:=0;

   MesIni:= '01/09/'+edtano.text;
   MesFim:= '30/09/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := mesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Sept :=qrySomaMes.fieldbyname('sum').value else Sept:=0;

   MesIni:= '01/10/'+edtano.text;
   MesFim:= '31/10/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Outb :=qrySomaMes.fieldbyname('sum').value else Outb:=0;

   MesIni:= '01/11/'+edtano.text;
   MesFim:= '30/11/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Nov :=qrySomaMes.fieldbyname('sum').value else Nov:=0;

   MesIni:= '01/12/'+edtano.text;
   MesFim:= '31/12/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
   end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Dez :=qrySomaMes.fieldbyname('sum').value else Dez:=0;

   dtSaveSoma.open;
   dtSaveSoma.append;
   dtSaveSoma.FieldByName('Produto').value := dtsalvarlancados.fieldbyname('produto').value;
   dtSaveSoma.FieldByName('Jan').value  := Jan;
   dtSaveSoma.FieldByName('Fev').value  := Fev;
   dtSaveSoma.FieldByName('Mar').value  := Mar;
   dtSaveSoma.FieldByName('Abr').value  := Abr;
   dtSaveSoma.FieldByName('Mai').value  := Mai;
   dtSaveSoma.FieldByName('Jun').value  := Jun;
   dtSaveSoma.FieldByName('Jul').value  := Jul;
   dtSaveSoma.FieldByName('Ago').value  := Ago;
   dtSaveSoma.FieldByName('Sept').value := Sept;
   dtSaveSoma.FieldByName('Out').value  := Outb;
   dtSaveSoma.FieldByName('Nov').value  := Nov;
   dtSaveSoma.FieldByName('Dez').value  := Dez;
   dtsaveSoma.post;
   dtsavesoma.close;
   dtSalvarLancados.Next;
  end;
  dm.TRANSATOTAL.Commit;
  dtsavesoma.open;
  report.Preview;
end;







{******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************}


if cliente.Checked = true then
begin

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;

  dtSalvarLancados.open;
  if dtsalvarlancados.RecordCount > 0 then dtSalvarLancados.Delete;
  dtsalvarlancados.close;

  dtsavesoma.open;
  if dtsavesoma.RecordCount > 0 then dtsavesoma.delete;
  dtsavesoma.close;

  with qrylancados do
   begin
    close;
    SQL.CLEAR;
    sql.add('select produtos.prodescricao,itens.codproduto,ITENS.codpedido,pedidos.*,produtos.procodigo From pedidos');
    sql.add('Join itens on itens.codpedido = pedidos.codpedido');
    sql.add('join produtos on produtos.procodigo = itens.codproduto');
    sql.add('Where pedidos.codcliente = :pcli and pedidos.bonificacao = ''NAO''');
    sql.add('order by produtos.prodescricao');
    parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
    open;
    First;
   end;

   if qrylancados.Eof then
    begin
     messagedlg('NÃO FORAM  encontradas VENDAS para o Cliente: '+combocliente.Text+ ' no Ano de: '+edtano.text,mterror,[mbok],0);
     combocliente.SetFocus;
     exit;
    end;

    l1.Caption    := 'Cliente: ';
    n1.caption    := combocliente.text;
    s1.Pen.Style  := pssolid;

    l2.Caption    := '';
    n2.caption    := '';
    s2.Pen.Style  := psclear;

    l3.Caption    := '';
    n3.caption    := '';
    s3.Pen.Style  := psclear;

   while not qryLancados.eof do
    begin
    dtSalvarLancados.open;
    dtSalvarLancados.append;
    dtSalvarLancados.fieldbyname('produto').value := qryLancados.fieldbyname('prodescricao').value;
    dtSalvarLancados.fieldbyname('codigo').value  := qryLancados.fieldbyname('proCodigo').value;
    dtSalvarLancados.post;
    dtSalvarLancados.close;
    qryLancados.next;
   end;

   with qrySomaMes do
    begin
     close;
     sql.Clear;
     sql.add('select produtos.prodescricao,sum(itens.qtde) from fornecedores a, pedidos b, itens c, produtos d, clientes e');
     sql.add('where a.forcodforn = b.codfornecedor');
     sql.add('and b.codpedido = c.codpedido');
     sql.add('and c.codproduto = d.procodigo');
     sql.add('and e.codigo = b.codcliente');
     sql.add('and b.codcliente    = :pcli');
     sql.add('and c.codproduto    = :pCod');
     sql.add('and b.data between :pini and :pfim');
     SQL.ADD('and B.bonificacao   = ''NAO''');
     sql.add('group by d.prodescricao');
    end;

  dtSalvarLancados.open;
  dtSalvarLancados.first;

  while not dtSalvarLancados.Eof do
   begin
    MesIni:= '01/01/'+edtano.text;
    MesFim:= '31/01/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').AsDate := strtodate(MesIni);
     ParamByName('pfim').AsDate := strtodate(MesFim);
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pCod').value :=  dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jan :=qrySomaMes.fieldbyname('sum').value else Jan:=0;

    MesIni:= '01/02/'+edtano.text;
    MesFim:= '28/02/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value  := MesIni;
     ParamByName('pfim').value  := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pCod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Fev :=qrySomaMes.fieldbyname('sum').value else Fev:=0;

   MesIni:= '01/03/'+edtano.text;
   MesFim:= '31/03/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Mar :=qrySomaMes.fieldbyname('sum').value else Mar:=0;

   MesIni:= '01/04/'+edtano.text;
   MesFim:= '30/04/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Abr :=qrySomaMes.fieldbyname('sum').value else Abr:=0;

   MesIni:= '01/05/'+edtano.text;
   MesFim:= '31/05/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Mai :=qrySomaMes.fieldbyname('sum').value else Mai:=0;

   MesIni:= '01/06/'+edtano.text;
   MesFim:= '30/06/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jun :=qrySomaMes.fieldbyname('sum').value else Jun:=0;

   MesIni:= '01/07/'+edtano.text;
   MesFim:= '31/07/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Jul :=qrySomaMes.fieldbyname('sum').value else Jul:=0;

   MesIni:= '01/08/'+edtano.text;
   MesFim:= '31/08/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Ago :=qrySomaMes.fieldbyname('sum').value else Ago:=0;

   MesIni:= '01/09/'+edtano.text;
   MesFim:= '30/09/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := mesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Sept :=qrySomaMes.fieldbyname('sum').value else Sept:=0;

   MesIni:= '01/10/'+edtano.text;
   MesFim:= '31/10/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Outb :=qrySomaMes.fieldbyname('sum').value else Outb:=0;

   MesIni:= '01/11/'+edtano.text;
   MesFim:= '30/11/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Nov :=qrySomaMes.fieldbyname('sum').value else Nov:=0;

   MesIni:= '01/12/'+edtano.text;
   MesFim:= '31/12/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
   end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Dez :=qrySomaMes.fieldbyname('sum').value else Dez:=0;

   dtSaveSoma.open;
   dtSaveSoma.append;
   dtSaveSoma.FieldByName('Produto').value := dtsalvarlancados.fieldbyname('produto').value;
   dtSaveSoma.FieldByName('Jan').value  := Jan;
   dtSaveSoma.FieldByName('Fev').value  := Fev;
   dtSaveSoma.FieldByName('Mar').value  := Mar;
   dtSaveSoma.FieldByName('Abr').value  := Abr;
   dtSaveSoma.FieldByName('Mai').value  := Mai;
   dtSaveSoma.FieldByName('Jun').value  := Jun;
   dtSaveSoma.FieldByName('Jul').value   := Jul;
   dtSaveSoma.FieldByName('Ago').value  := Ago;
   dtSaveSoma.FieldByName('Sept').value := Sept;
   dtSaveSoma.FieldByName('Out').value  := Outb;
   dtSaveSoma.FieldByName('Nov').value  := Nov;
   dtSaveSoma.FieldByName('Dez').value  := Dez;
   dtsaveSoma.post;
   dtsavesoma.close;
   dtSalvarLancados.Next;
  end;
  dm.TRANSATOTAL.Commit;
  dtsavesoma.open;
  report.Preview;
end;



{******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************}





if fornecedor.Checked = true then
begin

  if combofornecedor.Text = '' then
   begin
    messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;

  dtSalvarLancados.open;
  if dtsalvarlancados.RecordCount > 0 then dtSalvarLancados.Delete;
  dtsalvarlancados.close;

  dtsavesoma.open;
  if dtsavesoma.RecordCount > 0 then dtsavesoma.delete;
  dtsavesoma.close;

  with qrylancados do
   begin
    close;
    SQL.CLEAR;
    sql.add('select produtos.prodescricao,itens.codproduto,ITENS.codpedido,pedidos.*,produtos.procodigo From pedidos');
    sql.add('Join itens on itens.codpedido = pedidos.codpedido');
    sql.add('join produtos on produtos.procodigo = itens.codproduto');
    sql.add('Where pedidos.codfornecedor = :pfor and pedidos.bonificacao = ''NAO''');
    sql.add('order by produtos.prodescricao');
    parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
    open;
    First;
   end;

   if qrylancados.Eof then
    begin
     messagedlg('NÃO FORAM  encontradas VENDAS do Fornecedor: '+combofornecedor.text+ ' no Ano de: '+edtano.text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

    l1.Caption    := 'Fornecedor: ';
    n1.caption    := combofornecedor.text;
    s1.Pen.Style  := pssolid;

    l2.Caption    := '';
    n2.caption    := '';
    s2.Pen.Style  := psclear;

    l3.Caption    := '';
    n3.caption    := '';
    s3.Pen.Style  := psclear;

   while not qryLancados.eof do
    begin
    dtSalvarLancados.open;
    dtSalvarLancados.append;
    dtSalvarLancados.fieldbyname('produto').value := qryLancados.fieldbyname('prodescricao').value;
    dtSalvarLancados.fieldbyname('codigo').value  := qryLancados.fieldbyname('proCodigo').value;
    dtSalvarLancados.post;
    dtSalvarLancados.close;
    qryLancados.next;
   end;

   with qrySomaMes do
    begin
     close;
     sql.Clear;
     sql.add('select produtos.prodescricao,sum(itens.qtde) from fornecedores a, pedidos b, itens c, produtos d, clientes e');
     sql.add('where a.forcodforn = b.codfornecedor');
     sql.add('and b.codpedido = c.codpedido');
     sql.add('and c.codproduto = d.procodigo');
     sql.add('and e.codigo = b.codcliente');
     sql.add('and b.codfornecedor = :pfor');
     sql.add('and c.codproduto    = :pCod');
     sql.add('and b.data between :pini and :pfim');
     SQL.ADD('and B.bonificacao   = ''NAO''');
     sql.add('group by d.prodescricao');
    end;

  dtSalvarLancados.open;
  dtSalvarLancados.first;

  while not dtSalvarLancados.Eof do
   begin
    MesIni:= '01/01/'+edtano.text;
    MesFim:= '31/01/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').AsDate := strtodate(MesIni);
     ParamByName('pfim').AsDate := strtodate(MesFim);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCod').value :=  dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jan :=qrySomaMes.fieldbyname('sum').value else Jan:=0;

    MesIni:= '01/02/'+edtano.text;
    MesFim:= '28/02/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value  := MesIni;
     ParamByName('pfim').value  := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Fev :=qrySomaMes.fieldbyname('sum').value else Fev:=0;

   MesIni:= '01/03/'+edtano.text;
   MesFim:= '31/03/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Mar :=qrySomaMes.fieldbyname('sum').value else Mar:=0;

   MesIni:= '01/04/'+edtano.text;
   MesFim:= '30/04/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Abr :=qrySomaMes.fieldbyname('sum').value else Abr:=0;

   MesIni:= '01/05/'+edtano.text;
   MesFim:= '31/05/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Mai :=qrySomaMes.fieldbyname('sum').value else Mai:=0;

   MesIni:= '01/06/'+edtano.text;
   MesFim:= '30/06/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jun :=qrySomaMes.fieldbyname('sum').value else Jun:=0;

   MesIni:= '01/07/'+edtano.text;
   MesFim:= '31/07/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Jul :=qrySomaMes.fieldbyname('sum').value else Jul:=0;

   MesIni:= '01/08/'+edtano.text;
   MesFim:= '31/08/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Ago :=qrySomaMes.fieldbyname('sum').value else Ago:=0;

   MesIni:= '01/09/'+edtano.text;
   MesFim:= '30/09/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := mesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Sept :=qrySomaMes.fieldbyname('sum').value else Sept:=0;

   MesIni:= '01/10/'+edtano.text;
   MesFim:= '31/10/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Outb :=qrySomaMes.fieldbyname('sum').value else Outb:=0;

   MesIni:= '01/11/'+edtano.text;
   MesFim:= '30/11/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Nov :=qrySomaMes.fieldbyname('sum').value else Nov:=0;

   MesIni:= '01/12/'+edtano.text;
   MesFim:= '31/12/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
   end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Dez :=qrySomaMes.fieldbyname('sum').value else Dez:=0;

   dtSaveSoma.open;
   dtSaveSoma.append;
   dtSaveSoma.FieldByName('Produto').value := dtsalvarlancados.fieldbyname('produto').value;
   dtSaveSoma.FieldByName('Jan').value  := Jan;
   dtSaveSoma.FieldByName('Fev').value  := Fev;
   dtSaveSoma.FieldByName('Mar').value  := Mar;
   dtSaveSoma.FieldByName('Abr').value  := Abr;
   dtSaveSoma.FieldByName('Mai').value  := Mai;
   dtSaveSoma.FieldByName('Jun').value  := Jun;
   dtSaveSoma.FieldByName('Jul').value  := Jul;
   dtSaveSoma.FieldByName('Ago').value  := Ago;
   dtSaveSoma.FieldByName('Sept').value := Sept;
   dtSaveSoma.FieldByName('Out').value  := Outb;
   dtSaveSoma.FieldByName('Nov').value  := Nov;
   dtSaveSoma.FieldByName('Dez').value  := Dez;
   dtsaveSoma.post;
   dtsavesoma.close;
   dtSalvarLancados.Next;
  end;
  dm.TRANSATOTAL.Commit;
  dtsavesoma.open;
  report.Preview;
end;


{******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************}


if clientefornecedor.Checked = true then
begin

  if combofornecedor.Text = '' then
   begin
    messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;

  dtSalvarLancados.open;
  if dtsalvarlancados.RecordCount > 0 then dtSalvarLancados.Delete;
  dtsalvarlancados.close;

  dtsavesoma.open;
  if dtsavesoma.RecordCount > 0 then dtsavesoma.delete;
  dtsavesoma.close;

  with qrylancados do
   begin
    close;
    SQL.CLEAR;
    sql.add('select produtos.prodescricao,itens.codproduto,ITENS.codpedido,pedidos.*,produtos.procodigo From pedidos');
    sql.add('Join itens on itens.codpedido = pedidos.codpedido');
    sql.add('join produtos on produtos.procodigo = itens.codproduto');
    sql.add('Where pedidos.codcliente = :pcli and pedidos.codfornecedor = :pfor and pedidos.bonificacao = ''NAO''');
    sql.add('order by produtos.prodescricao');
    parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
    parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
    open;
    First;
   end;

   if qrylancados.Eof then
    begin
     messagedlg('NÃO FORAM  encontradas VENDAS do Fornecedor: '+combofornecedor.text+' para o Cliente: '+combocliente.Text+ ' no Ano de: '+edtano.text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

    l1.caption    := 'Cliente: ';
    n1.caption    := combocliente.Text;
    s1.Pen.Style  := pssolid;

    l2.Caption    := 'Fornecedor: ';
    n2.caption    := combofornecedor.text;
    s2.Pen.Style  := pssolid;

    l3.Caption    := '';
    n3.caption    := '';
    s3.Pen.Style  := psclear;

   while not qryLancados.eof do
    begin
    dtSalvarLancados.open;
    dtSalvarLancados.append;
    dtSalvarLancados.fieldbyname('produto').value := qryLancados.fieldbyname('prodescricao').value;
    dtSalvarLancados.fieldbyname('codigo').value  := qryLancados.fieldbyname('proCodigo').value;
    dtSalvarLancados.post;
    dtSalvarLancados.close;
    qryLancados.next;
   end;

   with qrySomaMes do
    begin
     close;
     sql.Clear;
     sql.add('select produtos.prodescricao,sum(itens.qtde) from fornecedores a, pedidos b, itens c, produtos d, clientes e');
     sql.add('where a.forcodforn = b.codfornecedor');
     sql.add('and b.codpedido = c.codpedido');
     sql.add('and c.codproduto = d.procodigo');
     sql.add('and e.codigo = b.codcliente');
     sql.add('and b.codfornecedor = :pfor');
     sql.add('and b.codcliente    = :pcli');
     sql.add('and c.codproduto    = :pCod');
     sql.add('and b.data between :pini and :pfim');
     SQL.ADD('and B.bonificacao   = ''NAO''');
     sql.add('group by d.prodescricao');
    end;

  dtSalvarLancados.open;
  dtSalvarLancados.first;

  while not dtSalvarLancados.Eof do
   begin
    MesIni:= '01/01/'+edtano.text;
    MesFim:= '31/01/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').AsDate := strtodate(MesIni);
     ParamByName('pfim').AsDate := strtodate(MesFim);
     parambyname('pcli').Value  := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value  := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCod').value  := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jan :=qrySomaMes.fieldbyname('sum').value else Jan:=0;

    MesIni:= '01/02/'+edtano.text;
    MesFim:= '28/02/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value  := MesIni;
     ParamByName('pfim').value  := MesFim;
     parambyname('pcli').Value  := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value  := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCod').value  := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Fev :=qrySomaMes.fieldbyname('sum').value else Fev:=0;

   MesIni:= '01/03/'+edtano.text;
   MesFim:= '31/03/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Mar :=qrySomaMes.fieldbyname('sum').value else Mar:=0;

   MesIni:= '01/04/'+edtano.text;
   MesFim:= '30/04/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Abr :=qrySomaMes.fieldbyname('sum').value else Abr:=0;

   MesIni:= '01/05/'+edtano.text;
   MesFim:= '31/05/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Mai :=qrySomaMes.fieldbyname('sum').value else Mai:=0;

   MesIni:= '01/06/'+edtano.text;
   MesFim:= '30/06/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jun :=qrySomaMes.fieldbyname('sum').value else Jun:=0;

   MesIni:= '01/07/'+edtano.text;
   MesFim:= '31/07/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Jul :=qrySomaMes.fieldbyname('sum').value else Jul:=0;

   MesIni:= '01/08/'+edtano.text;
   MesFim:= '31/08/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Ago :=qrySomaMes.fieldbyname('sum').value else Ago:=0;

   MesIni:= '01/09/'+edtano.text;
   MesFim:= '30/09/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := mesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Sept :=qrySomaMes.fieldbyname('sum').value else Sept:=0;

   MesIni:= '01/10/'+edtano.text;
   MesFim:= '31/10/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Outb :=qrySomaMes.fieldbyname('sum').value else Outb:=0;

   MesIni:= '01/11/'+edtano.text;
   MesFim:= '30/11/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Nov :=qrySomaMes.fieldbyname('sum').value else Nov:=0;

   MesIni:= '01/12/'+edtano.text;
   MesFim:= '31/12/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
   end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Dez :=qrySomaMes.fieldbyname('sum').value else Dez:=0;

   dtSaveSoma.open;
   dtSaveSoma.append;
   dtSaveSoma.FieldByName('Produto').value := dtsalvarlancados.fieldbyname('produto').value;
   dtSaveSoma.FieldByName('Jan').value  := Jan;
   dtSaveSoma.FieldByName('Fev').value  := Fev;
   dtSaveSoma.FieldByName('Mar').value  := Mar;
   dtSaveSoma.FieldByName('Abr').value  := Abr;
   dtSaveSoma.FieldByName('Mai').value  := Mai;
   dtSaveSoma.FieldByName('Jun').value  := Jun;
   dtSaveSoma.FieldByName('Jul').value  := Jul;
   dtSaveSoma.FieldByName('Ago').value  := Ago;
   dtSaveSoma.FieldByName('Sept').value := Sept;
   dtSaveSoma.FieldByName('Out').value  := Outb;
   dtSaveSoma.FieldByName('Nov').value  := Nov;
   dtSaveSoma.FieldByName('Dez').value  := Dez;
   dtsaveSoma.post;
   dtsavesoma.close;
   dtSalvarLancados.Next;
  end;
  dm.TRANSATOTAL.Commit;
  dtsavesoma.open;
  report.Preview;
end;


{******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************}



if clientevendedor.Checked = true then
begin

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;


  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

  dtSalvarLancados.open;
  if dtsalvarlancados.RecordCount > 0 then dtSalvarLancados.Delete;
  dtsalvarlancados.close;

  dtsavesoma.open;
  if dtsavesoma.RecordCount > 0 then dtsavesoma.delete;
  dtsavesoma.close;

  with qrylancados do
   begin
    close;
    SQL.CLEAR;
    sql.add('select produtos.prodescricao,itens.codproduto,ITENS.codpedido,pedidos.*,produtos.procodigo From pedidos');
    sql.add('Join itens on itens.codpedido = pedidos.codpedido');
    sql.add('join produtos on produtos.procodigo = itens.codproduto');
    sql.add('Where pedidos.codcliente = :pcli and pedidos.codvendedor = :pven and pedidos.bonificacao = ''NAO''');
    sql.add('order by produtos.prodescricao');
    parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
    parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
    open;
    First;
   end;

   if qrylancados.Eof then
    begin
     messagedlg('NÃO FORAM  encontradas VENDAS do Vendedor: '+combovendedor.text+ ' para o Cliente: '+combocliente.Text+ ' no Ano de: '+edtano.text,mterror,[mbok],0);
     combocliente.SetFocus;
     exit;
    end;

    l1.caption    := 'Cliente: ';
    n1.caption    := combocliente.Text;
    s1.Pen.Style  := pssolid;

    l2.Caption    := 'Vendedor: ';
    n2.caption    := combovendedor.text;
    s2.pen.Style  :=pssolid;

    l3.Caption    := '';
    n3.caption    := '';
    s3.Pen.Style  := psclear;



   while not qryLancados.eof do
    begin
    dtSalvarLancados.open;
    dtSalvarLancados.append;
    dtSalvarLancados.fieldbyname('produto').value := qryLancados.fieldbyname('prodescricao').value;
    dtSalvarLancados.fieldbyname('codigo').value  := qryLancados.fieldbyname('proCodigo').value;
    dtSalvarLancados.post;
    dtSalvarLancados.close;
    qryLancados.next;
   end;

   with qrySomaMes do
    begin
     close;
     sql.Clear;
     sql.add('select produtos.prodescricao,sum(itens.qtde) from fornecedores a, pedidos b, itens c, produtos d, clientes e');
     sql.add('where a.forcodforn = b.codfornecedor');
     sql.add('and b.codpedido = c.codpedido');
     sql.add('and c.codproduto = d.procodigo');
     sql.add('and e.codigo = b.codcliente');
     sql.add('and b.codcliente    = :pcli');
     sql.add('and b.codvendedor   = :pven');
     sql.add('and c.codproduto    = :pCod');
     sql.add('and b.data between :pini and :pfim');
     SQL.ADD('and B.bonificacao   = ''NAO''');
     sql.add('group by d.prodescricao');
    end;

  dtSalvarLancados.open;
  dtSalvarLancados.first;

  while not dtSalvarLancados.Eof do
   begin
    MesIni:= '01/01/'+edtano.text;
    MesFim:= '31/01/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').AsDate := strtodate(MesIni);
     ParamByName('pfim').AsDate := strtodate(MesFim);
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pCod').value :=  dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jan :=qrySomaMes.fieldbyname('sum').value else Jan:=0;

    MesIni:= '01/02/'+edtano.text;
    MesFim:= '28/02/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value  := MesIni;
     ParamByName('pfim').value  := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pCod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Fev :=qrySomaMes.fieldbyname('sum').value else Fev:=0;

   MesIni:= '01/03/'+edtano.text;
   MesFim:= '31/03/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Mar :=qrySomaMes.fieldbyname('sum').value else Mar:=0;

   MesIni:= '01/04/'+edtano.text;
   MesFim:= '30/04/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Abr :=qrySomaMes.fieldbyname('sum').value else Abr:=0;

   MesIni:= '01/05/'+edtano.text;
   MesFim:= '31/05/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Mai :=qrySomaMes.fieldbyname('sum').value else Mai:=0;

   MesIni:= '01/06/'+edtano.text;
   MesFim:= '30/06/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jun :=qrySomaMes.fieldbyname('sum').value else Jun:=0;

   MesIni:= '01/07/'+edtano.text;
   MesFim:= '31/07/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Jul :=qrySomaMes.fieldbyname('sum').value else Jul:=0;

   MesIni:= '01/08/'+edtano.text;
   MesFim:= '31/08/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Ago :=qrySomaMes.fieldbyname('sum').value else Ago:=0;

   MesIni:= '01/09/'+edtano.text;
   MesFim:= '30/09/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := mesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Sept :=qrySomaMes.fieldbyname('sum').value else Sept:=0;

   MesIni:= '01/10/'+edtano.text;
   MesFim:= '31/10/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Outb :=qrySomaMes.fieldbyname('sum').value else Outb:=0;

   MesIni:= '01/11/'+edtano.text;
   MesFim:= '30/11/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Nov :=qrySomaMes.fieldbyname('sum').value else Nov:=0;

   MesIni:= '01/12/'+edtano.text;
   MesFim:= '31/12/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
   end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Dez :=qrySomaMes.fieldbyname('sum').value else Dez:=0;

   dtSaveSoma.open;
   dtSaveSoma.append;
   dtSaveSoma.FieldByName('Produto').value := dtsalvarlancados.fieldbyname('produto').value;
   dtSaveSoma.FieldByName('Jan').value  := Jan;
   dtSaveSoma.FieldByName('Fev').value  := Fev;
   dtSaveSoma.FieldByName('Mar').value  := Mar;
   dtSaveSoma.FieldByName('Abr').value  := Abr;
   dtSaveSoma.FieldByName('Mai').value  := Mai;
   dtSaveSoma.FieldByName('Jun').value  := Jun;
   dtSaveSoma.FieldByName('Jul').value  := Jul;
   dtSaveSoma.FieldByName('Ago').value  := Ago;
   dtSaveSoma.FieldByName('Sept').value := Sept;
   dtSaveSoma.FieldByName('Out').value  := Outb;
   dtSaveSoma.FieldByName('Nov').value  := Nov;
   dtSaveSoma.FieldByName('Dez').value  := Dez;
   dtsaveSoma.post;
   dtsavesoma.close;
   dtSalvarLancados.Next;
  end;
  dm.TRANSATOTAL.Commit;
  dtsavesoma.open;
  report.Preview;
end;


{******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************}






if todos.Checked = true then
begin

  if combofornecedor.Text = '' then
   begin
    messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;


  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

  dtSalvarLancados.open;
  if dtsalvarlancados.RecordCount > 0 then dtSalvarLancados.Delete;
  dtsalvarlancados.close;

  dtsavesoma.open;
  if dtsavesoma.RecordCount > 0 then dtsavesoma.delete;
  dtsavesoma.close;

  with qrylancados do
   begin
    close;
    SQL.CLEAR;
    sql.add('select produtos.prodescricao,itens.codproduto,ITENS.codpedido,pedidos.*,produtos.procodigo From pedidos');
    sql.add('Join itens on itens.codpedido = pedidos.codpedido');
    sql.add('join produtos on produtos.procodigo = itens.codproduto');
    sql.add('Where pedidos.codcliente = :pcli and pedidos.codfornecedor = :pfor and pedidos.codvendedor = :pven and pedidos.bonificacao = ''NAO''');
    sql.add('order by produtos.prodescricao');
    parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
    parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
    parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
    open;
    First;
   end;

   if qrylancados.Eof then
    begin
     messagedlg('NÃO FORAM  encontradas VENDAS do Vendedor: '+combovendedor.text+' para o Fornecedor: '+combofornecedor.Text+ ' para o Cliente: '+combocliente.Text+ ' no Ano de: '+edtano.text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

    l1.caption    := 'Cliente: ';
    n1.caption    := combocliente.Text;
    s1.Pen.Style  := pssolid;

    l2.Caption    := 'Vendedor: ';
    n2.caption    := combovendedor.text;
    s2.pen.Style  := pssolid;

    l3.Caption    := 'Fornecedor: ';
    n3.caption    := combofornecedor.text;
    s3.Pen.Style  := pssolid;


   while not qryLancados.eof do
    begin
    dtSalvarLancados.open;
    dtSalvarLancados.append;
    dtSalvarLancados.fieldbyname('produto').value := qryLancados.fieldbyname('prodescricao').value;
    dtSalvarLancados.fieldbyname('codigo').value  := qryLancados.fieldbyname('proCodigo').value;
    dtSalvarLancados.post;
    dtSalvarLancados.close;
    qryLancados.next;
   end;

   with qrySomaMes do
    begin
     close;
     sql.Clear;
     sql.add('select produtos.prodescricao,sum(itens.qtde) from fornecedores a, pedidos b, itens c, produtos d, clientes e');
     sql.add('where a.forcodforn = b.codfornecedor');
     sql.add('and b.codpedido = c.codpedido');
     sql.add('and c.codproduto = d.procodigo');
     sql.add('and e.codigo = b.codcliente');
     sql.add('and b.codfornecedor = :pfor');
     sql.add('and b.codcliente    = :pcli');
     sql.add('and b.codvendedor   = :pven');
     sql.add('and c.codproduto    = :pCod');
     sql.add('and b.data between :pini and :pfim');
     SQL.ADD('and B.bonificacao   = ''NAO''');
     sql.add('group by d.prodescricao');
    end;

  dtSalvarLancados.open;
  dtSalvarLancados.first;

  while not dtSalvarLancados.Eof do
   begin
    MesIni:= '01/01/'+edtano.text;
    MesFim:= '31/01/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').AsDate := strtodate(MesIni);
     ParamByName('pfim').AsDate := strtodate(MesFim);
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCod').value :=  dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jan :=qrySomaMes.fieldbyname('sum').value else Jan:=0;

    MesIni:= '01/02/'+edtano.text;
    MesFim:= '28/02/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value  := MesIni;
     ParamByName('pfim').value  := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Fev :=qrySomaMes.fieldbyname('sum').value else Fev:=0;

   MesIni:= '01/03/'+edtano.text;
   MesFim:= '31/03/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Mar :=qrySomaMes.fieldbyname('sum').value else Mar:=0;

   MesIni:= '01/04/'+edtano.text;
   MesFim:= '30/04/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Abr :=qrySomaMes.fieldbyname('sum').value else Abr:=0;

   MesIni:= '01/05/'+edtano.text;
   MesFim:= '31/05/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Mai :=qrySomaMes.fieldbyname('sum').value else Mai:=0;

   MesIni:= '01/06/'+edtano.text;
   MesFim:= '30/06/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jun :=qrySomaMes.fieldbyname('sum').value else Jun:=0;

   MesIni:= '01/07/'+edtano.text;
   MesFim:= '31/07/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Jul :=qrySomaMes.fieldbyname('sum').value else Jul:=0;

   MesIni:= '01/08/'+edtano.text;
   MesFim:= '31/08/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Ago :=qrySomaMes.fieldbyname('sum').value else Ago:=0;

   MesIni:= '01/09/'+edtano.text;
   MesFim:= '30/09/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := mesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Sept :=qrySomaMes.fieldbyname('sum').value else Sept:=0;

   MesIni:= '01/10/'+edtano.text;
   MesFim:= '31/10/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Outb :=qrySomaMes.fieldbyname('sum').value else Outb:=0;

   MesIni:= '01/11/'+edtano.text;
   MesFim:= '30/11/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Nov :=qrySomaMes.fieldbyname('sum').value else Nov:=0;

   MesIni:= '01/12/'+edtano.text;
   MesFim:= '31/12/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
   end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Dez :=qrySomaMes.fieldbyname('sum').value else Dez:=0;

   dtSaveSoma.open;
   dtSaveSoma.append;
   dtSaveSoma.FieldByName('Produto').value := dtsalvarlancados.fieldbyname('produto').value;
   dtSaveSoma.FieldByName('Jan').value  := Jan;
   dtSaveSoma.FieldByName('Fev').value  := Fev;
   dtSaveSoma.FieldByName('Mar').value  := Mar;
   dtSaveSoma.FieldByName('Abr').value  := Abr;
   dtSaveSoma.FieldByName('Mai').value  := Mai;
   dtSaveSoma.FieldByName('Jun').value  := Jun;
   dtSaveSoma.FieldByName('Jul').value  := Jul;
   dtSaveSoma.FieldByName('Ago').value  := Ago;
   dtSaveSoma.FieldByName('Sept').value := Sept;
   dtSaveSoma.FieldByName('Out').value  := Outb;
   dtSaveSoma.FieldByName('Nov').value  := Nov;
   dtSaveSoma.FieldByName('Dez').value  := Dez;
   dtsaveSoma.post;
   dtsavesoma.close;
   dtSalvarLancados.Next;
  end;
  dm.TRANSATOTAL.Commit;
  dtsavesoma.open;
  report.Preview;
end;
End;

procedure TfrmRelatTotalizacao.SpeedButton3Click(Sender: TObject);
begin
report.PrinterSetup;
end;

procedure TfrmRelatTotalizacao.FormCreate(Sender: TObject);
begin
frmSYSProcedures.qryempresa.Open;
empresa.caption:= frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
endereco.Caption := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('endereco').value +' - CEP: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cep').value+ ' - Fone: ' +frmSYSProcedures.qryEMPRESA.FIELDBYNAME('telefone').value;
outros.Caption := 'FAX: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('fax').value + ' - E-mail: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('email').value + ' - ' + frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cidade').value + '-'+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('uf').value;
frmSYSProcedures.qryEMPRESA.close;

frmSYSProcedures.constroicombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
frmSYSProcedures.constroicombo('select * from clientes order by razao','razao',combocliente);

frmsysprocedures.Combo(combofornecedor,false);
frmsysprocedures.Combo(combocliente,false);
frmsysprocedures.Combo(combovendedor,true);
end;

procedure TfrmRelatTotalizacao.reportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
screen.Cursor:=0;
qrlabel18.caption := 'Planilha de Comparativo Mês a Mês do Ano de: '+edtano.text;
end;

procedure TfrmRelatTotalizacao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if key = vk_escape then close;
if key = vk_return then BitBtn1Click(self);
end;

procedure TfrmRelatTotalizacao.VENDEDORClick(Sender: TObject);
begin
frmsysprocedures.Combo(combofornecedor,false);
frmsysprocedures.Combo(combocliente,false);
frmsysprocedures.Combo(combovendedor,true);
combovendedor.setfocus;
end;

procedure TfrmRelatTotalizacao.CLIENTEClick(Sender: TObject);
begin
frmsysprocedures.Combo(combofornecedor,false);
frmsysprocedures.Combo(combocliente,true);
frmsysprocedures.Combo(combovendedor,false);
combocliente.setfocus;
end;

procedure TfrmRelatTotalizacao.FORNECEDORClick(Sender: TObject);
begin
frmsysprocedures.Combo(combofornecedor,true);
frmsysprocedures.Combo(combocliente,false);
frmsysprocedures.Combo(combovendedor,false);
combofornecedor.setfocus;
end;

procedure TfrmRelatTotalizacao.CLIENTEFORNECEDORClick(Sender: TObject);
begin
frmsysprocedures.Combo(combofornecedor,true);
frmsysprocedures.Combo(combocliente,true);
frmsysprocedures.Combo(combovendedor,false);
combofornecedor.setfocus;
end;

procedure TfrmRelatTotalizacao.CLIENTEVENDEDORClick(Sender: TObject);
begin
frmsysprocedures.Combo(combofornecedor,false);
frmsysprocedures.Combo(combocliente,true);
frmsysprocedures.Combo(combovendedor,true);
combovendedor.setfocus;
end;

procedure TfrmRelatTotalizacao.TODOSClick(Sender: TObject);
begin
frmsysprocedures.Combo(combofornecedor,true);
frmsysprocedures.Combo(combocliente,true);
frmsysprocedures.Combo(combovendedor,true);
combofornecedor.setfocus;
end;

procedure TfrmRelatTotalizacao.FormClick(Sender: TObject);
begin
screen.Cursor := 0;
end;

procedure TfrmRelatTotalizacao.GroupBox1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
screen.cursor:=0;
end;

procedure TfrmRelatTotalizacao.SpeedButton3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
screen.cursor:=0;
end;

procedure TfrmRelatTotalizacao.SpeedButton1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
screen.cursor:=0;
end;

procedure TfrmRelatTotalizacao.SpeedButton1Click(Sender: TObject);
begin
screen.Cursor := -11;

try
 strtoint(edtano.text);
except
 messagedlg('No campo ANO só é admitido Números! [0123456789]',mterror,[mbok],0);
 screen.Cursor := 0;
 edtano.SetFocus;
 exit;
end;

if (strtoint(edtano.text) < 1980) or (strtoint(EDTANO.TEXT) > 2100) then
 begin
  Messagedlg('SELECIONE um ano entre 1980 e 2100!',mterror,[mbok],0);
  edtano.setfocus;
  exit;
 end;
if vendedor.Checked = true then
begin

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

  dtSalvarLancados.open;
  if dtsalvarlancados.RecordCount > 0 then dtSalvarLancados.Delete;
  dtsalvarlancados.close;

  dtsavesoma.open;
  if dtsavesoma.RecordCount > 0 then dtsavesoma.delete;
  dtsavesoma.close;

  with qrylancados do
   begin
    close;
    SQL.CLEAR;
    sql.add('select produtos.prodescricao,itens.codproduto,ITENS.codpedido,pedidos.*,produtos.procodigo From pedidos');
    sql.add('Join itens on itens.codpedido = pedidos.codpedido');
    sql.add('join produtos on produtos.procodigo = itens.codproduto');
    sql.add('Where pedidos.codvendedor = :pven and pedidos.bonificacao = ''NAO''');
    sql.add('order by produtos.prodescricao');
    parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
    open;
    First;
   end;

   if qrylancados.Eof then
    begin
     messagedlg('NÃO FORAM  encontradas VENDAS do Vendedor: '+combovendedor.text+ ' no Ano de: '+edtano.text,mterror,[mbok],0);
     comboVENDEDOR.SetFocus;
     exit;
    end;

    l1.Caption    := 'Vendedor: ';
    n1.caption    := combovendedor.text;
    s1.Pen.Style  := pssolid;

    l2.Caption    := '';
    n2.caption    := '';
    s2.Pen.Style  := psclear;

    l3.Caption    := '';
    n3.caption    := '';
    s3.Pen.Style  := psclear;

   while not qryLancados.eof do
    begin
    dtSalvarLancados.open;
    dtSalvarLancados.append;
    dtSalvarLancados.fieldbyname('produto').value := qryLancados.fieldbyname('prodescricao').value;
    dtSalvarLancados.fieldbyname('codigo').value  := qryLancados.fieldbyname('proCodigo').value;
    dtSalvarLancados.post;
    dtSalvarLancados.close;
    qryLancados.next;
   end;

   with qrySomaMes do
    begin
     close;
     sql.Clear;
     sql.add('select produtos.prodescricao,sum(itens.qtde) from fornecedores a, pedidos b, itens c, produtos d, clientes e');
     sql.add('where a.forcodforn = b.codfornecedor');
     sql.add('and b.codpedido = c.codpedido');
     sql.add('and c.codproduto = d.procodigo');
     sql.add('and e.codigo = b.codcliente');
     sql.add('and b.codvendedor   = :pven');
     sql.add('and c.codproduto    = :pCod');
     sql.add('and b.data between :pini and :pfim');
     SQL.ADD('and B.bonificacao   = ''NAO''');
     sql.add('group by d.prodescricao');
    end;

  dtSalvarLancados.open;
  dtSalvarLancados.first;

  while not dtSalvarLancados.Eof do
   begin
    MesIni:= '01/01/'+edtano.text;
    MesFim:= '31/01/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').AsDate := strtodate(MesIni);
     ParamByName('pfim').AsDate := strtodate(MesFim);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pCod').value :=  dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jan :=qrySomaMes.fieldbyname('sum').value else Jan:=0;

    MesIni:= '01/02/'+edtano.text;
    MesFim:= '28/02/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value  := MesIni;
     ParamByName('pfim').value  := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pCod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Fev :=qrySomaMes.fieldbyname('sum').value else Fev:=0;

   MesIni:= '01/03/'+edtano.text;
   MesFim:= '31/03/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Mar :=qrySomaMes.fieldbyname('sum').value else Mar:=0;

   MesIni:= '01/04/'+edtano.text;
   MesFim:= '30/04/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Abr :=qrySomaMes.fieldbyname('sum').value else Abr:=0;

   MesIni:= '01/05/'+edtano.text;
   MesFim:= '31/05/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Mai :=qrySomaMes.fieldbyname('sum').value else Mai:=0;

   MesIni:= '01/06/'+edtano.text;
   MesFim:= '30/06/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jun :=qrySomaMes.fieldbyname('sum').value else Jun:=0;

   MesIni:= '01/07/'+edtano.text;
   MesFim:= '31/07/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Jul :=qrySomaMes.fieldbyname('sum').value else Jul:=0;

   MesIni:= '01/08/'+edtano.text;
   MesFim:= '31/08/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Ago :=qrySomaMes.fieldbyname('sum').value else Ago:=0;

   MesIni:= '01/09/'+edtano.text;
   MesFim:= '30/09/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := mesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Sept :=qrySomaMes.fieldbyname('sum').value else Sept:=0;

   MesIni:= '01/10/'+edtano.text;
   MesFim:= '31/10/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Outb :=qrySomaMes.fieldbyname('sum').value else Outb:=0;

   MesIni:= '01/11/'+edtano.text;
   MesFim:= '30/11/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Nov :=qrySomaMes.fieldbyname('sum').value else Nov:=0;

   MesIni:= '01/12/'+edtano.text;
   MesFim:= '31/12/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
   end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Dez :=qrySomaMes.fieldbyname('sum').value else Dez:=0;

   dtSaveSoma.open;
   dtSaveSoma.append;
   dtSaveSoma.FieldByName('Produto').value := dtsalvarlancados.fieldbyname('produto').value;
   dtSaveSoma.FieldByName('Jan').value  := Jan;
   dtSaveSoma.FieldByName('Fev').value  := Fev;
   dtSaveSoma.FieldByName('Mar').value  := Mar;
   dtSaveSoma.FieldByName('Abr').value  := Abr;
   dtSaveSoma.FieldByName('Mai').value  := Mai;
   dtSaveSoma.FieldByName('Jun').value  := Jun;
   dtSaveSoma.FieldByName('Jul').value  := Jul;
   dtSaveSoma.FieldByName('Ago').value  := Ago;
   dtSaveSoma.FieldByName('Sept').value := Sept;
   dtSaveSoma.FieldByName('Out').value  := Outb;
   dtSaveSoma.FieldByName('Nov').value  := Nov;
   dtSaveSoma.FieldByName('Dez').value  := Dez;
   dtsaveSoma.post;
   dtsavesoma.close;
   dtSalvarLancados.Next;
  end;
  dm.TRANSATOTAL.Commit;
  dtsavesoma.open;
  report.print;
end;







{******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************}


if cliente.Checked = true then
begin

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;

  dtSalvarLancados.open;
  if dtsalvarlancados.RecordCount > 0 then dtSalvarLancados.Delete;
  dtsalvarlancados.close;

  dtsavesoma.open;
  if dtsavesoma.RecordCount > 0 then dtsavesoma.delete;
  dtsavesoma.close;

  with qrylancados do
   begin
    close;
    SQL.CLEAR;
    sql.add('select produtos.prodescricao,itens.codproduto,ITENS.codpedido,pedidos.*,produtos.procodigo From pedidos');
    sql.add('Join itens on itens.codpedido = pedidos.codpedido');
    sql.add('join produtos on produtos.procodigo = itens.codproduto');
    sql.add('Where pedidos.codcliente = :pcli and pedidos.bonificacao = ''NAO''');
    sql.add('order by produtos.prodescricao');
    parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
    open;
    First;
   end;

   if qrylancados.Eof then
    begin
     messagedlg('NÃO FORAM  encontradas VENDAS para o Cliente: '+combocliente.Text+ ' no Ano de: '+edtano.text,mterror,[mbok],0);
     combocliente.SetFocus;
     exit;
    end;

    l1.Caption    := 'Cliente: ';
    n1.caption    := combocliente.text;
    s1.Pen.Style  := pssolid;

    l2.Caption    := '';
    n2.caption    := '';
    s2.Pen.Style  := psclear;

    l3.Caption    := '';
    n3.caption    := '';
    s3.Pen.Style  := psclear;

   while not qryLancados.eof do
    begin
    dtSalvarLancados.open;
    dtSalvarLancados.append;
    dtSalvarLancados.fieldbyname('produto').value := qryLancados.fieldbyname('prodescricao').value;
    dtSalvarLancados.fieldbyname('codigo').value  := qryLancados.fieldbyname('proCodigo').value;
    dtSalvarLancados.post;
    dtSalvarLancados.close;
    qryLancados.next;
   end;

   with qrySomaMes do
    begin
     close;
     sql.Clear;
     sql.add('select produtos.prodescricao,sum(itens.qtde) from fornecedores a, pedidos b, itens c, produtos d, clientes e');
     sql.add('where a.forcodforn = b.codfornecedor');
     sql.add('and b.codpedido = c.codpedido');
     sql.add('and c.codproduto = d.procodigo');
     sql.add('and e.codigo = b.codcliente');
     sql.add('and b.codcliente    = :pcli');
     sql.add('and c.codproduto    = :pCod');
     sql.add('and b.data between :pini and :pfim');
     SQL.ADD('and B.bonificacao   = ''NAO''');
     sql.add('group by d.prodescricao');
    end;

  dtSalvarLancados.open;
  dtSalvarLancados.first;

  while not dtSalvarLancados.Eof do
   begin
    MesIni:= '01/01/'+edtano.text;
    MesFim:= '31/01/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').AsDate := strtodate(MesIni);
     ParamByName('pfim').AsDate := strtodate(MesFim);
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pCod').value :=  dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jan :=qrySomaMes.fieldbyname('sum').value else Jan:=0;

    MesIni:= '01/02/'+edtano.text;
    MesFim:= '28/02/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value  := MesIni;
     ParamByName('pfim').value  := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pCod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Fev :=qrySomaMes.fieldbyname('sum').value else Fev:=0;

   MesIni:= '01/03/'+edtano.text;
   MesFim:= '31/03/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Mar :=qrySomaMes.fieldbyname('sum').value else Mar:=0;

   MesIni:= '01/04/'+edtano.text;
   MesFim:= '30/04/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Abr :=qrySomaMes.fieldbyname('sum').value else Abr:=0;

   MesIni:= '01/05/'+edtano.text;
   MesFim:= '31/05/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Mai :=qrySomaMes.fieldbyname('sum').value else Mai:=0;

   MesIni:= '01/06/'+edtano.text;
   MesFim:= '30/06/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jun :=qrySomaMes.fieldbyname('sum').value else Jun:=0;

   MesIni:= '01/07/'+edtano.text;
   MesFim:= '31/07/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Jul :=qrySomaMes.fieldbyname('sum').value else Jul:=0;

   MesIni:= '01/08/'+edtano.text;
   MesFim:= '31/08/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Ago :=qrySomaMes.fieldbyname('sum').value else Ago:=0;

   MesIni:= '01/09/'+edtano.text;
   MesFim:= '30/09/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := mesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Sept :=qrySomaMes.fieldbyname('sum').value else Sept:=0;

   MesIni:= '01/10/'+edtano.text;
   MesFim:= '31/10/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Outb :=qrySomaMes.fieldbyname('sum').value else Outb:=0;

   MesIni:= '01/11/'+edtano.text;
   MesFim:= '30/11/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Nov :=qrySomaMes.fieldbyname('sum').value else Nov:=0;

   MesIni:= '01/12/'+edtano.text;
   MesFim:= '31/12/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
   end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Dez :=qrySomaMes.fieldbyname('sum').value else Dez:=0;

   dtSaveSoma.open;
   dtSaveSoma.append;
   dtSaveSoma.FieldByName('Produto').value := dtsalvarlancados.fieldbyname('produto').value;
   dtSaveSoma.FieldByName('Jan').value  := Jan;
   dtSaveSoma.FieldByName('Fev').value  := Fev;
   dtSaveSoma.FieldByName('Mar').value  := Mar;
   dtSaveSoma.FieldByName('Abr').value  := Abr;
   dtSaveSoma.FieldByName('Mai').value  := Mai;
   dtSaveSoma.FieldByName('Jun').value  := Jun;
   dtSaveSoma.FieldByName('Jul').value   := Jul;
   dtSaveSoma.FieldByName('Ago').value  := Ago;
   dtSaveSoma.FieldByName('Sept').value := Sept;
   dtSaveSoma.FieldByName('Out').value  := Outb;
   dtSaveSoma.FieldByName('Nov').value  := Nov;
   dtSaveSoma.FieldByName('Dez').value  := Dez;
   dtsaveSoma.post;
   dtsavesoma.close;
   dtSalvarLancados.Next;
  end;
  dm.TRANSATOTAL.Commit;
  dtsavesoma.open;
  report.print;
end;



{******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************}





if fornecedor.Checked = true then
begin

  if combofornecedor.Text = '' then
   begin
    messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;

  dtSalvarLancados.open;
  if dtsalvarlancados.RecordCount > 0 then dtSalvarLancados.Delete;
  dtsalvarlancados.close;

  dtsavesoma.open;
  if dtsavesoma.RecordCount > 0 then dtsavesoma.delete;
  dtsavesoma.close;

  with qrylancados do
   begin
    close;
    SQL.CLEAR;
    sql.add('select produtos.prodescricao,itens.codproduto,ITENS.codpedido,pedidos.*,produtos.procodigo From pedidos');
    sql.add('Join itens on itens.codpedido = pedidos.codpedido');
    sql.add('join produtos on produtos.procodigo = itens.codproduto');
    sql.add('Where pedidos.codfornecedor = :pfor and pedidos.bonificacao = ''NAO''');
    sql.add('order by produtos.prodescricao');
    parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
    open;
    First;
   end;

   if qrylancados.Eof then
    begin
     messagedlg('NÃO FORAM  encontradas VENDAS do Fornecedor: '+combofornecedor.text+ ' no Ano de: '+edtano.text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

    l1.Caption    := 'Fornecedor: ';
    n1.caption    := combofornecedor.text;
    s1.Pen.Style  := pssolid;

    l2.Caption    := '';
    n2.caption    := '';
    s2.Pen.Style  := psclear;

    l3.Caption    := '';
    n3.caption    := '';
    s3.Pen.Style  := psclear;

   while not qryLancados.eof do
    begin
    dtSalvarLancados.open;
    dtSalvarLancados.append;
    dtSalvarLancados.fieldbyname('produto').value := qryLancados.fieldbyname('prodescricao').value;
    dtSalvarLancados.fieldbyname('codigo').value  := qryLancados.fieldbyname('proCodigo').value;
    dtSalvarLancados.post;
    dtSalvarLancados.close;
    qryLancados.next;
   end;

   with qrySomaMes do
    begin
     close;
     sql.Clear;
     sql.add('select produtos.prodescricao,sum(itens.qtde) from fornecedores a, pedidos b, itens c, produtos d, clientes e');
     sql.add('where a.forcodforn = b.codfornecedor');
     sql.add('and b.codpedido = c.codpedido');
     sql.add('and c.codproduto = d.procodigo');
     sql.add('and e.codigo = b.codcliente');
     sql.add('and b.codfornecedor = :pfor');
     sql.add('and c.codproduto    = :pCod');
     sql.add('and b.data between :pini and :pfim');
     SQL.ADD('and B.bonificacao   = ''NAO''');
     sql.add('group by d.prodescricao');
    end;

  dtSalvarLancados.open;
  dtSalvarLancados.first;

  while not dtSalvarLancados.Eof do
   begin
    MesIni:= '01/01/'+edtano.text;
    MesFim:= '31/01/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').AsDate := strtodate(MesIni);
     ParamByName('pfim').AsDate := strtodate(MesFim);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCod').value :=  dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jan :=qrySomaMes.fieldbyname('sum').value else Jan:=0;

    MesIni:= '01/02/'+edtano.text;
    MesFim:= '28/02/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value  := MesIni;
     ParamByName('pfim').value  := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Fev :=qrySomaMes.fieldbyname('sum').value else Fev:=0;

   MesIni:= '01/03/'+edtano.text;
   MesFim:= '31/03/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Mar :=qrySomaMes.fieldbyname('sum').value else Mar:=0;

   MesIni:= '01/04/'+edtano.text;
   MesFim:= '30/04/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Abr :=qrySomaMes.fieldbyname('sum').value else Abr:=0;

   MesIni:= '01/05/'+edtano.text;
   MesFim:= '31/05/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Mai :=qrySomaMes.fieldbyname('sum').value else Mai:=0;

   MesIni:= '01/06/'+edtano.text;
   MesFim:= '30/06/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jun :=qrySomaMes.fieldbyname('sum').value else Jun:=0;

   MesIni:= '01/07/'+edtano.text;
   MesFim:= '31/07/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Jul :=qrySomaMes.fieldbyname('sum').value else Jul:=0;

   MesIni:= '01/08/'+edtano.text;
   MesFim:= '31/08/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Ago :=qrySomaMes.fieldbyname('sum').value else Ago:=0;

   MesIni:= '01/09/'+edtano.text;
   MesFim:= '30/09/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := mesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Sept :=qrySomaMes.fieldbyname('sum').value else Sept:=0;

   MesIni:= '01/10/'+edtano.text;
   MesFim:= '31/10/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Outb :=qrySomaMes.fieldbyname('sum').value else Outb:=0;

   MesIni:= '01/11/'+edtano.text;
   MesFim:= '30/11/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Nov :=qrySomaMes.fieldbyname('sum').value else Nov:=0;

   MesIni:= '01/12/'+edtano.text;
   MesFim:= '31/12/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
   end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Dez :=qrySomaMes.fieldbyname('sum').value else Dez:=0;

   dtSaveSoma.open;
   dtSaveSoma.append;
   dtSaveSoma.FieldByName('Produto').value := dtsalvarlancados.fieldbyname('produto').value;
   dtSaveSoma.FieldByName('Jan').value  := Jan;
   dtSaveSoma.FieldByName('Fev').value  := Fev;
   dtSaveSoma.FieldByName('Mar').value  := Mar;
   dtSaveSoma.FieldByName('Abr').value  := Abr;
   dtSaveSoma.FieldByName('Mai').value  := Mai;
   dtSaveSoma.FieldByName('Jun').value  := Jun;
   dtSaveSoma.FieldByName('Jul').value  := Jul;
   dtSaveSoma.FieldByName('Ago').value  := Ago;
   dtSaveSoma.FieldByName('Sept').value := Sept;
   dtSaveSoma.FieldByName('Out').value  := Outb;
   dtSaveSoma.FieldByName('Nov').value  := Nov;
   dtSaveSoma.FieldByName('Dez').value  := Dez;
   dtsaveSoma.post;
   dtsavesoma.close;
   dtSalvarLancados.Next;
  end;
  dm.TRANSATOTAL.Commit;
  dtsavesoma.open;
  report.print;
end;


{******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************}


if clientefornecedor.Checked = true then
begin

  if combofornecedor.Text = '' then
   begin
    messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;

  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;

  dtSalvarLancados.open;
  if dtsalvarlancados.RecordCount > 0 then dtSalvarLancados.Delete;
  dtsalvarlancados.close;

  dtsavesoma.open;
  if dtsavesoma.RecordCount > 0 then dtsavesoma.delete;
  dtsavesoma.close;

  with qrylancados do
   begin
    close;
    SQL.CLEAR;
    sql.add('select produtos.prodescricao,itens.codproduto,ITENS.codpedido,pedidos.*,produtos.procodigo From pedidos');
    sql.add('Join itens on itens.codpedido = pedidos.codpedido');
    sql.add('join produtos on produtos.procodigo = itens.codproduto');
    sql.add('Where pedidos.codcliente = :pcli and pedidos.codfornecedor = :pfor and pedidos.bonificacao = ''NAO''');
    sql.add('order by produtos.prodescricao');
    parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
    parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
    open;
    First;
   end;

   if qrylancados.Eof then
    begin
     messagedlg('NÃO FORAM  encontradas VENDAS do Fornecedor: '+combofornecedor.text+' para o Cliente: '+combocliente.Text+ ' no Ano de: '+edtano.text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

    l1.caption    := 'Cliente: ';
    n1.caption    := combocliente.Text;
    s1.Pen.Style  := pssolid;

    l2.Caption    := 'Fornecedor: ';
    n2.caption    := combofornecedor.text;
    s2.Pen.Style  := pssolid;

    l3.Caption    := '';
    n3.caption    := '';
    s3.Pen.Style  := psclear;

   while not qryLancados.eof do
    begin
    dtSalvarLancados.open;
    dtSalvarLancados.append;
    dtSalvarLancados.fieldbyname('produto').value := qryLancados.fieldbyname('prodescricao').value;
    dtSalvarLancados.fieldbyname('codigo').value  := qryLancados.fieldbyname('proCodigo').value;
    dtSalvarLancados.post;
    dtSalvarLancados.close;
    qryLancados.next;
   end;

   with qrySomaMes do
    begin
     close;
     sql.Clear;
     sql.add('select produtos.prodescricao,sum(itens.qtde) from fornecedores a, pedidos b, itens c, produtos d, clientes e');
     sql.add('where a.forcodforn = b.codfornecedor');
     sql.add('and b.codpedido = c.codpedido');
     sql.add('and c.codproduto = d.procodigo');
     sql.add('and e.codigo = b.codcliente');
     sql.add('and b.codfornecedor = :pfor');
     sql.add('and b.codcliente    = :pcli');
     sql.add('and c.codproduto    = :pCod');
     sql.add('and b.data between :pini and :pfim');
     SQL.ADD('and B.bonificacao   = ''NAO''');
     sql.add('group by d.prodescricao');
    end;

  dtSalvarLancados.open;
  dtSalvarLancados.first;

  while not dtSalvarLancados.Eof do
   begin
    MesIni:= '01/01/'+edtano.text;
    MesFim:= '31/01/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').AsDate := strtodate(MesIni);
     ParamByName('pfim').AsDate := strtodate(MesFim);
     parambyname('pcli').Value  := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value  := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCod').value  := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jan :=qrySomaMes.fieldbyname('sum').value else Jan:=0;

    MesIni:= '01/02/'+edtano.text;
    MesFim:= '28/02/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value  := MesIni;
     ParamByName('pfim').value  := MesFim;
     parambyname('pcli').Value  := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value  := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCod').value  := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Fev :=qrySomaMes.fieldbyname('sum').value else Fev:=0;

   MesIni:= '01/03/'+edtano.text;
   MesFim:= '31/03/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Mar :=qrySomaMes.fieldbyname('sum').value else Mar:=0;

   MesIni:= '01/04/'+edtano.text;
   MesFim:= '30/04/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Abr :=qrySomaMes.fieldbyname('sum').value else Abr:=0;

   MesIni:= '01/05/'+edtano.text;
   MesFim:= '31/05/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Mai :=qrySomaMes.fieldbyname('sum').value else Mai:=0;

   MesIni:= '01/06/'+edtano.text;
   MesFim:= '30/06/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jun :=qrySomaMes.fieldbyname('sum').value else Jun:=0;

   MesIni:= '01/07/'+edtano.text;
   MesFim:= '31/07/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Jul :=qrySomaMes.fieldbyname('sum').value else Jul:=0;

   MesIni:= '01/08/'+edtano.text;
   MesFim:= '31/08/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Ago :=qrySomaMes.fieldbyname('sum').value else Ago:=0;

   MesIni:= '01/09/'+edtano.text;
   MesFim:= '30/09/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := mesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Sept :=qrySomaMes.fieldbyname('sum').value else Sept:=0;

   MesIni:= '01/10/'+edtano.text;
   MesFim:= '31/10/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Outb :=qrySomaMes.fieldbyname('sum').value else Outb:=0;

   MesIni:= '01/11/'+edtano.text;
   MesFim:= '30/11/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Nov :=qrySomaMes.fieldbyname('sum').value else Nov:=0;

   MesIni:= '01/12/'+edtano.text;
   MesFim:= '31/12/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
   end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Dez :=qrySomaMes.fieldbyname('sum').value else Dez:=0;

   dtSaveSoma.open;
   dtSaveSoma.append;
   dtSaveSoma.FieldByName('Produto').value := dtsalvarlancados.fieldbyname('produto').value;
   dtSaveSoma.FieldByName('Jan').value  := Jan;
   dtSaveSoma.FieldByName('Fev').value  := Fev;
   dtSaveSoma.FieldByName('Mar').value  := Mar;
   dtSaveSoma.FieldByName('Abr').value  := Abr;
   dtSaveSoma.FieldByName('Mai').value  := Mai;
   dtSaveSoma.FieldByName('Jun').value  := Jun;
   dtSaveSoma.FieldByName('Jul').value  := Jul;
   dtSaveSoma.FieldByName('Ago').value  := Ago;
   dtSaveSoma.FieldByName('Sept').value := Sept;
   dtSaveSoma.FieldByName('Out').value  := Outb;
   dtSaveSoma.FieldByName('Nov').value  := Nov;
   dtSaveSoma.FieldByName('Dez').value  := Dez;
   dtsaveSoma.post;
   dtsavesoma.close;
   dtSalvarLancados.Next;
  end;
  dm.TRANSATOTAL.Commit;
  dtsavesoma.open;
  report.print;
end;


{******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************}



if clientevendedor.Checked = true then
begin

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;


  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

  dtSalvarLancados.open;
  if dtsalvarlancados.RecordCount > 0 then dtSalvarLancados.Delete;
  dtsalvarlancados.close;

  dtsavesoma.open;
  if dtsavesoma.RecordCount > 0 then dtsavesoma.delete;
  dtsavesoma.close;

  with qrylancados do
   begin
    close;
    SQL.CLEAR;
    sql.add('select produtos.prodescricao,itens.codproduto,ITENS.codpedido,pedidos.*,produtos.procodigo From pedidos');
    sql.add('Join itens on itens.codpedido = pedidos.codpedido');
    sql.add('join produtos on produtos.procodigo = itens.codproduto');
    sql.add('Where pedidos.codcliente = :pcli and pedidos.codvendedor = :pven and pedidos.bonificacao = ''NAO''');
    sql.add('order by produtos.prodescricao');
    parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
    parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
    open;
    First;
   end;

   if qrylancados.Eof then
    begin
     messagedlg('NÃO FORAM  encontradas VENDAS do Vendedor: '+combovendedor.text+ ' para o Cliente: '+combocliente.Text+ ' no Ano de: '+edtano.text,mterror,[mbok],0);
     combocliente.SetFocus;
     exit;
    end;

    l1.caption    := 'Cliente: ';
    n1.caption    := combocliente.Text;
    s1.Pen.Style  := pssolid;

    l2.Caption    := 'Vendedor: ';
    n2.caption    := combovendedor.text;
    s2.pen.Style  :=pssolid;

    l3.Caption    := '';
    n3.caption    := '';
    s3.Pen.Style  := psclear;



   while not qryLancados.eof do
    begin
    dtSalvarLancados.open;
    dtSalvarLancados.append;
    dtSalvarLancados.fieldbyname('produto').value := qryLancados.fieldbyname('prodescricao').value;
    dtSalvarLancados.fieldbyname('codigo').value  := qryLancados.fieldbyname('proCodigo').value;
    dtSalvarLancados.post;
    dtSalvarLancados.close;
    qryLancados.next;
   end;

   with qrySomaMes do
    begin
     close;
     sql.Clear;
     sql.add('select produtos.prodescricao,sum(itens.qtde) from fornecedores a, pedidos b, itens c, produtos d, clientes e');
     sql.add('where a.forcodforn = b.codfornecedor');
     sql.add('and b.codpedido = c.codpedido');
     sql.add('and c.codproduto = d.procodigo');
     sql.add('and e.codigo = b.codcliente');
     sql.add('and b.codcliente    = :pcli');
     sql.add('and b.codvendedor   = :pven');
     sql.add('and c.codproduto    = :pCod');
     sql.add('and b.data between :pini and :pfim');
     SQL.ADD('and B.bonificacao   = ''NAO''');
     sql.add('group by d.prodescricao');
    end;

  dtSalvarLancados.open;
  dtSalvarLancados.first;

  while not dtSalvarLancados.Eof do
   begin
    MesIni:= '01/01/'+edtano.text;
    MesFim:= '31/01/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').AsDate := strtodate(MesIni);
     ParamByName('pfim').AsDate := strtodate(MesFim);
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     ParamByName('pCod').value :=  dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jan :=qrySomaMes.fieldbyname('sum').value else Jan:=0;

    MesIni:= '01/02/'+edtano.text;
    MesFim:= '28/02/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value  := MesIni;
     ParamByName('pfim').value  := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pCod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Fev :=qrySomaMes.fieldbyname('sum').value else Fev:=0;

   MesIni:= '01/03/'+edtano.text;
   MesFim:= '31/03/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Mar :=qrySomaMes.fieldbyname('sum').value else Mar:=0;

   MesIni:= '01/04/'+edtano.text;
   MesFim:= '30/04/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Abr :=qrySomaMes.fieldbyname('sum').value else Abr:=0;

   MesIni:= '01/05/'+edtano.text;
   MesFim:= '31/05/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Mai :=qrySomaMes.fieldbyname('sum').value else Mai:=0;

   MesIni:= '01/06/'+edtano.text;
   MesFim:= '30/06/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jun :=qrySomaMes.fieldbyname('sum').value else Jun:=0;

   MesIni:= '01/07/'+edtano.text;
   MesFim:= '31/07/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Jul :=qrySomaMes.fieldbyname('sum').value else Jul:=0;

   MesIni:= '01/08/'+edtano.text;
   MesFim:= '31/08/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Ago :=qrySomaMes.fieldbyname('sum').value else Ago:=0;

   MesIni:= '01/09/'+edtano.text;
   MesFim:= '30/09/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := mesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Sept :=qrySomaMes.fieldbyname('sum').value else Sept:=0;

   MesIni:= '01/10/'+edtano.text;
   MesFim:= '31/10/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Outb :=qrySomaMes.fieldbyname('sum').value else Outb:=0;

   MesIni:= '01/11/'+edtano.text;
   MesFim:= '30/11/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Nov :=qrySomaMes.fieldbyname('sum').value else Nov:=0;

   MesIni:= '01/12/'+edtano.text;
   MesFim:= '31/12/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);

     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
   end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Dez :=qrySomaMes.fieldbyname('sum').value else Dez:=0;

   dtSaveSoma.open;
   dtSaveSoma.append;
   dtSaveSoma.FieldByName('Produto').value := dtsalvarlancados.fieldbyname('produto').value;
   dtSaveSoma.FieldByName('Jan').value  := Jan;
   dtSaveSoma.FieldByName('Fev').value  := Fev;
   dtSaveSoma.FieldByName('Mar').value  := Mar;
   dtSaveSoma.FieldByName('Abr').value  := Abr;
   dtSaveSoma.FieldByName('Mai').value  := Mai;
   dtSaveSoma.FieldByName('Jun').value  := Jun;
   dtSaveSoma.FieldByName('Jul').value  := Jul;
   dtSaveSoma.FieldByName('Ago').value  := Ago;
   dtSaveSoma.FieldByName('Sept').value := Sept;
   dtSaveSoma.FieldByName('Out').value  := Outb;
   dtSaveSoma.FieldByName('Nov').value  := Nov;
   dtSaveSoma.FieldByName('Dez').value  := Dez;
   dtsaveSoma.post;
   dtsavesoma.close;
   dtSalvarLancados.Next;
  end;
  dm.TRANSATOTAL.Commit;
  dtsavesoma.open;
  report.print;
end;


{******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************}






if todos.Checked = true then
begin

  if combofornecedor.Text = '' then
   begin
    messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
    combofornecedor.SetFocus;
    exit;
   end;

  if combovendedor.Text = '' then
   begin
    messagedlg('SELECIONE um Vendedor!',mterror,[mbok],0);
    combovendedor.SetFocus;
    exit;
   end;

  if combocliente.Text = '' then
   begin
    messagedlg('SELECIONE um Cliente!',mterror,[mbok],0);
    combocliente.SetFocus;
    exit;
   end;


  if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
  if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;

  dtSalvarLancados.open;
  if dtsalvarlancados.RecordCount > 0 then dtSalvarLancados.Delete;
  dtsalvarlancados.close;

  dtsavesoma.open;
  if dtsavesoma.RecordCount > 0 then dtsavesoma.delete;
  dtsavesoma.close;

  with qrylancados do
   begin
    close;
    SQL.CLEAR;
    sql.add('select produtos.prodescricao,itens.codproduto,ITENS.codpedido,pedidos.*,produtos.procodigo From pedidos');
    sql.add('Join itens on itens.codpedido = pedidos.codpedido');
    sql.add('join produtos on produtos.procodigo = itens.codproduto');
    sql.add('Where pedidos.codcliente = :pcli and pedidos.codfornecedor = :pfor and pedidos.codvendedor = :pven and pedidos.bonificacao = ''NAO''');
    sql.add('order by produtos.prodescricao');
    parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
    parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
    parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
    open;
    First;
   end;

   if qrylancados.Eof then
    begin
     messagedlg('NÃO FORAM  encontradas VENDAS do Vendedor: '+combovendedor.text+' para o Fornecedor: '+combofornecedor.Text+ ' para o Cliente: '+combocliente.Text+ ' no Ano de: '+edtano.text,mterror,[mbok],0);
     combofornecedor.SetFocus;
     exit;
    end;

    l1.caption    := 'Cliente: ';
    n1.caption    := combocliente.Text;
    s1.Pen.Style  := pssolid;

    l2.Caption    := 'Vendedor: ';
    n2.caption    := combovendedor.text;
    s2.pen.Style  := pssolid;

    l3.Caption    := 'Fornecedor: ';
    n3.caption    := combofornecedor.text;
    s3.Pen.Style  := pssolid;


   while not qryLancados.eof do
    begin
    dtSalvarLancados.open;
    dtSalvarLancados.append;
    dtSalvarLancados.fieldbyname('produto').value := qryLancados.fieldbyname('prodescricao').value;
    dtSalvarLancados.fieldbyname('codigo').value  := qryLancados.fieldbyname('proCodigo').value;
    dtSalvarLancados.post;
    dtSalvarLancados.close;
    qryLancados.next;
   end;

   with qrySomaMes do
    begin
     close;
     sql.Clear;
     sql.add('select produtos.prodescricao,sum(itens.qtde) from fornecedores a, pedidos b, itens c, produtos d, clientes e');
     sql.add('where a.forcodforn = b.codfornecedor');
     sql.add('and b.codpedido = c.codpedido');
     sql.add('and c.codproduto = d.procodigo');
     sql.add('and e.codigo = b.codcliente');
     sql.add('and b.codfornecedor = :pfor');
     sql.add('and b.codcliente    = :pcli');
     sql.add('and b.codvendedor   = :pven');
     sql.add('and c.codproduto    = :pCod');
     sql.add('and b.data between :pini and :pfim');
     SQL.ADD('and B.bonificacao   = ''NAO''');
     sql.add('group by d.prodescricao');
    end;

  dtSalvarLancados.open;
  dtSalvarLancados.first;

  while not dtSalvarLancados.Eof do
   begin
    MesIni:= '01/01/'+edtano.text;
    MesFim:= '31/01/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').AsDate := strtodate(MesIni);
     ParamByName('pfim').AsDate := strtodate(MesFim);
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCod').value :=  dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jan :=qrySomaMes.fieldbyname('sum').value else Jan:=0;

    MesIni:= '01/02/'+edtano.text;
    MesFim:= '28/02/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value  := MesIni;
     ParamByName('pfim').value  := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pCod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Fev :=qrySomaMes.fieldbyname('sum').value else Fev:=0;

   MesIni:= '01/03/'+edtano.text;
   MesFim:= '31/03/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Mar :=qrySomaMes.fieldbyname('sum').value else Mar:=0;

   MesIni:= '01/04/'+edtano.text;
   MesFim:= '30/04/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Abr :=qrySomaMes.fieldbyname('sum').value else Abr:=0;

   MesIni:= '01/05/'+edtano.text;
   MesFim:= '31/05/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Mai :=qrySomaMes.fieldbyname('sum').value else Mai:=0;

   MesIni:= '01/06/'+edtano.text;
   MesFim:= '30/06/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Jun :=qrySomaMes.fieldbyname('sum').value else Jun:=0;

   MesIni:= '01/07/'+edtano.text;
   MesFim:= '31/07/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Jul :=qrySomaMes.fieldbyname('sum').value else Jul:=0;

   MesIni:= '01/08/'+edtano.text;
   MesFim:= '31/08/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Ago :=qrySomaMes.fieldbyname('sum').value else Ago:=0;

   MesIni:= '01/09/'+edtano.text;
   MesFim:= '30/09/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := mesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Sept :=qrySomaMes.fieldbyname('sum').value else Sept:=0;

   MesIni:= '01/10/'+edtano.text;
   MesFim:= '31/10/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then Outb :=qrySomaMes.fieldbyname('sum').value else Outb:=0;

   MesIni:= '01/11/'+edtano.text;
   MesFim:= '30/11/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
    end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Nov :=qrySomaMes.fieldbyname('sum').value else Nov:=0;

   MesIni:= '01/12/'+edtano.text;
   MesFim:= '31/12/'+edtano.text;

   with qrySomaMes do
    begin
     close;
     ParamByName('pini').value := MesIni;
     ParamByName('pfim').value := MesFim;
     parambyname('pcli').Value := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
     parambyname('pven').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
     parambyname('pfor').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
     ParamByName('pcod').value := dtSalvarLancados.fieldbyname('codigo').value;
     open;
   end;

   if qrySomaMes.fieldbyname('sum').value <> null then  Dez :=qrySomaMes.fieldbyname('sum').value else Dez:=0;

   dtSaveSoma.open;
   dtSaveSoma.append;
   dtSaveSoma.FieldByName('Produto').value := dtsalvarlancados.fieldbyname('produto').value;
   dtSaveSoma.FieldByName('Jan').value  := Jan;
   dtSaveSoma.FieldByName('Fev').value  := Fev;
   dtSaveSoma.FieldByName('Mar').value  := Mar;
   dtSaveSoma.FieldByName('Abr').value  := Abr;
   dtSaveSoma.FieldByName('Mai').value  := Mai;
   dtSaveSoma.FieldByName('Jun').value  := Jun;
   dtSaveSoma.FieldByName('Jul').value  := Jul;
   dtSaveSoma.FieldByName('Ago').value  := Ago;
   dtSaveSoma.FieldByName('Sept').value := Sept;
   dtSaveSoma.FieldByName('Out').value  := Outb;
   dtSaveSoma.FieldByName('Nov').value  := Nov;
   dtSaveSoma.FieldByName('Dez').value  := Dez;
   dtsaveSoma.post;
   dtsavesoma.close;
   dtSalvarLancados.Next;
  end;
  dm.TRANSATOTAL.Commit;
  dtsavesoma.open;
  report.print;
end;
end;

end.
