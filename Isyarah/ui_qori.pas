unit ui_qori;

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
  StdCtrls,
  Buttons;

type

  { Tfrm_Qori }

  Tfrm_Qori = class(TForm)
    imgAbdulBAsit: TImage;
    imgAliBasfar: TImage;
    imgAzisAlili: TImage;
    imgIbrahim: TImage;
    imgMahmud: TImage;
    imgAliJaber: TImage;
    imgShatere: TImage;
    imgMisyari: TImage;
    imgMahmudHusairy: TImage;
    imgKarim: TImage;
    imgAymanRusdi: TImage;
    imgGhomidi: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    procedure imgAbdulBAsitClick(Sender: TObject);
    procedure imgAliBasfarClick(Sender: TObject);
    procedure imgAliJaberClick(Sender: TObject);
    procedure imgAymanRusdiClick(Sender: TObject);
    procedure imgAzisAliliClick(Sender: TObject);
    procedure imgIbrahimClick(Sender: TObject);
    procedure imgIbtahimClick(Sender: TObject);
    procedure imgKarimClick(Sender: TObject);
    procedure imgGhomidiClick(Sender: TObject);
    procedure imgMahmudClick(Sender: TObject);
    procedure imgMahmudHusairyClick(Sender: TObject);
    procedure imgMisyariClick(Sender: TObject);
    procedure imgShatereClick(Sender: TObject);
  private

  public

  end;

var
  frm_Qori: Tfrm_Qori;

implementation

uses ui_main;

{$R *.lfm}

{ Tfrm_Qori }


procedure Tfrm_Qori.imgAbdulBAsitClick(Sender: TObject);
begin
  frm_Main.PEMBACA:= 'https://everyayah.com/data/AbdulSamad_64kbps_QuranExplorer.Com/';
  frm_Main.lbImam.Caption:='Qori : Syaikh Abdul Basith ( Online )';
  self.close;
end;

procedure Tfrm_Qori.imgAliBasfarClick(Sender: TObject);
begin
  frm_Main.PEMBACA:= 'https://everyayah.com/data/Abdullah_Basfar_192kbps/';
  frm_Main.lbImam.Caption:='Qori : Syaikh Ali Basfar ( Online )';
  self.close;
end;

procedure Tfrm_Qori.imgAliJaberClick(Sender: TObject);
begin
   frm_Main.PEMBACA:= 'https://everyayah.com/data/Ali_Jaber_64kbps/';
   frm_Main.lbImam.Caption:='Qori : Syaikh Ali Jabir ( Online )';
   self.close;
end;

procedure Tfrm_Qori.imgAymanRusdiClick(Sender: TObject);
var
  f : string;
begin

   f := frm_Main.DIR_APP + 'support/audio/qori/001001.mp3';

   if FileExists(PChar(f)) then
   begin
     frm_Main.lbImam.Caption:='Qori : Syaikh Ayman Suwaid (Offline)';
     frm_Main.PEMBACA:= frm_Main.DIR_APP + 'support/audio/qori/'
   end
   else
   begin
     frm_Main.lbImam.Caption:='Qori : Syaikh Ayman Suwaid (Online)';
     frm_Main.PEMBACA:= 'https://everyayah.com/data/Ayman_Sowaid_64kbps/';
   end;

   self.close;
end;

procedure Tfrm_Qori.imgAzisAliliClick(Sender: TObject);
begin

  frm_Main.PEMBACA:= 'https://everyayah.com/data/aziz_alili_128kbps/';
  frm_Main.lbImam.Caption:='Qori : Syaikh Azis Alili ( Online )';
  self.close;
end;

procedure Tfrm_Qori.imgIbrahimClick(Sender: TObject);
begin


   frm_Main.PEMBACA:= 'https://everyayah.com/data/Ibrahim_Akhdar_32kbps/';
   frm_Main.lbImam.Caption:='Qori : Syaikh Ibrahim Al-Akhdar ( Online )';
   self.close;

end;

procedure Tfrm_Qori.imgIbtahimClick(Sender: TObject);
begin
   frm_Main.PEMBACA:= 'https://everyayah.com/data/Hani_Rifai_192kbps/';
   frm_Main.lbImam.Caption:='Qori : Syaikh Ibrahim Al-Akhdar ( Online )';
   self.close;
end;

procedure Tfrm_Qori.imgKarimClick(Sender: TObject);
begin
   frm_Main.PEMBACA:= 'https://everyayah.com/data/Karim_Mansoori_40kbps/';
   frm_Main.lbImam.Caption:='Qori : Syaikh Karim Masyuri ( Online )';
   self.close;
end;

procedure Tfrm_Qori.imgGhomidiClick(Sender: TObject);
begin
    frm_Main.PEMBACA:= 'https://everyayah.com/data/Ghamadi_40kbps/';
    frm_Main.lbImam.Caption:='Qori : Syaikh Al-Ghomidi ( Online )';
    self.close;
end;

procedure Tfrm_Qori.imgMahmudClick(Sender: TObject);
begin
   frm_Main.PEMBACA:= 'https://everyayah.com/data/mahmoud_ali_al_banna_32kbps/';
   frm_Main.lbImam.Caption:='Qori : Syaikh Mahmud Ali Al-Banna ( Online )';
   self.close;

end;

procedure Tfrm_Qori.imgMahmudHusairyClick(Sender: TObject);
begin

   frm_Main.PEMBACA:= 'https://everyayah.com/data/Husary_128kbps/';
   frm_Main.lbImam.Caption:='Qori : Syaikh Mahmud Husairy ( Online )';
   self.close;

end;

procedure Tfrm_Qori.imgMisyariClick(Sender: TObject);
begin

    frm_Main.PEMBACA:= 'https://everyayah.com/data/Alafasy_128kbps/';
    frm_Main.lbImam.Caption:='Qori : Syaikh Misyari Rasyid ( Online )';

    self.close;

end;

procedure Tfrm_Qori.imgShatereClick(Sender: TObject);
begin

   frm_Main.PEMBACA:= 'https://everyayah.com/data/Abu_Bakr_Ash-Shaatree_128kbps/';
   frm_Main.lbImam.Caption:='Qori : Syaikh Abu Bakar Shatiri';

   self.close;

end;



end.

