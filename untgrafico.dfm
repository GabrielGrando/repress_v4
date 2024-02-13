object frmRelatGrafico1: TfrmRelatGrafico1
  Left = 56
  Top = 1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = '::Orion Inform'#225'tica::'
  ClientHeight = 686
  ClientWidth = 943
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = -2
    Top = 55
    Width = 957
    Height = 668
    Pen.Style = psClear
  end
  object Label2: TLabel
    Left = 608
    Top = 712
    Width = 55
    Height = 13
    Caption = 'Vendedor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label23: TLabel
    Left = 391
    Top = 77
    Width = 82
    Height = 13
    Caption = 'Raz'#227'o Social'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label27: TLabel
    Left = 391
    Top = 113
    Width = 61
    Height = 13
    Caption = 'Endere'#231'o'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label28: TLabel
    Left = 800
    Top = 114
    Width = 40
    Height = 13
    Caption = 'Bairro'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label29: TLabel
    Left = 392
    Top = 149
    Width = 44
    Height = 13
    Caption = 'Cidade'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label32: TLabel
    Left = 604
    Top = 148
    Width = 57
    Height = 13
    Caption = 'Telefone'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label34: TLabel
    Left = 727
    Top = 148
    Width = 50
    Height = 13
    Caption = 'Contato'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label30: TLabel
    Left = 571
    Top = 149
    Width = 17
    Height = 13
    Caption = 'UF'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 397
    Top = 401
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label3: TLabel
    Left = 394
    Top = 388
    Width = 504
    Height = 13
    Caption = 
      '*D'#234' um clique no fornecedor desejado para vizualisar suas '#250'ltima' +
      's compras.'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 33023
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 1
    Top = 669
    Width = 262
    Height = 13
    Caption = '*D'#234' um clique para selecionar o cliente.'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 33023
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object tree2: TTreeView
    Left = 386
    Top = 218
    Width = 553
    Height = 169
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Images = frmSYSMenu.List
    Indent = 19
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 12
    OnClick = tree2Click
  end
  object DBChart2: TDBChart
    Left = 355
    Top = 400
    Width = 600
    Height = 294
    AnimatedZoom = True
    BackWall.Brush.Color = clWhite
    BottomWall.Color = 33023
    Gradient.EndColor = 8421440
    Gradient.StartColor = 8404992
    LeftWall.Color = 8422019
    Title.Color = clWhite
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clTeal
    Title.Font.Height = -13
    Title.Font.Name = 'Verdana'
    Title.Font.Style = [fsBold]
    Title.Frame.Style = psDashDotDot
    Title.Frame.SmallDots = True
    Title.Text.Strings = (
      'Valor Comprado de cada Fornecedor (R$)')
    Chart3DPercent = 1
    LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
    LeftAxis.LabelsFont.Color = clBlack
    LeftAxis.LabelsFont.Height = -9
    LeftAxis.LabelsFont.Name = 'Arial'
    LeftAxis.LabelsFont.Style = []
    LeftAxis.LabelsMultiLine = True
    LeftAxis.LabelStyle = talValue
    Legend.Alignment = laTop
    Legend.Color = 16774378
    Legend.DividingLines.Visible = True
    Legend.Font.Charset = ANSI_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -9
    Legend.Font.Name = 'Verdana'
    Legend.Font.Style = []
    Legend.Frame.Width = 4
    Legend.ShadowColor = 4079166
    Legend.TextStyle = ltsXValue
    Legend.TopPos = 3
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
    TabOrder = 14
    object SpeedButton5: TSpeedButton
      Left = 531
      Top = 267
      Width = 51
      Height = 20
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
    object HorizBarSeries1: THorizBarSeries
      ColorEachPoint = True
      Marks.ArrowLength = 8
      Marks.Style = smsLabelValue
      Marks.Visible = True
      DataSource = qryGrafico
      SeriesColor = clRed
      ValueFormat = 'R$ #,##0.00'
      XLabelsSource = 'RAZAO'
      BarWidthPercent = 20
      XValues.DateTime = False
      XValues.Name = 'Bar'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      XValues.ValueSource = 'TOT'
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loAscending
    end
  end
  object edt2: TEdit
    Left = 608
    Top = 728
    Width = 121
    Height = 19
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    Text = '1'
  end
  object tree: TTreeView
    Left = -1
    Top = 72
    Width = 378
    Height = 596
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Images = frmSYSMenu.List
    Indent = 19
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    OnChange = treeChange
    OnClick = treeClick
  end
  object Panel2: TPanel
    Left = 372
    Top = 72
    Width = 9
    Height = 643
    Alignment = taLeftJustify
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = -1
    Top = 49
    Width = 382
    Height = 24
    Alignment = taLeftJustify
    Caption = '  Clientes do Vendedor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 381
    Top = 49
    Width = 565
    Height = 24
    Alignment = taLeftJustify
    Caption = '  Dados do Cliente selecionado'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object edtrazao: TEdit
    Left = 392
    Top = 92
    Width = 547
    Height = 19
    CharCase = ecUpperCase
    Color = 16053492
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object edtendereco: TEdit
    Left = 392
    Top = 128
    Width = 407
    Height = 19
    CharCase = ecUpperCase
    Color = 16053492
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object edtbairro: TEdit
    Left = 801
    Top = 128
    Width = 139
    Height = 19
    CharCase = ecUpperCase
    Color = 16053492
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object edtcidade: TEdit
    Left = 391
    Top = 163
    Width = 176
    Height = 19
    CharCase = ecUpperCase
    Color = 16053492
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object edtuf: TEdit
    Left = 571
    Top = 163
    Width = 28
    Height = 19
    CharCase = ecUpperCase
    Color = 16053492
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
  end
  object edttelefone: TEdit
    Left = 604
    Top = 163
    Width = 118
    Height = 19
    CharCase = ecUpperCase
    Color = 16053492
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
  end
  object edtcontato: TEdit
    Left = 726
    Top = 163
    Width = 162
    Height = 19
    CharCase = ecUpperCase
    Color = 16053492
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 11
  end
  object Panel4: TPanel
    Left = 381
    Top = 190
    Width = 564
    Height = 24
    Alignment = taLeftJustify
    Caption = '  Fornecedores do Cliente'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
  end
  object GroupBox1: TGroupBox
    Left = -2
    Top = -8
    Width = 952
    Height = 59
    Color = 10578246
    ParentColor = False
    TabOrder = 15
    object Label4: TLabel
      Left = 7
      Top = 12
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
    object Label6: TLabel
      Left = 582
      Top = 12
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
    object Label5: TLabel
      Left = 391
      Top = 12
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
    object Shape2: TShape
      Left = 772
      Top = 11
      Width = 172
      Height = 39
    end
    object button1: TSpeedButton
      Left = 776
      Top = 15
      Width = 167
      Height = 33
      Caption = 'Selecionar Vendedor'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        360C0000424D360C00000000000036000000280000001F000000200000000100
        180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFF808080808080808080808080808080FFFFFF8080808080808080808080
        80808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000080808000000000
        0000FFFFFF808080000000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFF0000000000000000
        00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000800000FFFFFF00
        0000800000000000808080FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF800000800000800000FFFFFF800000800000800000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080000080FFFFFF80
        8080000080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF800000800000800000FFFFFF800000800000800000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080000080FFFFFF80
        8080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF800000800000800000FFFFFF800000800000800000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000080FFFFFF00
        0000000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF800000800000800000FFFFFF800000800000800000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000080000080FFFFFF00
        0080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF800000800000800000FFFFFF800000800000800000FFFF
        FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000080000080FFFFFF00
        0080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF800000800000800000FFFFFF800000800000800000FFFF
        FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080000080FFFFFF80
        8080000080FFFFFFFFFFFF000080000000FFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF800000800000800000FFFFFF800000800000800000FFFF
        FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000080808000
        0000000000FFFFFFFFFFFF000080000000FFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF800000800000800000FFFFFF800000800000800000FFFF
        FF000000000000FFFFFFFFFFFFFFFFFFFFFFFF80808080000080000080000080
        0000800000808080FFFFFF000080000000FFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF800000800000800000FFFFFF800000800000800000FFFF
        FF000000000000FFFFFFFFFFFFFFFFFFFFFFFF80808080000080000080000080
        0000800000808080FFFFFF000080000000FFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFF000080FFFFFF808080800000800000808080800000800000800000FFFF
        FF000000000000FFFFFFFFFFFFFFFFFF00008080808080000080000080000080
        0000800000808080FFFFFF000080000000FFFFFFFFFFFF000000FFFFFFFFFFFF
        0000800000808080808000008000008000008000008000008000008000008080
        80000000000080FFFFFFFFFFFF00008000008080808080000080000080000080
        0000800000000000808080000080000000FFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFF8080808000008000008000008000008000008000008000008080
        80000080000080808080FFFFFFFFFFFF808080FF0000FF0000FF0000FF0000FF
        0000FF0000000000808080000000000000000080FFFFFF000000FFFFFFFFFFFF
        8000008000008080808000008000008000008000008000008000008000008080
        80FFFFFF808080FFFFFFFFFFFF000000000000FF0000FF0000FF0000800000FF
        0000FF0000000000808080FFFFFF000080FFFFFFFFFFFF000000FFFFFFFFFFFF
        8000008000008080808000008000008000008000008000008000008000008080
        80800000800000FFFFFFFFFFFFFF0000FF0000800000FF0000FF0000FF0000FF
        0000FF0000800000000000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        800000800000FFFFFF8000008000008000008000008000008000008000008080
        80800000800000FFFFFFFFFFFFFF0000FF0000800000FF0000FF0000800000FF
        0000FF0000800000FF0000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        800000800000808080800000800000800000800080800000800000800000FFFF
        FF800000800000FFFFFFFFFFFFFF0000FF0000800000FF0000FF0000FF0000FF
        0000FF0000800000FF0000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        8000008000008000008000008000008080808000808080808000008000008080
        80800000800000FFFFFFFFFFFFFF0000FF0000800000FF0000FF0000000000FF
        0000FF0000800000FF0000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        808080800000800000800000800000FFFFFF800080FFFFFF8000008000008000
        00800000800000FFFFFFFFFFFFFF0000FF0000800000FF0000FF0000000000FF
        0000FF0000FF0000000000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFF800000800000800000800000FFFFFF800080FFFFFF8000008000008000
        00800000808080FFFFFFFFFFFFFF0000FF0000800000FF0000000000FFFFFF00
        0000FF0000FF0000000000808080FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFF800000800000800000800000FFFFFF800080FFFFFF8000008000008000
        00800000FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000808080FFFFFF80
        8080000000FF0000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFF800000800000800000800000FFFFFF800080FFFFFF8000008000008000
        00800000FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000000000FFFFFFFF0000FF
        FFFF000000FF0000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFF800000800000800000800000FFFFFF800080FFFFFF8000008000008000
        00808080FFFFFFFFFFFFFFFFFF808080FF0000FF0000000000FFFFFFFF0000FF
        FFFF000000FF0000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFF800000800000FFFFFFFFFFFFFFFFFFFFFFFF8000008000008080
        80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF0000000000FF0000000000FF
        0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000008000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000080000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808000000000008000008000
        0080000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF808080000080000080000080808080FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000008000008000
        0080000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000080000080000080000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000008000
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF808080000000000000000000808080FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080000000808080FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080
        8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
      ParentFont = False
      OnClick = Button1Click
    end
    object combovendedor: TComboBox
      Left = 8
      Top = 28
      Width = 376
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
    end
    object dtfim: TDateTimePicker
      Left = 582
      Top = 28
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
      TabOrder = 2
    end
    object dtini: TDateTimePicker
      Left = 390
      Top = 28
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
  end
  object qryQtde: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select Produtos.proDescricao,Sum(Itens.Qtde) as Total,clientes.c' +
        'odigo'
      'From Produtos,Pedidos,Itens,clientes'
      ''
      ''
      'Where  Pedidos.codpedido = Itens.codpedido and'
      'Itens.CodProduto                 = 100 and'
      'Pedidos.Data Between :pIni and :pFim'
      'and pedidos.codvendedor   = :pven'
      ''
      ''
      'Group By Produtos.proDescricao,clientes.codigo')
    Left = 947
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pven'
        ParamType = ptUnknown
      end>
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
    Left = 987
    Top = 448
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
  object qryBanco: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select distinct(codfornecedor),fornecedores.forrazao from pedido' +
        's,fornecedores'
      
        'join fornecedores on fornecedores.forcodforn = pedidos.codfornec' +
        'edor where codcliente = :pcli and codvendedor = :pVen')
    Left = 846
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcli'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pVen'
        ParamType = ptUnknown
      end>
  end
  object qryTotal: TIBQuery
    Database = DM.TOTAL
    Transaction = DM.TRANSATOTAL
    BufferChunks = 1000
    CachedUpdates = False
    Left = 900
    Top = 440
  end
  object dtCliente: TIBTable
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'CODIGO'
    MasterFields = 'CODCLIENTE'
    MasterSource = dsCliVen
    TableName = 'CLIENTES'
    Left = 900
    Top = 88
  end
  object dsCliVen: TDataSource
    DataSet = qryCliVen
    Left = 844
    Top = 144
  end
  object qryCliVen: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cli_ven where codvendedor = :pven')
    Left = 844
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pven'
        ParamType = ptUnknown
      end>
    object qryCliVenCODVENDEDOR: TIBStringField
      FieldName = 'CODVENDEDOR'
      Origin = 'CLI_VEN.CODVENDEDOR'
    end
    object qryCliVenCODCLIENTE: TIBStringField
      FieldName = 'CODCLIENTE'
      Origin = 'CLI_VEN.CODCLIENTE'
    end
  end
  object dtVendedor: TIBTable
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'CODIGO'
    MasterFields = 'CODVENDEDOR'
    MasterSource = dsCliVen
    TableName = 'FUNCIONARIOS'
    Left = 956
    Top = 88
  end
  object dsPedidos: TDataSource
    DataSet = qryPedidos
    Left = 912
    Top = 320
  end
  object dtItens: TIBTable
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'CODPEDIDO'
    MasterFields = 'CODPEDIDO'
    MasterSource = dsPedidos
    TableName = 'ITENS'
    Left = 860
    Top = 264
    object dtItensCODPEDIDO: TIBStringField
      FieldName = 'CODPEDIDO'
      Size = 10
    end
    object dtItensCODPRODUTO: TIBStringField
      FieldName = 'CODPRODUTO'
      Size = 10
    end
    object dtItensQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object dtItensVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object dtItensDESCONTO1: TFloatField
      FieldName = 'DESCONTO1'
    end
    object dtItensGRADE: TIntegerField
      FieldName = 'GRADE'
    end
    object dtItensDESCONTO2: TFloatField
      FieldName = 'DESCONTO2'
    end
    object dtItensDESCONTO3: TFloatField
      FieldName = 'DESCONTO3'
    end
  end
  object qryPedidos: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 910
    Top = 264
  end
  object dsClientes: TDataSource
    DataSet = dtCliente
    Left = 902
    Top = 145
  end
  object qry: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      ''
      ''
      ''
      '')
    Left = 904
    Top = 497
  end
  object qryGrafico: TIBQuery
    Database = DM.TOTAL
    Transaction = DM.TRANSATOTAL
    OnCalcFields = qryCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select sum(((((qtde * total) - (qtde*total * (D1/100))) - (((qtd' +
        'e*total)-(qtde*total*(D1/100)))*D2/100)) -'
      
        '((((qtde*total)-(qtde*total*(D1/100)))-(((qtde*total)-(qtde*tota' +
        'l*(D1/100)))*D2/100))*D3/100))) as tot,codfornecedor'
      'From grafico'
      'group by codfornecedor')
    Left = 856
    Top = 497
    object IBStringField1: TIBStringField
      FieldName = 'CODFORNECEDOR'
      Size = 15
    end
    object StringField1: TStringField
      FieldKind = fkCalculated
      FieldName = 'RAZAO'
      Size = 60
      Calculated = True
    end
    object qryGraficoTOT: TFloatField
      FieldName = 'TOT'
    end
  end
end
