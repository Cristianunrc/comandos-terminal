program Project1;

uses
  Vcl.Forms,
  App_Command in 'App_Command.pas' {AppCommand},
  uDataModule in 'uDataModule.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAppCommand, AppCommand);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
