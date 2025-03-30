unit ui_ask;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, PythonEngine, Lcl.PythonGUIInputOutput;

type

  { Tfrm_Ask }

  Tfrm_Ask = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
    Memo2: TMemo;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Timer1StartTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure Dengarkan(k:string);
  public

  end;

var
  frm_Ask: Tfrm_Ask;
  i : integer;
implementation

uses ui_main;

{$R *.lfm}

procedure Tfrm_Ask.Image1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;

end;

procedure Tfrm_Ask.Timer1StartTimer(Sender: TObject);
begin

end;

procedure Tfrm_Ask.Timer1Timer(Sender: TObject);
begin
  inc(i);
  ProgressBar1.Position:=i;

  if i=1 then Dengarkan('');
  if i=100 then
  begin
    i := 0;
    ProgressBar1.Position:=i;
    self.Close;
  end;
end;

procedure Tfrm_Ask.FormShow(Sender: TObject);
begin

  i := 0;
  ProgressBar1.Position:=0;
  Timer1.Enabled:=true;

end;

procedure Tfrm_Ask.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  ProgressBar1.Enabled:=false;
end;

procedure Tfrm_Ask.Dengarkan(k:string);
var
  s : string;
  f : TStringList;
  fi : String;
begin



  fi := ExtractFilePath(Application.ExeName) + 'output.txt';

  DeleteFile(fi);
  Application.ProcessMessages;
  //frm_Main.PythonEngine1.ExecString(UTF8Encode(memo2.text));

  if FileExists(fi) then
  begin
    Memo1.Lines.Clear;
    Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'output.txt' );
    Timer1.Enabled:=false;
    i := 0;
    ProgressBar1.Position:=0;
    frm_Main.JawabPertanyaan(Memo1.text);
    self.close;
  end
  else
  begin
    ShowMessage('Gagal Terhubung ke Server');
    self.Close;
  end;



end;

end.

