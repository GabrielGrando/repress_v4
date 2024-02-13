unit frmPrepedido_for;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBCustomDataSet, DB, IBTable, IBQuery, Grids, DBGrids, StdCtrls,
  ComCtrls, DBCtrls, Buttons, ExtCtrls;

type
  TfrmPrepedido_FORNECEDOR = class(TForm)
    Shape4: TShape;
    button1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    combofornecedor: TDBLookupComboBox;
    edtfornecedor: TEdit;
    combovendedor: TDBLookupComboBox;
    edtvendedor: TEdit;
    dtini: TDateTimePicker;
    dtfim: TDateTimePicker;
    dsClientes: TDataSource;
    dsFornecedor: TDataSource;
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
    dsVendedor: TDataSource;
    qryVendedor: TIBQuery;
    dsListar: TDataSource;
    qryListar: TIBQuery;
    qryListarCODPEDIDO: TIBStringField;
    qryListarENTREGA: TDateTimeField;
    qryListarDATA: TDateTimeField;
    qryListarTIPO_FRETE: TIBStringField;
    qryListarBONIFICACAO: TIBStringField;
    dsListarItens: TDataSource;
    dtListarItens: TIBTable;
    dtListarItensCODPRODUTO: TIBStringField;
    dtListarItensQTDE: TFloatField;
    dtListarItensVALOR: TFloatField;
    dtListarItensDESCONTO2: TFloatField;
    dtListarItensDESCONTO3: TFloatField;
    dtListarItensDESCONTO1: TFloatField;
    dtListarItenstotal: TCurrencyField;
    dtListarItensdescricao: TStringField;
    qryProd: TIBQuery;
    qryGrade: TIBQuery;
    qryGradePROCODIGO: TIBStringField;
    qryGradePRODESCRICAO: TIBStringField;
    qryGradePROFORNECEDOR: TIBStringField;
    qryGradePROUNIDADE: TIBStringField;
    qryGradePROGRADE: TIntegerField;
    dtcriarrelat: TIBDataSet;
    dtcriarrelatCODIGO: TIBStringField;
    dtcriarrelatDESCRICAO: TIBStringField;
    dtcriarrelatEMB: TIBStringField;
    dtcriarrelatQTDE: TFloatField;
    dtcriarrelatVALOR: TFloatField;
    dtcriarrelatD1: TFloatField;
    dtcriarrelatD2: TFloatField;
    dtcriarrelatD3: TFloatField;
    combocliente: TDBLookupComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrepedido_FORNECEDOR: TfrmPrepedido_FORNECEDOR;

implementation

{$R *.dfm}

end.
