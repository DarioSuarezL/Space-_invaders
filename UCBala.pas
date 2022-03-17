unit UCBala;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,JPEG,
  Vcl.StdCtrls,Vcl.MPlayer, Vcl.ComCtrls, System.ImageList;

  Type


  Bala = class
    Private

    Public
      b:boolean;
      X,Y:integer;
      Bala_image:TPNGImage;
      Procedure loadimage;
      Procedure loadimage_enemigo;

  end;

implementation

{ Bala }


procedure Bala.loadimage;
begin
  Bala_image:=TPNGImage.Create;
  Bala_image.LoadFromFile('Mobs/shot_heroe2.png');
end;

procedure Bala.loadimage_enemigo;
begin
  Bala_image:=TPNGImage.Create;
  Bala_image.LoadFromFile('Mobs/shot_enemigo.png');
end;

end.
