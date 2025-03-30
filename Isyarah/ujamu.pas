unit ujamu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, urlmon, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  FXProgressBar;

type

  { TfrmJamu }

  TfrmJamu = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    pbarjamu: TFXProgressBar;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure CekUpdate;
  public

  end;

var
  frmJamu: TfrmJamu;
  i : integer;
  URL_SCRIPT : string;
implementation

uses ui_main;

{$R *.lfm}

{ TfrmJamu }

procedure TfrmJamu.FormShow(Sender: TObject);
begin
  i := 0 ;
  Timer1.Enabled:=true;
  //File = tajwid.db3
  //URL  = https://drive.google.com/file/d/1Fvl9UnNlx2hc0aXOl6B8mhmKSuMxqWYg/view?usp=sharing
  URL_SCRIPT:='1Fvl9UnNlx2hc0aXOl6B8mhmKSuMxqWYg';
end;

procedure TfrmJamu.Timer1Timer(Sender: TObject);
begin
  inc(i);
  pbarjamu.Value:=i;

  if i = 20 then
  CekUpdate
  else if i > 100 then
  begin
    Timer1.Enabled:=false;
    i := 0 ;
    close;
  end;
end;

procedure TfrmJamu.CekUpdate;
var
   versi_server       : string;
   versi_server_nomor : string;
   filep              : string ;
   f                  : Tstringlist;
begin

  versi_server := 'https://drive.google.com/uc?export=download&id=' + URL_SCRIPT;
  filep        := ExtractFilePath(Application.ExeName) + 'support/database/sql/tajwid.db3';
  frm_Main.KOneksi_Tajwid.Connected:=false;


  if URLDownloadToFile(nil, PChar(versi_server),
     PChar(filep), 0, nil) = 0 then
      frm_Main.KOneksi_Tajwid.Connect;


end;

end.

