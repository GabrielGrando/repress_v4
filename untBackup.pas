unit untBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBServices, ibx.IbDatabase, DB, FileCtrl, Buttons,
  ExtCtrls, ComCtrls,Shellapi;

type
  TfrmOUTBackup = class(TForm)
    Bevel4: TBevel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    origem: TLabel;
    destino: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    arvore1: TDirectoryListBox;
    Drive1: TDriveComboBox;
    DriveComboBox1: TDriveComboBox;
    Arvore2: TDirectoryListBox;
    txtArquivo: TEdit;
    FileListBox1: TFileListBox;
    IBBackupService1: TIBBackupService;
    BTNBACKUP: TSpeedButton;
    edtdata: TEdit;
    Shape2: TShape;
    Label22: TLabel;
    Image3: TImage;
    Label36: TLabel;
    Shape3: TShape;
    Image1: TImage;
    procedure btnBackupClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure arvore1Click(Sender: TObject);
    procedure Arvore2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function DeleteFolder(FolderName: String; LeaveFolder: Boolean): Boolean;
  private
    { Private declarations }
    Procedure ShowHint(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmOUTBackup: TfrmOUTBackup;
  vArquivo : string; {Pega o nome do Arquivo Selecionado}

implementation

uses untDM;

Procedure TfrmOUTBackup.ShowHint(Sender: TObject);
Begin

end;

{$R *.dfm}

procedure TfrmOUTBackup.btnBackupClick(Sender: TObject);
var
  vDataBase : string;
  i:integer;
  data:string;
begin
  txtarquivo.text:='BACKUP_REPRESS';
  data:='_';
  if trim(txtArquivo.Text) = '' then begin
    MessageDlg('Erro! Campo [NOME DO ARQUIVO A SER GERADO] em Branco',mtError,[mbOK],0);
    txtArquivo.SetFocus;
    txtArquivo.SelectAll;
    Exit;
  end;
  Screen.Cursor := crHourGlass;
//  vArquivo := FileListBox1.FileName;
  vArquivo := 'c:\repress\banco\vendas';;
  edtdata.Text := datetostr(date);

  for i:= 1 to 10 do
   begin
    if edtdata.text[i] = '/' then data:= data + '_' else data := data + edtdata.text[i];
   end;
  Txtarquivo.Text := Txtarquivo.Text + data;

  screen.Cursor := crHourGlass;
  try
    IBBackupService1.DatabaseName := vArquivo;
    IBBackupService1.Active := true;
    IBBackupService1.BackupFile.Clear;
    IBBackupService1.BackupFile.Add(destino.Caption + '\' + txtArquivo.Text + '.bkp=4096');
    IBBackupService1.Active := true;
    IBBackupService1.ServiceStart;
    MessageDlg('Backup realizado com Sucesso!',mtInformation,[mbok],0);
  except
    IBBackupService1.Active := False;
    MessageDlg('Erro ao realizar Backup!',mtError,[mbok],0);
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmOUTBackup.FormActivate(Sender: TObject);
begin
Application.OnHint := ShowHint;
end;

procedure TfrmOUTBackup.arvore1Click(Sender: TObject);
begin
Arvore1.OpenCurrent;
frmOutBackup.Caption:=' Backup de Arquivos - Arquivos Selecionados: '+IntToStr(FileListBox1.Count);
end;

procedure TfrmOUTBackup.Arvore2Click(Sender: TObject);
begin
Arvore2.OpenCurrent;
end;

procedure TfrmOUTBackup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmOUTBackup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
end;

procedure TfrmOUTBackup.FormShow(Sender: TObject);
begin
arvore1.Directory := extractfilepath(application.exename)+'\banco';
end;

procedure TfrmOUTBackup.Button1Click(Sender: TObject);
begin
dm.banco.Connected := false;
deleteFolder(extractfilepath(Application.ExeName)+'\banco',false);
ForceDirectories(extractfilepath(Application.ExeName)+'\banco');
end;


function tfrmOUTBackup.DeleteFolder(FolderName: String; LeaveFolder: Boolean): Boolean;
var
  r: TshFileOpStruct;
begin
  Result := False;
  if not DirectoryExists(FolderName) then
  Exit;
  if LeaveFolder then
  FolderName := FolderName + ' *.* '
  else
  if FolderName[Length(FolderName)] = ' \ ' then
  Delete(FolderName,Length(FolderName), 1);
  FillChar(r, SizeOf(r), 0);
  r.wFunc := FO_DELETE;
  r.pFrom := PChar(FolderName);
  r.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
  Result := ((ShFileOperation(r) = 0) and (not r.fAnyOperationsAborted));
end;
end.
