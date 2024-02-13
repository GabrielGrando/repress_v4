unit untOUTExportacaoDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls,oledb,COMOBJ, OleServer, Excel97,
  Grids, DB, ibx.IBCustomDataSet, ibx.IbQuery, DBGrids, ibx.IBTable,INIFILES,
  ibx.IbDatabase, Mask;

type
  TfrmOUTExportacaoPedido = class(TForm)
    qryPedidos: TIBQuery;
    DataSource1: TDataSource;
    qryPedidosCODPEDIDO: TIBStringField;
    qryPedidosCODCLIENTE: TIntegerField;
    qryPedidosCODVENDEDOR: TIBStringField;
    qryPedidosCODFORNECEDOR: TIBStringField;
    qryPedidosCODTRANS: TIBStringField;
    qryPedidosTIPO_FRETE: TIBStringField;
    qryPedidosPRAZO_PGTO: TIntegerField;
    qryPedidosENTREGA: TDateTimeField;
    qryPedidosDATA: TDateTimeField;
    qryPedidosORDEM_DE_COMPRA: TIBStringField;
    qryPedidosBONIFICACAO: TIBStringField;
    qryPedidosOBS: TIBStringField;
    qryItens: TIBQuery;
    qryItensCODPEDIDO: TIBStringField;
    qryItensCODPRODUTO: TIBStringField;
    qryItensQTDE: TFloatField;
    qryItensVALOR: TFloatField;
    qryItensDESCONTO1: TFloatField;
    qryItensGRADE: TIntegerField;
    qryItensDESCONTO2: TFloatField;
    qryItensDESCONTO3: TFloatField;
    qryItensESTOQUE: TIntegerField;
    DIALOG: TOpenDialog;
    dtPedidos: TIBDataSet;
    dtItens: TIBDataSet;
    dtPedidosCODPEDIDO: TIBStringField;
    dtPedidosCODCLIENTE: TIntegerField;
    dtPedidosCODVENDEDOR: TIBStringField;
    dtPedidosCODFORNECEDOR: TIBStringField;
    dtPedidosCODTRANS: TIBStringField;
    dtPedidosTIPO_FRETE: TIBStringField;
    dtPedidosPRAZO_PGTO: TIntegerField;
    dtPedidosENTREGA: TDateTimeField;
    dtPedidosDATA: TDateTimeField;
    dtPedidosORDEM_DE_COMPRA: TIBStringField;
    dtPedidosBONIFICACAO: TIBStringField;
    dtPedidosOBS: TIBStringField;
    dtItensCODPEDIDO: TIBStringField;
    dtItensCODPRODUTO: TIBStringField;
    dtItensQTDE: TFloatField;
    dtItensVALOR: TFloatField;
    dtItensDESCONTO1: TFloatField;
    dtItensGRADE: TIntegerField;
    dtItensDESCONTO2: TFloatField;
    dtItensDESCONTO3: TFloatField;
    dtItensESTOQUE: TIntegerField;
    qryCodigo: TIBQuery;
    qryCodigoCOUNT: TIntegerField;
    qryProduto: TIBQuery;
    qryProdutoPROCODIGO: TIBStringField;
    qryProdutoPRODESCRICAO: TIBStringField;
    qryProdutoPROFORNECEDOR: TIBStringField;
    qryProdutoPROUNIDADE: TIBStringField;
    qryProdutoPROGRADE: TIntegerField;
    qryProdutoCODBARRA: TIBStringField;
    qryPedidosCODIGO: TIntegerField;
    qryPedidosRAZAO: TIBStringField;
    qryPedidosFORRAZAO: TIBStringField;
    qryPedidosCODIGO1: TIntegerField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    Edit2: TEdit;
    BitBtn4: TBitBtn;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    edtNomeArq: TEdit;
    Label3: TLabel;
    edit1: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOUTExportacaoPedido: TfrmOUTExportacaoPedido;
  ArqIni  : tInifile;
  Excel   : Variant;
  Linha   : Integer;
  NomeArq : String;
  i       : Integer;
  vCodPedido : integer;
  Linhaitens : integer;

