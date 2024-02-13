unit untPrePedido3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ExtCtrls, DB, ibx.IBCustomDataSet,
  ibx.IbQuery, QRCtrls, QuickRpt;

type
  TfrmPrePedido_BRANCO = class(TForm)
    report: TQuickRep;
    QRBand2: TQRBand;
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
    QRShape55: TQRShape;
    QRShape1: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape71: TQRShape;
    QRShape74: TQRShape;
    QRShape3: TQRShape;
    QRShape75: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape72: TQRShape;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
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
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape56: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape73: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    QRShape123: TQRShape;
    QRShape124: TQRShape;
    QRShape125: TQRShape;
    QRShape126: TQRShape;
    QRShape127: TQRShape;
    QRShape128: TQRShape;
    QRShape129: TQRShape;
    QRShape130: TQRShape;
    QRShape131: TQRShape;
    QRShape132: TQRShape;
    QRShape133: TQRShape;
    QRShape134: TQRShape;
    QRShape135: TQRShape;
    QRShape136: TQRShape;
    QRShape137: TQRShape;
    QRShape138: TQRShape;
    QRShape139: TQRShape;
    QRShape140: TQRShape;
    QRShape141: TQRShape;
    QRShape142: TQRShape;
    QRShape143: TQRShape;
    QRShape144: TQRShape;
    QRShape145: TQRShape;
    QRShape146: TQRShape;
    QRShape147: TQRShape;
    QRShape148: TQRShape;
    QRShape149: TQRShape;
    QRShape150: TQRShape;
    QRShape151: TQRShape;
    QRShape152: TQRShape;
    QRShape153: TQRShape;
    QRShape154: TQRShape;
    QRShape155: TQRShape;
    QRShape156: TQRShape;
    QRShape157: TQRShape;
    QRShape158: TQRShape;
    QRShape159: TQRShape;
    QRShape160: TQRShape;
    QRShape161: TQRShape;
    QRShape162: TQRShape;
    QRShape163: TQRShape;
    QRShape164: TQRShape;
    QRShape165: TQRShape;
    QRShape166: TQRShape;
    QRShape167: TQRShape;
    QRShape168: TQRShape;
    QRShape169: TQRShape;
    QRShape170: TQRShape;
    QRShape171: TQRShape;
    QRShape172: TQRShape;
    QRShape173: TQRShape;
    QRShape174: TQRShape;
    QRShape175: TQRShape;
    QRShape176: TQRShape;
    QRShape177: TQRShape;
    QRShape178: TQRShape;
    QRShape179: TQRShape;
    QRShape180: TQRShape;
    QRShape181: TQRShape;
    QRShape182: TQRShape;
    QRShape183: TQRShape;
    QRShape184: TQRShape;
    QRShape185: TQRShape;
    QRShape186: TQRShape;
    QRShape187: TQRShape;
    QRShape188: TQRShape;
    QRShape189: TQRShape;
    QRShape190: TQRShape;
    QRShape191: TQRShape;
    QRShape192: TQRShape;
    QRShape193: TQRShape;
    QRShape194: TQRShape;
    QRShape195: TQRShape;
    QRShape196: TQRShape;
    QRShape197: TQRShape;
    QRShape198: TQRShape;
    QRShape199: TQRShape;
    QRShape200: TQRShape;
    QRShape201: TQRShape;
    QRShape202: TQRShape;
    QRShape203: TQRShape;
    QRShape204: TQRShape;
    QRShape205: TQRShape;
    QRShape206: TQRShape;
    QRShape207: TQRShape;
    QRShape208: TQRShape;
    QRShape209: TQRShape;
    QRShape210: TQRShape;
    QRShape211: TQRShape;
    QRShape212: TQRShape;
    QRShape213: TQRShape;
    QRShape214: TQRShape;
    QRShape215: TQRShape;
    QRShape216: TQRShape;
    QRShape217: TQRShape;
    QRShape218: TQRShape;
    QRShape219: TQRShape;
    QRShape220: TQRShape;
    QRShape221: TQRShape;
    QRShape222: TQRShape;
    QRShape223: TQRShape;
    QRShape224: TQRShape;
    QRShape225: TQRShape;
    QRShape226: TQRShape;
    QRShape227: TQRShape;
    QRShape228: TQRShape;
    QRShape229: TQRShape;
    QRShape230: TQRShape;
    QRShape231: TQRShape;
    QRShape232: TQRShape;
    QRShape233: TQRShape;
    QRShape234: TQRShape;
    QRShape235: TQRShape;
    QRShape236: TQRShape;
    QRShape237: TQRShape;
    QRShape238: TQRShape;
    QRShape239: TQRShape;
    QRShape240: TQRShape;
    QRShape241: TQRShape;
    QRShape242: TQRShape;
    QRShape243: TQRShape;
    QRShape244: TQRShape;
    QRShape245: TQRShape;
    QRShape246: TQRShape;
    QRShape247: TQRShape;
    QRShape248: TQRShape;
    QRShape249: TQRShape;
    QRShape250: TQRShape;
    QRShape251: TQRShape;
    QRShape252: TQRShape;
    QRShape253: TQRShape;
    QRShape254: TQRShape;
    QRShape255: TQRShape;
    QRShape256: TQRShape;
    QRShape257: TQRShape;
    QRShape258: TQRShape;
    QRShape259: TQRShape;
    QRShape260: TQRShape;
    QRShape261: TQRShape;
    QRShape262: TQRShape;
    QRShape263: TQRShape;
    QRShape264: TQRShape;
    QRShape265: TQRShape;
    QRShape266: TQRShape;
    QRShape267: TQRShape;
    QRShape268: TQRShape;
    QRShape269: TQRShape;
    QRShape270: TQRShape;
    QRShape271: TQRShape;
    QRShape272: TQRShape;
    QRShape273: TQRShape;
    QRShape274: TQRShape;
    QRShape275: TQRShape;
    QRShape276: TQRShape;
    QRShape277: TQRShape;
    QRShape278: TQRShape;
    QRShape279: TQRShape;
    QRShape280: TQRShape;
    QRShape281: TQRShape;
    QRShape282: TQRShape;
    QRShape283: TQRShape;
    QRShape284: TQRShape;
    QRShape285: TQRShape;
    QRShape286: TQRShape;
    QRShape287: TQRShape;
    QRShape288: TQRShape;
    QRShape289: TQRShape;
    QRShape290: TQRShape;
    QRShape291: TQRShape;
    QRShape292: TQRShape;
    QRShape293: TQRShape;
    QRShape294: TQRShape;
    QRShape295: TQRShape;
    QRShape296: TQRShape;
    QRShape297: TQRShape;
    QRShape298: TQRShape;
    QRShape299: TQRShape;
    QRShape300: TQRShape;
    QRShape301: TQRShape;
    QRShape302: TQRShape;
    QRShape303: TQRShape;
    QRShape304: TQRShape;
    QRShape305: TQRShape;
    QRShape306: TQRShape;
    QRShape307: TQRShape;
    QRShape308: TQRShape;
    QRShape309: TQRShape;
    QRShape310: TQRShape;
    QRShape311: TQRShape;
    QRShape312: TQRShape;
    QRShape313: TQRShape;
    QRShape314: TQRShape;
    QRShape315: TQRShape;
    QRShape316: TQRShape;
    QRShape317: TQRShape;
    QRShape318: TQRShape;
    QRShape319: TQRShape;
    QRShape320: TQRShape;
    QRShape321: TQRShape;
    QRShape322: TQRShape;
    QRShape323: TQRShape;
    QRShape324: TQRShape;
    QRShape325: TQRShape;
    QRShape326: TQRShape;
    QRShape327: TQRShape;
    QRShape328: TQRShape;
    QRShape329: TQRShape;
    QRShape330: TQRShape;
    QRShape331: TQRShape;
    QRShape332: TQRShape;
    QRShape333: TQRShape;
    QRShape334: TQRShape;
    QRShape335: TQRShape;
    QRShape336: TQRShape;
    QRShape337: TQRShape;
    QRShape338: TQRShape;
    QRShape339: TQRShape;
    QRShape340: TQRShape;
    QRShape341: TQRShape;
    QRShape342: TQRShape;
    QRShape343: TQRShape;
    QRShape344: TQRShape;
    QRShape345: TQRShape;
    QRShape346: TQRShape;
    QRShape347: TQRShape;
    QRShape348: TQRShape;
    QRShape349: TQRShape;
    QRShape350: TQRShape;
    QRShape351: TQRShape;
    QRShape352: TQRShape;
    QRShape353: TQRShape;
    QRShape354: TQRShape;
    QRShape355: TQRShape;
    QRShape356: TQRShape;
    QRShape357: TQRShape;
    QRShape358: TQRShape;
    QRShape359: TQRShape;
    QRShape360: TQRShape;
    QRShape361: TQRShape;
    QRShape362: TQRShape;
    QRShape363: TQRShape;
    QRShape364: TQRShape;
    QRShape365: TQRShape;
    QRShape366: TQRShape;
    QRShape367: TQRShape;
    QRShape368: TQRShape;
    QRShape369: TQRShape;
    QRShape370: TQRShape;
    QRShape371: TQRShape;
    QRShape372: TQRShape;
    QRShape373: TQRShape;
    QRShape374: TQRShape;
    QRShape375: TQRShape;
    QRShape376: TQRShape;
    QRShape377: TQRShape;
    QRShape378: TQRShape;
    QRShape379: TQRShape;
    QRShape380: TQRShape;
    QRShape381: TQRShape;
    QRShape382: TQRShape;
    QRShape383: TQRShape;
    QRShape384: TQRShape;
    QRShape385: TQRShape;
    QRShape386: TQRShape;
    QRShape387: TQRShape;
    QRShape388: TQRShape;
    QRShape389: TQRShape;
    QRShape390: TQRShape;
    QRShape391: TQRShape;
    QRShape392: TQRShape;
    QRShape393: TQRShape;
    QRShape394: TQRShape;
    QRShape395: TQRShape;
    QRShape396: TQRShape;
    QRShape397: TQRShape;
    QRShape398: TQRShape;
    QRShape399: TQRShape;
    QRShape400: TQRShape;
    QRShape401: TQRShape;
    QRShape402: TQRShape;
    QRShape403: TQRShape;
    QRShape404: TQRShape;
    QRShape405: TQRShape;
    QRShape406: TQRShape;
    QRShape407: TQRShape;
    QRShape408: TQRShape;
    QRShape409: TQRShape;
    QRShape410: TQRShape;
    QRShape411: TQRShape;
    QRShape412: TQRShape;
    QRShape413: TQRShape;
    QRShape414: TQRShape;
    QRShape415: TQRShape;
    QRShape416: TQRShape;
    QRShape417: TQRShape;
    QRShape418: TQRShape;
    QRShape419: TQRShape;
    QRShape420: TQRShape;
    QRShape421: TQRShape;
    QRShape422: TQRShape;
    QRShape423: TQRShape;
    QRShape424: TQRShape;
    QRShape425: TQRShape;
    QRShape426: TQRShape;
    QRShape427: TQRShape;
    qryVendedor: TIBQuery;
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
    qryCliente: TIBQuery;
    Shape4: TShape;
    GroupBox1: TGroupBox;
    escolhe: TRadioButton;
    branco: TRadioButton;
    box: TGroupBox;
    QRShape6: TQRShape;
    empresa: TQRLabel;
    endereco: TQRLabel;
    outros: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRShape7: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
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
    QRShape76: TQRShape;
    QRLabel89: TQRLabel;
    Image2: TImage;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    combocliente: TComboBox;
    combofornecedor: TComboBox;
    combovendedor: TComboBox;
    Label5: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Shape1: TShape;
    Label22: TLabel;
    Image3: TImage;
    Label36: TLabel;
    procedure SpeedButton3Click(Sender: TObject);
    procedure escolheClick(Sender: TObject);
    procedure brancoClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
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
  frmPrePedido_BRANCO: TfrmPrePedido_BRANCO;

