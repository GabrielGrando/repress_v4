unit untVisHoje;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBCustomDataSet, ibx.IbQuery, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmVisHoje = class(TForm)
    DBGrid1: TDBGrid;
    qryCons: TIBQuery;
    qry: TIBQuery;
    ds: TDataSource;
    qryConsCODIGO: TIntegerField;
    qryConsCLIENTE: TIntegerField;
    qryConsVENDEDOR: TIntegerField;
    qryConsHORA: TIBStringField;
    qryConsDATA: TDateTimeField;
    qryConsVISITADO: TIntegerField;
    qryConsDATA_ENTRADA: TDateTimeField;
    qryConsNOME_CLI: TStringField;
    qryConsNOME_VEN: TStringField;
    Shape34: TShape;
    Label22: TLabel;
    Image8: TImage;
    lblnomedia: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure qryConsCalcFields(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisHoje: TfrmVisHoje;

implementation

{$R *.dfm}

procedure TfrmVisHoje.FormCreate(Sender: TObject);
begin
qryCons.close;
qrycons.ParamByName('pdata').value := date;
qryCons.Open;
end;

procedure TfrmVisHoje.qryConsCalcFields(DataSet: TDataSet);
begin
 with qry do
  begin
   close;
   sql.clear;
   sql.add('select * from clientes where codigo = :pcod');
   parambyname('pcod').value := qryCons.fieldbyname('cliente').value;
   open;

   qrycons.FieldByName('nome_cli').value := fieldbyname('razao').value;

   close;
   sql.clear;
   sql.add('select * from funcionarios where codigo = :pcod');
   parambyname('pcod').value := qryCons.fieldbyname('vendedor').value;
   open;

   qrycons.FieldByName('nome_ven').value := fieldbyname('nome').value;

  end;

end;

procedure TfrmVisHoje.Button1Click(Sender: TObject);
begin
qryCons.close;
qrycons.ParamByName('pdata').value :='29/01/2007';
qryCons.Open;
end;

procedure TfrmVisHoje.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

end.
