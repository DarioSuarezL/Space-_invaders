unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,JPEG, UCNave, UCBala, UCEnemigo,
  Vcl.MPlayer, Vcl.StdCtrls;
  const
  MaxE=100;

type
  TJuego = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    MediaPlayer1: TMediaPlayer;
    MediaPlayer2: TMediaPlayer;
    Timer3: TTimer;
    Timer4: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MediaPlayer3: TMediaPlayer;
    MediaPlayer4: TMediaPlayer;
    Label4: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
  private
    { Private declarations }
    der,izq,arb,abj,esp:boolean;   //controles booleanos
   { X,Y,dx,dy,}ex,ey,cb,cbe,ran,flag,Cev,pts:integer; //direcciones

  public
    { Public declarations }
    Fondo:TJPEGImage;
    corazones:Array[1..3] of TPNGImage;
    //clases
    H:Heroe;
    B:Array[1..7] of Bala;
    E:Array [1..30] of Enemigo;
    BE:Array[1..30] of Bala;
  end;

var
  Juego: TJuego;
  k:integer;

implementation

{$R *.dfm}

procedure TJuego.FormCreate(Sender: TObject);
var de,i,j,px,py:word;
begin
pts:=0;
//mediaplayer1.Play;
  for i := 1 to 3 do begin
    Corazones[i]:=TPNGImage.Create;
    Corazones[i].LoadFromFile('Mobs/vidas.png');
  end;
  k:=10;  j:=1; px:=0;  py:=0;
  //Clases
  H:=Heroe.Create;                  //
  H.loadimages;                     //Heroe

  Fondo:=TJPEGImage.Create;         //
  Fondo.LoadFromFile('Fondo.jpg');  //Fondo

  for j := 1 to 7 do begin          //
    B[j]:=Bala.Create;              // Arreglo de
    B[j].loadimage;                 //
    B[j].b:=false;                  // Balas
  end;                              //
 cb:=0;

  for de := 1 to 30 do begin
    BE[de]:=Bala.Create;
    BE[de].loadimage_enemigo;
    BE[de].b:=false;
  end;


 for i := 1 to 10 do begin
   E[i]:=Enemigo.Create;
   E[i].loadimageT1;
   E[i].X:=E[i].X+px;
   Px:=px+100;
   E[i].Y:=py;
 end;
    px:=0;
    py:=70;
 for i := 11 to 20 do begin
   E[i]:=Enemigo.Create;
   E[i].loadimageT2;
   E[i].X:=E[i].X+px;
   E[i].Y:=py;
   Px:=px+100;
 end;
   Px:=0;
   py:=140;
 for i := 21 to 30 do begin
   E[i]:=Enemigo.Create;
   E[i].loadimageT3;
   E[i].X:=E[i].X+px;
   E[i].Y:=py;
   Px:=px+100;
 end;
 Cev:=30;
  //Inicializando heroe
  H.x:= (Screen.Width-H.Heroe_skin.Width) div 2;
  H.y:= (Screen.Height-H.Heroe_skin.Height);

end;

procedure TJuego.FormDblClick(Sender: TObject);
begin
application.Terminate;
end;

procedure TJuego.FormKeyDown(Sender: TObject;
  var Key: Word;
  Shift: TShiftState);
begin
  case key of
      37:Izq:=True;
      39:Der:=True;
      38:Arb:=True;
      40:Abj:=True;
      32: Begin
            cb:=cb+1;
            if cb=8 then cb:=1;

            mediaplayer2.Play;

            case cb of

              1:begin
              B[1].X:=H.x+(H.Heroe_skin.Width-B[1].Bala_image.Width)div 2;
              B[1].Y:=H.y-B[1].Bala_image.Height;
              B[1].b:=true;
              end;
              2: begin
              B[2].X:=H.x+(H.Heroe_skin.Width-B[2].Bala_image.Width)div 2;
              B[2].Y:=H.y-B[2].Bala_image.Height;
              B[2].b:=true;
              end;
              3: begin
              B[3].X:=H.x+(H.Heroe_skin.Width-B[3].Bala_image.Width)div 2;
              B[3].Y:=H.y-B[3].Bala_image.Height;
              B[3].b:=true;
              end;
              4: begin
              B[4].X:=H.x+(H.Heroe_skin.Width-B[4].Bala_image.Width)div 2;
              B[4].Y:=H.y-B[4].Bala_image.Height;
              B[4].b:=true;
              end;
              5: begin
              B[5].X:=H.x+(H.Heroe_skin.Width-B[5].Bala_image.Width)div 2;
              B[5].Y:=H.y-B[5].Bala_image.Height;
              B[5].b:=true;
              end;
              6: begin
              B[6].X:=H.x+(H.Heroe_skin.Width-B[6].Bala_image.Width)div 2;
              B[6].Y:=H.y-B[6].Bala_image.Height;
              B[6].b:=true;
              end;
              7: begin
              B[7].X:=H.x+(H.Heroe_skin.Width-B[7].Bala_image.Width)div 2;
              B[7].Y:=H.y-B[7].Bala_image.Height;
              B[7].b:=true;
              end;
            end;

          End;
  end;
