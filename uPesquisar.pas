unit uPesquisar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ibx.IBCustomDataSet, ibx.IbQuery, StdCtrls, ExtCtrls, Grids,
  DBGrids, Buttons, jpeg;

type
  TfrmSYSPesquisar = class(TForm)
    lblCampo: TLabel;
    Label1: TLabel;
    txPesquisa: TEdit;
    Grid: TDBGrid;
    cbPesq: TComboBox;
    cbPesquisa: TComboBox;
    srcSQL: TDataSource;
    Sql: TIBQuery;
    RG: TRadioGroup;
    lblMensagem: TLabel;
    btnCancelar: TSpeedButton;
    btnOk: TSpeedButton;
    Panel1: TPanel;
    Image2: TImage;
    Label3: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Shape1: TShape;
    Procedure CriaLista(vLista: TStringList; vString: String);
    Procedure MostraLbl;
    Procedure CriaLista2(vLista: TStringList; vString: String);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure RGClick(Sender: TObject);
    Procedure AjustaGrid;
    procedure btnCANCELARClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure cbPesqChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bltAtualiza;
    procedure txPesquisaChange(Sender: TObject);
    procedure txPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    BancoDeDados: String;    { Nome BancoDeDados - Aceita SQL }
    NomeAlias   : String;    { Alias dos Banco de Dados }
    Titulo      : String;    { Titulo da Janela }
    Campos      : String;    { Campos p/ Exibição no Grid }
    GridTitulo  : String;    { Titulo p/ os Grids [Opcional] }
    GridTamanho : String;    { Tamanhos p/ cada Campo [Opcional] }
    GridMask    : String;    { Mascara para os Campos [Opcional] }
    PesqSize    : String;    { Tamanho do Formulário de Pesquisa [Opcional] }
    PesqPadrao  : String;    { Opção Inicial de Pesquisa [Opcional] }
    PesqOrder   : String;    { Sem Comentários }
    PesqNum     : Integer;   { Numero de Itens Disponiveis a Pesquisa [Opcional] }
    NoAutoUpdate: Boolean;   { Desabilita Atualiação Automática da Consulta [Opcional] }
    TravaModo   : Boolean;   { Trava a Seleção de Modos (Igual a, Maior..) [Opcional] }
    Valor       : Variant;   { Contem o Valor Retornado pelo Usuário }
    Valor2      : Variant;   {Segundo Valor de Retorno}
    Retorno     : Boolean;   { Se Retornou Valor }
    vIsSql      : Boolean;   { Variável Interna }
    vIsOrder    : Boolean;   { Variável Interna }
    vCampoResult: String;    { Variável Interna }
    vMatriz     : Array[1..10] of String;
    vMatriz2    : Array[1..10] of String;
    frmproduto:boolean;
    valor3:variant;
    valor4:variant;
    valor5:variant;
  end;

var
  frmSYSPesquisar: TfrmSYSPesquisar;

implementation

uses untDM;

{$R *.dfm}

(* Rotinas Auxiliares *)
Procedure TfrmSYSPesquisar.CriaLista(vLista: TStringList; vString: String);
Begin
  vLista.Clear;
  vString:=vString+',';
  While POS(',',vString)>0 do Begin
        vLista.Add(Trim(Copy(vString,1,Pos(',',vString)-1)));
        vString:=Copy(vString,Pos(',',vString)+1,Length(vString));
  End;
End;

Procedure TfrmSYSPesquisar.CriaLista2(vLista: TStringList; vString: String);
Begin
  vLista.Clear;
  vString:=vString+';';
  While POS(';',vString)>0 do Begin
        vLista.Add(Trim(Copy(vString,1,Pos(';',vString)-1)));
        vString:=Copy(vString,Pos(';',vString)+1,Length(vString));
  End;
End;

Procedure TfrmSYSPesquisar.MostraLbl;
Var vStr: String;
Begin
  vStr:='';
  Case RG.ItemIndex of
       0: vStr:='Igual a';
       1: vStr:='Maior Que';
       2: vStr:='Menor Que';
       3: vStr:='Que Contenha';
  End;
  lblCampo.Caption:='Procurar Por '+cbPesq.Items[cbPesq.ItemIndex]+' '+vStr+'...';
