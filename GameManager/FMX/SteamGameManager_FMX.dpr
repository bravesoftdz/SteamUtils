program SteamGameManager_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  SGM.FMX.MainForm in 'SGM.FMX.MainForm.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
