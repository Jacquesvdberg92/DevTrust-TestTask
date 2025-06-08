object frmAddContact: TfrmAddContact
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Add Contact'
  ClientHeight = 165
  ClientWidth = 237
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Padding.Left = 10
  Padding.Top = 10
  Padding.Right = 10
  Padding.Bottom = 10
  OnCreate = FormCreate
  TextHeight = 15
  object lblFirstName: TLabel
    Left = 10
    Top = 13
    Width = 57
    Height = 15
    Caption = 'First Name'
  end
  object lblLastName: TLabel
    Left = 10
    Top = 43
    Width = 56
    Height = 15
    Caption = 'Last Name'
  end
  object lblCity: TLabel
    Left = 10
    Top = 72
    Width = 21
    Height = 15
    Caption = 'City'
  end
  object lblAddressLine: TLabel
    Left = 13
    Top = 101
    Width = 67
    Height = 15
    Caption = 'Address Line'
  end
  object edtFirstName: TEdit
    Left = 106
    Top = 10
    Width = 121
    Height = 23
    Hint = 'Enter First Name Please'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object edtLastName: TEdit
    Left = 106
    Top = 40
    Width = 121
    Height = 23
    Hint = 'Enter Last Name Please'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object edtCity: TEdit
    Left = 106
    Top = 69
    Width = 121
    Height = 23
    Hint = 'Enter City name please'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object edtAddressLine: TEdit
    Left = 106
    Top = 98
    Width = 121
    Height = 23
    Hint = 'Enter Address please'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 13
    Top = 130
    Width = 75
    Height = 25
    Hint = 'Cancels without saving, and closes window'
    Caption = 'Cancel'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object btnOk: TButton
    Left = 152
    Top = 130
    Width = 75
    Height = 25
    Hint = 'Saves data, and close window'
    Caption = 'OK'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnOkClick
  end
end
