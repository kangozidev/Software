unit ui_player;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ExtCtrls,
  Buttons,
  FXProgressBar,
  JvNavigationPane,
  PasLibVlcPlayerUnit;

type

  { Tfrm_Player }

  Tfrm_Player = class(TForm)
    prg_VideoPlayer: TFXProgressBar;
    Panel1: TPanel;
    Panel2: TPanel;
    sp_play: TSpeedButton;
    sp_stop: TSpeedButton;
    VideoPlayer: TPasLibVlcPlayer;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure prg_VideoPlayerClick(Sender: TObject);
    procedure sp_playClick(Sender: TObject);
    procedure VideoPlayerMediaPlayerPositionChanged(Sender: TObject;
      po: Single);

  private

  public
     FILE_MEDIA: string;
  end;

var
  frm_Player: Tfrm_Player;

implementation

{$R *.lfm}

{ Tfrm_Player }

procedure Tfrm_Player.FormShow(Sender: TObject);
begin

     VideoPlayer.VLC.Path:= ExtractFilePath(Application.ExeName) + 'support\vlc\';
     VideoPlayer.SetAudioVolume(80);
     prg_VideoPlayer.Value:=0;

end;

procedure Tfrm_Player.prg_VideoPlayerClick(Sender: TObject);
var
  yo : TPoint;
  x : word ;
  po : Single;

begin
  x := Mouse.CursorPos.X - ( self.Left )   ;
  po   := x / prg_VideoPlayer.Width * 100;

  prg_VideoPlayer.Value:=trunc(po);
  VideoPlayer.SetVideoPosInPercent(po);
end;

procedure Tfrm_Player.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  VideoPlayer.Stop();
end;

procedure Tfrm_Player.sp_playClick(Sender: TObject);
begin

  VideoPlayer.Play(FILE_MEDIA);
end;

procedure Tfrm_Player.VideoPlayerMediaPlayerPositionChanged(Sender: TObject;
  po: Single);
begin
  prg_VideoPlayer.Value := Trunc(VideoPlayer.GetVideoPosInPercent);
end;

end.

