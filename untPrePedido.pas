unit untPrePedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls,oledb,COMOBJ, OleServer, Excel97,
  Grids, DB, ibx.IBCustomDataSet, ibx.IbQuery, DBGrids, ibx.IBTable,INIFILES, QuickRpt,
  QRCtrls, Menus;

type
  TfrmPrePedido_GRADE = class(TForm)
    Shape4: TShape;
    lista: TListBox;
    dsGrade: TDataSource;
    report: TQuickRep;
    qryGradeProdutos: TIBQuery;
    QRSubDetail2: TQRSubDetail;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRShape3: TQRShape;
    QRBand3: TQRBand;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRShape83: TQRShape;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRBand2: TQRBand;
    QRShape6: TQRShape;
    empresa: TQRLabel;
    endereco: TQRLabel;
    outros: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
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
    QRShape54: TQRShape;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel85: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRShape55: TQRShape;
    QRShape1: TQRShape;
    qryCliente: TIBQuery;
    qryFornecedor: TIBQuery;
    qryFornecedorFORCODFORN: TIBStringField;
    qryFornecedorFORDATACAD: TDateTimeField;
    qryFornecedorFORRAZAO: TIBStringField;
    qryFornecedorFORENDERECO: TIBStringField;
    qryFornecedorFORBAIRRO: TIBStringField;
    qryFornecedorFORCIDADE: TIBStringField;
    qryFornecedorFORUF: TIBStringField;
    qryFornecedorFORCEP: TIBStringField;
    qryFornecedorFORCGC: TIBStringField;
    qryFornecedorFORINSC: TIBStringField;
    qryFornecedorFORTEL: TIBStringField;
    qryFornecedorFORFAX: TIBStringField;
    qryFornecedorFORCONTATO: TIBStringField;
    qryFornecedorFOROBS: TIBStringField;
    qryFornecedorCONTA: TIBStringField;
    qryFornecedorAGENCIA: TIBStringField;
    qryFornecedorBANCO: TIBStringField;
    qryFornecedorCIDADE: TIBStringField;
    qryFornecedorUF: TIBStringField;
    qryFornecedorTELEFONE: TIBStringField;
    qryVendedor: TIBQuery;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    btn: TSpeedButton;
    box: TGroupBox;
    Label4: TLabel;
    Label2: TLabel;
    Pop: TPopupMenu;
    Excluirgrade1: TMenuItem;
    qry: TIBQuery;
    qryCODIGO: TIntegerField;
    qryDESCRICAO: TIBStringField;
    QRDBText13: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel1: TQRLabel;
    Label8: TLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape76: TQRShape;
    QRLabel89: TQRLabel;
    QRShape16: TQRShape;
    qryGrade: TIBQuery;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    qryGradeCODIGO: TIntegerField;
    qryGradeDESCRICAO: TIBStringField;
    qryGradeCODFORNECEDOR: TIBStringField;
    img: TImage;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    btnTodas: TSpeedButton;
    Shape2: TShape;
    Label9: TLabel;
    Image3: TImage;
    Label41: TLabel;
    combofornecedor: TComboBox;
    Shape1: TShape;
    Shape3: TShape;
    Shape6: TShape;
    combocliente: TComboBox;
    combovendedor: TComboBox;
    Image1: TImage;
    SpeedButton3: TSpeedButton;
    BitBtn1: TSpeedButton;
    dtpedidos: TIBDataSet;
    dtpedidosCODPEDIDO: TIBStringField;
    dtpedidosCODCLIENTE: TIntegerField;
    dtpedidosCODVENDEDOR: TIBStringField;
    dtpedidosCODFORNECEDOR: TIBStringField;
    dtpedidosCODTRANS: TIBStringField;
    dtpedidosTIPO_FRETE: TIBStringField;
    dtpedidosPRAZO_PGTO: TIntegerField;
    dtpedidosENTREGA: TDateTimeField;
    dtpedidosDATA: TDateTimeField;
    dtpedidosORDEM_DE_COMPRA: TIBStringField;
    dtpedidosBONIFICACAO: TIBStringField;
    dtpedidosOBS: TIBStringField;
    dtItensPedido: TIBDataSet;
    dtItensPedidoCODPEDIDO: TIBStringField;
    dtItensPedidoCODPRODUTO: TIBStringField;
    dtItensPedidoQTDE: TFloatField;
    dtItensPedidoVALOR: TFloatField;
    dtItensPedidoDESCONTO1: TFloatField;
    dtItensPedidoGRADE: TIntegerField;
    dtItensPedidoDESCONTO2: TFloatField;
    dtItensPedidoDESCONTO3: TFloatField;
    dtItensPedidoESTOQUE: TIntegerField;
    qryProd: TIBQuery;
    qryProdPROCODIGO: TIBStringField;
    qryProdPRODESCRICAO: TIBStringField;
    qryProdPROFORNECEDOR: TIBStringField;
    qryProdPROUNIDADE: TIBStringField;
    qryProdPROGRADE: TIntegerField;
    qryProdCODBARRA: TIBStringField;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edtvendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn3Click(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Excluirgrade1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnTodasClick(Sender: TObject);
    procedure combofornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure listaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure comboclienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure combovendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrePedido_GRADE: TfrmPrePedido_GRADE;
  vetor : array [0..60] of string;
  i:integer;
  soma:integer;

implementation

uses untMenu, untPrepedido2, untProcedures, untDM, untPedidos;

{$R *.dfm}

procedure TfrmPrePedido_GRADE.btn1Click(Sender: TObject);
var
 clausula: string;
 control:boolean;
 AUX:INTEGER;
begin

 if lista.Items.Text <> '' then
  begin

  if combocliente.Text <> '' then
   begin
    if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
    qrycliente.close;
    qrycliente.ParamByName('pcod').value   := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
    qrycliente.open;
   end;

  if combovendedor.Text <> '' then
   begin
    if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;
    qryvendedor.close;
    qryvendedor.ParamByName('pcod').value  := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
    qryvendedor.open;
   end;

   AUX:=I;
   i:=0;
   SOMA:=0;
   control:= FALSE;
   qryGradeprodutos.sql.clear;

   while vetor[i] <> '' do
    begin
     soma:=soma + 1;
     i:=i+1;
    end;

   i:=1;
   qryGradeProdutos.close;
   qryGradeProdutos.SQL.clear;
   qryGradeProdutos.sql.add('select * from produtos');

   while (soma >= i) do
    begin
     if i = 1 then
      begin
       Clausula := 'Where prograde = :pGrade'+inttostr(i);
       Control := FALSE;
      end;

    if (soma = i)  and  (control = TRUE) then Clausula:= 'or prograde = :pGrade'+inttostr(i);
    if (i <> 1) and (i <> soma) then Clausula:= 'or prograde = :pGrade'+inttostr(i);

    qryGradeProdutos.sql.add(clausula);
    qrygradeProdutos.ParamByName('pGrade'+inttostr(i)).Value := vetor[i - 1];
    i:=i+1;
    control := TRUE;
   end;
   qryGradeProdutos.SQL.add('order by prograde');
   qryGradeProdutos.Open;
   report.preview;
   i:=Aux;
   soma:=0;
 end else begin
   messagedlg('NEHUMA Linha selecionada!',mterror,[mbok],0);
 end;
end;

procedure TfrmPrePedido_GRADE.FormCreate(Sender: TObject);
begin
frmSYSProcedures.qryempresa.Open;
empresa.caption  := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
endereco.Caption := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('endereco').value +' - CEP: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cep').value+ ' - Fone: ' +frmSYSProcedures.qryEMPRESA.FIELDBYNAME('telefone').value;
outros.Caption   := 'FAX: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('fax').value + ' - E-mail: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('email').value + ' - ' + frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cidade').value + '-'+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('uf').value;
frmSYSProcedures.qryEMPRESA.close;

