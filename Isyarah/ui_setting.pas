unit ui_setting;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  DB,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  DBCtrls,
  StdCtrls,
  Buttons,
  ExtCtrls,
  ComCtrls,
  atshapeline,
  Types;

type

  { TfrmSetting }

  TfrmSetting = class(TForm)
    ckUseApi2: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    ckSUseSyiah: TDBCheckBox;
    dm_API: TDBMemo;
    dmResumeAyat: TDBMemo;
    dmResumeTema: TDBMemo;
    dmResumeKata: TDBMemo;
    dmResumeTafsir: TDBMemo;
    dmResumeHadist: TDBMemo;
    DSSetting: TDataSource;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pgMain: TPageControl;
    ShapeLine1: TShapeLine;
    spb_Save: TSpeedButton;
    spb_api: TSpeedButton;
    spb_ayat: TSpeedButton;
    spb_kata: TSpeedButton;
    spb_Tema: TSpeedButton;
    spb_Hadist: TSpeedButton;
    spb_Tafsir: TSpeedButton;
    spbDefaultResumeAyat: TSpeedButton;
    spbDefaultResumeTema: TSpeedButton;
    spbDefaultResumeKata: TSpeedButton;
    spbDefaultResumeTafsir: TSpeedButton;
    spbDefaultResumeHadist: TSpeedButton;
    tbs_api: TTabSheet;
    tbs_ayat: TTabSheet;
    tbs_hadist: TTabSheet;
    tbs_kata: TTabSheet;
    tbs_tafsir: TTabSheet;
    tbs_tema: TTabSheet;
    procedure ckUseApi2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgMainChange(Sender: TObject);
    procedure spbDefaultResumeAyatClick(Sender: TObject);
    procedure spbDefaultResumeHadistClick(Sender: TObject);
    procedure spbDefaultResumeKataClick(Sender: TObject);
    procedure spbDefaultResumeTafsirClick(Sender: TObject);
    procedure spbDefaultResumeTemaClick(Sender: TObject);
    procedure spb_apiClick(Sender: TObject);
    procedure spb_ayatClick(Sender: TObject);
    procedure spb_HadistClick(Sender: TObject);
    procedure spb_kataClick(Sender: TObject);
    procedure spb_SaveClick(Sender: TObject);
    procedure spb_TafsirClick(Sender: TObject);
    procedure spb_TemaClick(Sender: TObject);
    procedure tbs_apiContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private

  public

  end;

var
  frmSetting: TfrmSetting;

implementation

uses ui_main;

{$R *.lfm}

{ TfrmSetting }

procedure TfrmSetting.spb_SaveClick(Sender: TObject);
begin

  if (ckUseApi2.Checked) and (dm_API.Text='') then
   begin
   ckUseApi2.Checked:=False;
   exit;
   end;

   if Dialogs.MessageDlg('Simpan Perubahan Pengaturan ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin

      frm_Main.DTSetting.Post;
      frm_Main.DTSetting.Edit;
      frm_Main.OpenSetting;
      ShowMessage('Pengaturan Baru Diterapkan');
    end;
end;

procedure TfrmSetting.spb_TafsirClick(Sender: TObject);
begin
  tbs_tafsir.show;
end;

procedure TfrmSetting.spb_TemaClick(Sender: TObject);
begin
  tbs_tema.show
end;

procedure TfrmSetting.FormShow(Sender: TObject);
begin
  pgMain.ShowTabs:=false;
end;

procedure TfrmSetting.ckUseApi2Click(Sender: TObject);
begin


  if dm_API.text='' then
   begin
     ShowMessage('API KEY tidak boleh Kosong');
     ckUseApi2.Checked:=False;
   end ;

end;

procedure TfrmSetting.pgMainChange(Sender: TObject);
begin

end;

procedure TfrmSetting.spbDefaultResumeAyatClick(Sender: TObject);
begin

  dmResumeAyat.Text := 'Uraian arti setiap kata dari ayat berikut ini " $KALIMAT " ' +
                       'kedalam bahasa Indonesia , Tentukan tema pokok ayat tersebut dan '+
                       'tampilkan hadist dalam kitab hadist Ahlussunnah  terkait , '+
                       'uraikan menurut kitab tafsir , berilah kesimpulan dan berikan contoh '+
                       'aplikasinya dalam kehidupan sehari-hari';

end;

procedure TfrmSetting.spbDefaultResumeHadistClick(Sender: TObject);
begin

  dmResumeHadist.text := 'Terjemahkan kedalam bahasa indonesia kalimat berikut ini " $KALIMAT " '+
                         'dan jelaskan kaitannya dengan hadist lain dan berikan kesimpulan' ;
end;

procedure TfrmSetting.spbDefaultResumeKataClick(Sender: TObject);
begin

  dmResumeKata.text := 'Jelaskan dalam bahasa Indonesia tentang Kata " $KALIMAT " '+
                       'menurut Tata Bahasa Arab , menurut Filsafat Islam dan Berilah contoh '+
                       'Hadist Ahlusunnah terkait kata ini ' ;
end;

procedure TfrmSetting.spbDefaultResumeTafsirClick(Sender: TObject);
begin

  dmResumeTafsir.text := 'Terjemahkan kedalam bahasa indonesia  kalimat berikut ini " $KALIMAT  "' ;

end;

procedure TfrmSetting.spbDefaultResumeTemaClick(Sender: TObject);
begin

  dmResumeTema.text := 'Jelaskan dalam bahasa Indonesia topik " $KALIMAT " menurut Hadist Ahlusunnah '+
                       'dan berikan kesimpulan';
end;

procedure TfrmSetting.spb_apiClick(Sender: TObject);
begin
  tbs_api.show;
end;

procedure TfrmSetting.spb_ayatClick(Sender: TObject);
begin
  tbs_ayat.show;
end;

procedure TfrmSetting.spb_HadistClick(Sender: TObject);
begin
  tbs_hadist.show;
end;

procedure TfrmSetting.spb_kataClick(Sender: TObject);
begin
  tbs_kata.show;
end;

procedure TfrmSetting.tbs_apiContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

end.

