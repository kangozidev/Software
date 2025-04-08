program samawa;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, SysUtils, // this includes the LCL widgetset
  Forms, dbflaz, sdflaz, runtimetypeinfocontrols, datetimectrls, umain,
  { you can add units after this }
  uCEFApplication, rxnew, indylaz, uecontrols, frameviewer09,
  usplash, uphonebook, uview, upicture, uregistration, utemplate,
  zcomponent, ubugfix, upesan, usettingproxy, uvcfmaker, uqmessage, uInformasi,
  uSapa, uscript, ucetak, uschedule, usendlog, ugoodbye, uabout, ujamu,
umessage, ugetXY;

{$R *.res}

{$IFDEF MSWINDOWS}
  // cef3 needs to set the LARGEADDRESSAWARE flag which allows 32-bit processes to use up to 3GB of RAM.
  {$SetPEFlags $20}
{$ENDIF}

begin
  GlobalCEFApp := TCefApplication.Create;


  //GlobalCEFApp.EnableGPU:=true;
  //GlobalCEFApp.PersistSessionCookies:=true;
  //GlobalCEFApp.MultiThreadedMessageLoop:=true;
  GlobalCEFApp.UserAgent             :='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36';
  GlobalCEFApp.FrameworkDirPath     := 'support\cef';
  GlobalCEFApp.ResourcesDirPath     := 'support\cef';
  GlobalCEFApp.Cache                := 'support\cache';
  GlobalCEFApp.LocalesDirPath       := 'support\cef\locales';

  if GlobalCEFApp.StartMainProcess then
    begin
      RequireDerivedFormResource:=True;
      Application.Title:='Samawa7';
      Application.Scaled:=True;
      Application.Initialize;
      Application.CreateForm(TFMain, FMain);

      Application.Run;
    end;

  GlobalCEFApp.Free;
  GlobalCEFApp := nil;
end.

