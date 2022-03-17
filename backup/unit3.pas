unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,math;

type

  { TForm3 }

  TForm3 = class(TForm)
    Shape1: TShape;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    procedure FormClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Shape1ChangeBounds(Sender: TObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseEnter(Sender: TObject);
    procedure Shape1MouseLeave(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

uses Unit1;
type
  TsColor = DWORD;

const
  scBlack       = $00000000;
  scWhite       = $00FFFFFF;
  scRed         = $000000FF;
  scGreen       = $0000FF00;
  scBlue        = $00FF0000;
  scYellow      = $0000FFFF;
  scMagenta     = $00FF00FF;
  scCyan        = $00FFFF00;
  scDarkRed     = $00000080;
  scDarkGreen   = $00008000;
  scDarkBlue    = $00800000;
  scOlive       = $00008080;
  scPurple      = $00800080;
  scTeal        = $00808000;
  scSilver      = $00C0C0C0;
  scGray        = $00808080;
  scGrey        = scGray; // redefine to allow different spelling

  // Identifier for undefined color
  scNotDefined  = $40000000;

  // Identifier for transparent color
  scTransparent = $20000000;

var isGreen:Boolean=True;
procedure TForm3.Timer1Timer(Sender: TObject);
begin
  if isGreen = True then
  begin
    isGreen:=False;
    Form3.Color:=scRed;
  end
  else if isGreen = False then
  begin
    isGreen:=True;
    Form3.Color:=scGreen;
  end;
end;

procedure setToRandomPlace;
var width,height:integer;
begin
  RandSeed:=GetTickCount;
  width:=RandomRange(0,Form3.Width);
  RandSeed:=GetTickCount+1;
  height:=RandomRange(0,Form3.Height);
  Form3.Shape1.Left:=width;
  Form3.Shape1.Top:=height;
end;
var moveLeft:Boolean=True;
    moveDown:Boolean=True;


var speed:Integer=2;


procedure moveToPlace;
var x,y:Integer;
begin
  if Form3.Shape1.Top + Form3.Shape1.Height >= Form3.Height then moveDown:=False
  else if Form3.Shape1.Top <= 0 then moveDown:=True;

  if Form3.Shape1.Left <= 0 then moveLeft:=True
  else if Form3.Shape1.Left + Form3.Shape1.Width >= Form3.Width then moveLeft:=False;

  if moveLeft = True then x := speed
  else x:= -speed;
  if moveDown = true then y := speed
  else y:= -speed;
  Form3.Shape1.Left:=Form3.Shape1.Left + x;
  Form3.Shape1.Top:=Form3.Shape1.Top + y;
end;

procedure adjustSize;
var xy:Integer;
begin
{  RandSeed:=GetTickCount+Unit1.logs.Count;
  xy := RandomRange(1,150);


  Form3.Shape1.Width:=xy;
  Form3.Shape1.Height:=xy; }
end;

var timeTookToClick:Integer;
procedure TForm3.FormCreate(Sender: TObject);
begin
  AdjustSize;
  timeTookToClick:=0;
  setToRandomPlace;
  RandSeed:=GetTickCount+5;
  speed:=RandomRange(2,8);
end;

procedure TForm3.Shape1ChangeBounds(Sender: TObject);
begin
end;

var inside:Boolean=False;
procedure TForm3.Shape1MouseEnter(Sender: TObject);
begin
  inside:=True;
end;

procedure TForm3.Shape1MouseLeave(Sender: TObject);
begin
  inside:=False;
end;

procedure TForm3.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if inside then Close;
end;

procedure TForm3.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Unit1.logs.Add(IntToStr(timeTookToClick));
  Unit1.speedlogs.Add(IntToStr(speed));
    inside:=False;
end;

procedure TForm3.FormClick(Sender: TObject);
begin
  if Unit1.clickBall = False then
  begin
         speed:=-1;
       Close;
  end;
end;

procedure TForm3.Timer2Timer(Sender: TObject);
begin
  timeTookToClick:=timeTookToClick+1;
end;

procedure TForm3.Timer3Timer(Sender: TObject);
begin
  moveToPlace;
end;

end.

