unit untVendedor_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBCustomDataSet, ibx.IbQuery, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, Menus;

type
  TfrmOUTCliVen = class(TForm)
    dtCliVen: TIBDataSet;
    lista: TListBox;
    DBGrid1: TDBGrid;
    qryVendedor: TIBQuery;
    dsVendedor: TDataSource;
    qryVendedorCODIGO: TIBStringField;
    qryVendedorNOME: TIBStringField;
    qryVendedorFUNCAO: TIBStringField;
    Shape2: TShape;
    Image2: TImage;
    lblcliente: TLabel;
    dtCliVenCODVENDEDOR: TIBStringField;
    dtCliVenCODCLIENTE: TIBStringField;
    POP: TPopupMenu;
    ExcluirVendedor1: TMenuItem;
    Label1: TLabel;
    Label8: TLabel;
    qryExcluir: TIBQuery;
    speedbutton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ExcluirVendedor1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure listaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    vetor: array [0..25] of string;
    i:integer;
  end;

var
  frmOUTCliVen: TfrmOUTCliVen;


implementation

uses untDM;

{$R *.dfm}

procedure TfrmOUTCliVen.FormShow(Sender: TObject);
begin
qryVendedor.open;
end;

procedure TfrmOUTCliVen.DBGrid1DblClick(Sender: TObject);
var
 z:integer;
begin
z:=0;

try
 while lista.Items.Strings[z] <> '' do
  begin
   if lista.items.Strings[z] = qryvendedor.fieldbyname('nome').value then
     begin
      messagedlg('Você já adiconou esse Vendedor!',mterror,[mbok],0);
      exit;
     end;
    z:=z+1;
  end;
except
end;

lista.Items.Add(qryvendedor.fieldbyname('nome').value);
vetor[i]:= qryvendedor.fieldbyname('codigo').value;
i:=i+1;
end;

procedure TfrmOUTCliVen.SpeedButton1Click(Sender: TObject);
var
 vSalva:boolean;
begin
qryExcluir.Close;
qryExcluir.sql.clear;
qryExcluir.sql.add('delete from cli_ven');
qryExcluir.sql.add('where codcliente =' +lblcliente.caption);
qryExcluir.open;
i:=0;
while (vetor[i] <> '') do
 begin
  vSalva:=true;
  if vetor[i] = '0' then vSalva := false;
  if vSalva = true then
   begin
    dtcliven.Open;
    dtcliven.Append;
    dtcliven.FieldByName('codvendedor').value :=vetor[i];
    dtcliven.fieldbyname('codcliente').value :=lblcliente.Caption;
    dtcliven.post;
    dtcliven.Close;
   end;
  i:=i+1;
 end;
close;
end;

procedure TfrmOUTCliVen.ExcluirVendedor1Click(Sender: TObject);
var
 aux:integer;
begin
aux:=i;
i:=0;
with qryexcluir do
 begin
  Close;
  sql.clear;
  sql.add('select * from funcionarios');
  sql.add('where nome = :pNome');
  parambyname('pnome').value := lista.Items.Strings[lista.ItemIndex];
  open;

  while vetor[i] <> '' do
   begin
    if vetor[i] = fieldbyname('codigo').value then vetor[i]:='0';
    i:=i+1;
   end;
  lista.items.Delete(lista.ItemIndex);
 end;
i:=aux;
end;
procedure TfrmOUTCliVen.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_return then DBGrid1DblClick(self);
end;

procedure TfrmOUTCliVen.listaKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
var
 aux:integer;
begin
if key = vk_delete then
 begin
  aux:=i;
  i:=0;
   with qryexcluir do
    begin
     Close;
     sql.clear;
     sql.add('select * from funcionarios');
     sql.add('where nome = :pNome');
     parambyname('pnome').value := lista.Items.Strings[lista.ItemIndex];
     open;

     while vetor[i] <> '' do
      begin
       if vetor[i] = fieldbyname('codigo').value then vetor[i]:='0';
       i:=i+1;
      end;
    lista.items.Delete(lista.ItemIndex);
   end;
  i:=aux;
 end;
end;

end.
