object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object Conection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Usuario\Desktop\Universidad\Database\STUDENTS.' +
        'FDB'
      'Server=localhost'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    Left = 184
    Top = 88
  end
end