frmSYSProcedures.constroicombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
frmSYSProcedures.constroicombo('select * from clientes order by razao','razao',combocliente);

i    :=0;
soma :=0;
end;

procedure TfrmPrePedido_GRADE.btn2Click(Sender: TObject);
var
 clausula: string;
 control:boolean;
 AUX:INTEGER;
begin

 if lista.Items.Text <> '' then
  begin
    if combocliente.Text <> '' then
   begin
    if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
    qrycliente.close;
    qrycliente.ParamByName('pcod').value   := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
    qrycliente.open;
   end;

  if combovendedor.Text <> '' then
   begin
    if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;
    qryvendedor.close;
    qryvendedor.ParamByName('pcod').value  := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
    qryvendedor.open;
   end;

   AUX:=I;
   i:=0;
   SOMA:=0;
   control:= FALSE;
   qryGradeprodutos.sql.clear;

   while vetor[i] <> '' do
    begin
     soma:=soma + 1;
     i:=i+1;
    end;

   i:=1;
   qryGradeProdutos.close;
   qryGradeProdutos.SQL.clear;   
   qryGradeProdutos.sql.add('select * from produtos');

   while (soma >= i) do
    begin
     if i = 1 then
      begin
       Clausula := 'Where prograde = :pGrade'+inttostr(i);
       Control := FALSE;
      end;

    if (soma = i)  and  (control = TRUE) then Clausula:= 'or prograde = :pGrade'+inttostr(i);
    if (i <> 1) and (i <> soma) then Clausula:= 'or prograde = :pGrade'+inttostr(i);

    qryGradeProdutos.sql.add(clausula);
    qrygradeProdutos.ParamByName('pGrade'+inttostr(i)).Value := vetor[i - 1];
    i:=i+1;
    control := TRUE;
   end;
   qryGradeProdutos.SQL.add('order by prograde');
   qryGradeProdutos.Open;
   report.print;
   i:=Aux;
   soma:=0;
 end else begin
   messagedlg('NEHUMA Linha selecionada!',mterror,[mbok],0);
 end;
