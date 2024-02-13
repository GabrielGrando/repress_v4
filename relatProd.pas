unit relatProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, Buttons, StdCtrls, DB,
  ibx.IBCustomDataSet, ibx.IbQuery, DBCtrls;

type
  TfrmRelatProduto = class(TForm)
    qrProdutos: TQuickRep;
    QRBand4: TQRBand;
    empresa: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape52: TQRShape;
    LBL: TQRLabel;
    QRSubDetail6: TQRSubDetail;
    QRShape55: TQRShape;
    QRDBText40: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    qryProdutos: TIBQuery;
    Shape2: TShape;
    QRLabel28: TQRLabel;
    QRShape43: TQRShape;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    Button3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Shape4: TShape;
    Label22: TLabel;
    Label36: TLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    Label1: TLabel;
    combofornecedor: TComboBox;
    Image3: TImage;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatProduto: TfrmRelatProduto;

implementation

uses untMenu, untProcedures;

{$R *.dfm}

procedure TfrmRelatProduto.SpeedButton1Click(Sender: TObject);
begin

if combofornecedor.Text = '' then
  begin
   messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
   combofornecedor.setfocus;
   exit;
  end else begin
   if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
   qryprodutos.close;
   qryprodutos.ParamByName('pCod').value:=frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qryprodutos.open;

   if qryprodutos.eof then
    begin
     messagedlg('Fornecedor não possui PRODUTOS cadastrados!',mterror,[mbok],0);
     exit;
    end;
  end;

Lbl.Caption :=combofornecedor.text;
qrProdutos.Preview;
end;

procedure TfrmRelatProduto.Button3Click(Sender: TObject);
begin
if combofornecedor.Text = '' then
  begin
   messagedlg('SELECIONE um Fornecedor!',mterror,[mbok],0);
   combofornecedor.setfocus;
   exit;
  end else begin
   if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
   qryprodutos.close;
   qryprodutos.ParamByName('pCod').value:=frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
   qryprodutos.open;

   if qryprodutos.eof then
    begin
     messagedlg('Fornecedor não possui PRODUTOS cadastrados!',mterror,[mbok],0);
     exit;
    end;
  end;

Lbl.Caption :=combofornecedor.text;
qrProdutos.Print;
end;

procedure TfrmRelatProduto.SpeedButton2Click(Sender: TObject);
begin
qrprodutos.PrinterSetup;
end;

procedure TfrmRelatProduto.FormCreate(Sender: TObject);
begin
frmSYSProcedures.qryempresa.Open;
empresa.caption := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
frmSYSProcedures.qryEMPRESA.close;

frmSYSProcedures.constroicombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
end;

procedure TfrmRelatProduto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if key = vk_escape then close;
if key = vk_return then SpeedButton1Click(self);
end;

end.
