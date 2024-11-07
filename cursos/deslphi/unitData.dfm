object DM: TDM
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=127.0.0.1'
      'Database=agenda'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 104
    Top = 112
  end
  object FDTable1: TFDTable
    Connection = FDConnection1
    Left = 192
    Top = 96
  end
  object DataSource1: TDataSource
    Left = 296
    Top = 80
  end
end