end;

procedure TJuego.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
      37:Izq:=false;
      39:Der:=false;
      38:Arb:=false;
      40:Abj:=false;
      32:esp:=true;
  end;
end;

procedure TJuego.FormPaint(Sender: TObject);
var i,vx:word;
begin
canvas.StretchDraw(Rect(0,0,Screen.Width,Screen.Height),Fondo);
  canvas.Draw(H.x,H.y,H.Heroe_skin);

  if (b[1].b) then begin
   canvas.Draw(B[1].X,B[1].Y,B[1].bala_image);
  end;
  if (b[2].b) then begin
   canvas.Draw(B[2].X,B[2].Y,B[2].bala_image);
  end;
  if (b[3].b) then begin
   canvas.Draw(B[3].X,B[3].Y,B[3].bala_image);
  end;
  if (b[4].b) then begin
   canvas.Draw(B[4].X,B[4].Y,B[4].bala_image);
  end;
  if (b[5].b) then begin
   canvas.Draw(B[5].X,B[5].Y,B[5].bala_image);
  end;
  if (b[6].b) then begin
   canvas.Draw(B[6].X,B[6].Y,B[6].bala_image);
  end;
  if (b[7].b) then begin
   canvas.Draw(B[7].X,B[7].Y,B[7].bala_image);
  end;

    for i := 1 to 10 do begin
      if E[i].vida=true then begin
      canvas.Draw(E[i].x,E[i].y,E[i].Enemigo_Tipo);
      end;
    end;

    for i := 11 to 20 do begin
      if E[i].vida=true then begin
      canvas.Draw(E[i].x,E[i].y,E[i].Enemigo_Tipo);
      end;
    end;

    for i := 21 to 30 do begin
      if E[i].vida=true then begin
      canvas.Draw(E[i].x,E[i].y,E[i].Enemigo_Tipo);
      end;
    end;

  if be[1].b then begin
   canvas.Draw(BE[1].X,BE[1].Y,BE[1].bala_image);
  end;
  if be[2].b then begin
   canvas.Draw(BE[2].X,BE[2].Y,BE[2].bala_image);
  end;
  if be[3].b then begin
   canvas.Draw(BE[3].X,BE[3].Y,BE[3].bala_image);
  end;
  if be[4].b then begin
   canvas.Draw(BE[4].X,BE[4].Y,BE[4].bala_image);
  end;
  if be[5].b then begin
   canvas.Draw(BE[5].X,BE[5].Y,BE[5].bala_image);
  end;
  if be[6].b then begin
   canvas.Draw(BE[6].X,BE[6].Y,BE[6].bala_image);
  end;
  if be[7].b then begin
   canvas.Draw(BE[7].X,BE[7].Y,BE[7].bala_image);
  end;
  if be[8].b then begin
   canvas.Draw(BE[8].X,BE[8].Y,BE[8].bala_image);
  end;
  if be[9].b then begin
   canvas.Draw(BE[9].X,BE[9].Y,BE[9].bala_image);
  end;
  if be[10].b then begin
   canvas.Draw(BE[10].X,BE[10].Y,BE[10].bala_image);
  end;
  if be[11].b then begin
   canvas.Draw(BE[11].X,BE[11].Y,BE[11].bala_image);
  end;
  if be[12].b then begin
   canvas.Draw(BE[12].X,BE[12].Y,BE[12].bala_image);
  end;
  if be[13].b then begin
   canvas.Draw(BE[13].X,BE[13].Y,BE[13].bala_image);
  end;
  if be[14].b then begin
   canvas.Draw(BE[14].X,BE[14].Y,BE[14].bala_image);
  end;
  if be[15].b then begin
   canvas.Draw(BE[15].X,BE[15].Y,BE[15].bala_image);
  end;
  if be[16].b then begin
   canvas.Draw(BE[16].X,BE[16].Y,BE[16].bala_image);
  end;
  if be[17].b then begin
   canvas.Draw(BE[17].X,BE[17].Y,BE[17].bala_image);
  end;
  if be[18].b then begin
   canvas.Draw(BE[18].X,BE[18].Y,BE[18].bala_image);
  end;
  if be[19].b then begin
   canvas.Draw(BE[19].X,BE[19].Y,BE[19].bala_image);
  end;
  if be[20].b then begin
   canvas.Draw(BE[20].X,BE[20].Y,BE[20].bala_image);
  end;
  if be[21].b then begin
   canvas.Draw(BE[21].X,BE[21].Y,BE[21].bala_image);
  end;
  if be[22].b then begin
   canvas.Draw(BE[22].X,BE[22].Y,BE[22].bala_image);
  end;
  if be[23].b then begin
   canvas.Draw(BE[23].X,BE[23].Y,BE[23].bala_image);
  end;
  if be[24].b then begin
   canvas.Draw(BE[24].X,BE[24].Y,BE[24].bala_image);
  end;
  if be[25].b then begin
   canvas.Draw(BE[25].X,BE[25].Y,BE[25].bala_image);
  end;
  if be[26].b then begin
   canvas.Draw(BE[26].X,BE[26].Y,BE[26].bala_image);
  end;
  if be[27].b then begin
   canvas.Draw(BE[27].X,BE[27].Y,BE[27].bala_image);
  end;
  if be[28].b then begin
   canvas.Draw(BE[28].X,BE[28].Y,BE[28].bala_image);
  end;
  if be[29].b then begin
   canvas.Draw(BE[29].X,BE[29].Y,BE[29].bala_image);
  end;
  if be[30].b then begin
   canvas.Draw(BE[30].X,BE[30].Y,BE[30].bala_image);
  end;
