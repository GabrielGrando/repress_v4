unit untPromotor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls,oledb,COMOBJ, OleServer, Excel97,
  Grids, DB, ibx.IBCustomDataSet, ibx.IbQuery, DBGrids, ibx.IBTable,INIFILES, QuickRpt,
  QRCtrls, DBCtrls;

type
  TfrmEXPPromotor = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Shape4: TShape;
    qryProdutos: TIBQuery;
    edtnome: TEdit;
    Image1: TImage;
    Shape1: TShape;
    Label22: TLabel;
    Image3: TImage;
    Label36: TLabel;
    SpeedButton1: TSpeedButton;
    combofornecedor: TComboBox;
    combocliente: TComboBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEXPPromotor: TfrmEXPPromotor;

implementation

uses untProcedures;

{$R *.dfm}

procedure TfrmEXPPromotor.SpeedButton1Click(Sender: TObject);
var
Excel   : Variant;
Linha   : Integer;
i       : integer;
nomearq : string;
arqIni  : tInifile;
begin
if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
if frmSYSProcedures.BuscaCombo('PESQUISA','CLIENTES','RAZAO',combocliente.text,'CLIENTE','CODIGO','ENCONTRAR_CODIGO',combocliente,frmsysprocedures.dataset)                        = 0 then exit;

Excel := CreateOleObject('Excel.Application');
Excel.Visible :=True;
Excel.WorkBooks.Open(extractfilepath(application.exename)+'\Excel\Estoque.xls');
Excel.WorkBooks[1].Sheets[1].Cells[4,1]:='Legenda: E.D.-Depósito A.V.-Área de Vendas T.U.-Total Unidade D.P.-Depósito Central';
Excel.WorkBooks[1].Sheets[1].Cells[7,1]:='Cliente: '+ combocliente.text;
Excel.WorkBooks[1].Sheets[1].Cells[8,1]:='DATA: ' + DATETOSTR(NOW);

qryProdutos.Close;
qryProdutos.Parambyname('pCod').Value := frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
qryProdutos.Open;
qryProdutos.First;

linha := 12;

 while not qryPRODUTOS.eof do
  begin
   Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:=qryProdutos.fieldbyname('codBarra').value;
   Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:=qryProdutos.fieldbyname('proDescricao').value;
   linha:=linha+1;
   qryPRODUTOS.Next;
  end;

linha:=linha+1;
Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'Encarregado:';
linha:=linha+1;
Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'Promotor(a):';
linha:=linha+1;
Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= '1º Via CBO';
linha:=linha+1;
Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= '2º Via Vendedor';
linha:=linha+1;
Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'Check Out:';
linha:=linha+1;

nomearq:='';
edtnome.text:= combocliente.text+ '   (DATA '+datetostr(now)+')';

for i:=1 to length(edtnome.text) do if edtnome.text[i] = '/' then nomearq:=nomearq + '_' else nomearq:=nomearq + edtnome.text[i];

ArqIni := tIniFile.Create(extractfilepath(application.exename)+'\config');
Excel.WorkBooks[1].SaveAs(ArqIni.Readstring('SALVAR', 'PASTA','')+nomearq+'.xls');
ArqIni.Free;
end;

procedure TfrmEXPPromotor.FormCreate(Sender: TObject);
begin
frmsysprocedures.constroicombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
frmsysprocedures.constroicombo('select * from clientes order by razao','razao',combocliente);
end;

procedure TfrmEXPPromotor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

end.
