object Form1: TForm1
  Left = 238
  Top = 139
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Web Tools'
  ClientHeight = 347
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Agent1: TAgent
    Left = 12
    Top = 10
    Width = 32
    Height = 32
    OnClick = Agent1Click
    ControlData = {02020000A5020000A5020000}
  end
  object Panel1: TPanel
    Left = 8
    Top = 0
    Width = 153
    Height = 201
    TabOrder = 1
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 328
    Width = 584
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Memo1: TMemo
    Left = 8
    Top = 207
    Width = 289
    Height = 114
    ReadOnly = True
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 368
    Top = 0
    Width = 209
    Height = 137
    Caption = ' '#1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1087#1077#1088#1089#1086#1085#1072#1078' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Label1: TLabel
      Left = 14
      Top = 30
      Width = 10
      Height = 16
      Caption = 'X'
    end
    object Label2: TLabel
      Left = 14
      Top = 58
      Width = 11
      Height = 16
      Caption = 'Y'
    end
    object Button1: TButton
      Left = 16
      Top = 96
      Width = 177
      Height = 25
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 32
      Top = 25
      Width = 161
      Height = 24
      TabOrder = 1
      Text = '0'
    end
    object Edit2: TEdit
      Left = 32
      Top = 54
      Width = 161
      Height = 24
      TabOrder = 2
      Text = '0'
    end
  end
  object ListBox1: TListBox
    Left = 168
    Top = 0
    Width = 193
    Height = 201
    ItemHeight = 16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = ListBox1Click
  end
  object GroupBox2: TGroupBox
    Left = 304
    Top = 202
    Width = 273
    Height = 119
    Caption = ' '#1054#1087#1086#1074#1077#1097#1077#1085#1080#1077' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object Button3: TButton
      Left = 16
      Top = 72
      Width = 113
      Height = 25
      Caption = #1055#1086#1076#1091#1084#1072#1090#1100
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button2: TButton
      Left = 144
      Top = 72
      Width = 113
      Height = 25
      Caption = #1057#1082#1072#1079#1072#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit3: TEdit
      Left = 16
      Top = 38
      Width = 241
      Height = 24
      TabOrder = 2
    end
  end
  object Button4: TButton
    Left = 368
    Top = 144
    Width = 209
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 368
    Top = 176
    Width = 209
    Height = 25
    Caption = #1057#1082#1088#1099#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 217
    Top = 10
    Width = 33
    Height = 31
    Caption = #1055#1056
    TabOrder = 9
    Visible = False
    OnClick = Button6Click
  end
  object Memo2: TMemo
    Left = 608
    Top = 10
    Width = 967
    Height = 306
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 10
  end
  object MainMenu1: TMainMenu
    Left = 144
    Top = 8
    object A1: TMenuItem
      Caption = #1060#1072#1081#1083
      object New: TMenuItem
        Caption = #1053#1086#1074#1099#1081
        OnClick = NewClick
      end
      object Save: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082
        ShortCut = 16467
        OnClick = SaveClick
      end
      object Exit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = ExitClick
      end
    end
    object N5: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object zap: TMenuItem
        Caption = #1047#1072#1087#1080#1089#1100
        ShortCut = 120
        OnClick = zapClick
      end
      object pause: TMenuItem
        Caption = #1055#1072#1091#1079#1072
        ShortCut = 114
        OnClick = pauseClick
      end
      object priview: TMenuItem
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088
        ShortCut = 123
        OnClick = priviewClick
      end
    end
    object N10: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N11: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072
        ShortCut = 112
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N12Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    FileName = 'Script.html'
    Filter = '*.html|*.html'
    Left = 208
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 240
    Top = 8
    object N1: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1082#1088#1099#1090#1100
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1047#1072#1087#1080#1089#1100
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1055#1072#1091#1079#1072
      OnClick = N4Click
    end
  end
end