vx:=0;
  for i := 1 to H.Vidas do begin
    canvas.Draw(0+vx,screen.Height-corazones[i].Height,Corazones[i]);
     vx:=vx+70;
  end;

end;

procedure TJuego.Timer1Timer(Sender: TObject);
var i:word;
begin


    if (Izq) and (H.x>1)then begin
      H.x:= H.x-10;
    end;
    if (Der) and (H.x<screen.Width-H.Heroe_skin.Width)then begin
      H.x:= H.x+10;
    end;
    if (Arb) and (H.y>1)then begin
      H.y:= H.y-10;
    end;
    if (Abj) and (H.y<screen.Height-H.Heroe_skin.Height)then begin
      H.y:= H.y+10;
    end;
    if esp then begin

        if (b[1].b) then begin
          B[1].Y:=B[1].Y-10;
          if B[1].Y<-20 then b[1].b:=false;
        end;
        if (b[2].b) then begin
          B[2].Y:=B[2].Y-10;
          if B[2].Y<-20 then b[2].b:=false;
        end;
        if (b[3].b) then begin
          B[3].Y:=B[3].Y-10;
          if B[3].Y<-20 then b[3].b:=false;
        end;
        if (b[4].b) then begin
          B[4].Y:=B[4].Y-10;
          if B[4].Y<-20 then b[4].b:=false;
        end;
        if (b[5].b) then begin
          B[5].Y:=B[5].Y-10;
          if B[5].Y<-20 then b[5].b:=false;
        end;
        if (b[6].b) then begin
          B[6].Y:=B[6].Y-10;
          if B[6].Y<-20 then b[6].b:=false;
        end;
        if (b[7].b) then begin
          B[7].Y:=B[7].Y-10;
          if B[7].Y<-20 then b[7].b:=false;
        end;

    end;
    if E[flag].vida then begin

        if (be[1].b) then begin
          Be[1].Y:=Be[1].Y+10;
        end;
        if (be[2].b) then begin
          Be[2].Y:=Be[2].Y+10;

        end;
        if (be[3].b) then begin
          Be[3].Y:=Be[3].Y+10;

        end;
        if (be[4].b) then begin
          Be[4].Y:=Be[4].Y+10;

        end;
        if (be[5].b) then begin
          Be[5].Y:=Be[5].Y+10;

        end;
        if (be[6].b) then begin
          Be[6].Y:=Be[6].Y+10;

        end;
        if (be[7].b) then begin
          Be[7].Y:=Be[7].Y+10;

        end;
        if (be[8].b) then begin
          Be[8].Y:=Be[8].Y+10;

        end;
        if (be[9].b) then begin
          Be[9].Y:=Be[9].Y+10;

        end;
        if (be[10].b) then begin
          Be[10].Y:=Be[10].Y+10;

        end;
        if (be[11].b) then begin
          Be[11].Y:=Be[11].Y+10;

        end;
        if (be[12].b) then begin
          Be[12].Y:=Be[12].Y+10;

        end;
        if (be[13].b) then begin
          Be[13].Y:=Be[13].Y+10;

        end;
        if (be[14].b) then begin
          Be[14].Y:=Be[14].Y+10;

        end;
        if (be[15].b) then begin
          Be[15].Y:=Be[15].Y+10;

        end;
        if (be[16].b) then begin
          Be[16].Y:=Be[16].Y+10;

        end;
        if (be[17].b) then begin
          Be[17].Y:=Be[17].Y+10;

        end;
        if (be[18].b) then begin
          Be[18].Y:=Be[18].Y+10;

        end;
        if (be[19].b) then begin
          Be[19].Y:=Be[19].Y+10;

        end;
        if (be[20].b) then begin
          Be[20].Y:=Be[20].Y+10;

        end;
        if (be[21].b) then begin
          Be[21].Y:=Be[21].Y+10;

        end;
        if (be[22].b) then begin
          Be[22].Y:=Be[22].Y+10;

        end;
        if (be[23].b) then begin
          Be[23].Y:=Be[23].Y+10;

        end;
        if (be[24].b) then begin
          Be[24].Y:=Be[24].Y+10;

        end;
        if (be[25].b) then begin
          Be[25].Y:=Be[25].Y+10;

        end;
        if (be[26].b) then begin
          Be[26].Y:=Be[26].Y+10;

        end;
        if (be[27].b) then begin
          Be[27].Y:=Be[27].Y+10;

        end;
        if (be[28].b) then begin
          Be[28].Y:=Be[28].Y+10;

        end;
        if (be[29].b) then begin
          Be[29].Y:=Be[29].Y+10;

        end;
        if (be[30].b) then begin
          Be[30].Y:=Be[30].Y+10;

        end;

    end;
    repaint;
