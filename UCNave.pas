unit UCNave;

interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,JPEG,
  Vcl.StdCtrls,Vcl.MPlayer, Vcl.ComCtrls, System.ImageList;
  
    type
    
    Heroe = class
    
      Private


      Public
      x,y:integer;
      Vidas:integer;
      Heroe_skin:TPNGImage;
      Procedure loadimages;
      Procedure daño;
      Procedure Explotar;

    end;

implementation

{ Heroe }

procedure Heroe.daño;
begin
  Vidas:=vidas-1;
end;

procedure Heroe.Explotar;
begin
  Heroe_skin.LoadFromFile('Mobs/Bum.png');
end;

procedure Heroe.LoadImages;
begin
  vidas:=3;
  Heroe_skin:=TPNGImage.Create;
  Heroe_skin.LoadFromFile('Mobs/Heroe_T4.png');
end;


end.