end;

procedure TfrmPrePedido_GRADE.edtvendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = vk_down then combovendedor.SetFocus;
end;

procedure TfrmPrePedido_GRADE.btn3Click(Sender: TObject);
begin
report.PrinterSetup;
end;

procedure TfrmPrePedido_GRADE.btnClick(Sender: TObject);
var
 clausula: string;
 control:boolean;
begin

if lista.Items.Text = '' then
 begin
  messagedlg('NEHUMA Linha selecionada!',mterror,[mbok],0);
  dbgrid1.SetFocus;
  exit;
 end;

i:=0;
control:= FALSE;
qrygradeprodutos.sql.clear;
frmprepedido_ESPELHO.qrygrade.sql.Clear;

while vetor[i] <> '' do
 begin
  soma:=soma + 1;
  i:=i+1;
 end;

i:=1;
qryGradeProdutos.close;

frmprepedido_ESPELHO.qrygrade.Close;

qryGradeProdutos.sql.add('select * from produtos');

frmprepedido_ESPELHO.qrygrade.SQL.ADD('SELECT * FROM PRODUTOS');

 while (soma >= i) do
  begin
   if i = 1 then
    begin
    clausula := 'Where prograde = :pGrade'+inttostr(i);
    control := FALSE;
    END;

   if (soma = i)  and  (control = TRUE) then Clausula:= 'or prograde = :pGrade'+inttostr(i);

   if (i <> 1) and (i <> soma) then Clausula:= 'or prograde = :pGrade'+inttostr(i);

   qryGradeProdutos.sql.add(clausula);
   frmprepedido_ESPELHO.qrygrade.SQL.ADD(CLAUSULA);
   qrygradeProdutos.ParamByName('pGrade'+inttostr(i)).Value := vetor[i - 1];
   frmprepedido_ESPELHO.qrygrade.parambyname('PGRADE'+INTTOSTR(I)).VALUE:=VETOR[I-1];
   i:=i+1;
   control := TRUE;
  end;

  i:=0;
  for i:=0 to 60 do vetor[i]:='';
  soma:=0;
  close;
end;
procedure TfrmPrePedido_GRADE.FormShow(Sender: TObject);
begin
if btn.Visible = true then dbgrid1.SetFocus else combofornecedor.setfocus;
lista.Items.Clear;
for i := 0 to 60 do vetor[i]:='';
i:=0;
end;

procedure TfrmPrePedido_GRADE.Excluirgrade1Click(Sender: TObject);
var
 aux:integer;
begin

try
aux:=i;
i:=0;

 qry.close;
 qry.parambyname('pdesc').value:= lista.Items.Strings[lista.ItemIndex];
 qry.open;

 while vetor [i] <> '' do
  begin
   if vetor[i] = qry.fieldbyname('codigo').value then
    begin
     vetor[i]:= '0';
    end;
    i:=i+1;
  end;


lista.items.Delete(lista.ItemIndex);
i:=aux;
except
 showmessage('Primeiro selecione uma grade para excluir!');
 lista.SetFocus; 
