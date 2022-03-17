program P_Juego;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {Juego},
  UCNave in 'UCNave.pas',
  UCEnemigo in 'UCEnemigo.pas',
  UCBala in 'UCBala.pas';

{Juego}
{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TJuego, Juego);
  Application.Run;
end.
