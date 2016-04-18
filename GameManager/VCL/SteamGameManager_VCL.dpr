program SteamGameManager_VCL;

uses
  Vcl.Forms,
  SGM.VCL.MainForm in 'SGM.VCL.MainForm.pas' {Form1},
  Steam.App.Manifests in '..\..\Source\Steam.App.Manifests.pas',
  Steam.Workshop.Manifests in '..\..\Source\Steam.Workshop.Manifests.pas',
  Steam.Config.Client in '..\..\Source\Steam.Config.Client.pas',
  Steam.Common in '..\..\Source\Steam.Common.pas',
  Steam.Config.Controller in '..\..\Source\Steam.Config.Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