end;

end;

procedure TfrmPrePedido_GRADE.SpeedButton2Click(Sender: TObject);
begin
if combofornecedor.Text = '' then
  begin
   messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
   combofornecedor.setfocus;
   exit;
  end else begin
   if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
   qrygrade.close;
   qrygrade.ParamByName('Pcod').value:= frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qrygrade.open;

   if qrygrade.eof then
    begin
     messagedlg('Fornecedor não possui LINHAS cadastradas!',mterror,[mbok],0);
     exit;
    end;
   dbgrid1.setfocus;
  end;
end;

procedure TfrmPrePedido_GRADE.DBGrid1DblClick(Sender: TObject);
var
 z:integer;
begin
z:=0;

try

   while lista.Items.Strings[z] <> '' do
  begin
   if lista.items.Strings[z] = qrygrade.fieldbyname('descricao').value then
     begin
      messagedlg('Você já adiconou essa Linha!',mterror,[mbok],0);
      exit;
     end;
    z:=z+1;
  end;
except
end;

lista.Items.Add(qrygrade.fieldbyname('descricao').value);
vetor[i] := qrygrade.fieldbyname('codigo').value;
i:=i+1;
end;

procedure TfrmPrePedido_GRADE.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then DBGrid1DblClick(self);
end;

procedure TfrmPrePedido_GRADE.btnTodasClick(Sender: TObject);
begin
i:=0;
qrygrade.First;
if qrygrade.eof then
 begin
  messagedlg('Primeiro escolha um FORNECEDOR!',mterror,[mbok],0);
  combofornecedor.setfocus;
  exit;
 end;

while not qrygrade.Eof do
 begin
 lista.Items.Add(qrygrade.fieldbyname('descricao').value);
 vetor[i] := qrygrade.fieldbyname('codigo').value;
 i:=i+1;
 qrygrade.Next;
end;
qrygrade.First;
end;

procedure TfrmPrePedido_GRADE.combofornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then SpeedButton2Click(self);
end;

procedure TfrmPrePedido_GRADE.listaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_delete then Excluirgrade1Click(self);
end;

procedure TfrmPrePedido_GRADE.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;

end;

procedure TfrmPrePedido_GRADE.comboclienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then btn1Click(self);
end;

procedure TfrmPrePedido_GRADE.combovendedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then btn1Click(self);
end;

procedure TfrmPrePedido_GRADE.SpeedButton3Click(Sender: TObject);
var
 clausula: string;
 control:boolean;
 AUX:INTEGER;
 Excel : Variant;
 Linha:Integer;
 numpedido:string;
 tot1:string;
 tot2:string;
 i:integer;
 nomearq:string;
 soma:integer;
 soma2:string;
 ARQINI:TINIFILE;
 resposta:string;
 NOMEEXCEL:STRING;
