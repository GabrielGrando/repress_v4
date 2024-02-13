unit untProcedures;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs,
  StdCtrls, DB, ibx.IBCustomDataSet, ibx.IbQuery, Mask, DBCtrls, ComCtrls, Grids,
  DBGrids;

type
  TfrmSYSProcedures = class(TForm)
    QUERY: TIBQuery;
    DATASET: TIBDataSet;
    qryConfig: TIBQuery;
    qryEMPRESA: TIBQuery;
    qryEMPRESANOME: TIBStringField;
    qryEMPRESAENDERECO: TIBStringField;
    qryEMPRESACIDADE: TIBStringField;
    qryEMPRESAUF: TIBStringField;
    qryEMPRESACEP: TIBStringField;
    qryEMPRESATELEFONE: TIBStringField;
    qryEMPRESAFAX: TIBStringField;
    qryEMPRESAEMAIL: TIBStringField;
  private
    { Private declarations }
  public
    Procedure Trataerros(Sender: TObject; E: Exception);
    Procedure Cadastro(vOperacao:string; vdataset:tibDataset; vDbedit:TDBEdit; vTab:Ttabsheet; vGroupBox:tGroupbox; vNovo,vGravar,vCancelar,vPesquisar,vAlterar,vConfirmar,vCancelAlt,vExcluir:tControl;vForm:tForm);
              {(NOVO,GRAVAR,ALTERAR),DATASET,DBEDIT PARA DAR FOCO,TABSHEET A TIRAR VISIBLE,GROUP BOX A TIRAR O ENABLED,TODOS OS BOTÕES DO FORM,FORM PARA LIMPAR EDITS}
    Function  Max(Tabela : string):integer;
              {TABELA DO BANCO DE DADOS A ENCONTRAR MAIOR VALOR}
    Function  BuscaCombo(vTipo,vTabela,vCampo,vParametro,vMsg,vCampoTabela,vOperacao:STRING;vCombo:tCombobox;vDataset:tibDataset):integer;
              {(DATASET,PESQUISA),Tabela a buscar dados,Campo da Tabela(WHERE),Parametro do WHERE,Título a sair no erro,Campo da tabela a enviar o codigo encontrado),(ENCONTRAR_DESCRICAO,ENCONTRAR_CODIGO,ALTERAR),Combobox a preencher ou pesquisar,Dataset a salvar Codigo }
    Procedure EncontraRegistro(vDataset : tibdataset; vParametro : variant);
              {Dataset a passar parametro,Parametro}
    Procedure ConstroiCombo(vTexto,vCampo:string;vCombo1:tcombobox);
              {Sql da Query a preencher combo,Campo da query a enviar,Combos a preencher}
    Procedure LimpaEdit (Form: TForm);
              {Form a limpar todos os edits}
    Function  TestaChave(vCampo,vTabela,vParametro,vMensagem:string):integer;
              {campo da tabela a testar,tabela a testar,parametro,[ALTERAÇÃO OU NOVO],mensagem para a messagedlg}
    Function  CNPJ(num: string): boolean;
              {testa cnpj}
    Procedure Combo(vCombo:tComboBox;vEnabled:boolean);
              {Configura Cor e Enabled do Combo}

  end;

var
  frmSYSProcedures: TfrmSYSProcedures;

implementation

uses untDM;

{$R *.dfm}

Procedure tfrmSYSProcedures.Cadastro(vOperacao:string; vdataset:tibDataset; vDbedit:TDBEdit; vTab:Ttabsheet; vGroupBox:tGroupbox; vNovo,vGravar,vCancelar,vPesquisar,vAlterar,vConfirmar,vCancelAlt,vExcluir:tControl;vForm:tForm);
begin
if vOperacao = 'NOVO' then
 begin
  vNovo.enabled:=false;
  vGravar.Enabled :=true;
  vCancelar.Enabled := true;
  vDataset.Open;
  vdataset.Append;
  vGroupBox.Enabled := true;
  vDbedit.setfocus;
  vTab.TabVisible := false;
 end;

if vOperacao = 'GRAVAR' then
 begin
  vNovo.Enabled := true;
  vGravar.Enabled := false;
  vCancelar.Enabled := false;
  vDataset.Post;
  vDataset.Close;
  dm.transacao.commit;
  vTab.TabVisible := true;
  vGroupBox.Enabled := false;
 end;

