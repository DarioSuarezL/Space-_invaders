unit UCEnemigo;

interface

Uses
Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,JPEG,
  Vcl.StdCtrls,Vcl.MPlayer, Vcl.ComCtrls, System.ImageList;

  type

  Enemigo = class

    Private

    Public
    vida:boolean;
    X,Y:Integer;
    Enemigo_Tipo:TPNGImage;
    Procedure LoadImageT3;
    Procedure LoadImageT2;
    Procedure LoadImageT1;
    Procedure Muerte;

  end;
implementation

{ Enemigos }

procedure Enemigo.LoadImageT1;
begin
  Enemigo_Tipo:=TpngImage.Create;
  Enemigo_tipo.LoadFromFile('Mobs/Enemigo_T1.png');
  vida:=true;
  x:=0; y:=0;
end;

procedure Enemigo.LoadImageT2;
begin
  Enemigo_Tipo:=TpngImage.Create;
  Enemigo_tipo.LoadFromFile('Mobs/Enemigo_T2.png');
  vida:=true;
  x:=0; y:=0;
end;

procedure Enemigo.LoadImageT3;
begin
  Enemigo_Tipo:=TpngImage.Create;
  Enemigo_tipo.LoadFromFile('Mobs/Enemigo_T3.png');
  vida:=true;
  x:=0; y:=0;
end;

procedure Enemigo.Muerte;
begin
  vida:=false;
end;

end.