begin

 if lista.Items.Text <> '' then
  begin

  if combocliente.Text <> '' then
   begin
    if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
    qrycliente.close;
    qrycliente.ParamByName('pcod').value   := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
    qrycliente.open;
   end;

  if combovendedor.Text <> '' then
   begin
    if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;
    qryvendedor.close;
    qryvendedor.ParamByName('pcod').value  := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
    qryvendedor.open;
   end;

   AUX:=I;
   i:=0;
   SOMA:=0;
   control:= FALSE;
   qryGradeprodutos.sql.clear;

   while vetor[i] <> '' do
    begin
     soma:=soma + 1;
     i:=i+1;
    end;

   i:=1;
   qryGradeProdutos.close;
   qryGradeProdutos.SQL.clear;
   qryGradeProdutos.sql.add('select * from produtos');

   while (soma >= i) do
    begin
     if i = 1 then
      begin
       Clausula := 'Where prograde = :pGrade'+inttostr(i);
       Control := FALSE;
      end;

    if (soma = i)  and  (control = TRUE) then Clausula:= 'or prograde = :pGrade'+inttostr(i);
    if (i <> 1) and (i <> soma) then Clausula:= 'or prograde = :pGrade'+inttostr(i);

    qryGradeProdutos.sql.add(clausula);
    qrygradeProdutos.ParamByName('pGrade'+inttostr(i)).Value := vetor[i - 1];
    i:=i+1;
    control := TRUE;
   end;
   qryGradeProdutos.SQL.add('order by prograde');
   qryGradeProdutos.Open;
   qrygradeprodutos.first;

  //EXCEL ****************************************
   ArqIni := tIniFile.Create(extractfilepath(application.exename)+'\config');
   repeat
   Resposta := InputBox('NOME DO ARQUIVO', 'Digite o nome do arquivo:',nomearq);
   if resposta = '' then exit;
   until Resposta <> '';
   NOMEEXCEL := (ArqIni.Readstring('SALVAR', 'PASTA','')+resposta+'.xls');
   ArqIni.Free;

  Excel := CreateOleObject('Excel.Application');
  Excel.Visible :=True;
  Excel.WorkBooks.Open('c:\repress\Excel\Pedidos.xls'); //CAMINHO ARQUIVO EXCEL
  Excel.WorkBooks[1].Sheets[1].Cells[7,2] :='';
  Excel.WorkBooks[1].Sheets[1].Cells[7,4] :='';
  Excel.WorkBooks[1].Sheets[1].Cells[7,7] :=datetostr(date);
  Excel.WorkBooks[1].Sheets[1].Cells[7,10]:='';
  Excel.WorkBooks[1].Sheets[1].Cells[8,2] :=combofornecedor.text;
  Excel.WorkBooks[1].Sheets[1].Cells[9,2] :=comboVENDEDOR.text;
  Excel.WorkBooks[1].Sheets[1].Cells[10,2]:=combocliente.text;
  Excel.WorkBooks[1].Sheets[1].Cells[11,2]:='CIF';
  Excel.WorkBooks[1].Sheets[1].Cells[11,5]:='';
  Excel.WorkBooks[1].Sheets[1].Cells[12,2]:='';


  linha:=16;
  tot1:='=((((((K16:K100*J16:J100-(K16:K100*J16:J100*(L16:L100/100)))))-((((K16:K100*J16:J100-(K16:K100*J16:J100*(L16:L100/100)))))*(M16:M100/100)))) - (((((K16:K100*J16:J100-';
  tot2:='(K16:K100*J16:J100*(L16:L100/100)))))-((((K16:K100*J16:J100-(K16:K100*J16:J100*(L16:L100/100)))))*(M16:M100/100))) * (N16:N100/100)) )';

  while not qrygradeprodutos.eof do
   begin
    Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:=qrygradeprodutos.fieldbyname('procodigo').value;
    Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:=qrygradeprodutos.fieldbyname('prodescricao').value;
    Excel.WorkBooks[1].Sheets[1].Cells[linha,5]:='';
    excel.WorkBooks[1].Sheets[1].Cells[linha,6]:='';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,7]:='';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:='';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,9]:='';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,15]:= tot1+tot2;
    linha:=linha+1;
    qrygradeprodutos.Next;
  end;


  soma2:='';
  soma2:= '=(';

  for i := 16 to linha-1 do
   begin
     if i < linha -1 then soma2:= soma2 +'O'+ inttostr(i)+ '+' else soma2:= soma2 +'O'+ inttostr(i)+')';
   end;


  Excel.WorkBooks[1].Sheets[1].Cells[linha,15]:= soma2;
  Excel.WorkBooks[1].SaveAs(NOMEEXCEL);

  i:=Aux;
  soma:=0;
  qrygradePRODUTOS.SQL.Text := '';
 end else begin
   messagedlg('NEHUMA Linha selecionada!',mterror,[mbok],0);
 end;
end;

procedure TfrmPrePedido_GRADE.SpeedButton1Click(Sender: TObject);
begin
for i:=0 to 60 do vetor[i] := '';
lista.Clear;
end;

procedure TfrmPrePedido_GRADE.BitBtn1Click(Sender: TObject);
var
 clausula: string;
 control:boolean;
 AUX:INTEGER;
 Excel : Variant;
 Linha:Integer;
 numpedido:string;
 tot1:string;
 tot2:string;
 i:integer;
 nomearq:string;
 soma:integer;
 soma2:string;
 ARQINI:TINIFILE;
 resposta:string;
 NOMEEXCEL:STRING;
 vCodPedido : integer;