End;



procedure TfrmSYSPesquisar.FormActivate(Sender: TObject);
Var
  Cnt           : Integer;
  vCampos       : TStringList;
  CampoAtual    : String;
begin
  vIsSql:=False;
  vIsOrder:=True;
  Retorno:=False;
  If PesqOrder<>'' Then PesqOrder:=UpperCase(PesqOrder)
  Else vIsOrder:=False;
  For Cnt:=0 to 10 do vMatriz[Cnt]:='';
  If TravaModo Then RG.Enabled:=False;
  If (PesqSize='') or (StrToInt(PesqSize)<288) Then PesqSize:='288';
  If (PesqPadrao='') or (StrToInt(PesqPadrao)<0) Then PesqPadrao:='2';
  If PesqSize<>'' Then Begin
     Width:=StrToInt(PesqSize);
     frmSYSPesquisar.Left:=StrToInt(Format('%9.0f',[(Screen.Width-Width)/2]));
     Grid.Width:=StrToInt(PesqSize)-38;
//     txPesquisa.Width:=StrToInt(PesqSize)-12;
     txPesquisa.Width := frmSYSPesquisar.Width - 176;
     btnOK.Left:=(Width-btnCANCELAR.Width-btnOK.Width)-15;
     btnCANCELAR.Left:=(Width-btnCANCELAR.Width)-8;
     Panel1.Width := width;
     rg.Width := Width -40;
  End;
  //RG.ItemIndex:=0;
  If Titulo='' Then Titulo:='Localizar';
  If Campos='' Then Campos:='*';
  If Pos('WHERE',UpperCase(BancoDeDados))>0 Then vIsSql:=True;
  Caption:=Titulo;
  SQL.SQL.Clear;
  SQL.Close;
  SQL.SQL.Add('Select '+Campos);
  SQL.SQL.Add('From   '+BancoDeDados);
  If NoAutoUpdate Then Begin
     If vIsSql Then SQL.SQL.Add('and 0=1')
     Else SQL.SQL.Add('Where 0=1')
  End;
  SQL.Open;
  vCampoResult:=Grid.SelectedField.FullName;
  Grid.SetFocus;
  cbPesquisa.Clear;
  cbPesquisa.Items.Add('<Pesquisa Por>');
  vCampos:=TStringList.Create;
  SQL.Fields.GetFieldNames(vCampos);
  CampoAtual := Campos;
  For Cnt:=0 to vCampos.Count-1 do Begin
      If (PesqNum<=0) or (Cnt<=PesqNum-1) Then begin
         cbPesq.Items.Add(vCampos[Cnt]);
         if Pos(',',CampoAtual) <> 0 then begin
           cbPesquisa.Items.Add(Copy(CampoAtual,1,Pos(',',CampoAtual)-1));
           vMatriz2[Cnt]:=Copy(CampoAtual,1,Pos(',',CampoAtual)-1);
           Delete(CampoAtual,1,Pos(',',CampoAtual));
         end else begin
           cbPesquisa.items.Add(Copy(CampoAtual,1,Length(CampoAtual)));
           vMatriz2[Cnt]:=Copy(CampoAtual,1,Length(CampoAtual));
         end;
         vMatriz[Cnt]:=vCampos[Cnt];
      end;
  End;
  vCampos.Free;
  vCampos:=TStringList.Create;
  CriaLista(vCampos,GridTitulo);
  If Grid.Columns.Count=vCampos.Count Then Begin
     cbPesq.Items.Clear;
     cbPesq.Items.Add('<Pesquisar Por>');
     For Cnt:=0 to Grid.Columns.Count-1 do Begin
         If (PesqNum<=0) or (Cnt<=PesqNum-1) Then
            cbPesq.Items.Add(vCampos[Cnt]);
     End;
  End;
  vCampos.Free;
  cbPesq.ItemIndex:=StrToInt(PesqPadrao);
  cbPesquisa.itemIndex := cbPesq.ItemIndex;  
  AjustaGrid;
  txPesquisaChange(Self);
  txPesquisa.setFocus;
