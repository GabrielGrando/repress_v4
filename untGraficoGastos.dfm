object frmRelatGrafico6: TfrmRelatGrafico6
  Left = 16
  Top = -6
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = '::Orion Inform'#225'tica::'
  ClientHeight = 681
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = -28
    Top = 590
    Width = 1066
    Height = 99
    Brush.Color = 10578246
    Pen.Style = psClear
  end
  object DBChart2: TDBChart
    Left = -27
    Top = -15
    Width = 1034
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
      'Gr'#225'fico de Gastos')
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
    object SpeedButton5: TSpeedButton
      Left = 963
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
    object Label3: TLabel
      Left = 440
      Top = 604
      Width = 144
      Height = 16
      Caption = 'Valor em Reais (R$)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Series1: THorizBarSeries
      ColorEachPoint = True
      Marks.ArrowLength = 20
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      DataSource = dtGastos
      SeriesColor = clRed
      XLabelsSource = 'descricao'
      XValues.DateTime = False
      XValues.Name = 'Bar'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loNone
      XValues.ValueSource = 'SUM'
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'CONTA'
    end
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 618
    Width = 989
    Height = 63
    Color = 10578246
    ParentColor = False
    TabOrder = 1
    object Label1: TLabel
      Left = 17
      Top = 17
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
      Left = 185
      Top = 17
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
    object Shape2: TShape
      Left = 373
      Top = 22
      Width = 149
      Height = 33
    end
    object SpeedButton2: TSpeedButton
      Left = 376
      Top = 26
      Width = 144
      Height = 28
      Caption = 'Visualizar Gr'#225'fico'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        16080000424D160800000000000036000000280000001B000000180000000100
        180000000000E007000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F58C8E8A31342DE6E6E5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEFEFEE6E716C292C2523261FC8C8C7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D4D350524C494B45C2C3C1
        4649439A9B98FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFAFAFAACADAA294E263C953F6DD67562BF7A4F8D6061625DFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000BDBEBCFAFAFAFAFAFAC2C3C15C5E5920231B49A24C3F
        CF4833A45118904850B26631342DBDBEBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000004D4F
        496466615C5E591F221A464943B4B3B082D07E359959189C4008C71A4AE0527C
        7E792D302ABDBEBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000040423B50524C71B17347CB4C7BD9
        73B0CEA13D99601BA04002CF1002D40C14D71D8CE3902A932D146D15779A76EF
        EFEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000A8A9A7313E3157C06564B66E50A16B269252189C4003C91302D4
        0C02D40C04D40E25DA2D18D52119C220116A134D504AC2C3C1FAFAFAFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000E2E6E32B7449
        1C924A1AA13E16B3300DA81E17681A235020285A242350201654161F4E1C2757
        231E5B1D4F9F525C5E59282A24747672DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFF707F741CA6260BD51502B50A0D210C
        060605665A56A9948D403836090808544946998780312F2A20371EC7E9C9C2C3
        C15C5E5942453EA8A9A7F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFD6D7D626672632A638027217093B19151E161518142326210F1210
        151E16131A121E241B131B15093C2008572B3C9B5BC7EDCEBBBCB94547415C5E
        59DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF68717003
        0F10012627045E66058292068D9C058292046F7C03444A02272B011E21046D79
        06A0B204636E011E2105593921BF2C5DDA62557A545C5E59F2F3F2FFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFEAEAEA2B424504697508CDE409E4FE09E4FE09
        E4FE09E4FE08CDE4022B3003566008C6DD09E4FE09E4FE09E4FE07B1C5022A2E
        014F2005D10F51DB584D504A737570FAFAFAFFFFFFFFFFFFFFFFFF000000FFFF
        FFDEDEDE1C34370695A609E4FE09E4FE09E4FE07BDD3046F7C034C5402141405
        7A8809D9F209E4FE09E4FE09E4FE08CDE4023F43013B1802CC0B17D721DADBDA
        3F413CA1A3A0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF7F8D8F050F100452
        5A07AFC3057A87011E2102343A046D7904606A012226034C5407B1C508C6DD06
        A0B202343A01322602A30E02D40C08D61281EA8663BA662F532DE8E8E7FFFFFF
        FFFFFF000000FFFFFFFFFFFFF5F5F5A1A7A8324446162B2E02141405808F09D9
        F209E4FE09E4FE07BDD304525A022A2E01222602191B02362D02BB1D02D40C02
        D40C03D01019BA322CA54D268237A8A9A7FFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFF5F5F5C8C8C711252706A5B809E4FE09E4FE09E4FE09E4FE09E4
        FE08CDE407B8CD04646D01331602CC0B02D10E0FB92723994B27945035AB513A
        A3454B4D47F5F5F5FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA
        6A7778091B1E046D7907B8CD08C6DD09D9F208C1D707AFC304525A021414068E
        1303C9131CA33F22914E63B26F2DCD3434DD3C74CC77252820C6C6C5FFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F598A7A8324446112527
        11252714333706171902191B1C2D2F9EA4A417CD251899413599595DC45F13D4
        1A2DDB358EE692C3E6C542453E858682F5F5F5000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5DEDEDED1D1D1D1D1D1CDCDCC939591
        282A246E716C2AA94A22914E2AA94A10C02313D41C4A8A4B3A3D3642453E3639
        3230322B9C9E9B000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC0BE2B352A3192534CC35F
        2AA94A31A44C206221666863A7A8A5D0D0CFB6B7B5747672E8E8E7000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFBFC0BE353E349395916E746E2F362DACADAAFAFAFA
        FFFFFFFFFFFFFFFFFFFAFAFAFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFB8B8B6292C254B4D47B8B8B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA8C8E8A7C7E79FA
        FAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object Label4: TLabel
      Left = 544
      Top = 31
      Width = 431
      Height = 13
      Caption = '*Porcentagem em rela'#231#227'o ao TOTAL DE GASTOS feitos no per'#237'odo.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtfim: TDateTimePicker
      Left = 184
      Top = 31
      Width = 165
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
      Left = 15
      Top = 31
      Width = 160
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
  end
  object dtGastos: TIBDataSet
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    OnCalcFields = dtGastosCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GASTOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into GASTOS'
      '  (CODIGO, CONTA, DATA, VALOR, NOTA, DATA_VENC)'
      'values'
      '  (:CODIGO, :CONTA, :DATA, :VALOR, :NOTA, :DATA_VENC)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  CONTA,'
      '  DATA,'
      '  VALOR,'
      '  NOTA,'
      '  DATA_VENC'
      'from GASTOS '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select sum(valor),conta from gastos'
      'where data_venc between :pINI and :pFIM'
      'group by conta')
    ModifySQL.Strings = (
      'update GASTOS'
      'set'
      '  CODIGO = :CODIGO,'
      '  CONTA = :CONTA,'
      '  DATA = :DATA,'
      '  VALOR = :VALOR,'
      '  NOTA = :NOTA,'
      '  DATA_VENC = :DATA_VENC'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 856
    Top = 264
    object dtGastosSUM: TFloatField
      FieldName = 'SUM'
      currency = True
    end
    object dtGastosCONTA: TIntegerField
      FieldName = 'CONTA'
      Required = True
    end
    object dtGastosdescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'descricao'
      Size = 80
      Calculated = True
    end
  end
  object QRY: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM CONTAS '
      'WHERE CODIGO = :PCOD')
    Left = 920
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PCOD'
        ParamType = ptUnknown
      end>
    object QRYCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTAS.CODIGO'
      Required = True
    end
    object QRYDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'CONTAS.DESCRICAO'
      Required = True
      Size = 80
    end
  end
end