implementation

uses untDM, untMenu, untRelatpedidos3;

{$R *.dfm}

procedure TfrmOUTExportacaoPedido.BitBtn1Click(Sender: TObject);
begin
IF EDIT1.Text = '' THEN EXIT; 
qryPedidos.close;
qryPedidos.parambyname('pdata').Value := edit1.text;
qrypedidos.open;
end;

procedure TfrmOUTExportacaoPedido.BitBtn2Click(Sender: TObject);
begin


if (qrypedidos.eof and qrypedidos.bof) then showmessage('Nenhum pedido para exportação!');

qryPedidos.first;
Linha := 2;
Excel := CreateOleObject('Excel.Application');
Excel.Visible :=false;
Excel.WorkBooks.Open(extractfilepath(application.exename)+'\Excel\Exportacao.xls');

WHILE NOT qryPedidos.eof do
  begin
   Excel.WorkBooks[1].Sheets[1].Cells[Linha,1]:= Linha-1;
   Excel.WorkBooks[1].Sheets[1].Cells[Linha,2]:= (datetostr(qryPedidosDATA.value));

   Excel.WorkBooks[1].Sheets[1].Cells[Linha,3]:= (datetostr(qryPedidosENTREGA.value));
   Excel.WorkBooks[1].Sheets[1].Cells[Linha,4]:= qryPedidosCODFORNECEDOR.value;
   Excel.WorkBooks[1].Sheets[1].Cells[Linha,5]:= qryPedidosCODVENDEDOR.value;
   Excel.WorkBooks[1].Sheets[1].Cells[Linha,6]:= qryPedidosCODCLIENTE.value;
   Excel.WorkBooks[1].Sheets[1].Cells[Linha,7]:= qryPedidosTIPO_FRETE.value;
   Excel.WorkBooks[1].Sheets[1].Cells[Linha,8]:= qryPedidosPRAZO_PGTO.value;
   Excel.WorkBooks[1].Sheets[1].Cells[Linha,9]:= qryPedidosBONIFICACAO.value;
   linha := linha + 1;
   qryPedidos.next;
  end;

 Excel.WorkBooks[1].Sheets[1].Cells[Linha,1]:= '0';

 qryPedidos.First;
 vCodPedido := 1;
 linha := 2;

 WHILE NOT qryPedidos.eof do
  begin
   qryItens.close;
   qryItens.ParamByName('pCod').value := qryPedidosCODPEDIDO.value;
   qryItens.open;

    while not qryItens.eof do
     begin
      Excel.WorkBooks[1].Sheets[2].Cells[Linha,1]:= vCodPedido;
      Excel.WorkBooks[1].Sheets[2].Cells[Linha,2]:= qryItensCODPRODUTO.value;
      Excel.WorkBooks[1].Sheets[2].Cells[Linha,3]:= qryItensQTDE.value;
      Excel.WorkBooks[1].Sheets[2].Cells[Linha,4]:= qryItensVALOR.value;
      Excel.WorkBooks[1].Sheets[2].Cells[Linha,5]:= qryItensDESCONTO1.value;
      Excel.WorkBooks[1].Sheets[2].Cells[Linha,6]:= qryItensDESCONTO2.value;
      Excel.WorkBooks[1].Sheets[2].Cells[Linha,7]:= qryItensDESCONTO3.value;
      Linha := Linha + 1;
      qryItens.Next;
     end;

   Excel.WorkBooks[1].Sheets[2].Cells[Linha,1]:= '0';
   vCodPedido := vCodPedido + 1;
   qryPedidos.next;
  end;

edtnomearq.text := 'Exportacao_Repress_' + Edit1.text + ' - '+frmsysmenu.st.panels[0].text;
nomearq:='';