begin

 if lista.Items.Text <> '' then
  begin

  if combocliente.Text <> '' then
   begin
    if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset) = 0 then exit;
    qrycliente.close;
    qrycliente.ParamByName('pcod').value   := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
    qrycliente.open;
   end;

  if combovendedor.Text <> '' then
   begin
    if frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset) = 0 then exit;
    qryvendedor.close;
    qryvendedor.ParamByName('pcod').value  := frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset);
    qryvendedor.open;
   end;

   AUX:=I;
   i:=0;
   SOMA:=0;
   control:= FALSE;
   qryGradeprodutos.sql.clear;

   while vetor[i] <> '' do
    begin
     soma:=soma + 1;
     i:=i+1;
    end;

   i:=1;
   qryGradeProdutos.close;
   qryGradeProdutos.SQL.clear;
   qryGradeProdutos.sql.add('select * from produtos');

   while (soma >= i) do
    begin
     if i = 1 then
      begin
       Clausula := 'Where prograde = :pGrade'+inttostr(i);
       Control := FALSE;
      end;

    if (soma = i)  and  (control = TRUE) then Clausula:= 'or prograde = :pGrade'+inttostr(i);
    if (i <> 1) and (i <> soma) then Clausula:= 'or prograde = :pGrade'+inttostr(i);

    qryGradeProdutos.sql.add(clausula);
    qrygradeProdutos.ParamByName('pGrade'+inttostr(i)).Value := vetor[i - 1];
    i:=i+1;
    control := TRUE;
   end;
   qryGradeProdutos.SQL.add('order by prograde');
   qryGradeProdutos.Open;
   qrygradeprodutos.first;

   dtPedidos.Open;
   dtpedidos.last;

   vCodPedido := dtPedidos.RecordCount + 100000;

   dtPedidos.Append;
   dtPedidosCODPEDIDO.AsInteger := vCodPedido;
   dtPedidosDATA.AsDateTime     := date;
   dtPedidosENTREGA.AsDateTime  := date + 1;
   dtPedidosCODCLIENTE.Value    := frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODCLIENTE','ENCONTRAR_CODIGO',comboCliente,frmsysprocedures.dataset);
   dtPedidosCODFORNECEDOR.Value := inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset));
   dtPedidosCODVENDEDOR.Value   := inttostr(frmSYSProcedures.BuscaCombo('PESQUISA','FUNCIONARIOS','NOME',combovendedor.text,'VENDEDOR','CODVENDEDOR','ENCONTRAR_CODIGO',combovendedor,frmsysprocedures.dataset));
   dtPedidosTIPO_FRETE.Value    := 'CIF';
   dtPedidosPRAZO_PGTO.Value    := 101;
   dtPedidosCODTRANS.Value      := '1';
   dtPedidosBONIFICACAO.Value   := 'NAO';
   vCodPedido                   := dtPedidosCODPEDIDO.AsInteger;
   dtPedidos.Post;
   dtPedidos.close;

   dtItensPedido.open;

  while not qrygradeprodutos.eof do
   begin

    qryProd.Close;
    qryProd.ParamByName('pCod').value := qryGradeProdutos.fieldbyname('PROCODIGO').value;
    qryProd.Open;

    if not qryProd.eof then
    begin
     dtItensPedido.Append;
     dtItensPedidoCODPEDIDO.AsInteger := vCodPedido;
     dtItensPedidoCODPRODUTO.Value    := qrygradeprodutos.fieldbyname('procodigo').value;
     dtItensPedidoQTDE.Value          := 0;
     dtItensPedidoVALOR.Value         := 0;
     dtItensPedidoGRADE.Value         := qryProdPROGRADE.Value;
     dtItensPedidoDESCONTO1.Value     := 0;
     dtItensPedidoDESCONTO2.Value     := 0;
     dtItensPedidoDESCONTO3.Value     := 0;
     dtItensPedido.Post;
    end;
    qrygradeprodutos.Next;
  end;


  dtItensPedido.Close;
  dm.transacao.commit;
  i:=Aux;
  soma:=0;
  qrygradePRODUTOS.SQL.Text := '';

  Shortdateformat:= ('dd/MM/yyyy');
  frmCADpedidos:= tfrmCADpedidos.create(self);
  frmCADPedidos.edtcod.Text := inttostr(vCodPedido);
  frmCADPedidos.vHerancaEspelho := true;
  frmCADpedidos.showmodal;
  frmCADpedidos.free;

 end else begin
   messagedlg('NEHUMA Linha selecionada!',mterror,[mbok],0);
 end;
end;

end.
