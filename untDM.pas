unit untDM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus,  ImgList, ExtCtrls, jpeg, StdCtrls,
  Buttons,inifiles, DB, ibx.IBCustomDataSet, ibx.IbQuery, ToolWin,
  ibx.IbDatabase;

type
  TDM = class(TDataModule)
    BANCO: TIbDatabase;
    TRANSACAO: TIBTransaction;
    TOTAL: TIbDatabase;
    TRANSATOTAL: TIBTransaction;
    VISITAS: TIbDatabase;
    TRANSAVISITAS: TIBTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
 arqini:tinifile;
begin
try
 ArqIni             := tIniFile.Create(extractfilepath(application.exename) +'\config');
 BANCO.Connected    := false;
 TOTAL.Connected    := FALSE;

 banco.DatabaseName := ArqIni.Readstring('VENDAS', 'CAMINHO','');
 total.DatabaseName := ArqIni.Readstring('RELATORIO', 'CAMINHO','');
 VISITAS.DatabaseName := ArqIni.Readstring('VISITAS', 'CAMINHO','');

 BANCO.Connected    := TRUE;
 TOTAL.Connected    := TRUE;
 VISITAS.Connected    := TRUE;

 ArqIni.Free;
except
  banco.Connected   := false;
  messagedlg('N�o foi poss�vel conectar-se ao BANCO DE DADOS! O servidor deve estar desligado ou n�o entraram no sistema da m�quina do SERVIDOR. Entre em contato com a pessoa respons�vel pelo servidor e REINICIE sua m�quina! Persistindo contacte o ADMINISTRADOR.',mterror,[mbok],0);
end;

end;

end.
