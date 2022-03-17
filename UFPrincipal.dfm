object Juego: TJuego
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Juego'
  ClientHeight = 856
  ClientWidth = 1307
  Color = clBackground
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clYellow
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 23
  object Label1: TLabel
    Left = 469
    Top = 344
    Width = 280
    Height = 112
    Caption = 'You win!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -96
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 1130
    Top = 777
    Width = 92
    Height = 22
    Caption = 'Puntaje: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 469
    Top = 344
    Width = 310
    Height = 112
    Caption = 'You lose!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -96
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 1228
    Top = 777
    Width = 16
    Height = 22
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object MediaPlayer1: TMediaPlayer
    Left = 0
    Top = 679
    Width = 253
    Height = 30
    AutoOpen = True
    FileName = 
      'C:\Users\pc\Desktop\Dario S (no tocar)\Program 1\Space Invaders ' +
      '(Proyecto)\Win32\Debug\Fx\Musica.mp3'
    Visible = False
    TabOrder = 0
  end
  object MediaPlayer2: TMediaPlayer
    Left = 0
    Top = 643
    Width = 253
    Height = 30
    AutoOpen = True
    FileName = 
      'C:\Users\pc\Desktop\Dario S (no tocar)\Program 1\Space Invaders ' +
      '(Proyecto)\Win32\Debug\Fx\Shot.mp3'
    Visible = False
    TabOrder = 1
  end
  object MediaPlayer3: TMediaPlayer
    Left = 0
    Top = 607
    Width = 253
    Height = 30
    AutoOpen = True
    FileName = 
      'C:\Users\pc\Desktop\Dario S (no tocar)\Program 1\Space Invaders ' +
      '(Proyecto)\Win32\Debug\Fx\Da'#241'o.mp3'
    Visible = False
    TabOrder = 2
  end
  object MediaPlayer4: TMediaPlayer
    Left = 0
    Top = 571
    Width = 253
    Height = 30
    AutoOpen = True
    FileName = 
      'C:\Users\pc\Desktop\Dario S (no tocar)\Program 1\Space Invaders ' +
      '(Proyecto)\Win32\Debug\Fx\Bum.mp3'
    Visible = False
    TabOrder = 3
  end
  object Timer1: TTimer
    Interval = 25
    OnTimer = Timer1Timer
    Left = 848
    Top = 520
  end
  object Timer2: TTimer
    Interval = 250
    OnTimer = Timer2Timer
    Left = 848
    Top = 480
  end
  object Timer3: TTimer
    Left = 848
    Top = 440
  end
  object Timer4: TTimer
    OnTimer = Timer4Timer
    Left = 16
    Top = 512
  end
end
