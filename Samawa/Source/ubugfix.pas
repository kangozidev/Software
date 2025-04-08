unit ubugfix;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFBugFix }

  TFBugFix = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
    Panel1: TPanel;
  private

  public

  end;

var
  FBugFix: TFBugFix;

implementation

{$R *.lfm}

end.