for i:=1 to length(edtnomearq.text) do
begin
if (edtnomearq.text[i] = '/') or (edtnomearq.text[i] = ':') then nomearq:=nomearq + ' ' else nomearq:=nomearq + edtnomearq.text[i];
end;

edtNomeArq.text := nomearq;

ArqIni := tIniFile.Create(extractfilepath(application.exename)+'\config');

Excel.WorkBooks[1].SaveAs(ArqIni.Readstring('SALVAR', 'PASTA','')+nomearq+'.xls');
messagedlg('Exportação realizada com sucesso! Arquivo salvo em: '+ArqIni.Readstring('SALVAR', 'PASTA','')+nomearq+'.xls',mtInformation,[mbOK],0);
Excel.quit;
ArqIni.Free;

end;

procedure TfrmOUTExportacaoPedido.BitBtn4Click(Sender: TObject);
begin
 ArqIni := tIniFile.Create(extractfilepath(application.exename)+'\config');
 dialog.InitialDir := ArqIni.Readstring('SALVAR', 'PASTA','');
 ArqIni.Free;
 DIALOG.Execute;
 IF DIALOG.FileName <> '' THEN EDIT2.TEXT := DIALOG.FileName;
end;

procedure TfrmOUTExportacaoPedido.BitBtn3Click(Sender: TObject);
var
 ValorTextoExcel :string;
 vComparacao1 : string;
 vComparacao2 : string;
 vCodigoGrade : integer;
 ValorZero : string;
begin

Linha := 2;
Excel := CreateOleObject('Excel.Application');
Excel.Visible :=false;
Excel.WorkBooks.Open(edit2.Text);

dtPedidos.Open;
ValorTextoExcel := Excel.WorkBooks[1].Sheets[1].Cells[Linha,1];

IF Excel.WorkBooks[1].Sheets[1].Cells[2,10].value = 'S' THEN
begin
 if messagedlg('Arquivo já exportado, deseja exportar novamente?',mtWarning,[mbyes, mbno],0) = mrno then exit;
end;

 try

