unit upesan;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFPesan }

  TFPesan = class(TForm)
    btOK: TButton;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    procedure btOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
  d: string;
  end;

var
  FPesan: TFPesan;

implementation

{$R *.lfm}

{ TFPesan }

procedure TFPesan.btOKClick(Sender: TObject);
begin
     Close;
end;

procedure TFPesan.FormShow(Sender: TObject);
begin
  Label1.Caption:=d;
end;

end.