if vOperacao = 'CANCELAR' then
 begin
  vNovo.Enabled := true;
  vGravar.Enabled := false;
  vCancelar.Enabled := false;
  vTab.TabVisible := true;
  vdataset.Cancel;
  vdataset.close;
  vGroupBox.Enabled := false;
  LimpaEdit(vForm);
 end;

if vOperacao = 'PESQUISAR' then
 begin
  vExcluir.Enabled := false;
  vCancelAlt.Enabled := false;
  vConfirmar.Enabled := false;
  vAlterar.Enabled := false;
  vGroupBox.Enabled := false;
  LimpaEdit(vForm);
 end;

if vOperacao = 'ALTERAR' then
 begin
  vExcluir.Enabled := false;
  vCancelAlt.Enabled := true;
  vConfirmar.Enabled := true;
  vPesquisar.Enabled := false;
  vAlterar.Enabled := false;
  vDataset.edit;
  vGroupBox.Enabled := true;
  vDbedit.setfocus;
  vTab.TabVisible := false;
 end;

if vOperacao = 'EXCLUIR' then
 begin
  IF MESSAGEDLG('Ao Excluir este registro todos os dados relacionados a ele também serão apagados !!'+#13+#10+#13+#10+ 'Por Exemplo: Ao apagar um PRODUTO todos os ITENS lançados em PEDIDOS serão excluidos támbem !!'+#13+#10+#13+#10+'TEM CERTEZA QUE DESEJA EXCLUIR??',mtwarning,[mbyes,mbno],0) = mryes then
   begin
    vExcluir.Enabled := false;
    vCancelAlt.Enabled := false;
    vConfirmar.Enabled := false;
    vPesquisar.Enabled := true;
    vAlterar.Enabled := false;
    vDataset.delete;
    dm.transacao.commit;
    vGroupBox.Enabled := false;
    LimpaEdit(vForm);
   end;
 end;

if vOperacao = 'CONFIRMAR' then
 begin
  vExcluir.Enabled := false;
  vCancelAlt.Enabled := false;
  vConfirmar.Enabled := false;
  vPesquisar.Enabled := true;
  vAlterar.Enabled := false;
  vDataset.applyupdates;
  dm.transacao.commit;
  vTab.TabVisible := true;
  vGroupBox.Enabled := false;
  LimpaEdit(vForm);
 end;

if vOperacao = 'CANCELARALTERAR' then
 begin
  vExcluir.Enabled := false;
  vCancelAlt.Enabled := false;
  vConfirmar.Enabled := false;
  vPesquisar.Enabled := true;
  vAlterar.Enabled := false;
  vDataset.cancel;
  vDataset.close;
  vTab.TabVisible := true;
  vGroupBox.Enabled := false;
  LimpaEdit(vForm);
 end;

end;

procedure tfrmSYSProcedures.LimpaEdit (Form: TForm);
var
i : Integer;
begin

 for i := 0 to Form.ComponentCount - 1 do
  begin
   if Form.Components[i] is TCustomEdit then (Form.Components[i] as TCustomEdit).Clear;
   if Form.Components[i] is TComboBox   then (Form.Components[i] as TComboBox).text:='';
  end;

end;

function tfrmSYSProcedures.Max(Tabela:string):integer;
begin
QUERY.close;
QUERY.SQL.Clear;
QUERY.sql.add('select max(codigo) from '+tabela);
QUERY.open;
if QUERY.fieldbyname('max').value = null then  result:= 1 else result:= QUERY.fieldbyname('max').value +1;
end;

Procedure tfrmSYSProcedures.EncontraRegistro(vDataset:tibdataset;vParametro:variant);
begin
vDataset.close;
vDataset.ParamByName('pcod').Value := vParametro;
vDataset.open;
end;

procedure TfrmSYSProcedures.Trataerros(Sender: TObject; E: Exception);
var mensagem: string;
    Pos1, Pos2: integer;
begin
   If Pos(UpperCase('is not a valid date'), UpperCase(E.Message)) <> 0 then Messagedlg('Data inválida!',mterror,[mbok],0) else
   if Pos(UpperCase('must have a value'), UpperCase(E.Message)) <> 0 then
     begin
       Pos1:=Pos('''', E.Message);
       mensagem:=E.Message;
       Delete(mensagem, Pos1, 1);
       Pos2:=Pos('''', mensagem);
       mensagem:=copy(E.Message, Pos1 + 1, Pos2 - Pos1);
       messagedlg('É obrigatório o preenchimento do campo '+ mensagem + '.',mterror,[mbok],0)
     end
    else
       If Pos(UpperCase('key violation'), UpperCase(E.Message)) <> 0 then messagedlg('Violação de Chave Primária. Registro já incluido.',mterror,[mbok],0)
     else
       If Pos(UpperCase('Input value'), UpperCase(E.Message)) <> 0 then
       messagedlg('Campo preenchido com valor Inválido!',mterror,[mbok],0)
      else
       If Pos(UpperCase('is not a valid time'), UpperCase(E.Message)) <> 0 then           messagedlg('Hora inválida!',mterror,[mbok],0)
      else
       If Pos(UpperCase('master has detail records'), UpperCase(E.Message)) <> 0 then          messagedlg('Proibida a Exclusão e Modificação deste Registro, pois ele faz Referência a Outro(s) Registro(s)!',mterror,[mbok],0)
      else
       If Pos(UpperCase('field value required'), UpperCase(E.Message)) <> 0 then        Begin
          Pos1:=Pos(':',E.Message);
          Delete(Mensagem,Pos1,1);
          Mensagem:=copy(E.Message,Pos1+2,30);
          Messagedlg('É obrigatório o preenchimento do campo "'+ mensagem + '".',mterror,[mbok],0);
      End;

      If Pos(UpperCase('RECORD LOCKED BY ANOTHER USER.'), UpperCase(E.Message)) <> 0 then         messagedlg('O Registro está sendo Utilizado por Outro Usuário da Rede. Cancele a Operação e Aguarde a Liberação do Mesmo!',mterror,[mbok],0)
 end;

Function tfrmSYSProcedures.BuscaCombo(vTipo,vTabela,vCampo,vParametro,vMsg,vCampoTabela,vOperacao:STRING;vCombo:tCombobox;vDataset:tibDataset):integer;
begin
QUERY.CLOSE;
QUERY.sql.clear;
QUERY.sql.add('select * from '+vTabela);
QUERY.sql.add('where '+vCampo+ ' = :pParam');
QUERY.parambyname('pParam').value := vParametro;
QUERY.open;

 if QUERY.eof then
   begin
     if vOperacao = 'ENCONTRAR_DESCRICAO' then exit;
     messagedlg('Campo '+vMsg+' está preenchido com um valor não cadastrado!',mterror,[mbok],0);
     vCombo.SetFocus;
     result:=0;
     
     exit;
   end else begin
    if vOperacao = 'ENCONTRAR_DESCRICAO' THEN
      begin
       vCombo.Text :=QUERY.fieldbyname(vcampoTabela).value;
       exit;
      end else begin
       if vTipo = 'DATASET' THEN  vDataset.fieldbyname(vCampoTabela).value := QUERY.Fields[0].value;
       result:=QUERY.Fields[0].value;
      end;
   end;

end;

Procedure tfrmSYSProcedures.ConstroiCombo(vTexto,vCampo:string;vCombo1:tcombobox);
begin
 with QUERY do
  begin
   close;
   sql.clear;
   sql.add(vTexto);
   open;
   first;

   while not eof do
    begin
     vCombo1.items.add(trim(fieldbyname(vCampo).value));
     next;
    end;
  end;
end;

Function tfrmSYSProcedures.TestaChave(vCampo,vTabela,vParametro,vMensagem:string):integer;
begin
query.close;
query.sql.clear;
query.sql.add('select * from '+vTabela);
query.sql.add('where '+vCampo+' =:pParam');
query.parambyname('pParam').value := vParametro;
query.open;

if query.eof then
 begin
  result:=0;
 end else begin
  messagedlg('Violação de Chave Primária! O(A) '+vMensagem+': ' +vParametro+' já foi cadastrado(a)!',mterror,[mbok],0);
  result:=1;
 end;

end;

function tfrmsysprocedures.CNPJ(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
n10:=StrToInt(num[10]);
n11:=StrToInt(num[11]);
n12:=StrToInt(num[12]);
d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[13]+num[14];
if calculado=digitado then result :=true else result:=false;
end;

procedure tfrmSysProcedures.Combo(vCombo:tComboBox;vEnabled:boolean);
begin

if vEnabled = true then
 begin
  vCombo.Color   := clWhite;
  vCombo.Enabled := true;
 end else begin
  vCombo.Color   := clMedgray;
  vCombo.Enabled := false;
 end;

end;






end.
