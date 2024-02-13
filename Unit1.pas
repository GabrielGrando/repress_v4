unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, ibx.IBCustomDataSet, ibx.IbQuery, jpeg;

type
  TfrmVISAgendamento = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    S24: TShape;
    S25: TShape;
    S26: TShape;
    S27: TShape;
    s31: TShape;
    S30: TShape;
    S29: TShape;
    S28: TShape;
    S23: TShape;
    S22: TShape;
    S21: TShape;
    S20: TShape;
    S19: TShape;
    S18: TShape;
    S17: TShape;
    S16: TShape;
    S15: TShape;
    S14: TShape;
    S13: TShape;
    S12: TShape;
    S11: TShape;
    S10: TShape;
    S9: TShape;
    S8: TShape;
    S7: TShape;
    S6: TShape;
    S5: TShape;
    S4: TShape;
    S3: TShape;
    S2: TShape;
    s1: TShape;
    Shape33: TShape;
    Label10: TLabel;
    Label22: TLabel;
    Shape34: TShape;
    Image8: TImage;
    LBLVENDEDOR: TLabel;
    LBLDATA: TLabel;
    qry: TIBQuery;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    lblqtdevis: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    lblmin: TLabel;
    lbldiasuteis: TLabel;
    lblmax: TLabel;
    procedure SpeedButton14Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);

  private
    { Private declarations }
  public
    data2:tdate;
    Procedure MontarMapa;
    Procedure Datas;
    function  DifDateUtil(dataini,datafin:string):integer;
    Procedure ContarVisitas(Dia:string;Shape:tShape);
    Procedure AbrirConsulta(vDia:string);
   end;


var
  frmVISAgendamento: TfrmVISAgendamento;
  data,dtfim,datafim,dataini:string;
  vZerados :integer;
  vmaximo :integer;


implementation

uses untVisConsulta, frmEscolhevendedor;

{$R *.dfm}

procedure TfrmVISAgendamento.MontarMapa;
var
 DataRef : string;
begin
 vZerados := 0;
 vMaximo  := 0;
 DataRef  := frmVisVendedor.edtdata.Text[1] + frmVisVendedor.edtdata.Text[2];

 with qry do
  begin
   close;
   sql.clear;
   sql.add('select count(codigo) from VISITAS');
   sql.add('where vendedor = :pven');
   sql.add('and data between :pini and :pfim');
   parambyname('pven').value := lblvendedor.caption;
   parambyname('pini').value := dataini;
   parambyname('pfim').value := datafim;
   open;

   if qry.fieldbyname('count').value <> null then  lblqtdevis.caption := qry.fieldbyname('count').value;
  end;

 ContarVisitas('01',s1);
 ContarVisitas('02',s2);
 ContarVisitas('03',s3);
 ContarVisitas('04',s4);
 ContarVisitas('05',s5);
 ContarVisitas('06',s6);
 ContarVisitas('07',s7);
 ContarVisitas('08',s8);
 ContarVisitas('09',s9);
 ContarVisitas('10',s10);
 ContarVisitas('11',s11);
 ContarVisitas('12',s12);
 ContarVisitas('13',s13);
 ContarVisitas('14',s14);
 ContarVisitas('15',s15);
 ContarVisitas('16',s16);
 ContarVisitas('17',s17);
 ContarVisitas('18',s18);
 ContarVisitas('19',s19);
 ContarVisitas('20',s20);
 ContarVisitas('21',s21);
 ContarVisitas('22',s22);
 ContarVisitas('23',s23);
 ContarVisitas('24',s24);
 ContarVisitas('25',s25);
 ContarVisitas('26',s26);
 ContarVisitas('27',s27);
 ContarVisitas('28',s28);


 if DataRef <> '02' then
  begin
   ContarVisitas('29',s29);
   ContarVisitas('30',s30);
   if (DataRef = '01') or  (DataRef = '03') or (DataRef = '05') or (DataRef = '07') or (DataRef = '08') or (DataRef = '10') or (DataRef = '12') then ContarVisitas('31',s31);
  end;

 if DataRef <> '02' then
  begin

   if (DataRef = '01') or  (DataRef = '03') or (DataRef = '05') or (DataRef = '07') or (DataRef = '08') or (DataRef = '10') or (DataRef = '12') then
    begin
     s30.Visible := true;
     speedbutton25.Visible := true;
     s31.Visible := true;
     speedbutton32.Visible := true;
    end else begin
     s30.Visible := true;
     speedbutton25.Visible := true;
    end;

  end else begin
   s29.Visible           := false;
   speedbutton26.Visible := false;
 end;


