unit ui_showhuruf;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Clipbrd, Graphics, Dialogs, ExtCtrls,
  ComCtrls, ExtDlgs, DBGrids, DBCtrls, Buttons, PasLibVlcPlayerUnit,
  FXProgressBar, ZDataset, RxDBGrid, JvNavigationPane,ui_player;

type

  { Tfrm_ShowHuruf }

  Tfrm_ShowHuruf = class(TForm)
    DBImage1: TDBImage;
    DBMemo1: TDBMemo;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    grd_Sifat: TRxDBGrid;
    JvNavPanelHeader1: TJvNavPanelHeader;
    OPD: TOpenPictureDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    pn_Huruf: TPanel;
    spb_Makhraj: TSpeedButton;
    spb_Sifat: TSpeedButton;
    procedure DBImage1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pn_HurufClick(Sender: TObject);
    procedure grd_SifatCellClick(Column: TColumn);
    procedure spb_MakhrajClick(Sender: TObject);
    procedure spb_SifatClick(Sender: TObject);
    procedure sp_playClick(Sender: TObject);
    procedure sp_stopClick(Sender: TObject);
    procedure VideoPlayerMediaPlayerPositionChanged(Sender: TObject;
      po: Single);
  private
     FRM_Player : Tfrm_Player;
  public
     HURUF : string;
  end;

var
  frm_ShowHuruf: Tfrm_ShowHuruf;

implementation

uses ui_main;

{$R *.lfm}

{ Tfrm_ShowHuruf }

procedure Tfrm_ShowHuruf.FormShow(Sender: TObject);
begin

     //pg_Huruf.ShowTabs:=false;
     FRM_Player := Tfrm_Player.create(self);


end;

procedure Tfrm_ShowHuruf.DBImage1Click(Sender: TObject);
begin
    if OPD.Execute then
  begin
       frm_Main.DTHuruf.Edit;
       TBlobField(frm_Main.DTHuruf.FieldByName('gbr')).LoadFromFile(OPD.FileName);
       frm_Main.DTHuruf.post;
  end;
end;

procedure Tfrm_ShowHuruf.pn_HurufClick(Sender: TObject);
begin
    if OPD.Execute then
  begin
       frm_Main.DTHuruf.Edit;
       TBlobField(frm_Main.DTHuruf.FieldByName('gbr')).LoadFromFile(OPD.FileName);
       frm_Main.DTHuruf.post;
  end;
end;

procedure Tfrm_ShowHuruf.grd_SifatCellClick(Column: TColumn);
begin
  spb_Sifat.Caption:= 'Totorial : "' + frm_Main.DTSifat.FieldByName('nama').AsString  + '"';
end;

procedure Tfrm_ShowHuruf.spb_MakhrajClick(Sender: TObject);
begin

  FRM_Player.FILE_MEDIA:= frm_Main.DTHuruf.FieldByName('vid').AsString;
  FRM_Player.ShowModal;

end;

procedure Tfrm_ShowHuruf.spb_SifatClick(Sender: TObject);
begin

  FRM_Player.FILE_MEDIA:= frm_Main.DTSifat.FieldByName('vid').AsString;
  FRM_Player.ShowModal;

end;


procedure Tfrm_ShowHuruf.sp_playClick(Sender: TObject);
begin
   //VideoPlayer.Play(ExtractFilePath(Application.ExeName) + '\support\video\huruf\' + frm_Main.DTHuruf.FieldByName('vid').AsString)
end;

procedure Tfrm_ShowHuruf.sp_stopClick(Sender: TObject);
begin
  // VideoPlayer.Stop();
end;

procedure Tfrm_ShowHuruf.VideoPlayerMediaPlayerPositionChanged(Sender: TObject;
  po: Single);
begin
    //prg_VideoPlayer.Value := Trunc(VideoPlayer.GetVideoPosInPercent);
end;


end.

