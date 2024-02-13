object frmMorto: TfrmMorto
  Left = 331
  Top = 244
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Arquivo morto'
  ClientHeight = 290
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = -4
    Top = -1
    Width = 289
    Height = 178
    ActivePage = TabSheet1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Gerar'
      object SpeedButton1: TSpeedButton
        Left = 40
        Top = 81
        Width = 193
        Height = 33
        Caption = 'Gerar arquivo morto'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333C3333333333333337F3333333333333C0C3333
          333333333777F33333333333C0F0C3333333333377377F333333333C0FFF0C33
          3333333777F377F3333333CCC0FFF0C333333373377F377F33333CCCCC0FFF0C
          333337333377F377F3334CCCCCC0FFF0C3337F3333377F377F33C4CCCCCC0FFF
          0C3377F333F377F377F33C4CC0CCC0FFF0C3377F3733F77F377333C4CCC0CC0F
          0C333377F337F3777733333C4C00CCC0333333377F773337F3333333C4CCCCCC
          3333333377F333F7333333333C4CCCC333333333377F37733333333333C4C333
          3333333333777333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object Shape1: TShape
        Left = -35
        Top = -16
        Width = 324
        Height = 89
        Brush.Color = 10578246
        Pen.Style = psClear
      end
      object Label1: TLabel
        Left = 8
        Top = 16
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
        Left = 144
        Top = 16
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
      object prog: TGauge
        Left = 0
        Top = 128
        Width = 279
        Height = 22
        ForeColor = 16717591
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Progress = 0
      end
      object INI: TDateTimePicker
        Left = 8
        Top = 32
        Width = 129
        Height = 21
        Date = 38582.779452754630000000
        Time = 38582.779452754630000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object FIM: TDateTimePicker
        Left = 144
        Top = 32
        Width = 129
        Height = 21
        Date = 38582.779452754630000000
        Time = 38582.779452754630000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Restaurar'
      ImageIndex = 1
      object SpeedButton2: TSpeedButton
        Left = 40
        Top = 80
        Width = 193
        Height = 33
        Caption = 'Restaurar arquivo morto'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
          333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
          C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
          F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
          F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
          00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
          3333333373FF7333333333333000333333333333377733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object Shape2: TShape
        Left = -43
        Top = -16
        Width = 324
        Height = 89
        Brush.Color = 10578246
        Pen.Style = psClear
      end
    end
  end
  object qrybanco: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from pedidos '
      'where data between :pdataini and :pdatafim')
    Left = 328
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pdataini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pdatafim'
        ParamType = ptUnknown
      end>
  end
  object qrymorto: TIBQuery
    Database = MORTO
    Transaction = TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from pedidos'
      'where data > :pdata')
    Left = 336
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pdata'
        ParamType = ptUnknown
      end>
  end
  object MORTO: TIBDatabase
    DatabaseName = 'C:\REPRESS 1.0\BANCO\MORTO\vendas'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 240
    Top = 208
  end
  object TRANSACAO: TIBTransaction
    Active = False
    DefaultDatabase = MORTO
    AutoStopAction = saNone
    Left = 160
    Top = 208
  end
  object qryBancoItens: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from itens'
      'where codpedido = :pCodpedido')
    Left = 408
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pCodpedido'
        ParamType = ptUnknown
      end>
  end
  object qrymortoitens: TIBQuery
    Database = MORTO
    Transaction = TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from itens'
      'where codpedido = :pcodpedido')
    Left = 400
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcodpedido'
        ParamType = ptUnknown
      end>
  end
end
