object frmRelatGrafico5: TfrmRelatGrafico5
  Left = 4
  Top = 24
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = '::Orion Inform'#225'tica::'
  ClientHeight = 638
  ClientWidth = 1009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBChart2: TDBChart
    Left = -41
    Top = -28
    Width = 1073
    Height = 680
    AnimatedZoom = True
    BackWall.Brush.Color = clWhite
    BottomWall.Color = 33023
    Gradient.EndColor = 8421440
    Gradient.StartColor = 8404992
    LeftWall.Color = 8422019
    Title.Color = clWhite
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clTeal
    Title.Font.Height = -21
    Title.Font.Name = 'Verdana'
    Title.Font.Style = [fsBold]
    Title.Frame.Style = psDashDotDot
    Title.Frame.SmallDots = True
    Title.Text.Strings = (
      '')
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
    Visible = False
    object SpeedButton5: TSpeedButton
      Left = 983
      Top = 638
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
    object Series1: TAreaSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      DataSource = dt
      SeriesColor = clRed
      XLabelsSource = 'DESCRICAO'
      DrawArea = True
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      XValues.ValueSource = 'CODIGO'
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'QTDE'
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
    Left = 793
    Top = 426
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
    object dtRAZAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'RAZAO'
      Size = 60
      Calculated = True
    end
  end
  object qry: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    Left = 844
    Top = 425
  end
end
