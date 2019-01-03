program RapentoProject;

uses
  System.StartUpCopy,
  FMX.Forms,
  Rapento in 'Rapento.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
