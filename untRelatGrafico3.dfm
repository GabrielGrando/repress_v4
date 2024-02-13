object frmRelatGrafico3: TfrmRelatGrafico3
  Left = 3
  Top = 1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = '::Orion Inform'#225'tica::'
  ClientHeight = 697
  ClientWidth = 1009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = -43
    Top = 607
    Width = 1068
    Height = 97
    Brush.Color = 10578246
    Pen.Style = psClear
  end
  object DBChart1: TDBChart
    Left = -27
    Top = -18
    Width = 1051
    Height = 632
    AnimatedZoom = True
    BackWall.Brush.Color = clWhite
    BottomWall.Color = 33023
    Gradient.EndColor = 8421440
    Gradient.StartColor = 8404992
    LeftWall.Color = 8422019
    PrintProportional = False
    Title.Color = clWhite
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clTeal
    Title.Font.Height = -21
    Title.Font.Name = 'Verdana'
    Title.Font.Style = [fsBold]
    Title.Frame.Style = psDashDotDot
    Title.Frame.SmallDots = True
    Title.Text.Strings = (
      'Gr'#225'fico de Desempenho de Vendas (Quantidade Vendida)')
    Chart3DPercent = 1
    LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
    LeftAxis.LabelsFont.Color = clBlack
    LeftAxis.LabelsFont.Height = -9
    LeftAxis.LabelsFont.Name = 'Arial'
    LeftAxis.LabelsFont.Style = []
    LeftAxis.LabelsMultiLine = True
    LeftAxis.LabelStyle = talValue
    Legend.Color = 16774378
    Legend.DividingLines.Visible = True
    Legend.Font.Charset = ANSI_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -9
    Legend.Font.Name = 'Verdana'
    Legend.Font.Style = []
    Legend.Frame.Width = 4
    Legend.ShadowColor = 4079166
    Legend.TextStyle = ltsLeftPercent
    Legend.Visible = False
    View3D = False
    View3DOptions.Elevation = 315
    View3DOptions.HorizOffset = 19
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DOptions.VertOffset = 19
    View3DOptions.Zoom = 93
    BevelInner = bvRaised
    Color = clWhite
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 983
      Top = 601
      Width = 55
      Height = 23
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object BarSeries1: TBarSeries
      ColorEachPoint = True
      Marks.ArrowLength = 8
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = dt
      SeriesColor = clRed
      ValueFormat = '#,##0'
      XLabelsSource = 'DATA'
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      XValues.ValueSource = 'DATA'
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loAscending
      YValues.ValueSource = 'QTDE'
    end
  end
  object DBChart2: TDBChart
    Left = -26
    Top = -15
    Width = 1051
    Height = 632
    AnimatedZoom = True
    BackWall.Brush.Color = clWhite
    BottomWall.Color = 33023
    Gradient.EndColor = 8421440
    Gradient.StartColor = 8404992
    LeftWall.Color = 8422019
    PrintProportional = False
    Title.Color = clWhite
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clTeal
    Title.Font.Height = -21
    Title.Font.Name = 'Verdana'
    Title.Font.Style = [fsBold]
    Title.Frame.Style = psDashDotDot
    Title.Frame.SmallDots = True
    Title.Text.Strings = (
      'Gr'#225'fico de Desempenho de Vendas (Valor Monet'#225'rio)')
    Chart3DPercent = 1
    LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
    LeftAxis.LabelsFont.Color = clBlack
    LeftAxis.LabelsFont.Height = -9
    LeftAxis.LabelsFont.Name = 'Arial'
    LeftAxis.LabelsFont.Style = []
    LeftAxis.LabelsMultiLine = True
    LeftAxis.LabelStyle = talValue
    Legend.Color = 16774378
    Legend.DividingLines.Visible = True
    Legend.Font.Charset = ANSI_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -9
    Legend.Font.Name = 'Verdana'
    Legend.Font.Style = []
    Legend.Frame.Width = 4
    Legend.ShadowColor = 4079166
    Legend.TextStyle = ltsLeftPercent
    Legend.Visible = False
    View3D = False
    View3DOptions.Elevation = 315
    View3DOptions.HorizOffset = 19
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DOptions.VertOffset = 19
    View3DOptions.Zoom = 93
    BevelInner = bvRaised
    Color = clWhite
    TabOrder = 1
    object SpeedButton5: TSpeedButton
      Left = 979
      Top = 600
      Width = 55
      Height = 23
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton5Click
    end
    object HorizBarSeries1: TBarSeries
      ColorEachPoint = True
      Marks.ArrowLength = 8
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = dt
      SeriesColor = clRed
      ValueFormat = 'R$ #,##0.00'
      XLabelsSource = 'DATA'
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      XValues.ValueSource = 'DATA'
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loAscending
      YValues.ValueSource = 'TOTAL'
    end
  end
  object GroupBox1: TGroupBox
    Left = -1
    Top = 605
    Width = 1010
    Height = 92
    Color = 10578246
    ParentColor = False
    TabOrder = 2
    object Label1: TLabel
      Left = 273
      Top = 49
      Width = 21
      Height = 13
      Caption = 'De:'
      Color = 10578246
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 467
      Top = 49
      Width = 26
      Height = 13
      Caption = 'At'#233':'
      Color = 10578246
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 271
      Top = 8
      Width = 62
      Height = 13
      Caption = 'Vendedor'
      Color = 10578246
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Shape2: TShape
      Left = 666
      Top = 21
      Width = 187
      Height = 61
    end
    object SpeedButton2: TSpeedButton
      Left = 669
      Top = 25
      Width = 182
      Height = 56
      Caption = 'Visualizar Gr'#225'fico'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        1E0C0000424D1E0C00000000000036040000280000002C0000002E0000000100
        080000000000E8070000EB0A0000EB0A000000010000800000001BA80000ECB5
        54001D5AF700BA6F2A00963F0B00AEC6F200F4F4F400C6AC89008CCB81005FAE
        4C00F4E3A60055B0F4009193900052AF3F00DCA149005EF45600647BD300F4D2
        900086B8D800A47A6400E7D8920021E91200E1E1E2007E907C0047F33E00BA81
        56004887F400CC996600DAD5DC00BAF4B70078A2D80026D51600A0D29800B6AA
        B60092674B00A0A1A000F4EEE4004FE242006ED9F4007A87B900526BD600D291
        3E00F4C86F00CCCCCC0067CF5700E3B1620039A3280096B2F300A78674006BF4
        640039F22F005E8AF400F3DCAC0051D44200DABF8D00D7AB5B00BDCEF4007AD0
        6D008FC0810099F4950068CEF4003D73F400F2EADA00AE622500499DF400C081
        42008AF4840060C34D00649DF400C2906800C1C0C900509B4800E5E9F0009888
        7F0061C1F400E7AD4F0097A68400A29FB20027C51200C69B7C0099C1D800B6D3
        AD00C3B6A20034D72300D0BD7500AD884E0062C1A7003363EA00F4E8CD006D91
        D700F4BE5B00D3C1A100F4D8A5004E78F4007BC7BD0084C3CE009BBDF400D1F4
        C700CAD4F30052F44A007D9DF4002FF02400838DB1001CA87700F4CE8200D3C5
        AD0063E35700738CF400DBA3550066B6F300B9C65500D1985700A6F4A90066C8
        5500F4E5C6007EC29C00F4E2C100F0EAF200A25119003CBA2900ACB2B7006BAA
        5C00B0754D00E1D37E00C07A3400A2B581007AF47400FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000060606060606
        0606060606060606060606060606060606060606060606060606060606060606
        0606060606060606060606060606060606060606060606060606060606060606
        0606060606060606060606060606060606060606060606060606060606060606
        0606060606060606060606060606060606060606060606060606060606060606
        060606060606060606060606757516161C1C1C16487506060606060606060606
        060606060606060606060606060606060606060606481C4621230C0C0C0C0C0C
        23782B1675060606060606060606060606060606060606060606060606060648
        2B210C1779713908205437374513490C781C7506060606060606060606060606
        060606060606060606061621170D5365180F7E3B707B5A5A4B0E294122497816
        0606060606060606060606060606060606060606061C23474E15153263317E3B
        707B5A5A4B0E29297C3F22231606060606060606060606060606060606060606
        16232E4E1F1F653263317E3B707B5A5A4B0E29297C033F224D16060606060606
        060606060606060606060606462E004E1F1F6532630F7E42707B5A014B0E2929
        7C033F76222B0606060606060606060606060606060606754C004E4E1F1F1532
        6331423B1D142A5A4B0E297C7C033F7604237506060606060606060606060606
        0606067579004E4E1F1F6563317E42423B1414141414546F7C033F7604307506
        0606060606060606060606060606067579004E4E5318630F0F0F0F63636E012D
        2D5436695B453F76041348060606060606060606060606060606067579004E53
        18181818630F0F0F0F6E5A01014B0E0E54695B3F041348060606060606060606
        06060606060606757900533232180F317E7E42427E7B2A5A5A5A4B0E29290769
        7613480606060606060606060606060606060675794E653263317E423B707070
        70345C11682A5A4B0E297C1B4F13750606060606060606060606060606060675
        79153263317E423B701D1D1D1D7474747434115A4B0E29034530461C16060606
        0606060606060606060606063915180F7E423B701D6161616172727274747474
        110E297C7C13170C4D1C06060606060606060606060606067367565E5E5F5F50
        5050050505623E585858585858346C2903716363432316060606060606060606
        0606060662025D646464642F2F2F60606060051C3E585858583E74297C323265
        15351C06060606060606060606060606062F02332F2F2F606060050505050505
        38163E3E3E245C2953151515156A1C0606060606060606060606060606064D57
        3D6405050505053838383838386248485868372C1825256A0F6A1C0606060606
        060606060606060606485B2D66573D336460383862626262382F6B57287D6563
        7E42427E63631C06060606060606060606060606064869682A2A5227103D3D3D
        3D3D3D3D02023D40503A1532180F0F6332251C06060606060606060606060606
        0648691134340A0A0A1152501E0B4A3C26262626507D1F323218181832351C06
        06060606060606060606060606485B68115C5C5C5C68362B5026262626262626
        507D77352525252535351C0606060606060606060606060606485B2A68111111
        682A362B503C262626262626504C777143432C2C2C0D1C060606060606060606
        060606060648365A2A2A2A2A2A5A362B503C3C3C3C3C3C3C504C0D3A39393939
        3A471C06060606060606060606060606064807015A5A5A5A5A5A542B123C3C3C
        3C3C3C3C504C0D6A323232322C091C060606060606060606060606060648076C
        2D2D2D2D2D2D4F1C124A4A3C3C3C3C4A50527753535353534E09750606060606
        060606060606060606484F6F6C6C6C6C6C6C4F1C124A4A4A4A4A4A0B121C092E
        0D43430D2E3A060606060606060606060606060606064F191B1B1B1B1B1B451C
        120B0B0B0B0B0B0B122424513A3A3A202B060606060606060606060606060606
        06063019454545454545301C1E40404040404040122406060606060606060606
        0606060606060606060606060606307A4F4F4F4F4F4F131C1E40404040404040
        1E2406060606060606060606060606060606060606060606060630196F0E0E0E
        6F6F301C1E1A1A1A1A1A1A1A1E24060606060606060606060606060606060606
        06060606060607037C414141413F4F16591A1A1A1A1A1A1A1E24060606060606
        06060606060606060606060606060606060616197A1919197A7A2B24591A1A1A
        1A1A1A1A59240606060606060606060606060606060606060606060606060606
        2B5B07526975063E105D5D5D5D5D5D5D59240606060606060606060606060606
        060606060606060606060606060606060606063E105D5D5D5D5D5D5D10240606
        060606060606060606060606060606060606060606060606060606060606063E
        285D5D5D5D5D5D5D102406060606060606060606060606060606060606060606
        06060606060606060606063E28336B646464645D102406060606060606060606
        06060606060606060606060606060606060606060606062410443C3C3C3C3C44
        5924060606060606060606060606060606060606060606060606060606060606
        060606061E3D0B6D6D6D0B3D2F06060606060606060606060606060606060606
        0606060606060606060606060606060662333344444433334806060606060606
        0606060606060606060606060606060606060606060606060606060606066205
        0505620606060606060606060606060606060606060606060606060606060606
        0606060606060606060606060606060606060606060606060606060606060606
        0606}
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object dtfim: TDateTimePicker
      Left = 466
      Top = 63
      Width = 186
      Height = 21
      Date = 38749.719093599540000000
      Time = 38749.719093599540000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dtini: TDateTimePicker
      Left = 271
      Top = 63
      Width = 186
      Height = 21
      Date = 38353.719070451390000000
      Time = 38353.719070451390000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object combovendedor: TComboBox
      Left = 271
      Top = 22
      Width = 382
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
    end
    object GroupBox2: TGroupBox
      Left = 115
      Top = 10
      Width = 145
      Height = 73
      TabOrder = 3
      object RadioButton1: TRadioButton
        Left = 8
        Top = 17
        Width = 113
        Height = 17
        Caption = 'Qtde. Vendida'
        Checked = True
        Color = 10578246
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 9
        Top = 43
        Width = 126
        Height = 17
        Caption = 'Valor Monet'#225'rio'
        Color = 10578246
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        OnClick = RadioButton2Click
      end
    end
  end
  object qryJoin: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Produtos.prodescricao,Sum(Itens.Qtde) as qtde,'#39');'
      
        'sum(((((itens.qtde * itens.valor) - (itens.qtde*itens.valor * (i' +
        'tens.desconto1/100))) - (((itens.qtde*itens.valor)-(itens.qtde*i' +
        'tens.valor*(itens.desconto1/100)))*itens.desconto2/100)) -'
      
        '((((itens.qtde*itens.valor)- (itens.qtde*itens.valor*(itens.desc' +
        'onto1/100)))-(((itens.qtde*itens.valor)-(itens.qtde*itens.valor*' +
        '(itens.desconto1/100)))*itens.desconto2/100))*itens.desconto3/10' +
        '0)))'
      'From Produtos,Pedidos,Itens'
      'Where Pedidos.codpedido = Itens.codpedido'
      'and Itens.CodProduto    = Produtos.procodigo'
      'and Pedidos.Data Between :pDataIni and :pDataFim'
      'and pedidos.bonificacao = '#39#39'NAO'#39#39
      'and pedidos.codvendedor = :pVen'
      'Group By Produtos.proDescricao'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 759
    Top = 386
    object qryJoinQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object qryJoinTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object dt: TIBDataSet
    Database = DM.TOTAL
    Transaction = DM.TRANSATOTAL
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from grafico')
    InsertSQL.Strings = (
      'insert into grafico'
      
        '  (CODIGO, CODPRODUTO, CODFORNECEDOR, CODVENDEDOR, CODCLIENTE, C' +
        'ODGRADE, '
      '   QTDE, TOTAL, DESCRICAO, DATA, D1, D2, D3)'
      'values'
      
        '  (:CODIGO, :CODPRODUTO, :CODFORNECEDOR, :CODVENDEDOR, :CODCLIEN' +
        'TE, :CODGRADE, '
      '   :QTDE, :TOTAL, :DESCRICAO, :DATA, :D1, :D2, :D3)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  CODPRODUTO,'
      '  CODFORNECEDOR,'
      '  CODVENDEDOR,'
      '  CODCLIENTE,'
      '  CODGRADE,'
      '  QTDE,'
      '  TOTAL,'
      '  DESCRICAO,'
      '  DATA,'
      '  D1,'
      '  D2,'
      '  D3'
      'from grafico '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select * from grafico'
      'order by total')
    ModifySQL.Strings = (
      'update grafico'
      'set'
      '  CODIGO = :CODIGO,'
      '  CODPRODUTO = :CODPRODUTO,'
      '  CODFORNECEDOR = :CODFORNECEDOR,'
      '  CODVENDEDOR = :CODVENDEDOR,'
      '  CODCLIENTE = :CODCLIENTE,'
      '  CODGRADE = :CODGRADE,'
      '  QTDE = :QTDE,'
      '  TOTAL = :TOTAL,'
      '  DESCRICAO = :DESCRICAO,'
      '  DATA = :DATA,'
      '  D1 = :D1,'
      '  D2 = :D2,'
      '  D3 = :D3'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 801
    Top = 386
    object dtCODPRODUTO: TIBStringField
      FieldName = 'CODPRODUTO'
      Origin = 'GRAFICO.CODPRODUTO'
      Size = 15
    end
    object dtCODFORNECEDOR: TIBStringField
      FieldName = 'CODFORNECEDOR'
      Origin = 'GRAFICO.CODFORNECEDOR'
      Size = 15
    end
    object dtCODVENDEDOR: TIBStringField
      FieldName = 'CODVENDEDOR'
      Origin = 'GRAFICO.CODVENDEDOR'
      Size = 15
    end
    object dtCODCLIENTE: TIBStringField
      FieldName = 'CODCLIENTE'
      Origin = 'GRAFICO.CODCLIENTE'
      Size = 15
    end
    object dtCODGRADE: TIBStringField
      FieldName = 'CODGRADE'
      Origin = 'GRAFICO.CODGRADE'
      Size = 15
    end
    object dtQTDE: TIntegerField
      FieldName = 'QTDE'
      Origin = 'GRAFICO.QTDE'
    end
    object dtTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'GRAFICO.TOTAL'
    end
    object dtDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'GRAFICO.DESCRICAO'
      Size = 60
    end
    object dtCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'GRAFICO.CODIGO'
      Required = True
    end
    object dtDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'GRAFICO.DATA'
    end
    object dtD1: TFloatField
      FieldName = 'D1'
      Origin = 'GRAFICO.D1'
    end
    object dtD2: TFloatField
      FieldName = 'D2'
      Origin = 'GRAFICO.D2'
    end
    object dtD3: TFloatField
      FieldName = 'D3'
      Origin = 'GRAFICO.D3'
    end
  end
end