implementation

uses untMenu, untProcedures;

{$R *.dfm}

procedure TfrmPrePedido_BRANCO.SpeedButton3Click(Sender: TObject);
begin

if branco.Checked = true then
 begin
  qrycliente.close;
  qryfornecedor.Close;
  qryvendedor.close;
  report.preview;
 end;

if escolhe.Checked = true then
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

  if combofornecedor.Text <> '' then
   begin
    if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
    qryfornecedor.close;
    qryfornecedor.ParamByName('pcod').value:= frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
    qryfornecedor.open;
   end;

  report.Preview;
 end;

end;

procedure TfrmPrePedido_BRANCO.escolheClick(Sender: TObject);
begin
combocliente.color    := clwhite;
combofornecedor.color := clwhite;
combovendedor.color   := clwhite;
box.Enabled := true;
end;

procedure TfrmPrePedido_BRANCO.brancoClick(Sender: TObject);
begin
combocliente.Text    := '';
combofornecedor.Text :='';
combovendedor.text   :='';

combocliente.color    := clmedgray;
combofornecedor.color := clmedgray;
combovendedor.color   := clmedgray;

qryvendedor.close;
qrycliente.close;
qryfornecedor.close;

box.Enabled := false;
end;

procedure TfrmPrePedido_BRANCO.SpeedButton4Click(Sender: TObject);
begin

