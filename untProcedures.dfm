object frmSYSProcedures: TfrmSYSProcedures
  Left = 187
  Top = 105
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio das Functions e Procedures'
  ClientHeight = 212
  ClientWidth = 385
  Color = 10329599
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object QUERY: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    Left = 16
    Top = 8
  end
  object DATASET: TIBDataSet
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ANOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into ANOS'
      '  (CODIGO, ANO)'
      'values'
      '  (:CODIGO, :ANO)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  ANO'
      'from ANOS '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'SELECT * FROM ANOS')
    ModifySQL.Strings = (
      'update ANOS'
      'set'
      '  CODIGO = :CODIGO,'
      '  ANO = :ANO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 72
    Top = 8
  end
  object qryConfig: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from config')
    Left = 144
    Top = 8
  end
  object qryEMPRESA: TIBQuery
    Database = DM.BANCO
    Transaction = DM.TRANSACAO
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from empresa')
    Left = 26
    Top = 63
    object qryEMPRESANOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'EMPRESA.NOME'
      Size = 70
    end
    object qryEMPRESAENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'EMPRESA.ENDERECO'
      Size = 70
    end
    object qryEMPRESACIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'EMPRESA.CIDADE'
      Size = 25
    end
    object qryEMPRESAUF: TIBStringField
      FieldName = 'UF'
      Origin = 'EMPRESA.UF'
      Size = 2
    end
    object qryEMPRESACEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'EMPRESA.CEP'
      Size = 9
    end
    object qryEMPRESATELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'EMPRESA.TELEFONE'
      Size = 14
    end
    object qryEMPRESAFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'EMPRESA.FAX'
      Size = 14
    end
    object qryEMPRESAEMAIL: TIBStringField
      DisplayWidth = 100
      FieldName = 'EMAIL'
      Origin = 'EMPRESA.EMAIL'
      Size = 100
    end
  end
end
