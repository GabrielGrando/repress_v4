unit untExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls,oledb,COMOBJ, OleServer,
  Grids, DB, ibx.IBCustomDataSet, ibx.IbQuery, DBGrids, ibx.IBTable,INIFILES;

type
  TfrmEXPExcel = class(TForm)
    qryPedido: TIBQuery;
    qryPedidoCODPEDIDO: TIBStringField;
    qryPedidoCODCLIENTE: TIntegerField;
    qryPedidoCODVENDEDOR: TIBStringField;
    qryPedidoCODFORNECEDOR: TIBStringField;
    qryPedidoCODTRANS: TIBStringField;
    qryPedidoTIPO_FRETE: TIBStringField;
    qryPedidoPRAZO_PGTO: TIntegerField;
    qryPedidoENTREGA: TDateTimeField;
    qryPedidoDATA: TDateTimeField;
    qryPedidoORDEM_DE_COMPRA: TIBStringField;
    qryPedidoBONIFICACAO: TIBStringField;
    qryPedidoOBS: TIBStringField;
    qryItens: TIBQuery;
    qryItensCODPEDIDO: TIBStringField;
    qryItensCODPRODUTO: TIBStringField;
    qryItensQTDE: TFloatField;
    qryItensVALOR: TFloatField;
    qryItensDESCONTO1: TFloatField;
    qryItensGRADE: TIntegerField;
    qryItensDESCONTO2: TFloatField;
    qryItensDESCONTO3: TFloatField;
    DTPRODUTOS: TIBTable;
    dtfornecedor: TIBTable;
    dtvendedor: TIBTable;
    dtcliente: TIBTable;
    dtpgto: TIBTable;
    DSPEDIDOS: TDataSource;
    DSITENS: TDataSource;
    dtfornecedorFORCODFORN: TIBStringField;
    dtfornecedorFORDATACAD: TDateTimeField;
    dtfornecedorFORRAZAO: TIBStringField;
    dtfornecedorFORENDERECO: TIBStringField;
    dtfornecedorFORBAIRRO: TIBStringField;
    dtfornecedorFORCIDADE: TIBStringField;
    dtfornecedorFORUF: TIBStringField;
    dtfornecedorFORCEP: TIBStringField;
    dtfornecedorFORCGC: TIBStringField;
    dtfornecedorFORINSC: TIBStringField;
    dtfornecedorFORTEL: TIBStringField;
    dtfornecedorFORFAX: TIBStringField;
    dtfornecedorFORCONTATO: TIBStringField;
    dtfornecedorFOROBS: TIBStringField;
    dtfornecedorCONTA: TIBStringField;
    dtfornecedorAGENCIA: TIBStringField;
    dtfornecedorBANCO: TIBStringField;
    dtfornecedorCIDADE: TIBStringField;
    dtfornecedorUF: TIBStringField;
    dtfornecedorTELEFONE: TIBStringField;
    dtvendedorCODIGO: TIBStringField;
    dtvendedorNOME: TIBStringField;
    dtvendedorENDERECO: TIBStringField;
    dtvendedorBAIRRO: TIBStringField;
    dtvendedorCIDADE: TIBStringField;
    dtvendedorUF: TIBStringField;
    dtvendedorRG: TIBStringField;
    dtvendedorCPF: TIBStringField;
    dtvendedorTELEFONE: TIBStringField;
    dtvendedorCELULAR: TIBStringField;
    dtvendedorFUNCAO: TIBStringField;
    DTPRODUTOSPROCODIGO: TIBStringField;
    DTPRODUTOSPRODESCRICAO: TIBStringField;
    DTPRODUTOSPROFORNECEDOR: TIBStringField;
    DTPRODUTOSPROUNIDADE: TIBStringField;
    DTPRODUTOSPROGRADE: TIntegerField;
    dtclienteCODIGO: TIntegerField;
    dtclienteRAZAO: TIBStringField;
    dtclienteFANTASIA: TIBStringField;
    dtclienteCNPJ: TIBStringField;
    dtclienteINSC: TIBStringField;
    dtclienteENDERECO: TIBStringField;
    dtclienteBAIRRO: TIBStringField;
    dtclienteCIDADE: TIBStringField;
    dtclienteUF: TIBStringField;
    dtclienteCEP: TIBStringField;
    dtclienteTELEFONE: TIBStringField;
    dtclienteFAX: TIBStringField;
    dtclienteCONTATO: TIBStringField;
    dtclienteBANCO: TIBStringField;
    dtclienteCONTA: TIBStringField;
    dtclienteAGENCIA: TIBStringField;
    dtclienteBANCOCIDADE: TIBStringField;
    dtclienteBANCOUF: TIBStringField;
    dtclienteBANCOTELEFONE: TIBStringField;
    dtclienteOBS: TIBStringField;
    dtpgtoCODIGO: TIntegerField;
    dtpgtoPRAZOPRIMEIRA: TIntegerField;
    dtpgtoQTDEPARCELAS: TIntegerField;
    dtpgtoDESCRICAO: TIBStringField;
    edtcod: TEdit;
    Shape2: TShape;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Shape4: TShape;
    Label22: TLabel;
    Image3: TImage;
    Label36: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtcodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEXPExcel: TfrmEXPExcel;

implementation

{$R *.dfm}

procedure TfrmEXPExcel.SpeedButton1Click(Sender: TObject);
var
Excel : Variant;
Linha:Integer;
numpedido:string;
tot1:string;
tot2:string;
i:integer;
nomearq:string;
soma:string;
ARQINI:TINIFILE;
vSoma : real;