end;

procedure TJuego.Timer2Timer(Sender: TObject);
var i,j:integer;
begin
for i := 1 to 30 do begin
  E[i].X:=E[i].X+K;
end;
 if (E[10].X>screen.Width-E[10].Enemigo_Tipo.width)or(E[1].X<1) then begin
  k:=k*-1;
  for I := 1 to 30 do begin
    E[i].Y:=E[i].Y+20;
  end;
 end;

  for i := 1 to 30 do begin
    for j := 1 to 7 do begin
      if (((B[j].x)>=E[i].X) and (B[j].X<=E[i].X+E[i].Enemigo_Tipo.Width))and((B[j].Y>=E[i].Y)and(B[j].Y<=E[i].Y+E[i].Enemigo_Tipo.height))and(E[i].vida) then  begin
       E[i].vida:=false;  Cev:=cev-1; pts:=pts+10; label4.Caption:=inttostr(pts);
       //E[i].X:=Screen.Width+200;
       //E[i].Y:=Screen.Height+200;
       B[j].b:=false;
       B[j].X:=-50;
       B[j].Y:=-50;
      end;
    end;
  end;

  for i := 1 to 30 do begin

    if ((BE[i].X>=H.x)and(BE[i].X<=H.x+H.Heroe_skin.Width))and((BE[i].Y>=H.y)and(BE[i].Y<=H.y+H.Heroe_skin.Height)) then begin
     H.daño;
      if H.Vidas>=1 then mediaplayer3.Play;
    end;
  end;

      repaint;

end;

procedure TJuego.Timer4Timer(Sender: TObject);
begin
randomize;
ran:=1+random(30);
  if E[ran].vida then begin
    flag:=ran;
   BE[flag].X:=E[flag].x+(E[flag].Enemigo_Tipo.Width-BE[flag].Bala_image.Width)div 2;
   BE[flag].Y:=E[flag].Y+BE[flag].Bala_image.Height;
   BE[flag].b:=true;
  end;
  if cev<=0 then label1.Visible:=true;

  if H.Vidas<1 then begin
    mediaplayer4.Play;
    H.explotar;
    label3.Visible:=true;
  end;

  
  
end;



end.
