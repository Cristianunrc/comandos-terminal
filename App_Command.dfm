object AppCommand: TAppCommand
  Left = 0
  Top = 0
  Caption = 'Gestor de comandos'
  ClientHeight = 539
  ClientWidth = 1124
  Color = clWhitesmoke
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  TextHeight = 21
  object Content: TCardPanel
    Left = 0
    Top = 0
    Width = 1124
    Height = 539
    Align = alClient
    ActiveCard = CardCreate
    BevelOuter = bvNone
    Caption = 'Content'
    TabOrder = 0
    object CardRegisterLogin: TCard
      Left = 0
      Top = 0
      Width = 1124
      Height = 539
      Caption = 'CardRegisterLogin'
      CardIndex = 0
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object PcRegisterLogin: TPageControl
        AlignWithMargins = True
        Left = 525
        Top = 100
        Width = 289
        Height = 401
        ActivePage = TsRegister
        TabOrder = 0
        object TsRegister: TTabSheet
          Caption = 'Registrarse'
          object LbRegUser: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 275
            Height = 21
            Align = alTop
            Alignment = taCenter
            Caption = 'Usuario'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 59
          end
          object LbRegEmail: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 65
            Width = 275
            Height = 21
            Align = alTop
            Alignment = taCenter
            Caption = 'Email'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 43
          end
          object LbRegPassword: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 127
            Width = 275
            Height = 21
            Align = alTop
            Alignment = taCenter
            Caption = 'Contrase'#241'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 86
          end
          object LbRegConfPassword: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 189
            Width = 275
            Height = 21
            Align = alTop
            Alignment = taCenter
            Caption = 'Confirmar contrase'#241'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 165
          end
          object SbRegister: TSpeedButton
            AlignWithMargins = True
            Left = 3
            Top = 328
            Width = 275
            Height = 34
            Cursor = crHandPoint
            Align = alBottom
            Caption = 'Registrarse'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            OnClick = SbRegisterClick
            ExplicitTop = 304
          end
          object EdRegName: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 30
            Width = 275
            Height = 29
            Align = alTop
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object EdRegPassword: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 154
            Width = 275
            Height = 29
            Align = alTop
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 1
          end
          object EdRegEmail: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 92
            Width = 275
            Height = 29
            Align = alTop
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object EdRegConfPassword: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 216
            Width = 275
            Height = 29
            Align = alTop
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 3
          end
        end
        object TsLogin: TTabSheet
          Caption = 'Iniciar Sesi'#243'n'
          ImageIndex = 1
          object LbLoginPassword: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 65
            Width = 86
            Height = 21
            Align = alTop
            Alignment = taCenter
            Caption = 'Contrase'#241'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SbLogin: TSpeedButton
            AlignWithMargins = True
            Left = 3
            Top = 328
            Width = 275
            Height = 34
            Cursor = crHandPoint
            Align = alBottom
            Caption = 'Iniciar Sesi'#243'n'
            OnClick = SbLoginClick
            ExplicitTop = 304
          end
          object LbLoginUser: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 59
            Height = 21
            Align = alTop
            Alignment = taCenter
            Caption = 'Usuario'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdLoginPassword: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 92
            Width = 275
            Height = 29
            Align = alTop
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 0
          end
          object EdLoginName: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 30
            Width = 275
            Height = 29
            Align = alTop
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
    object CardCommand: TCard
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 1118
      Height = 533
      Caption = 'CardCommand'
      CardIndex = 1
      TabOrder = 1
      object LbTitleCategory: TLabel
        AlignWithMargins = True
        Left = 50
        Top = 50
        Width = 67
        Height = 21
        Alignment = taCenter
        Caption = 'Categor'#237'a'
      end
      object LbTitleSubCategory: TLabel
        AlignWithMargins = True
        Left = 350
        Top = 50
        Width = 91
        Height = 21
        Alignment = taCenter
        Caption = 'Subcategor'#237'a'
      end
      object BtnAddCommand: TButton
        Left = 850
        Top = 50
        Width = 139
        Height = 33
        Cursor = crHandPoint
        Caption = 'Crear comando'
        TabOrder = 0
        OnClick = BtnAddCommandClick
      end
      object EdSearchCategory: TEdit
        Left = 140
        Top = 50
        Width = 160
        Height = 29
        TabOrder = 1
      end
      object EdSearchSubCategory: TEdit
        Left = 460
        Top = 50
        Width = 160
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object BtnListCommand: TButton
        Left = 680
        Top = 50
        Width = 81
        Height = 33
        Cursor = crHandPoint
        Caption = 'Buscar'
        TabOrder = 3
        OnClick = BtnListCommandClick
      end
      object BtnLogout: TButton
        Left = 1075
        Top = 50
        Width = 105
        Height = 34
        Cursor = crHandPoint
        Caption = 'Salir'
        TabOrder = 4
        OnClick = BtnLogoutClick
      end
      object SbPanelContainer: TScrollBox
        AlignWithMargins = True
        Left = 3
        Top = 110
        Width = 1330
        Height = 560
        TabOrder = 5
      end
    end
    object CardCreate: TCard
      Left = 0
      Top = 0
      Width = 1124
      Height = 539
      Caption = 'CardCreate'
      CardIndex = 2
      TabOrder = 2
      object PCreate: TPanel
        Left = 525
        Top = 100
        Width = 267
        Height = 332
        Color = clGradientActiveCaption
        ParentBackground = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        object LbCreateSubCat: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 66
          Width = 259
          Height = 21
          Align = alTop
          Alignment = taCenter
          Caption = 'Subcategor'#237'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 101
        end
        object LbCreateCat: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 259
          Height = 21
          Align = alTop
          Alignment = taCenter
          Caption = 'Categor'#237'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 74
        end
        object LbCreateCommand: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 128
          Width = 259
          Height = 21
          Align = alTop
          Alignment = taCenter
          Caption = 'Comando'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 74
        end
        object LbCreateDesc: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 190
          Width = 259
          Height = 21
          Align = alTop
          Alignment = taCenter
          Caption = 'Descripci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 90
        end
        object SbCreate: TSpeedButton
          AlignWithMargins = True
          Left = 4
          Top = 298
          Width = 259
          Height = 30
          Cursor = crHandPoint
          Align = alBottom
          Caption = 'Crear'
          OnClick = SbCreateClick
          ExplicitTop = 296
        end
        object EdCategory: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 31
          Width = 259
          Height = 29
          Align = alTop
          Alignment = taCenter
          TabOrder = 0
        end
        object EdSubCategory: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 93
          Width = 259
          Height = 29
          Align = alTop
          Alignment = taCenter
          TabOrder = 1
        end
        object EdCommand: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 155
          Width = 259
          Height = 29
          Align = alTop
          Alignment = taCenter
          TabOrder = 2
        end
        object EdDescription: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 217
          Width = 259
          Height = 29
          Align = alTop
          Alignment = taCenter
          TabOrder = 3
        end
      end
      object BtnBackCreate: TButton
        AlignWithMargins = True
        Left = 16
        Top = 16
        Width = 105
        Height = 34
        Cursor = crHandPoint
        Caption = 'Volver'
        TabOrder = 1
        OnClick = BtnBackCreateClick
      end
    end
    object CardUpdateDelete: TCard
      Left = 0
      Top = 0
      Width = 1124
      Height = 539
      Caption = 'CardUpdateDelete'
      CardIndex = 3
      TabOrder = 3
      object PUpdateDelete: TPanel
        Left = 525
        Top = 100
        Width = 267
        Height = 332
        Color = clGradientActiveCaption
        ParentBackground = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        object LbUpDelSubCat: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 66
          Width = 259
          Height = 21
          Align = alTop
          Alignment = taCenter
          Caption = 'Subcategor'#237'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 101
        end
        object LbUpDelCat: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 259
          Height = 21
          Align = alTop
          Alignment = taCenter
          Caption = 'Categor'#237'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 74
        end
        object LbUpDelCommand: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 128
          Width = 259
          Height = 21
          Align = alTop
          Alignment = taCenter
          Caption = 'Comando'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 74
        end
        object LbUpDelDesc: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 190
          Width = 259
          Height = 21
          Align = alTop
          Alignment = taCenter
          Caption = 'Descripci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 90
        end
        object SbDelete: TSpeedButton
          AlignWithMargins = True
          Left = 4
          Top = 298
          Width = 259
          Height = 30
          Cursor = crHandPoint
          Align = alBottom
          Caption = 'Borrar'
          OnClick = SbDeleteClick
          ExplicitLeft = -140
        end
        object SbUpdate: TSpeedButton
          AlignWithMargins = True
          Left = 4
          Top = 262
          Width = 259
          Height = 30
          Cursor = crHandPoint
          Align = alBottom
          Caption = 'Actualizar'
          OnClick = SbUpdateClick
          ExplicitTop = 264
        end
        object EdCatUpDel: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 31
          Width = 259
          Height = 29
          Align = alTop
          Alignment = taCenter
          TabOrder = 0
        end
        object EdSubCatUpDel: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 93
          Width = 259
          Height = 29
          Align = alTop
          Alignment = taCenter
          TabOrder = 1
        end
        object EdCommandUpDel: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 155
          Width = 259
          Height = 29
          Align = alTop
          Alignment = taCenter
          TabOrder = 2
        end
        object EdDescUpDel: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 217
          Width = 259
          Height = 29
          Align = alTop
          Alignment = taCenter
          TabOrder = 3
        end
      end
      object BtnBackUpDel: TButton
        AlignWithMargins = True
        Left = 16
        Top = 16
        Width = 105
        Height = 34
        Cursor = crHandPoint
        Caption = 'Volver'
        TabOrder = 1
        OnClick = BtnBackCreateClick
      end
    end
  end
  object Query: TFDQuery
    Connection = DataModule1.Conection
    Left = 1016
    Top = 488
  end
end
