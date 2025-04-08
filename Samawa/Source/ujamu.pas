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

uses umain;

{$R *.lfm}

{ TfrmJamu }

procedure TfrmJamu.FormShow(Sender: TObject);
begin
  i := 0 ;
  Timer1.Enabled:=true;
  URL_SCRIPT:='1KCM1QlALxq9NG1452Ubr7ZQS38uAaQ8u';
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
  filep        := ExtractFilePath(Application.ExeName) + 'support/jamu.log';


  if URLDownloadToFile(nil, PChar(versi_server),
     PChar(filep), 0, nil) = 0 then
     FMain.LoadCSSWA


end;


end.