begin

qrypedido.Close;
qrypedido.ParamByName('pcod').value := edtcod.text;
qrypedido.Open;

if qrypedido.eof then
 begin
  messagedlg('PEDIDO não encontrado!',mterror,[mbok],0);
  edtcod.setfocus;
  exit;
 end;

qryitens.close;
qryitens.parambyname('pcod').value:=edtcod.text;
qryitens.open;

if qryitens.eof then
 begin
  messagedlg('Pedido NÃO POSSUI ITENS cadastrados!',mterror,[mbok],0);
  edtcod.setfocus;
  exit;
 end;


dtprodutos.open;
dtfornecedor.open;
dtvendedor.open;
dtpgto.open;
dtcliente.open;

Excel := CreateOleObject('Excel.Application');
Excel.Visible :=True;
Excel.WorkBooks.Open(extractfilepath(application.exename)+'\Excel\Pedidos.xls');
Excel.WorkBooks[1].Sheets[1].Cells[7,2]:=qrypedido.FieldByName('codpedido').value;
Excel.WorkBooks[1].Sheets[1].Cells[7,4]:=qrypedido.FieldByName('ordem_de_compra').value;
Excel.WorkBooks[1].Sheets[1].Cells[7,6]:='Data: '+ datetostr(qrypedido.FieldByName('data').value);
Excel.WorkBooks[1].Sheets[1].Cells[7,15]:=qrypedido.FieldByName('entrega').value;
Excel.WorkBooks[1].Sheets[1].Cells[8,2]:=dtfornecedor.fieldbyname('forrazao').value;
Excel.WorkBooks[1].Sheets[1].Cells[9,2]:=dtVENDEDOR.fieldbyname('nome').value;
Excel.WorkBooks[1].Sheets[1].Cells[10,2]:=dtcliente.fieldbyname('razao').value;
Excel.WorkBooks[1].Sheets[1].Cells[11,2]:=qrypedido.FieldByName('tipo_frete').value;;
Excel.WorkBooks[1].Sheets[1].Cells[11,5]:=dtpgto.fieldbyname('descricao').value;
Excel.WorkBooks[1].Sheets[1].Cells[12,2]:=qrypedido.FieldByName('bonificacao').value;

Excel.WorkBooks[1].Sheets[1].Cells[2,11]:=qryPedidoCODCLIENTE.value;
Excel.WorkBooks[1].Sheets[1].Cells[3,11]:=qryPedidoCODVENDEDOR.value;
Excel.WorkBooks[1].Sheets[1].Cells[4,11]:=qryPedidoCODFORNECEDOR.value;
Excel.WorkBooks[1].Sheets[1].Cells[5,11]:=qryPedidoCODTRANS.value;
Excel.WorkBooks[1].Sheets[1].Cells[6,11]:=qryPedidoPRAZO_PGTO.value;


linha:=16;
tot1:='=((((((F16:F66*E16:E66-(F16:F66*E16:E66*(G16:G66/100)))))-((((F16:F66*E16:E66-(F16:F66*E16:E66*(G16:G66/100)))))*(H16:H66/100)))) - (((((F16:F66*E16:E66-';
tot2:='(F16:F66*E16:E66*(G16:G66/100)))))-((((F16:F66*E16:E66-(F16:F66*E16:E66*(G16:G66/100)))))*(H16:H66/100))) * (I16:I66/100)) )';
vSoma := 0;

while not qryitens.eof do
begin
Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:=qryitens.fieldbyname('codproduto').value;
Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:=dtprodutos.fieldbyname('prodescricao').value;
Excel.WorkBooks[1].Sheets[1].Cells[linha,5]:=qryitens.fieldbyname('qtde').value;
excel.WorkBooks[1].Sheets[1].Cells[linha,6]:=qryitens.fieldbyname('valor').value;
Excel.WorkBooks[1].Sheets[1].Cells[linha,7]:=qryitens.fieldbyname('desconto1').value;
Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:=qryitens.fieldbyname('desconto2').value;
Excel.WorkBooks[1].Sheets[1].Cells[linha,9]:=qryitens.fieldbyname('desconto3').value;
linha:=linha+1;
qryitens.Next;
end;

soma:='';

soma:= '=(';

for i := 16 to linha-1 do

 if i < linha -1 then
  soma:= soma +'J'+ inttostr(i)+ '+'
   else
  soma:= soma +'J'+ inttostr(i)+')';


Excel.WorkBooks[1].Sheets[1].Cells[linha,10]:= soma;

nomearq:='';

edtcod.text := datetostr(qrypedido.FieldByName('data').value) +' - '+ dtfornecedor.fieldbyname('forrazao').value +' - '+ dtcliente.fieldbyname('razao').value;

for i:=1 to length(edtcod.text) do
begin
if edtcod.text[i] = '/' then nomearq:=nomearq + '-' else nomearq:=nomearq + edtcod.text[i];
end;

edtcod.text := '';

ArqIni := tIniFile.Create(extractfilepath(application.exename)+'\config');

Excel.WorkBooks[1].SaveAs(ArqIni.Readstring('SALVAR', 'PASTA','')+nomearq+'.xls');

ArqIni.Free;
end;

procedure TfrmEXPExcel.edtcodKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
if key = vk_return then SpeedButton1Click(self);
end;

procedure TfrmEXPExcel.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

end.
