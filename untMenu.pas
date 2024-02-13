
unit untMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus,  ImgList, ExtCtrls, jpeg, StdCtrls,
  Buttons,inifiles, DB, ToolWin;


type
  TfrmSYSMenu = class(TForm)
    st: TStatusBar;
    Menu: TMainMenu;
    Cadastro1: TMenuItem;
    Reltrios1: TMenuItem;
    Reltrios2: TMenuItem;
    Utiltrios1: TMenuItem;
    Configuraes1: TMenuItem;
    Sobre1: TMenuItem;
    Calculadora1: TMenuItem;
    Backup1: TMenuItem;
    List: TImageList;
    Bevel1: TBevel;
    Fornecedor1: TMenuItem;
    Produtos1: TMenuItem;
    Vendedores1: TMenuItem;
    Cliente1: TMenuItem;
    Timer: TTimer;
    Pedidos1: TMenuItem;
    N2: TMenuItem;
    Dadosdaempresa1: TMenuItem;
    N1: TMenuItem;
    Medidas1: TMenuItem;
    Formasdepagamento1: TMenuItem;
    Sair1: TMenuItem;
    Fornecedores1: TMenuItem;
    Funcionrios1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos2: TMenuItem;
    Pedidos3: TMenuItem;
    Pedidosrealizados1: TMenuItem;
    otalpor1: TMenuItem;
    N5: TMenuItem;
    Cadastrodeusurio1: TMenuItem;
    gb: TGroupBox;
    edtbanco: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Comorestaurarbackup1: TMenuItem;
    Imprimirpedido1: TMenuItem;
    N3: TMenuItem;
    PrPedido1: TMenuItem;
    Pedidoespelho1: TMenuItem;
    Gradecomultimacompra1: TMenuItem;
    Fornecedor2: TMenuItem;
    Fichaembranco1: TMenuItem;
    N6: TMenuItem;
    otalizao1: TMenuItem;
    Comisses1: TMenuItem;
    Comisses3: TMenuItem;
    ExportarExcel1: TMenuItem;
    ArquivosExcel1: TMenuItem;
    N4: TMenuItem;
    aaa1: TMenuItem;
    bbb1: TMenuItem;
    Grfico1: TMenuItem;
    Grficodevenda1: TMenuItem;
    lblusuario: TLabel;
    lblsair: TLabel;
    Panel3: TPanel;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    FichaPromotor1: TMenuItem;
    Sair2: TMenuItem;
    Desenvolvimento1: TMenuItem;
    DesempenhodeVendas1: TMenuItem;
    Os10maioresclientes1: TMenuItem;
    ValorMonetrio1: TMenuItem;
    QtdeVendida1: TMenuItem;
    Image1: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    ComissesReceber1: TMenuItem;
    ComissesPendentes2: TMenuItem;
    Contas1: TMenuItem;
    Gastos1: TMenuItem;
    Gastos: TMenuItem;
    Visitas1: TMenuItem;
    Visitas2: TMenuItem;
    N7: TMenuItem;
    VendedorescomvisitasagendadasHOJE1: TMenuItem;
    Devolues1: TMenuItem;
    Gastos2: TMenuItem;
    Devoluo1: TMenuItem;
    ImportaoExportaodePedidos1: TMenuItem;
    ArquivoMorto1: TMenuItem;
    procedure TimerTimer(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Vendedores1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Medidas1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure Formasdepagamento1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Pedidosrealizados1Click(Sender: TObject);
    procedure otalpor1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure Verificaodosistema1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Dadosdaempresa1Click(Sender: TObject);
    procedure Cadastrodeusurio1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Comorestaurarbackup1Click(Sender: TObject);
    procedure Imprimirpedido1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Pedidoespelho1Click(Sender: TObject);
    procedure Gradecomultimacompra1Click(Sender: TObject);
    procedure otalizao1Click(Sender: TObject);
    procedure Fichaembranco1Click(Sender: TObject);
    procedure Comisses1Click(Sender: TObject);
    procedure Fornecedor2Click(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure ArquivosExcel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Function SerialNum(FDrive:String) :String;
    function EnDecryptString(StrValue : String; Chave: Word) : String;
    procedure aaa1Click(Sender: TObject);
    procedure bbb1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Grficodevenda1Click(Sender: TObject);
    procedure Trataerros(Sender: TObject; E: Exception);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure stDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure FichaPromotor1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Desenvolvimento1Click(Sender: TObject);
    procedure DesempenhodeVendas1Click(Sender: TObject);
    procedure ValorMonetrio1Click(Sender: TObject);
    procedure QtdeVendida1Click(Sender: TObject);
    procedure ComissesReceber1Click(Sender: TObject);
    procedure ComissesPendentes2Click(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure Gastos1Click(Sender: TObject);
    procedure GastosClick(Sender: TObject);
    procedure Visitas2Click(Sender: TObject);
    procedure VendedorescomvisitasagendadasHOJE1Click(Sender: TObject);
    procedure Gastos2Click(Sender: TObject);
    procedure Devolues1Click(Sender: TObject);
    procedure Devoluo1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ImportaoExportaodePedidos1Click(Sender: TObject);
    procedure ArquivoMorto1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSYSMenu: TfrmSYSMenu;
  vcreate:boolean;

implementation

uses untLogin, untSplash, untFornecedores, untProdutos, untMedidas,
  untFuncionarios, untClientes, untPedidos, untPagamento, untRelat, untRelatFunc, relatProd, untRelatCliente,
  untRelatPedido, untRelatPedidos2, untBackup, untSobre,
  untVerificacao, untInfo, untMorto, untUsuarios, untRelatpedidos3,
  untgrafico, untGrade, untPrePedido, untPrepedido2, untTotalizacao,
  untPrePedido3, untComissao, untRelatComissao, untPrePedido4, untExcel,
  untLiberar, UntLibera, untMensagens, untMeta, untPromotor, untProcedures,
  untRelatGrafico3, untRelatgrafico4, untNaoPagas, untContas, untGastos,
  untGraficoGastos, frmEscolhevendedor, untVisHoje, untRelGastos,
  untDevolucoes, untRelDevolucao, untOUTExportacaoDados,
  frmOUTArquivoMorto;

{$R *.dfm}

procedure TfrmSYSMenu.TimerTimer(Sender: TObject);
var
 tempo:ttime;
begin
 tempo:=time+1;
 st.Panels[2].text:=timetostr(tempo);
end;

procedure TfrmSYSMenu.Backup1Click(Sender: TObject);
begin
Try
Winexec('Calc.exe',Sw_Show);
Except
MESSAGEDLG('Verifique se a Calculadora foi Instalada pelo Windows!',MTERROR,[MBOK],0);
End;

end;

procedure TfrmSYSMenu.Fornecedor1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmCADfornecedores:=tfrmCADfornecedores.create(self);
frmCADfornecedores.showmodal;
frmCADfornecedores.free;
end;

procedure TfrmSYSMenu.Produtos1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmCADprodutos:= tfrmCADprodutos.create(self);
frmCADprodutos.showmodal;
frmCADprodutos.free;
end;

procedure TfrmSYSMenu.Sair2Click(Sender: TObject);
begin
application.terminate;
end;

procedure TfrmSYSMenu.Vendedores1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmCADfuncionarios:= tfrmCADfuncionarios.create(self);
frmCADfuncionarios.showmodal;
frmCADfuncionarios.free;
end;

procedure TfrmSYSMenu.Cliente1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmCADclientes:= tfrmCADclientes.create(self);
frmCADclientes.showmodal;
frmCADclientes.free;
end;

procedure TfrmSYSMenu.Medidas1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmCADunidades:= tfrmCADunidades.create(self);
frmCADunidades.showmodal;
frmCADunidades.free;
end;

procedure TfrmSYSMenu.Sair1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TfrmSYSMenu.Pedidos1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmCADpedidos:= tfrmCADpedidos.create(self);
frmCADpedidos.showmodal;
frmCADpedidos.free;
end;

procedure TfrmSYSMenu.Formasdepagamento1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmCADpagamento:= tfrmCADpagamento.create(self);
frmCADpagamento.showmodal;
frmCADpagamento.free;
end;

procedure TfrmSYSMenu.Fornecedores1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmRelatFornecedor:= tfrmRelatFornecedor.create(self);
frmRelatFornecedor.showmodal;
frmRelatFornecedor.free;
end;

procedure TfrmSYSMenu.Funcionrios1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmRelatFuncionario:= tfrmRelatFuncionario.create(self);
frmRelatFuncionario.showmodal;
frmRelatFuncionario.free;
end;

procedure TfrmSYSMenu.Produtos2Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmRelatProduto:= tfrmRelatProduto.create(self);
frmRelatProduto.showmodal;
frmRelatProduto.free;
end;

procedure TfrmSYSMenu.Clientes1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmrelatcliente:= tfrmrelatcliente.create(self);
frmrelatcliente.showmodal;
frmrelatcliente.free;
end;

procedure TfrmSYSMenu.Pedidosrealizados1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmrelatpedidos_FEITOS:= tfrmrelatpedidos_FEITOS.create(self);
frmrelatpedidos_FEITOS.showmodal;
frmrelatpedidos_FEITOS.free;
end;

procedure TfrmSYSMenu.otalpor1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmrelatpedidos_TOTALVENDA:= tfrmrelatpedidos_TOTALVENDA.create(self);
frmrelatpedidos_TOTALVENDA.showmodal;
frmrelatpedidos_TOTALVENDA.free;
end;

procedure TfrmSYSMenu.Calculadora1Click(Sender: TObject);
begin
frmOUTbackup:= tfrmOUTbackup.create(self);
frmOUTbackup.show;
end;

procedure TfrmSYSMenu.Verificaodosistema1Click(Sender: TObject);
begin
frmOUTVerificacao:= tfrmOUTVerificacao.create(self);
frmOUTVerificacao.showmodal;
frmOUTVerificacao.free;
end;

procedure TfrmSYSMenu.FormShow(Sender: TObject);
begin

vCreate := true;

if ShortDateFormat <> 'dd/MM/yyyy' then
  begin
    MessageDlg('Favor arrumar data para dd/mm/aaaa'+#13+#10+#13+#10+
                'Painel de Controle > Op��es regionais e de idioma > '+#13+#10 +
                'Personalizar > Data  ', mterror, [mbOk],0);
     close;
  end;

end;

procedure TfrmSYSMenu.Dadosdaempresa1Click(Sender: TObject);
begin
frmOUTRepresentacao:= tfrmOUTRepresentacao.create(self);
frmOUTRepresentacao.showmodal;
frmOUTRepresentacao.free;
end;

procedure TfrmSYSMenu.Cadastrodeusurio1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmcadUsuarios:= tfrmcadUsuarios.create(self);
frmcadUsuarios.showmodal;
frmcadUsuarios.free;
end;

procedure TfrmSYSMenu.BitBtn1Click(Sender: TObject);
var
 arqini:tinifile;
begin
if messagedlg('Tem certeza que deseja salvar?',mtinformation,[mbyes,mbno],0)=mryes then
begin
ArqIni := tIniFile.Create(extractfilepath(application.exename)+'\config');
ArqIni.Writestring('VENDAS', 'CAMINHO', EDTBANCO.TEXT);
ArqIni.Free;
gb.Visible :=false;
end;
end;

procedure TfrmSYSMenu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
arqini:tinifile;
begin

if (key = vk_f9)  THEN
 BEGIN
  gb.Visible := true;
  ArqIni := tIniFile.Create(extractfilepath(application.exename)+'\config');
  edtbanco.Text := ArqIni.Readstring('VENDAS', 'CAMINHO','');
  ArqIni.Free;

 if st.Panels[0].Text = 'Usu�rio: ADMINISTRADOR' then
  begin
   Menu.Items[6].Items[4].Visible := true;
  end;

 end;

if key = vk_escape then gb.Visible :=false;

end;

procedure TfrmSYSMenu.Comorestaurarbackup1Click(Sender: TObject);
begin
Winexec('c:\repress\Restaurar Backup.exe',Sw_Show);
end;

procedure TfrmSYSMenu.Imprimirpedido1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmrelatpedidos_PEDIDO:= tfrmrelatpedidos_PEDIDO.create(self);
frmrelatpedidos_PEDIDO.showmodal;
frmrelatpedidos_PEDIDO.free;
end;

procedure TfrmSYSMenu.Button1Click(Sender: TObject);
begin
 frmCADpedidos:= tfrmCADpedidos.create(self);
 frmCADPedidos.pg.Pages[1].Visible := false;
 frmCADPedidos.ShowModal;
 frmCADPedidos.free;
end;

procedure TfrmSYSMenu.N5Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmCADgrade:= tfrmCADgrade.create(self);
frmCADgrade.showmodal;
frmCADgrade.free;
end;

procedure TfrmSYSMenu.Button2Click(Sender: TObject);
begin
application.Minimize;
end;

procedure TfrmSYSMenu.Pedidoespelho1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmprepedido_ESPELHO:= tfrmprepedido_ESPELHO.create(self);
frmprepedido_ESPELHO.showmodal;
frmprepedido_ESPELHO.free;
end;

procedure TfrmSYSMenu.Gradecomultimacompra1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmprepedido_grade:= tfrmprepedido_grade.create(self);
frmprepedido_grade.showmodal;
frmprepedido_grade.free;

end;

procedure TfrmSYSMenu.otalizao1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmRelattotalizacao:= tfrmRelattotalizacao.create(self);
frmRelattotalizacao.showmodal;

frmRelattotalizacao.free;
end;

procedure TfrmSYSMenu.Fichaembranco1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmprepedido_BRANCO:= tfrmprepedido_BRANCO.create(self);
frmprepedido_BRANCO.showmodal;
frmprepedido_BRANCO.free;
end;

procedure TfrmSYSMenu.Comisses1Click(Sender: TObject);
begin
//Shortdateformat:= ('dd/MM/yyyy');
frmCADcomissao:= tfrmCADcomissao.create(self);
frmCADcomissao.showmodal;
frmCADcomissao.free;
end;

procedure TfrmSYSMenu.Fornecedor2Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmprepedido_fornecedor:= tfrmprepedido_fornecedor.create(self);
frmprepedido_fornecedor.showmodal;
frmprepedido_fornecedor.free;
end;

procedure TfrmSYSMenu.ExportarExcel1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmEXPExcel:=tfrmEXPExcel.create(self);
frmEXPExcel.showmodal;
frmEXPExcel.free;
end;

procedure TfrmSYSMenu.ArquivosExcel1Click(Sender: TObject);
var
Resposta : string;
arqini:tinifile;
arqini2:tinifile;
atual:string;
begin
ArqIni2 := tIniFile.Create(extractfilepath(application.exename)+'\config');
atual:=ArqIni2.Readstring('SALVAR', 'PASTA','');
ArqIni2.Free;

repeat
Resposta := InputBox('Salvar arquivos excel em:', 'Digite a pasta (N�o esque�a de colocar ''\'' no final do endere�o):',atual);
until Resposta <> '';
ArqIni := tIniFile.Create(extractfilepath(application.exename)+'\config');
ArqIni.Writestring('SALVAR', 'PASTA', RESPOSTA);
ArqIni.Free;
end;


procedure TfrmSYSMenu.FormCreate(Sender: TObject);
begin
frmsysmenu.Visible := false;
frmSYSsplash:=tfrmSYSsplash.Create(self);
frmSYSsplash.ShowModal;
frmSYSsplash.free;
application.OnException := trataerros;
end;

Function tfrmSYSMenu.SerialNum(FDrive:String) :String;
Var
Serial:DWord;
DirLen,Flags: DWord;
DLabel : Array[0..11] of Char;
begin
Try GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
Result := IntToHex(Serial,8);
Except Result :='';
end;
end;

function tfrmSYSMenu.EnDecryptString(StrValue : String; Chave: Word) : String;
var
I: Integer;
OutValue : String;
begin
OutValue := '';
for I := 1 to Length(StrValue) do
OutValue := OutValue + char(Not(ord(StrValue[I])-Chave));
Result := OutValue;
end;

procedure TfrmSYSMenu.aaa1Click(Sender: TObject);
begin
frmREGcodigo:=tfrmREGcodigo.create(self);
frmREGcodigo.showmodal;
frmREGcodigo.free;
end;

procedure TfrmSYSMenu.bbb1Click(Sender: TObject);
begin
frmREGLiberar:=tfrmREGliberar.create(self);
frmREGliberar.showmodal;
frmREGliberar.free;
end;

procedure TfrmSYSMenu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
frmOUTSair:=tfrmOUTSair.create(self);
frmOUTSair.showmodal;
frmOUTSair.free;
if lblsair.caption = 'NAO' then canclose := false;
end;

procedure TfrmSYSMenu.Grficodevenda1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmrelatgrafico1:=tfrmrelatgrafico1.Create(self);
frmrelatgrafico1.ShowModal;
frmrelatgrafico1.free;
end;

procedure TfrmSYSMenu.Trataerros(Sender: TObject; E: Exception);
var mensagem: string;
    Pos1, Pos2: integer;
begin
   If Pos(UpperCase('is not a valid date'), UpperCase(E.Message)) <> 0 then
           MESSAGEDLG('Data inv�lida!',MTERROR,[MBOK],0)
   else
      if Pos(UpperCase('must have a value'), UpperCase(E.Message)) <> 0 then
           begin
              Pos1:=Pos('''', E.Message);
              mensagem:=E.Message;
              Delete(mensagem, Pos1, 1);
              Pos2:=Pos('''', mensagem);
              mensagem:=copy(E.Message, Pos1 + 1, Pos2 - Pos1);
              MESSAGEDLG('� obrigat�rio o preenchimento do campo '+ mensagem + '.',MTERROR,[MBOK],0);
           end
   else
      If Pos(UpperCase('key violation'), UpperCase(E.Message)) <> 0 then
           MESSAGEDLG('Registro j� incluido!',MTERROR,[MBOK],0)
   else
      If Pos(UpperCase('Input value'), UpperCase(E.Message)) <> 0 then
           MESSAGEDLG('Campo preenchido com valor Inv�lido!',MTERROR,[MBOK],0)
   else
      If Pos(UpperCase('is not a valid time'), UpperCase(E.Message)) <> 0 then
           MESSAGEDLG('Hora inv�lida!',MTERROR,[MBOK],0)
   else
      If Pos(UpperCase('master has detail records'), UpperCase(E.Message)) <> 0 then
          MESSAGEDLG('Proibida a Exclus�o e Modifica��o deste Registro, pois ele faz Refer�ncia a Outro(s) Registro(s)!',MTERROR,[MBOK],0)
   else
      If Pos(UpperCase('field value required'), UpperCase(E.Message)) <> 0 then
        Begin
          Pos1:=Pos(':',E.Message);
          Delete(Mensagem,Pos1,1);
          Mensagem:=copy(E.Message,Pos1+2,30);
          MESSAGEDLG('� obrigat�rio o preenchimento do campo "'+ mensagem + '".',MTERROR,[MBOK],0);
        End;
      If Pos(UpperCase('RECORD LOCKED BY ANOTHER USER.'), UpperCase(E.Message)) <> 0 then
         MESSAGEDLG('O Registro est� sendo Utilizado por Outro Usu�rio da Rede. Cancele a Opera��o e Aguarde a Libera��o do Mesmo!',MTERROR,[MBOK],0)

end;

procedure TfrmSYSMenu.Image9Click(Sender: TObject);
begin
frmCADpedidos:= tfrmCADpedidos.create(self);
frmCADpedidos.showmodal;
frmCADpedidos.free;
end;

procedure TfrmSYSMenu.Image10Click(Sender: TObject);
begin
frmCADcomissao:= tfrmCADcomissao.create(self);
frmCADcomissao.showmodal;
frmCADcomissao.free;
end;

procedure TfrmSYSMenu.Image3Click(Sender: TObject);
begin
frmCADclientes:= tfrmCADclientes.create(self);
frmCADclientes.showmodal;
frmCADclientes.free;
end;

procedure TfrmSYSMenu.Image6Click(Sender: TObject);
begin
frmCADprodutos:= tfrmCADprodutos.create(self);
frmCADprodutos.showmodal;
frmCADprodutos.free;
end;

procedure TfrmSYSMenu.Image2Click(Sender: TObject);
begin
frmprepedido_BRANCO:= tfrmprepedido_BRANCO.create(self);
frmprepedido_BRANCO.showmodal;
frmprepedido_BRANCO.free;
end;

procedure TfrmSYSMenu.Image4Click(Sender: TObject);
begin
frmprepedido_grade:= tfrmprepedido_grade.create(self);
frmPrePedido_GRADE.box.visible:=true;
frmPrePedido_GRADE.height:=581;
frmPrePedido_GRADE.shape4.height:=515;
frmPrePedido_GRADE.btn.visible:=false;
frmprepedido_grade.showmodal;
frmprepedido_grade.free;
end;

procedure TfrmSYSMenu.Image5Click(Sender: TObject);
begin
frmprepedido_ESPELHO:= tfrmprepedido_ESPELHO.create(self);
frmprepedido_ESPELHO.showmodal;
frmprepedido_ESPELHO.free;
end;

procedure TfrmSYSMenu.Image8Click(Sender: TObject);
begin
frmprepedido_fornecedor:= tfrmprepedido_fornecedor.create(self);
frmprepedido_fornecedor.showmodal;
frmprepedido_fornecedor.free;
end;

procedure TfrmSYSMenu.Image7Click(Sender: TObject);
begin
frmrelatpedidos_PEDIDO:= tfrmrelatpedidos_PEDIDO.create(self);
frmrelatpedidos_PEDIDO.showmodal;
frmrelatpedidos_PEDIDO.free;
end;

procedure TfrmSYSMenu.Image11Click(Sender: TObject);
begin
frmEXPExcel:=tfrmEXPExcel.create(self);
frmEXPExcel.showmodal;
frmEXPExcel.free;
end;

procedure TfrmSYSMenu.stDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
  const Rect: TRect);
begin
if Panel.Index = 0 then
BEGIN
st.canvas.FillRect(Rect);
st.canvas.Font.Name   := 'verdana';
st.canvas.Font.Color  := CLBLACK;
st.Canvas.Font.Size   := 7;
List.Draw(St.Canvas,Rect.Left+1,Rect.Top+1,41);
st.canvas.TextOut(Rect.Left + 21, Rect.Top + 1,lblusuario.caption);
END;
end;

procedure TfrmSYSMenu.FichaPromotor1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmEXPPromotor:=tfrmEXPPromotor.create(self);
frmEXPPromotor.showmodal;
frmEXPPromotor.free;
end;

procedure TfrmSYSMenu.N3Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmCADMetas:=tfrmCADMetas.create(self);
frmCADMetas.showmodal;
frmCADMetas.free;
end;

procedure TfrmSYSMenu.Desenvolvimento1Click(Sender: TObject);
begin
frmSYSsobre:= tfrmSYSsobre.create(self);
frmSYSsobre.showmodal;
frmSYSsobre.free;
end;

procedure TfrmSYSMenu.DesempenhodeVendas1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmRelatGrafico3:=tfrmRelatGrafico3.create(SELF);
frmRelatGrafico3.showmodal;
frmRelatGrafico3.free;
end;

procedure TfrmSYSMenu.ValorMonetrio1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmRelatGrafico4:=tfrmRelatGrafico4.create(self);
frmRelatGrafico4.vMenu := 'VALOR MONET�RIO';
frmrelatgrafico4.dbchart2.visible:=true;
frmRelatGrafico4.showmodal;
frmRelatGrafico4.free;
end;

procedure TfrmSYSMenu.QtdeVendida1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmRelatGrafico4:=tfrmRelatGrafico4.create(self);
frmRelatGrafico4.vMenu := 'QTDE';
frmrelatgrafico4.dbchart1.visible:=true;
frmRelatGrafico4.showmodal;
frmRelatGrafico4.free;
end;
procedure TfrmSYSMenu.ComissesReceber1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmrelatcomissao:= tfrmrelatcomissao.create(self);
frmrelatcomissao.showmodal;
frmrelatcomissao.free;
end;

procedure TfrmSYSMenu.ComissesPendentes2Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmComissaoNaoPaga:=tfrmComissaoNaoPaga.create(self);
frmComissaoNaoPaga.showmodal;
frmComissaoNaoPaga.free;
end;

procedure TfrmSYSMenu.Contas1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmcadcontas:=tfrmcadcontas.create(self);
frmcadcontas.showmodal;
frmcadcontas.free;
end;

procedure TfrmSYSMenu.Gastos1Click(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmCADGastos := tfrmCADGastos.create(self);
frmCADGastos.showmodal;
frmCADGastos.free;
end;

procedure TfrmSYSMenu.GastosClick(Sender: TObject);
begin
Shortdateformat:= ('dd/MM/yyyy');
frmRelatGrafico6:=tfrmRelatGrafico6.create(self);
frmRelatGrafico6.ShowModal;
frmRelatGrafico6.free;
end;

procedure TfrmSYSMenu.Visitas2Click(Sender: TObject);
begin
frmVISVendedor := tfrmVISVendedor.create(self);
frmVISVendedor.showmodal;
frmVISVendedor.free;
end;

procedure TfrmSYSMenu.VendedorescomvisitasagendadasHOJE1Click(
  Sender: TObject);
begin
frmVisHoje := tfrmVisHoje.create(self);
frmVisHoje.showmodal;
frmVisHoje.free;
end;

procedure TfrmSYSMenu.Gastos2Click(Sender: TObject);
begin
frmRelatGastos := tfrmRelatGastos.create(self);
frmRelatGastos.showmodal;
frmRelatGastos.free;
end;

procedure TfrmSYSMenu.Devolues1Click(Sender: TObject);
begin
frmCADDevolucao := tfrmCADDevolucao.create(self);
frmCADDevolucao.showmodal;
frmCADDevolucao.free;
end;

procedure TfrmSYSMenu.Devoluo1Click(Sender: TObject);
begin
frmRelatDevolucao := tfrmRelatDevolucao.create(self);
frmRelatDevolucao.showmodal;
frmRelatDevolucao.free;
end;

procedure TfrmSYSMenu.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then
  begin
   beep;
   key:=#0;
  end;

end;

procedure TfrmSYSMenu.ImportaoExportaodePedidos1Click(Sender: TObject);
begin
frmOUTExportacaoPedido := tfrmOUTExportacaoPedido.create(self);
frmOUTExportacaoPedido.showmodal;
frmOUTExportacaoPedido.free;
end;

procedure TfrmSYSMenu.ArquivoMorto1Click(Sender: TObject);
begin
frmSYSArquivoMorto := tfrmSYSArquivoMorto.create(self);
frmSYSArquivoMorto.showmodal;
frmSYSArquivoMorto.free;
end;

end.



