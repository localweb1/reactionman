unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, ExtCtrls,
  ValEdit, StdCtrls, TASources, TAGraph, TASeries, TANavigation;

type

  { TForm2 }

  TForm2 = class(TForm)
    Chart1: TChart;
    ChartNavScrollBar1: TChartNavScrollBar;
    timeToClick: TLineSeries;
    targetSpeed: TLineSeries;
    Label1: TLabel;
    Label2: TLabel;
    ListChartSource1: TListChartSource;
    Shape1: TShape;
    Shape2: TShape;
    Timer1: TTimer;
    ValueListEditor1: TValueListEditor;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
{$R *.lfm}                     
uses Unit1;

{ TForm2 }

procedure processChart;
var d:string;
    c:integer=0;
begin
  Form2.timeToClick.Clear;
  Form2.targetSpeed.Clear;
  for d in Unit1.logs do
  begin
      if c <> 0 then
      begin
           Form2.timeToClick.Add(StrToInt(d), d);
      end;
      c := c + 1;
  end;
  c:= 0;
  for d in Unit1.speedlogs do
  begin
      if c <> 0 then
      begin
           Form2.targetSpeed.Add(StrToInt(d)*1000, d);
      end;
      c := c + 1;
  end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  ValueListEditor1.Cols[0].Assign(Unit1.logs);
  ValueListEditor1.Cols[1].Assign(Unit1.speedlogs);
  processChart;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

end.