if branco.Checked = true then
 begin
  qrycliente.close;
  qryfornecedor.Close;
  qryvendedor.close;
  report.print;
 end;

if escolhe.Checked = true then
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

  if combofornecedor.Text <> '' then
   begin
    if frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset) = 0 then exit;
    qryfornecedor.close;
    qryfornecedor.ParamByName('pcod').value:= frmSYSProcedures.BuscaCombo('PESQUISA','FORNECEDORES','FORRAZAO',combofornecedor.text,'FORNECEDOR','CODFORNECEDOR','ENCONTRAR_CODIGO',combofornecedor,frmsysprocedures.dataset);
    qryfornecedor.open;
   end;

  report.Print;
 end;
end;

procedure TfrmPrePedido_BRANCO.SpeedButton1Click(Sender: TObject);
begin
report.PrinterSetup;
end;

procedure TfrmPrePedido_BRANCO.FormCreate(Sender: TObject);
begin
frmSYSProcedures.qryempresa.Open;
empresa.caption  := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('nome').value;
endereco.Caption := frmSYSProcedures.qryEMPRESA.FIELDBYNAME('endereco').value +' - CEP: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cep').value+ ' - Fone: ' +frmSYSProcedures.qryEMPRESA.FIELDBYNAME('telefone').value;
outros.Caption   := 'FAX: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('fax').value + ' - E-mail: '+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('email').value + ' - ' + frmSYSProcedures.qryEMPRESA.FIELDBYNAME('cidade').value + '-'+frmSYSProcedures.qryEMPRESA.FIELDBYNAME('uf').value;
frmSYSProcedures.qryEMPRESA.close;

frmSYSProcedures.constroicombo('select * from fornecedores order by forrazao','forrazao',combofornecedor);
frmSYSProcedures.constroicombo('select * from funcionarios where funcao = ''VENDEDOR'' order by nome','nome',combovendedor);
frmSYSProcedures.constroicombo('select * from clientes order by razao','razao',combocliente);
end;

procedure TfrmPrePedido_BRANCO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

end.

