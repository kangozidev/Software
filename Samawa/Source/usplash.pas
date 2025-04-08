unit usplash;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TFSplash }

  TFSplash = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lbTerminate: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    tmSplash: TTimer;
    procedure FormShow(Sender: TObject);
    procedure lbTerminateClick(Sender: TObject);
    procedure tmSplashTimer(Sender: TObject);
  private

  public

  end;

var
  FSplash: TFSplash;
  i: integer;

implementation

uses umain;

{$R *.lfm}

{ TFSplash }

procedure TFSplash.tmSplashTimer(Sender: TObject);
begin
  inc(i);
  if i>3 then
      begin
        tmSplash.Enabled:=false;
        i := 0;
        FMain.Chromium1.LoadURL('https://web.whatsapp.com');
        self.close;
        Fmain.TampilPengumunan;
      end;
end;

procedure TFSplash.FormShow(Sender: TObject);
begin
  i := 0 ;
  tmSplash.Enabled:=true;
end;

procedure TFSplash.lbTerminateClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.

