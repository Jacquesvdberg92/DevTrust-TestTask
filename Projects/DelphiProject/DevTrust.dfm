object frmContactManager: TfrmContactManager
  Left = 0
  Top = 0
  Hint = 'Deletes teh selected record'
  AutoSize = True
  Caption = 'Contact Manager'
  ClientHeight = 326
  ClientWidth = 621
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
  Menu = mnuMainMenu
  OnCreate = FormCreate
  TextHeight = 15
  object sgContactDisplay: TStringGrid
    Left = 10
    Top = 92
    Width = 601
    Height = 193
    TabOrder = 0
    OnSelectCell = sgContactDisplaySelectCell
    ColWidths = (
      64
      64
      64
      64
      225)
  end
  object btnAdd: TButton
    Left = 536
    Top = 291
    Width = 75
    Height = 25
    Hint = 'Adds a new entry'
    Caption = 'Add'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 455
    Top = 291
    Width = 75
    Height = 25
    Hint = 'Deletes the selected record'
    Caption = 'Delete'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnDeleteClick
  end
  object gbFilters: TGroupBox
    Left = 10
    Top = 10
    Width = 601
    Height = 65
    Caption = 'Filter'
    TabOrder = 3
    object lblName: TLabel
      Left = 17
      Top = 11
      Width = 32
      Height = 15
      Caption = 'Name'
    end
    object lblLastName: TLabel
      Left = 152
      Top = 11
      Width = 56
      Height = 15
      Caption = 'Last Name'
    end
    object lblCity: TLabel
      Left = 288
      Top = 11
      Width = 21
      Height = 15
      Caption = 'City'
    end
    object edtName: TEdit
      Left = 17
      Top = 32
      Width = 121
      Height = 23
      Hint = 'Name to filer by. Does not have to be exact match'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object edtLastName: TEdit
      Left = 152
      Top = 32
      Width = 121
      Height = 23
      Hint = 'Last Name to filter by. Does not have to be exact match'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object edtCity: TEdit
      Left = 288
      Top = 32
      Width = 121
      Height = 23
      Hint = 'City to filter by. Does not have to be exact match'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object btnFilter: TButton
      Left = 424
      Top = 31
      Width = 163
      Height = 25
      Hint = 'Click to filter Contacts'
      Caption = 'Filter'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnFilterClick
    end
  end
  object sdSaveDialogForSaveButton: TSaveDialog
    Left = 355
    Top = 280
  end
  object odOpenDialogForLoadFileButton: TOpenDialog
    Left = 387
    Top = 280
  end
  object mnuMainMenu: TMainMenu
    Left = 419
    Top = 280
    object mmFile: TMenuItem
      Caption = 'File'
      object mnuFetchContacts: TMenuItem
        Caption = 'Fetch All Contacts'
        Hint = 'Gets all contacts from the API'
        OnClick = mnuFetchContactsClick
      end
      object mnuPushAPIContacts: TMenuItem
        Caption = 'Push All Contacts'
        Hint = 'Saves all contacts to the API'
        OnClick = mnuPushAPIContactsClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuLoadFile: TMenuItem
        Caption = 'Load File'
        Hint = 'Loads a CSV file'
        OnClick = mnuLoadFileClick
      end
      object mnuExport: TMenuItem
        Caption = 'Export CSV'
        Hint = 'Exports a CSV file'
        OnClick = mnuExportClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuExit: TMenuItem
        Caption = 'Exit'
        Hint = 'Closes the application'
        OnClick = mnuExitClick
      end
    end
  end
end
