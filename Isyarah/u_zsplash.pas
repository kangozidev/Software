unit u_zsplash;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms, Controls,
  Graphics,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  TplGifAnimatorUnit;

type

  { TFZSplash }

  TFZSplash = class(TForm)
    Image1: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    tmSplash: TTimer;
    procedure FormShow(Sender: TObject);
    procedure lbTerminateClick(Sender: TObject);
    procedure tmSplashTimer(Sender: TObject);
  private

  public

  end;

var
  FZSplash: TFZSplash;
  i: integer;

implementation

uses  ui_main;

{$R *.lfm}

{ TFZSplash }

procedure TFZSplash.tmSplashTimer(Sender: TObject);
begin

  inc(i);
  if i>6 then
      begin
        tmSplash.Enabled:=false;
        self.Width:=0;
        self.Height:=0;
        frm_Main.ShowAgree;

        self.close;
      end;
end;

procedure TFZSplash.FormShow(Sender: TObject);
begin
  i := 0 ;
  tmSplash.Enabled:=true;
 // GIF.FileName:=ExtractFilePath(Application.ExeName) + 'support\gif\Splash_Light3.gif';
end;


procedure TFZSplash.lbTerminateClick(Sender: TObject);
begin
  frm_Main.Free;
  FreeOnRelease;
  Application.Terminate;
end;

end.

