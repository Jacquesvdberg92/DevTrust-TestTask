program ContactManager;

uses
  Vcl.Forms,
  DevTrust in 'DevTrust.pas' {frmContactManager},
  AddContactForm in 'AddContactForm.pas' {frmAddContact};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmContactManager, frmContactManager);
  Application.CreateForm(TfrmAddContact, frmAddContact);
  Application.Run;
end.