lblqtdevis.caption := lblqtdevis.caption + ' Visita(s)';
lblmax.caption := inttostr(vMaximo) + ' Dia(s)';
lblmin.caption := inttostr(vZerados)+ ' Dia(s)';
end;

procedure TfrmVISAgendamento.DATAS;
begin
DATA := frmvisvendedor.edtdata.text[1] + frmvisvendedor.edtdata.text[2];

if data = '01' then dtfim := '31/';
if data = '02' then dtfim := '28/';
if data = '03' then dtfim := '31/';
if data = '04' then dtfim := '30/';
if data = '05' then dtfim := '31/';
if data = '06' then dtfim := '30/';
if data = '07' then dtfim := '31/';
if data = '08' then dtfim := '31/';
if data = '09' then dtfim := '30/';
if data = '10' then dtfim := '31/';
if data = '11' then dtfim := '30/';
if data = '12' then dtfim := '31/';

dataini := '01/' + frmvisvendedor.edtdata.text;
datafim := dtfim + frmvisvendedor.edtdata.text;

lbldiasuteis.caption:= inttostr(DifDateUtil(dataini,datafim))+ ' Dia(s)';
end;




Procedure TfrmVISAgendamento.ContarVisitas(Dia:string;Shape:tShape);
begin

 with qry do
  begin
   close;
   sql.clear;
   sql.add('select count(codigo) from visitas where vendedor = :pven and data = :pdata');
   parambyname('pven').value := lblvendedor.caption;
   parambyname('pdata').value := Dia+'/'+lbldata.Caption;
   open;

   if  fieldbyname('count').value = 0 then
    begin
     Shape.Brush.Color := clsilver;
     vZerados := vZerados +1;
    end;

   if (fieldbyname('count').value > 0)  and (fieldbyname('count').value < 5) then Shape.Brush.Color := clgreen;

   if (fieldbyname('count').value >= 5) then
    begin
     Shape.Brush.Color := clred;
     vMaximo := vMaximo +1;
    end;
  end;

end;



Procedure TfrmVISAgendamento.AbrirConsulta(vDia:string);
var
  data:string;
begin

frmVISConsulta  := tfrmVISConsulta.create(self);

frmVISConsulta.qryconsulta.close;
frmVISConsulta.qryConsulta.parambyname('pData').value := vDia+'/'+lbldata.caption;
frmVISConsulta.qryConsulta.parambyname('pVen').value  := lblvendedor.Caption;
frmVISConsulta.qryconsulta.open;

frmVISConsulta.lbldia.Caption     :=  vDia+'/';
Shortdateformat                   :=  ('dddd, dd" de "mmmm" de "yyyy');
data                              :=  vDia+'/'+lbldata.caption;
data2                             :=  strtodate(data);
frmVISConsulta.lblnomedia.Caption :=  uppercase(datetostr(data2));
frmvisagendamento.Visible         :=  false;

frmVISConsulta.showmodal;
frmVISConsulta.free;
end;




procedure TfrmVISAgendamento.FormCreate(Sender: TObject);
begin
datas;
end;

procedure TfrmVISAgendamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

procedure TfrmVISAgendamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmvisvendedor.Visible := true;
end;


//***************************************************************
//CHAMADAS DOS DIAS
//***************************************************************


procedure TfrmVISAgendamento.SpeedButton15Click(Sender: TObject);
begin
AbrirConsulta('01');
end;

procedure TfrmVISAgendamento.SpeedButton14Click(Sender: TObject);
begin
AbrirConsulta('02');
end;

procedure TfrmVISAgendamento.SpeedButton13Click(Sender: TObject);
begin
AbrirConsulta('03');
end;

procedure TfrmVISAgendamento.SpeedButton12Click(Sender: TObject);
begin
AbrirConsulta('04');
end;

procedure TfrmVISAgendamento.SpeedButton11Click(Sender: TObject);
begin
AbrirConsulta('05');
end;

procedure TfrmVISAgendamento.SpeedButton10Click(Sender: TObject);
begin
AbrirConsulta('06');
end;