end;

procedure TfrmSYSPesquisar.FormDeactivate(Sender: TObject);
begin
  BancoDeDados:='';
  PesqPadrao:='';
  PesqOrder:='';
  Titulo:='';
  Campos:='';
  GridTitulo:='';
  GridMask:='';
  PesqSize:='';
  PesqNum :=0;
  txPesquisa.Text:='';
  RG.Enabled:=True;
  frmSYSPesquisar.Left:=261;
  frmSYSPesquisar.Width:=289;
  NoAutoUpdate:=False;
  cbPesq.Items.Clear;
  cbPesq.Items.Add('<Pesquisar Por>');
  SQL.Close;

end;

Procedure TfrmSYSPesquisar.AjustaGrid;
Var vColuna: TColumn;
    vCampos: TStringList;
    vMask  : TStringList;
    Cnt    : Integer;
Begin
  vCampos:=TStringList.Create;
  SQL.Fields.GetFieldNames(vCampos);
  Grid.Columns.Clear;
  vColuna:=TColumn.Create(Grid.Columns);
  vColuna.FieldName:=vCampos[0];
  vColuna.Title.Caption:=vCampos[0];
  Grid.Columns[0]:=vColuna;
  vColuna.Free;
  vCampos.Free;
  vCampos:=TStringList.Create;
  CriaLista(vCampos,GridTitulo);
  If Grid.Columns.Count=vCampos.Count Then Begin
     For Cnt:=0 to Grid.Columns.Count-1 do Begin
         Grid.Columns.Items[Cnt].Title.Caption:=vCampos[Cnt];
     End;
  End;
  vCampos.Free;
  vCampos:=TStringList.Create;
  CriaLista(vCampos,GridTamanho);
  If Grid.Columns.Count=vCampos.Count Then Begin
     For Cnt:=0 to Grid.Columns.Count-1 do Begin
         Grid.Columns.Items[Cnt].Width:=StrToInt(vCampos[Cnt])*10;
     End;
  End;
  vCampos.Free;
  vCampos:=TStringList.Create;
  vMask:=TStringList.Create;
  CriaLista2(vMask,GridMask);
  SQL.Fields.GetFieldNames(vCampos);
  For Cnt:=0 to vCampos.Count-1 do Begin
      If vCampos.Count=vMask.Count Then Begin
         If vMask[Cnt]<>'' Then
            If SQL.FieldByName(vCampos[Cnt]).DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency] Then
               (SQL.FieldByName(vCampos[Cnt]) as TFloatField).DisplayFormat:=vMask[Cnt]
      End;
  End;
  vCampos.Free;
  vMask.Free;
End;

procedure TfrmSYSPesquisar.RGClick(Sender: TObject);
begin
  bltAtualiza;
end;

procedure TfrmSYSPesquisar.btnCANCELARClick(Sender: TObject);
begin
  Valor:='';
  Retorno:=False;
  Close;

end;

procedure TfrmSYSPesquisar.btnOKClick(Sender: TObject);
begin
  If (Grid.Fields[0].Value=NULL) Then Exit;
  Valor :=Grid.Fields[0].Value;
  Valor2:=Grid.Fields[1].Value;
  Retorno:=True;
  Close;
end;

procedure TfrmSYSPesquisar.GridDblClick(Sender: TObject);
begin
  If (Grid.Fields[0].Value=NULL) Then Exit;
  Valor :=Grid.Fields[0].Value;
  Valor2:=Grid.Fields[1].Value;
  Retorno:=True;
  Close;

end;

procedure TfrmSYSPesquisar.cbPesqChange(Sender: TObject);
begin
  If cbPesq.ItemIndex<=0 Then cbPesq.ItemIndex:=1;
  MostraLbl;
  bltAtualiza;

end;

procedure TfrmSYSPesquisar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If (Key=VK_ESCAPE) Then Begin
       Key:=0;
       btnCancelarClick(Self);
   End;
   If (Key=VK_F1) Then Begin
      cbPesq.ItemIndex:=1;
      Key:=0;
   End;
   If (Key=VK_F2) Then Begin
      cbPesq.ItemIndex:=2;
      Key:=0;
   End;
   If Key=vk_return Then btnOKClick(self);