WHILE ValorTextoExcel <> '0' do
  begin
   qryCodigo.close;
   qryCodigo.open;

   dtPedidos.Append;
   dtPedidosCODPEDIDO.Value := 'IMP'+inttostr(qryCodigoCOUNT.value + 1);
   dtPedidosDATA.Value := strtodate(Excel.WorkBooks[1].Sheets[1].Cells[Linha,2]);
   dtPedidosENTREGA.Value := strtodate(Excel.WorkBooks[1].Sheets[1].Cells[Linha,3]);
   dtPedidosCODFORNECEDOR.Value := Excel.WorkBooks[1].Sheets[1].Cells[Linha,4];
   dtPedidosCODVENDEDOR.Value := Excel.WorkBooks[1].Sheets[1].Cells[Linha,5];
   dtPedidosCODCLIENTE.Value := Excel.WorkBooks[1].Sheets[1].Cells[Linha,6];
   dtPedidosTIPO_FRETE.Value := Excel.WorkBooks[1].Sheets[1].Cells[Linha,7];
   dtPedidosPRAZO_PGTO.Value := Excel.WorkBooks[1].Sheets[1].Cells[Linha,8];
   dtPedidosBONIFICACAO.Value := Excel.WorkBooks[1].Sheets[1].Cells[Linha,9];
   dtPedidosCODTRANS.Value := '1';

   LinhaItens := 2;
   ValorTextoExcel := Excel.WorkBooks[1].Sheets[2].Cells[LinhaItens,1];

     WHILE ValorTextoExcel <> '0' do
       begin
         vComparacao1 := Excel.WorkBooks[1].Sheets[1].Cells[Linha,1];
         vComparacao2 := Excel.WorkBooks[1].Sheets[2].Cells[LinhaItens,1];
         if vComparacao1  = vComparacao2  then Excel.WorkBooks[1].Sheets[2].Cells[LinhaItens,1] := 'IMP'+inttostr(qryCodigoCOUNT.value + 1);
         LinhaItens := Linhaitens + 1;
         ValorTextoExcel := Excel.WorkBooks[1].Sheets[2].Cells[LinhaItens,1];
       end;

   Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := 'IMP'+inttostr(qryCodigoCOUNT.value + 1);
   Linha := Linha + 1;
   ValorTextoExcel := Excel.WorkBooks[1].Sheets[1].Cells[Linha,1];
   dtPedidos.post;
  end;

 dtPedidos.close;
 dm.TRANSACAO.Commit;

 Linha := 2;
 dtItens.open;

 ValorTextoExcel := Excel.WorkBooks[1].Sheets[2].Cells[Linha,1];

 WHILE ValorTextoExcel <> '0' do
  begin
  ValorZero := Excel.WorkBooks[1].Sheets[2].Cells[Linha,3];
  if ValorZero <> '0' then
   begin

   qryProduto.Close;
   qryProduto.SQL.clear;
   qryProduto.sql.Add('select * from produtos where procodigo = '+ quotedstr(Excel.WorkBooks[1].Sheets[2].Cells[Linha,2].VALUE));
   qryProduto.OPEN;

   IF qryProduto.Fieldbyname('PROGRADE').Value <> NULL THEN
    begin
     vCodigoGrade := qryProduto.Fieldbyname('PROGRADE').Value;
     dtItens.Append;
     dtItensCODPEDIDO.Value := Excel.WorkBooks[1].Sheets[2].Cells[Linha,1];
     dtItensCODPRODUTO.Value := Excel.WorkBooks[1].Sheets[2].Cells[Linha,2];
     dtItensGRADE.Value := vCodigoGrade;
     dtItensQTDE.Value := Excel.WorkBooks[1].Sheets[2].Cells[Linha,3];
     dtItensVALOR.Value := Excel.WorkBooks[1].Sheets[2].Cells[Linha,4];
     dtItensDESCONTO1.Value := Excel.WorkBooks[1].Sheets[2].Cells[Linha,5];
     dtItensDESCONTO2.Value := Excel.WorkBooks[1].Sheets[2].Cells[Linha,6];
     dtItensDESCONTO3.Value := Excel.WorkBooks[1].Sheets[2].Cells[Linha,7];
     dtItens.post;
    end;
  end; 
   Linha := Linha + 1;
   ValorTextoExcel := Excel.WorkBooks[1].Sheets[2].Cells[Linha,1];
 end;

 dm.TRANSACAO.Commit;
 Excel.WorkBooks[1].Sheets[1].Cells[2,10] := 'S';
 Linha := 2;
 ValorTextoExcel := Excel.WorkBooks[1].Sheets[1].Cells[Linha,1];
 frmrelatpedidos_PEDIDO:= tfrmrelatpedidos_PEDIDO.create(self);

 WHILE  ValorTextoExcel <> '0' do
  begin
   Memo1.lines.add(ValorTextoExcel);
   Shortdateformat:= ('dd/MM/yyyy');
   frmRelatPedidos_PEDIDO.edtcod.Text := ValorTextoExcel;
   frmRelatPedidos_PEDIDO.SpeedButton1Click(SELF);

   Linha := Linha + 1;
   ValorTextoExcel := Excel.WorkBooks[1].Sheets[1].Cells[Linha,1];
  end;

 frmrelatpedidos_PEDIDO.free;

messagedlg('Importação realizada com sucesso!',mtInformation,[mbOK],0);
Excel.WorkBooks[1].Save;
Excel.quit;

 except
  dm.TRANSACAO.Rollback;
  Excel.quit;
  messagedlg('Reinicie a máquina, caso o problema persista, faça novamente a exportação dos pedidos e realize a operação novamente!',mtWarning,[mbOK],0);
 end;
end;

procedure TfrmOUTExportacaoPedido.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if key = vk_return then BitBtn1Click(self);
end;

procedure TfrmOUTExportacaoPedido.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_escape then close;
end;

end.
