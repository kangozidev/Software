unit ui_wait;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  ColorSpeedButton,
  FXProgressBar;

type

  { TfrmWait }

  TfrmWait = class(TForm)
    btn_Cancel: TColorSpeedButton;
    Label1: TLabel;
    Panel1: TPanel;
    pbar: TFXProgressBar;
    Timer1: TTimer;
    procedure btn_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  frmWait: TfrmWait;
  i : integer;
implementation

uses ui_main;

{$R *.lfm}

{ TfrmWait }

procedure TfrmWait.btn_CancelClick(Sender: TObject);
begin
  frm_Main.thrRequestAI.Terminate;
  Timer1.Enabled:=false;
  self.close;

end;


procedure TfrmWait.FormShow(Sender: TObject);
begin
  i := 0 ;
  Timer1.Enabled:=True
end;

procedure TfrmWait.Timer1Timer(Sender: TObject);
begin
  inc(i);
  if i<100 then
      pbar.Value:= i
  else
   i:=0;
end;

end.

