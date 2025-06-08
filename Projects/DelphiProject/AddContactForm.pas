unit AddContactForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.RegularExpressions;

type
  TfrmAddContact = class(TForm)
    lblFirstName: TLabel;
    lblLastName: TLabel;
    lblCity: TLabel;
    lblAddressLine: TLabel;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtCity: TEdit;
    edtAddressLine: TEdit;
    btnCancel: TButton;
    btnOk: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddContact: TfrmAddContact;

implementation

{$R *.dfm}


procedure TfrmAddContact.FormCreate(Sender: TObject);
begin
  Self.Caption := 'Add New Contact';

  // btnOk should not close the form automatically
  btnOk.ModalResult := mrNone;

  // Ensure buttons close the modal
  btnCancel.ModalResult := mrCancel;
end;

procedure TfrmAddContact.btnOkClick(Sender: TObject);
var
  NameRegex: TRegEx;
begin
  NameRegex := TRegEx.Create('\d');

  if Trim(edtFirstName.Text) = '' then
  begin
    MessageDlg('First Name cannot be empty.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if NameRegex.IsMatch(edtFirstName.Text) then
  begin
    MessageDlg('First Name cannot contain numbers.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if Trim(edtLastName.Text) = '' then
  begin
    MessageDlg('Last Name cannot be empty.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if NameRegex.IsMatch(edtLastName.Text) then
  begin
    MessageDlg('Last Name cannot contain numbers.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if Trim(edtCity.Text) = '' then
  begin
    MessageDlg('City cannot be empty.', mtWarning, [mbOK], 0);
    Exit;
  end;

  // Removed Address Line check to make it optional

  // All validations passed
  ModalResult := mrOk;
end;


end.
