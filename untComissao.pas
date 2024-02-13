unit untComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBCustomDataSet, Grids, DBGrids, ibx.IBTable, StdCtrls,
  ExtCtrls, Buttons, Mask, DBCtrls, Menus, ibx.IBQuery;

type
  TfrmCADComissao = class(TForm)
    dtPEDIDOS: TIBDataSet;
    dsPEDIDOS: TDataSource;
    dsItens: TDataSource;
    dtItens: TIBTable;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    box2: TGroupBox;
    box1: TGroupBox;
    Pop: TPopupMenu;
    Excluiritem1: TMenuItem;
    edttotal: TEdit;
    Label6: TLabel;
    qryTOTAL: TIBQuery;
    qryTOTALSUM: TFloatField;
    Image1: TImage;
    Label1: TLabel;
    edtcod: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    lancar: TSpeedButton;
    grid1: TDBGrid;
    Image2: TImage;
    lbl: TLabel;
    Image4: TImage;
    Label29: TLabel;
    lbltotal: TLabel;
    Bevel4: TBevel;
    SpeedButton6: TSpeedButton;
    fechar: TSpeedButton;
    LBLPEDIDO: TLabel;
    dtPEDIDOSCODPEDIDO: TIBStringField;
    dtPEDIDOSCODCLIENTE: TIntegerField;
    dtPEDIDOSCODVENDEDOR: TIBStringField;
    dtPEDIDOSCODFORNECEDOR: TIBStringField;
    dtPEDIDOSCODTRANS: TIBStringField;
    dtPEDIDOSCODIGO: TIBStringField;
    dtPEDIDOSNOME: TIBStringField;
    dtPEDIDOSCODIGO1: TIntegerField;
    dtPEDIDOSRAZAO: TIBStringField;
    dtPEDIDOSFORCODFORN: TIBStringField;
    dtPEDIDOSFORRAZAO: TIBStringField;
    dtPEDIDOSTIPO_FRETE: TIBStringField;
    dtPEDIDOSPRAZO_PGTO: TIntegerField;
    dtPEDIDOSENTREGA: TDateTimeField;
    dtPEDIDOSDATA: TDateTimeField;
    dtPEDIDOSORDEM_DE_COMPRA: TIBStringField;
    dtPEDIDOSBONIFICACAO: TIBStringField;
    dtPEDIDOSOBS: TIBStringField;
    dtPEDIDOSENDERECO: TIBStringField;
    dtPEDIDOSBAIRRO: TIBStringField;
    dtPEDIDOSCIDADE: TIBStringField;
    dtPEDIDOSUF: TIBStringField;
    dtPEDIDOSRG: TIBStringField;
    dtPEDIDOSCPF: TIBStringField;
    dtPEDIDOSTELEFONE: TIBStringField;
    dtPEDIDOSCELULAR: TIBStringField;
    dtPEDIDOSFUNCAO: TIBStringField;
    dtPEDIDOSFANTASIA: TIBStringField;
    dtPEDIDOSCNPJ: TIBStringField;
    dtPEDIDOSINSC: TIBStringField;
    dtPEDIDOSENDERECO1: TIBStringField;
    dtPEDIDOSBAIRRO1: TIBStringField;
    dtPEDIDOSCIDADE1: TIBStringField;
    dtPEDIDOSUF1: TIBStringField;
    dtPEDIDOSCEP: TIBStringField;
    dtPEDIDOSTELEFONE1: TIBStringField;
    dtPEDIDOSFAX: TIBStringField;
    dtPEDIDOSCONTATO: TIBStringField;
    dtPEDIDOSBANCO: TIBStringField;
    dtPEDIDOSCONTA: TIBStringField;
    dtPEDIDOSAGENCIA: TIBStringField;
    dtPEDIDOSBANCOCIDADE: TIBStringField;
    dtPEDIDOSBANCOUF: TIBStringField;
    dtPEDIDOSBANCOTELEFONE: TIBStringField;
    dtPEDIDOSOBS1: TIBStringField;
    dtPEDIDOSFORDATACAD: TDateTimeField;
    dtPEDIDOSFORENDERECO: TIBStringField;
    dtPEDIDOSFORBAIRRO: TIBStringField;
    dtPEDIDOSFORCIDADE: TIBStringField;
    dtPEDIDOSFORUF: TIBStringField;
    dtPEDIDOSFORCEP: TIBStringField;
    dtPEDIDOSFORCGC: TIBStringField;
    dtPEDIDOSFORINSC: TIBStringField;
    dtPEDIDOSFORTEL: TIBStringField;
    dtPEDIDOSFORFAX: TIBStringField;
    dtPEDIDOSFORCONTATO: TIBStringField;
    dtPEDIDOSFOROBS: TIBStringField;
    dtPEDIDOSCONTA1: TIBStringField;
    dtPEDIDOSAGENCIA1: TIBStringField;
    dtPEDIDOSBANCO1: TIBStringField;
    dtPEDIDOSCIDADE2: TIBStringField;
    dtPEDIDOSUF2: TIBStringField;
    dtPEDIDOSTELEFONE2: TIBStringField;
    dtPEDIDOSCODPEDIDO1: TIBStringField;
    dtPEDIDOSCODPRODUTO: TIBStringField;
    dtPEDIDOSQTDE: TFloatField;
    dtPEDIDOSVALOR: TFloatField;
    dtPEDIDOSDESCONTO1: TFloatField;
    dtPEDIDOSGRADE: TIntegerField;
    dtPEDIDOSDESCONTO2: TFloatField;
    dtPEDIDOSDESCONTO3: TFloatField;
    dtItensCODPEDIDO: TIBStringField;
    dtItensNUM_NF: TIBStringField;
    dtItensDATA_NF: TDateTimeField;
    dtItensVALOR_NF: TFloatField;
    dtItensCOMISSAO: TFloatField;
    dtItensDATA_PGTO: TDateTimeField;
    dtItensTOTAL: TCurrencyField;
    Label7: TLabel;
    Shape4: TShape;
    Label22: TLabel;
    Image3: TImage;
    Label36: TLabel;
    Label24: TLabel;
    dtItens2: TIBDataSet;
    dtItens2CODPEDIDO: TIBStringField;
    dtItens2CODPRODUTO: TIBStringField;
    dtItens2QTDE: TFloatField;
    dtItens2VALOR: TFloatField;
    dtItens2DESCONTO2: TFloatField;
    dtItens2DESCONTO3: TFloatField;
    dtItens2DESCONTO1: TFloatField;
    dtItens2GRADE: TIntegerField;
    dtItens2PRODESCRICAO: TIBStringField;
    dtItens2PROUNIDADE: TIBStringField;
    dtItens2PROGRADE: TIntegerField;
    dtItens2TOTAL: TCurrencyField;
    dtItens2desconto: TCurrencyField;
    procedure dtItensCalcFields(DataSet: TDataSet);
    Function CalculaTotal :integer;
    procedure dtItensAfterOpen(DataSet: TDataSet);
    procedure dtItensBeforePost(DataSet: TDataSet);
    procedure dtItensAfterDelete(DataSet: TDataSet);
    procedure dtItensAfterPost(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lancarClick(Sender: TObject);
    procedure fecharClick(Sender: TObject);
    procedure Excluiritem1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure grid1KeyPress(Sender: TObject; var Key: Char);
    procedure dtItensCOMISSAOChange(Sender: TField);
    procedure edtcodChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtItens2CalcFields(DataSet: TDataSet);
  private

  public

  end;

var
  frmCADComissao: TfrmCADComissao;

implementation

uses untMenu, untDM, untPrepedido2;

{$R *.dfm}

procedure TfrmCADComissao.dtItensCalcFields(DataSet: TDataSet);
begin
dtitenstotal.value:=dtitensvalor_nf.Value * (dtitenscomissao.value / 100);
end;

Function TfrmCADComissao.CalculaTotal :integer;
Var
  VarTot:Real;
  VarPonto:Integer;
Begin
VarTot:=0;
VarPonto:=0;

dtitens.open;
dtitens.first;
While Not dtItens.eof do
  begin
    VarTot:=VarTot+dtItensTotal.Value;
    dtItens.Next;
  end;
    lbltotal.Caption:=FloatToStrf(VarTot,ffcurrency,18,2);
    Result:=VarPonto;
end;


procedure TfrmCADComissao.dtItensAfterOpen(DataSet: TDataSet);
begin
calculatotal;
end;

procedure TfrmCADComissao.dtItensBeforePost(DataSet: TDataSet);
begin
dtitens.FieldByName('codpedido').value:=dtPEDIDOS.fieldbyname('codpedido').value;
end;

procedure TfrmCADComissao.dtItensAfterDelete(DataSet: TDataSet);
begin
calculatotal;
end;

procedure TfrmCADComissao.dtItensAfterPost(DataSet: TDataSet);
begin
calculatotal;
DM.TRANSACAO.Commit;
dtPedidos.CLOSE;
dtPedidos.ParamByName('PCOD').VALUE:=LBLPEDIDO.CAPTION;
dtPedidos.OPEN;
DTITENS.OPEN;
end;

procedure TfrmCADComissao.SpeedButton1Click(Sender: TObject);
var
  VarTot:Real;
  VarPonto:Integer;
begin
dtPedidos.Close;
dtPedidos.ParamByName('pcod').value:=edtcod.text;
dtPedidos.Open;

if dtPedidos.eof then
 begin
  messagedlg('Pedido não cadastrado ou o pedido não possui itens cadastrados!',mterror,[mbok],0);
  lancar.enabled:=false;
  edtcod.setfocus;
  lbltotal.Caption := 'R$ 0,00';
  lbl.Caption := 'Notas do pedido';
  dtitens.close;
 end else begin
  qryTOTAL.close;
  qryTOTAL.ParamByName('pcod').Value :=edtcod.text;
  qryTOTAL.open;

  // VACILO DA SOMA DAS COMISSÕES
  VarTot:=0;
  VarPonto:=0;
  dtitens.close;
  dtitens2.ParamByName('pcod').value :=  edtcod.Text;
  dtitens2.open;
  dtItens2.First;

  While Not dtItens2.eof do
   begin
    VarTot:=VarTot+dtItens2Total.Value;
    dtItens2.Next;
   end;
    EDTtotal.text:=FloatToStrf(VarTot,ffcurrency,18,2);
  //FIM DO VACILO


//  edttotal.text:=FloatToStrf(qryTOTAL.fieldbyname('sum').value,ffcurrency,18,2);
  lancar.enabled:=true;
  dtitens.Open;
  lbl.Caption := 'Notas do pedido Nº'+dtPEDIDOS.fieldbyname('codpedido').value;
  calculatotal;
 end;
end;

procedure TfrmCADComissao.FormShow(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmcadcomissao.Caption := 'Entrada de Comissões - '+datetostr(now);
edtcod.setfocus;
dtPEDIDOS.close;
dtitens.close;
edtcod.text      :='';
lbl.Caption      := 'Notas do Pedido';
lbltotal.Caption := 'R$ 0,00';
end;

procedure TfrmCADComissao.lancarClick(Sender: TObject);
begin
LBLPEDIDO.CAPTION   := EDTCOD.Text;
lancar.Enabled      := false;
box1.Enabled        := false;
box2.Enabled        := true;
grid1.SelectedIndex := 0;
fechar.Enabled      := true;
grid1.setfocus;
dtitens.open;
end;

procedure TfrmCADComissao.fecharClick(Sender: TObject);
begin
edttotal.Text    := '';
lbl.Caption      := 'Notas do pedido';
lbltotal.Caption := 'R$ 0,00';
box1.Enabled     := true;
box2.Enabled     :=false;
fechar.Enabled   :=false;
edtcod.Text      :='';
edtcod.SetFocus;

dtPedidos.Close;
dtitens.close;
dm.transacao.commit;

end;

procedure TfrmCADComissao.Excluiritem1Click(Sender: TObject);
begin
dtitens.Delete;
end;

procedure TfrmCADComissao.SpeedButton6Click(Sender: TObject);
begin
 try
  Winexec('Calc.exe',Sw_Show);
 except
  messagedlg('Verifique se a Calculadora foi Instalada pelo Windows!',mterror,[mbok],0);
 end;
end;

procedure TfrmCADComissao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if fechar.Enabled = true then
 begin
  canclose:=false;
  messagedlg('Antes de fechar é necessário finalizar a operação clicando em Fechar entrada de notas',mterror,[mbok],0);
 end;
end;

procedure TfrmCADComissao.SpeedButton2Click(Sender: TObject);
begin
frmPrepedido_espelho:=tfrmPrepedido_espelho.create(self);

with frmPrepedido_espelho do
begin
 lbl.visible           := true;
 label41.CAPTION       := 'Pesquisa de Pedidos para COMISSÃO';
 height                := 613;
 pesquisa.caption      := 'PESQUISA';
 COMBOVENDEDOR.enabled := FALSE;
 COMBOVENDEDOR.color   := clmedgray;
end;

frmPrepedido_espelho.showmodal;
frmPrepedido_espelho.free;
end;

procedure TfrmCADComissao.grid1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 begin
  with TDBGrid(ActiveControl) do
   begin
    if selectedindex = 4 then
     begin
      selectedindex := 0;
      dtitens.Append;
      exit;
     end;
    if selectedindex = 3 then selectedindex := 4;
    if selectedindex = 2 then selectedindex :=3;
    if selectedindex = 1 then selectedindex :=2;
    if selectedindex = 0 then selectedindex:= 1;
   end;
 end;
end;

procedure TfrmCADComissao.dtItensCOMISSAOChange(Sender: TField);
begin
 IF dtitenscomissao.Value > 100 then
  begin
   messagedlg('Comissão não pode exceder 100%',mterror,[mbok],0);
   grid1.selectedindex:=2;
  end;
end;

procedure TfrmCADComissao.edtcodChange(Sender: TObject);
begin
lbl.Caption      := 'Notas do pedido';
box1.Enabled     :=true;
box2.Enabled     :=false;
fechar.Enabled   :=false;
lbltotal.Caption := 'R$ 0,00';
lancar.Enabled   :=false;
edttotal.Text    :='';
edtcod.SetFocus;

dtPEDIDOS.Close;
dtitens.close;
end;

procedure TfrmCADComissao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key = vk_return) and (box1.Enabled = true) then SpeedButton1Click(self);
if (key = vk_f1) and (lancar.Enabled = true) then lancarclick(self);
if (key = vk_f2) and (box2.Enabled = true) then fecharClick(self);
if (key = vk_f3) and (box1.Enabled = true) then SpeedButton2Click(self);
if key = vk_escape then close;
end;

procedure TfrmCADComissao.dtItens2CalcFields(DataSet: TDataSet);
begin
dtitens2total.value:=((dtitens2qtde.Value * dtitens2valor.Value) - (dtitens2qtde.Value * dtitens2valor.Value * (dtitens2desconto1.value/100)));
dtitens2total.value:=((dtitens2total.Value) - (dtitens2total.Value * (dtitens2desconto2.value/100)));
dtitens2total.value:=((dtitens2total.Value) - (dtitens2total.Value * (dtitens2desconto3.value/100)));
end;

end.
