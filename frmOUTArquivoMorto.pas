unit frmOUTArquivoMorto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBCustomDataSet, ibx.IbQuery, StdCtrls, Buttons;

type
  TfrmSYSArquivoMorto = class(TForm)
    edtIni: TEdit;
    Label1: TLabel;
    edtFim: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    qryExcluir: TIBQuery;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSYSArquivoMorto: TfrmSYSArquivoMorto;

implementation

uses untDM;

{$R *.dfm}

procedure TfrmSYSArquivoMorto.BitBtn1Click(Sender: TObject);
begin

if messagedlg('Are you sure?',mtInformation,[mbYes,mbno],0) = mrYes then
 begin
  qryExcluir.close;
  qryExcluir.ParamByName('pIni').Value := edtIni.Text;
  qryExcluir.ParamByName('pFim').Value := edtFim.Text;
  qryExcluir.Open;
  dm.TRANSACAO.Commit;
  showmessage('Registros apagados com sucesso!');
 end;

end;

end.
