unit uSapa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  JvSpecialProgress, TplLabelUnit,urlmon,LCLIntf, Buttons;

type

  { TFSapa }

  TFSapa = class(TForm)
    barupdate: TJvSpecialProgress;
    btclose: TButton;
    ckAutoCekUpdate: TCheckBox;
    Image1: TImage;
    Image2: TImage;
    imgSapa: TImage;
    kozweb: TSpeedButton;
    pnCekUpdate: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    spSurvey: TSpeedButton;
    spKozWeb: TSpeedButton;
    tmUpdate: TTimer;
    procedure btcloseClick(Sender: TObject);
    procedure btStartCeckClick(Sender: TObject);
    procedure ckAutoCekUpdateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure kozwebClick(Sender: TObject);
    procedure spKozWebClick(Sender: TObject);
    procedure spSurveyClick(Sender: TObject);
    procedure tmUpdateTimer(Sender: TObject);
    procedure GetPicSplash(u:string);
  private


    const VERSI = '0.7.4.006 [06 September 2022]';
  public
    MUST_UPDATE : String;
    procedure CekUpdate;


  end;

var
  FSapa: TFSapa;
  hit : integer;
  LINK : string;

implementation

uses umain;

{$R *.lfm}

{ TFSapa }

procedure TFSapa.btcloseClick(Sender: TObject);
begin
  close;
end;

procedure TFSapa.btStartCeckClick(Sender: TObject);
begin
  hit := 0 ;
  tmUpdate.Enabled:=true;
  kozweb.Visible:=false;

end;

procedure TFSapa.ckAutoCekUpdateClick(Sender: TObject);
var
  fc : TStringList;
begin
  fc := TStringList.Create;
  fc.Add('4%^#3456789**&%js74asadjai3456789787asgahs');
  if ckAutoCekUpdate.Checked then
     begin
     DeleteFile(ExtractFilePath(Application.ExeName) + 'support/AutoChekTrue.no');
     fc.SaveToFile(ExtractFilePath(Application.ExeName) + 'support/AutoChekTrue.yes')
     end
  else
     begin
     DeleteFile(ExtractFilePath(Application.ExeName) + 'support/AutoChekTrue.yes');
     fc.SaveToFile(ExtractFilePath(Application.ExeName) + 'support/AutoChekTrue.no')
     end;


end;

procedure TFSapa.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  tmUpdate.Enabled:=false;
  FMain.SetNewUser;
end;

procedure TFSapa.FormShow(Sender: TObject);
begin

  imgSapa.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'support/sapa.jpg');
  hit := 0;
  if FileExists(ExtractFilePath(Application.ExeName) + 'support/AutoChekTrue.yes') then
  begin
     pnCekUpdate.Visible:=true;
     ckAutoCekUpdate.Checked:=true;
     tmUpdate.Enabled:=true;
  end
  else
  begin
     pnCekUpdate.Visible:=false;
     tmUpdate.Enabled:=false;
     btclose.Caption:='Lanjut>>';
     btclose.Enabled:=true;
     ckAutoCekUpdate.Checked:=false;
  end;

end;

procedure TFSapa.kozwebClick(Sender: TObject);
begin
  OpenURL(LINK);
end;

procedure TFSapa.spKozWebClick(Sender: TObject);
begin
  OpenURL('http://sites.google.com/view/kangozicorner/home');
end;

procedure TFSapa.spSurveyClick(Sender: TObject);
begin
    OpenURL('http://forms.gle/tSDS5xnzRQmeu3tw7');
end;


procedure TFSapa.CekUpdate ;
var
     versi_server : string;
     versi_server_nomor : string;
     filep : string;
     p:TStringList;
begin
  //versi3.log
  versi_server := 'https://drive.google.com/uc?export=download&id=1TiLBjCG5GMyUJO9OkDmLfG9Cd2r97AG4';
  filep        := ExtractFilePath(Application.ExeName) + 'support/vernew.log';

  if URLDownloadToFile(nil, PChar(versi_server),
     PChar(filep), 0, nil) = 0 then
     begin
     try
        p := TStringList.Create;
        p.LoadFromFile(filep);
        versi_server_nomor := p.Strings[0];
   LINK := p.Strings[1];      // Untuk v64
   //LINK := p.Strings[2];      // Untuk v32
        if versi_server_nomor=VERSI then
           begin
           FMain.ShowPesan('Terima Kasih ' + #13 + 'Anda menggunakan SamaWA terbaru') ;
           MUST_UPDATE:= '1001';   // Tidak Perlu Update
           kozweb.Visible:=false;
           btclose.Enabled:=true;
           btclose.Caption:='Lanjut >>';
           pnCekUpdate.Hide;
           end
        else
           begin
           FMain.ShowPesan('Tersedia Update Terbaru, Silahkan klik tombol Download Patch');
           MUST_UPDATE:= '1002'; // Harus Update
           kozweb.Visible:=true;
           btclose.Enabled:=true;
           btclose.Caption:='Lanjut >>';
           pnCekUpdate.Hide;
           end;

     finally
     p.Free;
     end;

     end
  else
  FMain.ShowPesan('Periksa Koneksi Internet') ;


end;

procedure TFSapa.tmUpdateTimer(Sender: TObject);
begin
    inc(hit);

   barupdate.Position:=hit;
   Application.ProcessMessages;
   if hit =50 then
     begin
        CekUpdate;
     end
   else if hit=100 then
      begin
      hit:=0;
      barupdate.Position:=0;
      tmUpdate.Enabled:=false;
      GetPicSplash('1HpeJos7c4frZr09D0eRwNsarWPEeDtx8');
   end;
end;

procedure TFSapa.GetPicSplash(u:string);
var
  fs,fd : string;
begin

  fs := 'https://drive.google.com/uc?export=download&id='+ u;
  fd := ExtractFilePath(Application.ExeName) + 'support/sapa.jpg';

  if URLDownloadToFile(nil, PChar(fs),
     PChar(fd), 0, nil) = 0 then
     begin
        imgSapa.Picture.LoadFromFile(fd);
     end;

end;

end.

