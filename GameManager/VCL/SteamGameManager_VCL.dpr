program SteamGameManager_VCL;

uses
  Vcl.Forms,
  SGM.VCL.MainForm in 'SGM.VCL.MainForm.pas' {Form1},
  Steam.App.Manifests in '..\..\Source\Steam.App.Manifests.pas',
  Steam.Workshop.Manifests in '..\..\Source\Steam.Workshop.Manifests.pas',
  Steam.Config.Client in '..\..\Source\Steam.Config.Client.pas',
  Steam.Common in '..\..\Source\Steam.Common.pas',
  Steam.Config.BigPicture in '..\..\Source\Steam.Config.BigPicture.pas',
  Steam.App.Manifests.Intf in '..\..\Source\Steam.App.Manifests.Intf.pas',
  Steam.Common.Intf in '..\..\Source\Steam.Common.Intf.pas',
  Steam.Config.Client.Intf in '..\..\Source\Steam.Config.Client.Intf.pas',
  Steam.Config.BigPicture.Intf in '..\..\Source\Steam.Config.BigPicture.Intf.pas',
  Steam.Workshop.Manifests.Intf in '..\..\Source\Steam.Workshop.Manifests.Intf.pas',
  Steam.Api.Common in '..\..\Source\Steam.Api.Common.pas',
  Steam.Api.Common.Intf in '..\..\Source\Steam.Api.Common.Intf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
