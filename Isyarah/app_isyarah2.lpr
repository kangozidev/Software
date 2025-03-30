program app_isyarah2;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  runtimetypeinfocontrols,
  lazcontrols,
  tachartlazaruspkg,
  rxnew,
  indylaz,
  laz_acs_lib,
  FrameViewer09,
  uCEFApplication,
  pkg_gifanim,
  zcomponent,
  ui_main,
  ui_qori,
  ubrowser,
  ui_regtajwid,
  ui_showhuruf,
  ui_ayatbyai,
  ui_message,
  ui_player,
  ui_keyboard,
  ui_hadist,
  ui_ask,
  uabout,
  u_zsplash,
  ui_edtrans,
  ui_progres,
  ui_treekata,
  ui_agreement,
  ui_wait,
  ui_statistika,
  ui_setting,
  ui_chatai,
  uregistration,
  ui_showkata,
  ui_record,
  ui_tafsir2,
  ui_quiz,
  ui_quotemaker,
  ujamu,
  ui_source, usimplebrowser, ui_translate_tafsir, ui_restranslate;

{$R *.res}

begin

  GlobalCEFApp := TCefApplication.Create;
  GlobalCEFApp.EnableGPU            := True;      // Enable hardware acceleration
  GlobalCEFApp.IgnoreCertificateErrors := True;

  GlobalCEFApp.FrameworkDirPath     := 'support\cef';
  GlobalCEFApp.ResourcesDirPath     := 'support\cef';
  GlobalCEFApp.LocalesDirPath       := 'support\cef\locales';
  GlobalCEFApp.Cache                := 'support\cache\';
  GlobalCEFApp.RootCache            := 'support\cache\';
  GlobalCEFApp.SetCurrentDir        := True;
  GlobalCEFApp.UserAgent            :='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) ';
//  GlobalCEFApp.UserAgent            := 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko)  Safari/537.36';
  if GlobalCEFApp.StartMainProcess then
    begin

      RequireDerivedFormResource:=True;
  Application.Title:='Aplikasi Isyarah [ Pembelajaran Al-Quran Digital ]';
  Application.Scaled:=True;
      Application.Initialize;
  Application.CreateForm(Tfrm_Main, frm_Main);
      Application.Run;

    end;

  GlobalCEFApp.Free;
  GlobalCEFApp := nil;

end.