end;

procedure TfrmSYSPesquisar.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If key = vk_return then  btnokClick(Self);
end;

procedure TfrmSYSPesquisar.bltAtualiza;
Var
    eNumeric   : Boolean;
    vCampoAtual: String;
    vCampoPesq : String;
    vCampoOrder: String;
    vOrder     : TStringList;
    Ct         : Integer;
begin
  If BancoDeDados='' Then Exit;
  Mostralbl;
  cbPesquisa.itemIndex := cbPesq.ItemIndex;
  vCampoAtual          := vMatriz[cbPesquisa.ItemIndex-1];
  vCampoPesq           := vMatriz2[cbPesquisa.ItemIndex-1];
  eNumeric:=False;
  vOrder:=TStringList.Create;
  CriaLista(vOrder,PesqOrder);
  For Ct:=0 to vOrder.Count-1 do Begin
      If Trim(vOrder[Ct])<>UpperCase(vCampoAtual) Then vCampoOrder:=vOrder[Ct];
  End;
  vOrder.Free;
  If (vCampoAtual='') or (Trim(txPesquisa.Text)='') Then Begin
     SQL.Close;
     SQL.SQL.Clear;
     SQL.SQL.Add('Select  '+Campos);
     SQL.SQL.Add('From    '+BancoDeDados);
     If vIsOrder Then
        If vCampoAtual<>'' Then SQL.SQL.Add('Order By '+vCampoPesq+','+vCampoOrder)
     Else
        If vCampoAtual<>'' Then SQL.SQL.Add('Order By '+vCampoPesq);
     SQL.Open;
     AjustaGrid;
     Exit;
  End;
  if SQL.FieldByName(vCampoAtual).DataType in [ftDate, ftTime, ftDateTime] Then begin
    SQL.Close;
    SQL.SQL.Clear;
    SQL.SQL.Add('Select  '+Campos);
    SQL.SQL.Add('From    '+BancoDeDados);
    Sql.Sql.Add('Where ' + vCampoPesq + '= :xValor');
    Sql.Params[0].AsDateTime := StrToDateTime(txPesquisa.Text);
    If vIsOrder Then
       If vCampoPesq<>'' Then SQL.SQL.Add('Order By '+vCampoPesq+','+vCampoOrder)
    Else
       If vCampoPesq<>'' Then SQL.SQL.Add('Order By '+vCampoPesq);
    SQL.Open;
    AjustaGrid;
    Exit;
  end;
  If SQL.FieldByName(vCampoAtual).DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency] Then eNumeric:=True;
  If (eNumeric) and (txPesquisa.Text<>'') Then Begin
     Try
       StrToInt(txPesquisa.Text);
     Except
       SQL.Close;
       SQL.SQL.Clear;
       SQL.SQL.Add('Select '+Campos);
       SQL.SQL.Add('From   '+BancoDeDados);
       If vIsOrder Then
          SQL.SQL.Add('Order By '+vCampoPesq+','+vCampoOrder)
       Else
          SQL.SQL.Add('Order By '+vCampoPesq);
       SQL.Open;
       AjustaGrid;
       txPesquisa.Text:='';
       Exit;
     End;
  End;
  Case RG.ItemIndex of
       0: Begin (* Igual a *)
            SQL.Close;
            SQL.SQL.Clear;
            SQL.SQL.Add('Select '+Campos);
            SQL.SQL.Add('From   '+BancoDeDados);
            If eNumeric Then Begin
              If vIsSql Then SQL.SQL.Add('and '+vCampoPesq+'= :xValor')
              Else SQL.SQL.Add('Where '+vCampoPesq+'= :xValor')
            End Else Begin
              If vIsSql Then
                SQL.SQL.Add('and ' + vCampoPesq + '= :xValor')
              Else
                SQL.SQL.Add('Where ' + vCampoPesq + '= :xValor');
            End;
            If vIsOrder Then
               SQL.SQL.Add('Order By '+vCampoPesq+','+vCampoOrder)
            Else
               SQL.SQL.Add('Order By '+vCampoPesq);

            Sql.Params[0].AsString := txPesquisa.Text;
            SQL.Open;
            AjustaGrid;
          End;
       1: Begin (* Maior *)
            SQL.Close;
            SQL.SQL.Clear;
            SQL.SQL.Add('Select '+Campos);
            SQL.SQL.Add('From   '+BancoDeDados);
            If eNumeric Then Begin
               If vIsSql Then SQL.SQL.Add('and '+vCampoPesq+' >= :xValor2')
               Else SQL.SQL.Add('Where '+vCampoPesq+' >= :xValor2')
            End Else Begin
               If vIsSql Then SQL.SQL.Add('and '+vCampoPesq+' Like :xValor2')
               Else SQL.SQL.Add('Where '+vCampoPesq+' Like :xValor2')
            End;
            If vIsOrder Then
               SQL.SQL.Add('Order By '+vCampoPesq+','+vCampoOrder)
            Else
               SQL.SQL.Add('Order By '+vCampoPesq);

            if eNumeric Then Begin
              SQL.Params[0].AsString      := txPesquisa.Text;
            end else begin
              SQL.Params[0].AsString      := txPesquisa.Text + '%';
            end;
            SQL.Open;
            AjustaGrid;
          End;
       2: Begin (* Menor *)
            SQL.Close;
            SQL.SQL.Clear;
            SQL.SQL.Add('Select '+Campos);
            SQL.SQL.Add('From   '+BancoDeDados);
            If eNumeric Then Begin
               If vIsSql Then SQL.SQL.Add('and '+vCampoPesq+'<= :xValor2')
               Else SQL.SQL.Add('Where '+vCampoPesq+'<= :xValor2')
            End
            Else Begin
               If vIsSql Then SQL.SQL.Add('and '+vCampoPesq+' Like :xValor2')
               Else SQL.SQL.Add('Where '+vCampoPesq+' Like :xValor2')
            End;
            If vIsOrder Then
               SQL.SQL.Add('Order By '+vCampoPesq+','+vCampoOrder)
            Else
               SQL.SQL.Add('Order By '+vCampoPesq);

            if Enumeric Then begin
              Sql.Params[0].AsString := txPesquisa.Text;
            end else begin
              Sql.Params[0].AsString := '%' + txPesquisa.Text;
            end;
            SQL.Open;
            AjustaGrid;
          End;
       3: Begin (* Contenha *)
            SQL.Close;
            SQL.SQL.Clear;
            SQL.SQL.Add('Select '+Campos);
            SQL.SQL.Add('From   '+BancoDeDados);
            If eNumeric Then Begin
               If vIsSql Then SQL.SQL.Add('and '+vCampoPesq+'= :xValor2')
               Else SQL.SQL.Add('Where '+vCampoPesq+'= :xValor2')
            End
            Else Begin
               If vIsSql Then SQL.SQL.Add('and '+vCampoPesq+' Like :xValor2')
               Else SQL.SQL.Add('Where '+vCampoPesq+' Like :xValor2')
            End;
            If vIsOrder Then
               SQL.SQL.Add('Order By '+vCampoPesq+','+vCampoOrder)
            Else
               SQL.SQL.Add('Order By '+vCampoPesq);
            if eNumeric Then Begin
              Sql.Params[0].AsString := txPesquisa.Text;
            end else begin
              Sql.Params[0].AsString := '%' + txPesquisa.Text + '%';
            end;
            SQL.Open;
            AjustaGrid;
       End;
  End;
End;



procedure TfrmSYSPesquisar.txPesquisaChange(Sender: TObject);
begin
  If Not NoAutoUpdate Then bltAtualiza;
end;

procedure TfrmSYSPesquisar.txPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = vk_return Then bltAtualiza;
  if key = vk_down   Then grid.SetFocus;
end;

procedure TfrmSYSPesquisar.FormShow(Sender: TObject);
begin
  DM.Transacao.Active := False;
  DM.Transacao.StartTransaction;
end;

procedure TfrmSYSPesquisar.FormCreate(Sender: TObject);
begin
frmproduto:=false;
end;

end.
