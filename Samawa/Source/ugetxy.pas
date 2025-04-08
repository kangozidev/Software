unit ugetXY;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TfrmGetXY }

  TfrmGetXY = class(TForm)
    procedure FormClick(Sender: TObject);
  private

  public

  end;

var
  frmGetXY: TfrmGetXY;

implementation

uses umain;

{$R *.lfm}

{ TfrmGetXY }

procedure TfrmGetXY.FormClick(Sender: TObject);
var
  y : TStringList;
begin

    try
    y := TStringList.create;
    y.Add(IntToStr(Mouse.CursorPos.X));
    y.Add(IntToStr(Mouse.CursorPos.Y));
    y.SaveToFile(ExtractFilePath(Application.ExeName) + 'sendpos.xy');
    FMain.LoadSendXY;
    finally
    y.Free;
    end;

    self.close;




end;

end.

