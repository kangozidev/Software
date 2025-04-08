unit upicture;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls,  Graphics, Dialogs, FileCtrl, ExtCtrls,
  Buttons,Clipbrd, ExtDlgs,math;

type

  { TFpicture }

  TFpicture = class(TForm)
    FLB: TFileListBox;
    ImgSend: TImage;
    odPic: TOpenPictureDialog;
    Panel1: TPanel;
    spOpen: TSpeedButton;
    spUse: TSpeedButton;
    procedure FLBClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spOpenClick(Sender: TObject);
    procedure spUseClick(Sender: TObject);
  private
   procedure UkuranGambar(g:TImage);
  public

  end;

var
  Fpicture: TFpicture;
  JPEGImage: TJPEGImage;
  Bitmap: TBitmap;

implementation

{$R *.lfm}
uses
  umain;

{ TFpicture }

//Membuka Gambar Baru
procedure TFpicture.spOpenClick(Sender: TObject);
var
  f : string;
  s : integer;
begin
//
Randomize;
s := RandomRange(1000000,9999999);


 if odPic.Execute then
    begin
    ImgSend.Picture.LoadFromFile( odPic.FileName );
    f := ExtractFilePath(Application.ExeName) + 'pictures/' + inttostr(s) + '.jpg' ;
    ImgSend.Picture.SaveToFile(f);
    FLB.Directory := ExtractFilePath(Application.ExeName) + 'pictures/';
    Position := poMainFormCenter;
    UkuranGambar(ImgSend);
    end;
end;

// Memilih gambar dalam daftar
procedure TFpicture.FLBClick(Sender: TObject);
begin
 try
  ImgSend.Picture.LoadFromFile(FLB.FileName);
  UkuranGambar(ImgSend);

 except
   on e:Exception do
    exit;
 end;
end;

// Set folder yang berisi gambar
procedure TFpicture.FormShow(Sender: TObject);
begin
 FLB.Directory := ExtractFilePath(Application.ExeName) + 'pictures/';

end;

// Dapatkan Ukuran gambar untuk menetukan ukuran form
procedure TFPicture.UkuranGambar(g:TImage);
var
  b:TJPEGImage;
begin
   //
  g.Picture.SaveToFile(ExtractFilepath(Application.ExeName)+ 'apic.jpg');

  b := TJPEGImage.Create;
  b.LoadFromFile(ExtractFilepath(Application.ExeName)+ 'apic.jpg');


  Width := b.Width + 150;
  Height := b.Height ;
  Position := poMainFormCenter;


end;

//Memilih gambar dan menyimpan dalam clipboard
procedure TFpicture.spUseClick(Sender: TObject);
var
  jpg1: TBitmap;
begin

  jpg1 := TBitmap.Create;

  jpg1.Width := ImgSend.Width;
  jpg1.Height := ImgSend.Height;
  jpg1.Canvas.Draw(0,0,ImgSend.Picture.Graphic);
  Clipboard.Assign(jpg1);

  jpg1.Free;
  Close;

  // Membuka Thumbnail gambar pada Form utama
  FMain.picAttach.Picture := Imgsend.Picture;;
  FMain.gbPicture.Caption:='Gambar';

end;



end.

