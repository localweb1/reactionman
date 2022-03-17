unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    PopupMenu1: TPopupMenu;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
var logs,speedlogs:TStringList; clickBall:Boolean=True;
implementation
uses Unit2,Unit3;
{$R *.lfm}

{ TForm1 }
procedure TForm1.FormCreate(Sender: TObject);
begin
  logs := TStringList.Create;
  speedlogs := TStringList.Create;
  logs.Add('Reaction Time');
  speedlogs.Add('Cube Speed');
  TrayIcon1.ShowBalloonHint;
end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
   Timer1.Interval:=(1000 * 60) * 5;
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
   Timer1.Interval:=(1000 * 60) * 10;
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  Timer1.Interval:=(1000 * 60) * 15;
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  Timer1.Interval:=(1000 * 60) * 30;
end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  Timer1.Interval:=(1000 * 60) * 60;
end;

procedure TForm1.MenuItem16Click(Sender: TObject);
begin
  clickBall:=True;
end;

procedure TForm1.MenuItem17Click(Sender: TObject);
begin
  clickBall:=False;
end;

var isRunning:Boolean=False;

procedure start;
begin
  Form1.Timer1.Enabled:=True;
end;

procedure stop;
begin
  Form1.Timer1.Enabled:=False;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  If isRunning = True then
  begin
    stop;
    MenuItem1.Caption:='Start';
    isRunning:=False;
  end
  else if isRunning = False then
  begin
    start;
    MenuItem1.Caption:='Stop';
    isRunning:=True;
  end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  Halt;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  Application.CreateForm(TForm2,Form2);
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
   Application.CreateForm(TForm3,Form3);
end;

procedure TForm1.Timer1Timer(Sender: TObject);        // 600000 10 minutes
begin
    Application.CreateForm(TForm3,Form3);
end;


end.

