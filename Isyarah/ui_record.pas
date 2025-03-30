unit ui_record;

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
  Buttons,
  acs_audio,
  acs_file;

type

  { Tfrm_RecordAudio }

  Tfrm_RecordAudio = class(TForm)
    AcsAudioIn1: TAcsAudioIn;
    AcsAudioOut1: TAcsAudioOut;
    AcsFileOut1: TAcsFileOut;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private

  public
     file_name : string;
     mic : integer;
  end;

var
  frm_RecordAudio: Tfrm_RecordAudio;

implementation

{$R *.lfm}

{ Tfrm_RecordAudio }

procedure Tfrm_RecordAudio.FormShow(Sender: TObject);
begin
  AcsFileOut1.FileName:=file_name;
  Label1.Caption:= 'Tekan Icon Microphone Untuk Mulai Merekam ';
  mic := 0;
    Label2.Caption:= 'Mic : ' + AcsAudioIn1.DeviceInfo[mic].DeviceName;

end;

procedure Tfrm_RecordAudio.RadioButton1Click(Sender: TObject);
begin
  Label2.Caption:= 'Mic : ' + AcsAudioIn1.DeviceInfo[0].DeviceName;
  mic := 0 ;
end;

procedure Tfrm_RecordAudio.RadioButton2Click(Sender: TObject);
begin
  try
   Label2.Caption:= 'Mic : ' + AcsAudioIn1.DeviceInfo[1].DeviceName;
   mic := 1;
  except
    on e:Exception do
    begin
    ShowMessage(e.Message);
    mic := 0;
    RadioButton1.Checked:=true;
    end;
  end;
end;

procedure Tfrm_RecordAudio.SpeedButton1Click(Sender: TObject);
begin

  SpeedButton2.Enabled:=true;
  SpeedButton1.Enabled:=false;
  AcsAudioIn1.Device:=mic;
  AcsFileOut1.Run();
  Label1.Caption:='Proses Merekam ....';

end;

procedure Tfrm_RecordAudio.SpeedButton2Click(Sender: TObject);
begin

  SpeedButton1.Enabled:=true;
  SpeedButton2.Enabled:=false;
  AcsFileOut1.Stop();
  Label1.Caption:='Berhenti Merekam';

end;

end.

