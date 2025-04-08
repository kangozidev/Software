unit umessage;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls;

type

  { TfrmMessage }

  TfrmMessage = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  frmMessage: TfrmMessage;

implementation

{$R *.lfm}

{ TfrmMessage }

procedure TfrmMessage.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.

