object frmOUTExportacaoPedido: TfrmOUTExportacaoPedido
  Left = 121
  Top = 47
  Width = 843
  Height = 646
  BorderIcons = [biSystemMenu]
  Caption = 'Exporta'#231#227'o / Importa'#231#227'o de Pedidos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 275
    Width = 835
    Height = 334
    Align = alTop
    Caption = 'Importa'#231#227'o de Dados'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 53
      Width = 134
      Height = 14
      Caption = 'C'#243'digo dos pedidos criados'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object BitBtn3: TBitBtn
      Left = 16
      Top = 300
      Width = 145
      Height = 25
      Caption = 'Realizar Importa'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn3Click
    end
    object Edit2: TEdit
      Left = 15
      Top = 26
      Width = 338
      Height = 20
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object BitBtn4: TBitBtn
      Left = 360
      Top = 24
      Width = 114
      Height = 25
      Caption = 'Selecionar Arquivo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn4Click
    end
    object Memo1: TMemo
      Left = 16
      Top = 71
      Width = 801
      Height = 222
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 835
    Height = 275
    Align = alTop
    Caption = 'Exporta'#231#227'o de Dados'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 23
      Width = 181
      Height = 14
      Caption = 'Exportar pedidos cadastrados no dia:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 162
      Top = 246
      Width = 125
      Height = 14
      Caption = 'Nome do Arquivo Gerado:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 319
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 50
      Width = 809
      Height = 185
      DataSource = DataSource1
      TabOrder = 2
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clRed
      TitleFont.Height = -16
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'CODPEDIDO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Pedido'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZAO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Cliente'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 227
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORRAZAO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Fornecedor'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 217
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTREGA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Dt. Entrega'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_FRETE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Tipo Frete'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRAZO_PGTO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Forma Pgto.'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BONIFICACAO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Bonifica'#231#227'o?'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Visible = True
        end>
    end
    object BitBtn2: TBitBtn
      Left = 8
      Top = 241
      Width = 145
      Height = 25
      Caption = 'Realizar Exporta'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object edtNomeArq: TEdit
      Left = 290
      Top = 243
      Width = 329
      Height = 20
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edit1: TMaskEdit
      Left = 192
      Top = 19
      Width = 119
      Height = 22
      Ctl3D = False
      EditMask = '!99/99/0000;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
      OnKeyDown = Edit1KeyDown
    end
  end
  object qryPedidos: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select pedidos.*, clientes.codigo, clientes.razao, fornecedores.' +
        'forrazao, fornecedores.codigo from pedidos'
      'join clientes on clientes.codigo = pedidos.codcliente'
      'join fornecedores on fornecedores.codigo = pedidos.codfornecedor'
      'where pedidos.DATA = :pdata')
    Left = 1136
    Top = 672
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pdata'
        ParamType = ptUnknown
      end>
    object qryPedidosCODPEDIDO: TIBStringField
      FieldName = 'CODPEDIDO'
      Origin = 'PEDIDOS.CODPEDIDO'
      Required = True
      Size = 15
    end
    object qryPedidosCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'PEDIDOS.CODCLIENTE'
      Required = True
    end
    object qryPedidosCODVENDEDOR: TIBStringField
      FieldName = 'CODVENDEDOR'
      Origin = 'PEDIDOS.CODVENDEDOR'
      Required = True
      Size = 10
    end
    object qryPedidosCODFORNECEDOR: TIBStringField
      FieldName = 'CODFORNECEDOR'
      Origin = 'PEDIDOS.CODFORNECEDOR'
      Required = True
      Size = 15
    end
    object qryPedidosCODTRANS: TIBStringField
      FieldName = 'CODTRANS'
      Origin = 'PEDIDOS.CODTRANS'
      Required = True
    end
    object qryPedidosTIPO_FRETE: TIBStringField
      FieldName = 'TIPO_FRETE'
      Origin = 'PEDIDOS.TIPO_FRETE'
      Required = True
      Size = 3
    end
    object qryPedidosPRAZO_PGTO: TIntegerField
      FieldName = 'PRAZO_PGTO'
      Origin = 'PEDIDOS.PRAZO_PGTO'
      Required = True
    end
    object qryPedidosENTREGA: TDateTimeField
      FieldName = 'ENTREGA'
      Origin = 'PEDIDOS.ENTREGA'
      Required = True
    end
    object qryPedidosDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'PEDIDOS.DATA'
      Required = True
    end
    object qryPedidosORDEM_DE_COMPRA: TIBStringField
      FieldName = 'ORDEM_DE_COMPRA'
      Origin = 'PEDIDOS.ORDEM_DE_COMPRA'
      Size = 15
    end
    object qryPedidosBONIFICACAO: TIBStringField
      FieldName = 'BONIFICACAO'
      Origin = 'PEDIDOS.BONIFICACAO'
      Required = True
      Size = 10
    end
    object qryPedidosOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'PEDIDOS.OBS'
      Size = 80
    end
    object qryPedidosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CLIENTES.CODIGO'
      Required = True
    end
    object qryPedidosRAZAO: TIBStringField
      FieldName = 'RAZAO'
      Origin = 'CLIENTES.RAZAO'
      Required = True
      Size = 70
    end
    object qryPedidosFORRAZAO: TIBStringField
      FieldName = 'FORRAZAO'
      Origin = 'FORNECEDORES.FORRAZAO'
      Size = 80
    end
    object qryPedidosCODIGO1: TIntegerField
      FieldName = 'CODIGO1'
      Origin = 'FORNECEDORES.CODIGO'
    end
  end
  object DataSource1: TDataSource
    DataSet = qryPedidos
    Left = 1200
    Top = 736
  end
  object qryItens: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from itens'
      'where CODPEDIDO = :pCod')
    Left = 1248
    Top = 672
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pCod'
        ParamType = ptUnknown
      end>
    object qryItensCODPEDIDO: TIBStringField
      FieldName = 'CODPEDIDO'
      Origin = 'ITENS.CODPEDIDO'
      Required = True
      Size = 10
    end
    object qryItensCODPRODUTO: TIBStringField
      FieldName = 'CODPRODUTO'
      Origin = 'ITENS.CODPRODUTO'
      Required = True
      Size = 10
    end
    object qryItensQTDE: TFloatField
      FieldName = 'QTDE'
      Origin = 'ITENS.QTDE'
      Required = True
    end
    object qryItensVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'ITENS.VALOR'
      Required = True
    end
    object qryItensDESCONTO1: TFloatField
      FieldName = 'DESCONTO1'
      Origin = 'ITENS.DESCONTO1'
      Required = True
    end
    object qryItensGRADE: TIntegerField
      FieldName = 'GRADE'
      Origin = 'ITENS.GRADE'
      Required = True
    end
    object qryItensDESCONTO2: TFloatField
      FieldName = 'DESCONTO2'
      Origin = 'ITENS.DESCONTO2'
      Required = True
    end
    object qryItensDESCONTO3: TFloatField
      FieldName = 'DESCONTO3'
      Origin = 'ITENS.DESCONTO3'
      Required = True
    end
    object qryItensESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      Origin = 'ITENS.ESTOQUE'
    end
  end
  object DIALOG: TOpenDialog
    Left = 1136
    Top = 728
  end
  object dtPedidos: TIBDataSet
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from pedidos'
      'where'
      '  CODPEDIDO = :OLD_CODPEDIDO')
    InsertSQL.Strings = (
      'insert into pedidos'
      
        '  (CODPEDIDO, CODCLIENTE, CODVENDEDOR, CODFORNECEDOR, CODTRANS, ' +
        'TIPO_FRETE, '
      '   PRAZO_PGTO, ENTREGA, DATA, ORDEM_DE_COMPRA, BONIFICACAO, OBS)'
      'values'
      
        '  (:CODPEDIDO, :CODCLIENTE, :CODVENDEDOR, :CODFORNECEDOR, :CODTR' +
        'ANS, :TIPO_FRETE, '
      
        '   :PRAZO_PGTO, :ENTREGA, :DATA, :ORDEM_DE_COMPRA, :BONIFICACAO,' +
        ' :OBS)')
    RefreshSQL.Strings = (
      'Select '
      '  CODPEDIDO,'
      '  CODCLIENTE,'
      '  CODVENDEDOR,'
      '  CODFORNECEDOR,'
      '  CODTRANS,'
      '  TIPO_FRETE,'
      '  PRAZO_PGTO,'
      '  ENTREGA,'
      '  DATA,'
      '  ORDEM_DE_COMPRA,'
      '  BONIFICACAO,'
      '  OBS'
      'from pedidos '
      'where'
      '  CODPEDIDO = :CODPEDIDO')
    SelectSQL.Strings = (
      'select * from pedidos')
    ModifySQL.Strings = (
      'update pedidos'
      'set'
      '  CODPEDIDO = :CODPEDIDO,'
      '  CODCLIENTE = :CODCLIENTE,'
      '  CODVENDEDOR = :CODVENDEDOR,'
      '  CODFORNECEDOR = :CODFORNECEDOR,'
      '  CODTRANS = :CODTRANS,'
      '  TIPO_FRETE = :TIPO_FRETE,'
      '  PRAZO_PGTO = :PRAZO_PGTO,'
      '  ENTREGA = :ENTREGA,'
      '  DATA = :DATA,'
      '  ORDEM_DE_COMPRA = :ORDEM_DE_COMPRA,'
      '  BONIFICACAO = :BONIFICACAO,'
      '  OBS = :OBS'
      'where'
      '  CODPEDIDO = :OLD_CODPEDIDO')
    Left = 1192
    Top = 600
    object dtPedidosCODPEDIDO: TIBStringField
      FieldName = 'CODPEDIDO'
      Origin = 'PEDIDOS.CODPEDIDO'
      Required = True
      Size = 15
    end
    object dtPedidosCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'PEDIDOS.CODCLIENTE'
      Required = True
    end
    object dtPedidosCODVENDEDOR: TIBStringField
      FieldName = 'CODVENDEDOR'
      Origin = 'PEDIDOS.CODVENDEDOR'
      Required = True
      Size = 10
    end
    object dtPedidosCODFORNECEDOR: TIBStringField
      FieldName = 'CODFORNECEDOR'
      Origin = 'PEDIDOS.CODFORNECEDOR'
      Required = True
      Size = 15
    end
    object dtPedidosCODTRANS: TIBStringField
      FieldName = 'CODTRANS'
      Origin = 'PEDIDOS.CODTRANS'
      Required = True
    end
    object dtPedidosTIPO_FRETE: TIBStringField
      FieldName = 'TIPO_FRETE'
      Origin = 'PEDIDOS.TIPO_FRETE'
      Required = True
      Size = 3
    end
    object dtPedidosPRAZO_PGTO: TIntegerField
      FieldName = 'PRAZO_PGTO'
      Origin = 'PEDIDOS.PRAZO_PGTO'
      Required = True
    end
    object dtPedidosENTREGA: TDateTimeField
      FieldName = 'ENTREGA'
      Origin = 'PEDIDOS.ENTREGA'
      Required = True
    end
    object dtPedidosDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'PEDIDOS.DATA'
      Required = True
    end
    object dtPedidosORDEM_DE_COMPRA: TIBStringField
      FieldName = 'ORDEM_DE_COMPRA'
      Origin = 'PEDIDOS.ORDEM_DE_COMPRA'
      Size = 15
    end
    object dtPedidosBONIFICACAO: TIBStringField
      FieldName = 'BONIFICACAO'
      Origin = 'PEDIDOS.BONIFICACAO'
      Required = True
      Size = 10
    end
    object dtPedidosOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'PEDIDOS.OBS'
      Size = 80
    end
  end
  object dtItens: TIBDataSet
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from itens'
      'where'
      '  CODPEDIDO = :OLD_CODPEDIDO and'
      '  CODPRODUTO = :OLD_CODPRODUTO')
    InsertSQL.Strings = (
      'insert into itens'
      
        '  (CODPEDIDO, CODPRODUTO, QTDE, VALOR, DESCONTO1, GRADE, DESCONT' +
        'O2, DESCONTO3, '
      '   ESTOQUE)'
      'values'
      
        '  (:CODPEDIDO, :CODPRODUTO, :QTDE, :VALOR, :DESCONTO1, :GRADE, :' +
        'DESCONTO2, '
      '   :DESCONTO3, :ESTOQUE)')
    RefreshSQL.Strings = (
      'Select '
      '  CODPEDIDO,'
      '  CODPRODUTO,'
      '  QTDE,'
      '  VALOR,'
      '  DESCONTO1,'
      '  GRADE,'
      '  DESCONTO2,'
      '  DESCONTO3,'
      '  ESTOQUE'
      'from itens '
      'where'
      '  CODPEDIDO = :CODPEDIDO and'
      '  CODPRODUTO = :CODPRODUTO')
    SelectSQL.Strings = (
      'select * from itens')
    ModifySQL.Strings = (
      'update itens'
      'set'
      '  CODPEDIDO = :CODPEDIDO,'
      '  CODPRODUTO = :CODPRODUTO,'
      '  QTDE = :QTDE,'
      '  VALOR = :VALOR,'
      '  DESCONTO1 = :DESCONTO1,'
      '  GRADE = :GRADE,'
      '  DESCONTO2 = :DESCONTO2,'
      '  DESCONTO3 = :DESCONTO3,'
      '  ESTOQUE = :ESTOQUE'
      'where'
      '  CODPEDIDO = :OLD_CODPEDIDO and'
      '  CODPRODUTO = :OLD_CODPRODUTO')
    Left = 1128
    Top = 600
    object dtItensCODPEDIDO: TIBStringField
      FieldName = 'CODPEDIDO'
      Origin = 'ITENS.CODPEDIDO'
      Required = True
      Size = 10
    end
    object dtItensCODPRODUTO: TIBStringField
      FieldName = 'CODPRODUTO'
      Origin = 'ITENS.CODPRODUTO'
      Required = True
      Size = 10
    end
    object dtItensQTDE: TFloatField
      FieldName = 'QTDE'
      Origin = 'ITENS.QTDE'
      Required = True
    end
    object dtItensVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'ITENS.VALOR'
      Required = True
    end
    object dtItensDESCONTO1: TFloatField
      FieldName = 'DESCONTO1'
      Origin = 'ITENS.DESCONTO1'
      Required = True
    end
    object dtItensGRADE: TIntegerField
      FieldName = 'GRADE'
      Origin = 'ITENS.GRADE'
      Required = True
    end
    object dtItensDESCONTO2: TFloatField
      FieldName = 'DESCONTO2'
      Origin = 'ITENS.DESCONTO2'
      Required = True
    end
    object dtItensDESCONTO3: TFloatField
      FieldName = 'DESCONTO3'
      Origin = 'ITENS.DESCONTO3'
      Required = True
    end
    object dtItensESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      Origin = 'ITENS.ESTOQUE'
    end
  end
  object qryCodigo: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT count(CODPEDIDO) FROM Pedidos')
    Left = 1192
    Top = 672
    object qryCodigoCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object qryProduto: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    Left = 1304
    Top = 672
    object qryProdutoPROCODIGO: TIBStringField
      FieldName = 'PROCODIGO'
      Origin = 'PRODUTOS.PROCODIGO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryProdutoPRODESCRICAO: TIBStringField
      FieldName = 'PRODESCRICAO'
      Origin = 'PRODUTOS.PRODESCRICAO'
      Required = True
      FixedChar = True
      Size = 50
    end
    object qryProdutoPROFORNECEDOR: TIBStringField
      FieldName = 'PROFORNECEDOR'
      Origin = 'PRODUTOS.PROFORNECEDOR'
      Required = True
      Size = 15
    end
    object qryProdutoPROUNIDADE: TIBStringField
      FieldName = 'PROUNIDADE'
      Origin = 'PRODUTOS.PROUNIDADE'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryProdutoPROGRADE: TIntegerField
      FieldName = 'PROGRADE'
      Origin = 'PRODUTOS.PROGRADE'
      Required = True
    end
    object qryProdutoCODBARRA: TIBStringField
      FieldName = 'CODBARRA'
      Origin = 'PRODUTOS.CODBARRA'
      Size = 40
    end
  end
end
