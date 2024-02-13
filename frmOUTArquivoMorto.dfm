object frmSYSArquivoMorto: TfrmSYSArquivoMorto
  Left = 197
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Arquivo Morto'
  ClientHeight = 106
  ClientWidth = 278
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 49
    Height = 14
    Caption = 'Data In'#237'cio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 144
    Top = 16
    Width = 47
    Height = 14
    Caption = 'Data Final'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object edtIni: TEdit
    Left = 16
    Top = 32
    Width = 121
    Height = 22
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtFim: TEdit
    Left = 144
    Top = 32
    Width = 121
    Height = 22
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 192
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Executar '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object qryExcluir: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from pedidos'
      'where DATA between :pIni and :pFim')
    Left = 40
    Top = 48
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
      end>
  end
end