procedure TfrmVISAgendamento.SpeedButton9Click(Sender: TObject);
begin
AbrirConsulta('07');
end;

procedure TfrmVISAgendamento.SpeedButton8Click(Sender: TObject);
begin
AbrirConsulta('08');
end;

procedure TfrmVISAgendamento.SpeedButton7Click(Sender: TObject);
begin
AbrirConsulta('09');
end;

procedure TfrmVISAgendamento.SpeedButton22Click(Sender: TObject);
begin
AbrirConsulta('17');
end;

procedure TfrmVISAgendamento.SpeedButton30Click(Sender: TObject);
begin
AbrirConsulta('25');
end;

procedure TfrmVISAgendamento.SpeedButton6Click(Sender: TObject);
begin
AbrirConsulta('10');
end;

procedure TfrmVISAgendamento.SpeedButton21Click(Sender: TObject);
begin
AbrirConsulta('18');
end;

procedure TfrmVISAgendamento.SpeedButton29Click(Sender: TObject);
begin
AbrirConsulta('26');
end;

procedure TfrmVISAgendamento.SpeedButton5Click(Sender: TObject);
begin
AbrirConsulta('11');
end;

procedure TfrmVISAgendamento.SpeedButton20Click(Sender: TObject);
begin
AbrirConsulta('19');
end;

procedure TfrmVISAgendamento.SpeedButton28Click(Sender: TObject);
begin
AbrirConsulta('27');
end;

procedure TfrmVISAgendamento.SpeedButton4Click(Sender: TObject);
begin
AbrirConsulta('12');
end;

procedure TfrmVISAgendamento.SpeedButton19Click(Sender: TObject);
begin
AbrirConsulta('20');
end;

procedure TfrmVISAgendamento.SpeedButton27Click(Sender: TObject);
begin
AbrirConsulta('28');
end;

procedure TfrmVISAgendamento.SpeedButton3Click(Sender: TObject);
begin
AbrirConsulta('13');
end;

procedure TfrmVISAgendamento.SpeedButton18Click(Sender: TObject);
begin
AbrirConsulta('21');
end;

procedure TfrmVISAgendamento.SpeedButton26Click(Sender: TObject);
begin
AbrirConsulta('29');
end;

procedure TfrmVISAgendamento.SpeedButton2Click(Sender: TObject);
begin
AbrirConsulta('14');
end;

procedure TfrmVISAgendamento.SpeedButton17Click(Sender: TObject);
begin
AbrirConsulta('22');
end;

procedure TfrmVISAgendamento.SpeedButton25Click(Sender: TObject);
begin
AbrirConsulta('30');
end;

procedure TfrmVISAgendamento.SpeedButton1Click(Sender: TObject);
begin
AbrirConsulta('15');
end;

procedure TfrmVISAgendamento.SpeedButton24Click(Sender: TObject);
begin
AbrirConsulta('23');
end;

procedure TfrmVISAgendamento.SpeedButton32Click(Sender: TObject);
begin
AbrirConsulta('31');
end;

procedure TfrmVISAgendamento.SpeedButton23Click(Sender: TObject);
begin
AbrirConsulta('16');
end;

procedure TfrmVISAgendamento.SpeedButton31Click(Sender: TObject);
begin
AbrirConsulta('24');
end;

//***************************************************************
//FUNCTION PARA CONTAGEM DE DIAS ÚTEIS
//***************************************************************


function TfrmVISAgendamento.DifDateUtil(dataini,datafin:string):integer;
var a,b,c:tdatetime;
  ct,s:integer;
begin
if StrToDate(DataFin) < StrtoDate(DataIni) then
  begin
  Result := 0;
  exit;
  end;
ct := 0;
s := 1;
a := strtodate(dataFin);
b := strtodate(dataIni);
if a > b then
  begin
  c := a;
  a := b;
  b := c;
  s := 1;
  end;
a := a + 1;
while (dayofweek(a)<>2) and (a <= b) do
  begin
  if dayofweek(a) in [2..6] then
  begin
  inc(ct);
  end;
  a := a + 1;
  end;
ct := ct + round((5*int((b-a)/7)));
a := a + (7*int((b-a)/7));
while a <= b do
  begin
  if dayofweek(a) in [2..6] then
  begin
  inc(ct);
  end;
  a := a + 1;
  end;
if ct < 0 then
  begin
  ct := 0;
  end;
result := s*ct;
end;

end.
