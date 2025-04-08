unit ugoodbye;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, LCLIntf;

type

  { TfrmGoodBy }

  TfrmGoodBy = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    bYesSurvey: TSpeedButton;
    bNoSurvey: TSpeedButton;
    procedure bNoSurveyClick(Sender: TObject);
    procedure bYesSurveyClick(Sender: TObject);
  private

  public

  end;

var
  frmGoodBy: TfrmGoodBy;

implementation

{$R *.lfm}

{ TfrmGoodBy }

procedure TfrmGoodBy.bNoSurveyClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmGoodBy.bYesSurveyClick(Sender: TObject);
begin
  OpenDocument('https://forms.gle/yns8GAwG7dp3Fusz5');
  Application.Terminate;
end;

end.
                            https://forms.gle/YkQceQjTD3asmBsV6
