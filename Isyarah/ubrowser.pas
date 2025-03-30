// ************************************************************************
// ***************************** CEF4Delphi *******************************
// ************************************************************************
//
// CEF4Delphi is based on DCEF3 which uses CEF to embed a chromium-based
// browser in Delphi applications.
//
// The original license of DCEF3 still applies to CEF4Delphi.
//
// For more information about CEF4Delphi visit :
//         https://www.briskbard.com/index.php?lang=en&pageid=cef
//
//        Copyright © 2022 Salvador Diaz Fau. All rights reserved.
//
// ************************************************************************
// ************ vvvv Original license and comments below vvvv *************
// ************************************************************************
(*
 *                       Delphi Chromium Embedded 3
 *
 * Usage allowed under the restrictions of the Lesser GNU General Public License
 * or alternatively the restrictions of the Mozilla Public License 1.1
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
 * the specific language governing rights and limitations under the License.
 *
 * Unit owner : Henri Gourvest <hgourvest@gmail.com>
 * Web site   : http://www.progdigy.com
 * Repository : http://code.google.com/p/delphichromiumembedded/
 * Group      : http://groups.google.com/group/delphichromiumembedded
 *
 * Embarcadero Technologies, Inc is not permitted to use or redistribute
 * this source code without explicit permission.
 *
 *)

unit ubrowser;

{$mode objfpc}{$H+}

interface

uses
  Windows,
  Classes,
  SysUtils,
  StrUtils,
  Clipbrd,
  process,
  FileUtil,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  LMessages,
  uCEFChromium,
  uCEFWindowParent,
  URIParser,
  ui_edtrans,
  uCEFInterfaces,
  uCEFConstants,
  uCEFTypes,
  uCEFChromiumEvents,
  uCEFSentinel,
  LCLIntf,
  Buttons,
  JvNavigationPane;

const
   MINIBROWSER_CONTEXTMENU_TRANSLATE    = MENU_ID_USER_FIRST + 1;
   MINIBROWSER_COPYHTML        = WM_APP + $103;

type
  { TfrmBrowser }
  TfrmBrowser = class(TForm)
    CEFWindowParent1: TCEFWindowParent;
    ck_AUtoRefresh: TCheckBox;
    Chromium1: TChromium;
    ckOpenTab: TCheckBox;
    EURL: TEdit;
    GoBtn: TImage;
    AddressPnl: TJvNavPanelHeader;
    spBack: TSpeedButton;
    spNext: TSpeedButton;
    Process1: TProcess;
    spTranslate: TImage;
    spb_BookMark: TImage;
    spTranslate2: TImage;
    Timer1: TTimer;
    tmAUtoRefresh: TTimer;
    procedure AddressEdtChange(Sender: TObject);
    procedure Chromium1AddressChange(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame; const url: ustring);
    procedure Chromium1BeforeContextMenu(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const params: ICefContextMenuParams; const model: ICefMenuModel);
    procedure Chromium1ContextMenuCommand(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const params: ICefContextMenuParams; commandId: Integer;
      eventFlags: TCefEventFlags; out Result: Boolean);
    procedure Chromium1PopupShow(Sender: TObject; const browser: ICefBrowser;
      tampil: Boolean);
    procedure Chromium1RunContextMenu(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const params: ICefContextMenuParams; const model: ICefMenuModel;
      const callback: ICefRunContextMenuCallback; var aResult: Boolean);
    procedure ck_AUtoRefreshChange(Sender: TObject);
    procedure Chromium1AfterCreated(Sender: TObject; const browser: ICefBrowser
      );
    procedure Chromium1BeforeClose(Sender: TObject; const browser: ICefBrowser);
    procedure Chromium1BeforeDownload(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const suggestedName: ustring; const callback: ICefBeforeDownloadCallback);
    procedure Chromium1BeforePopup(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; const targetUrl, targetFrameName: ustring;
      targetDisposition: TCefWindowOpenDisposition; userGesture: Boolean;
      const popupFeatures: TCefPopupFeatures; var windowInfo: TCefWindowInfo;
      var client: ICefClient; var settings: TCefBrowserSettings;
      var extra_info: ICefDictionaryValue;
      var noJavascriptAccess: Boolean; var Result: Boolean);
    procedure Chromium1Close(Sender: TObject; const browser: ICefBrowser;
      var aAction : TCefCloseBrowserAction);
    procedure Chromium1DownloadUpdated(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const callback: ICefDownloadItemCallback);
    procedure Chromium1LoadEnd(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; httpStatusCode: Integer);
    procedure Chromium1LoadStart(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; transitionType: TCefTransitionType);
    procedure Chromium1OpenUrlFromTab(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const targetUrl: ustring; targetDisposition: TCefWindowOpenDisposition;
      userGesture: Boolean; out Result: Boolean);
    procedure Chromium1StatusMessage(Sender: TObject;
      const browser: ICefBrowser; const value: ustring);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GoBtnClick(Sender: TObject);
    procedure spBackClick(Sender: TObject);
    procedure spCopyClick(Sender: TObject);
    procedure spNextClick(Sender: TObject);
    procedure spTranslateClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tmAUtoRefreshTimer(Sender: TObject);

  protected
    // Variables to control when can we destroy the form safely
    FCanClose  : boolean;  // Set to True in TChromium.OnBeforeClose
    FClosing   : boolean;  // Set to True in the CloseQuery event. 

    // You have to handle this two messages to call NotifyMoveOrResizeStarted or some page elements will be misaligned.
    procedure WMMove(var aMessage : TWMMove); message WM_MOVE;
    procedure WMMoving(var aMessage : TMessage); message WM_MOVING;
    // You also have to handle these two messages to set GlobalCEFApp.OsmodalLoop
    procedure WMEnterMenuLoop(var aMessage: TMessage); message WM_ENTERMENULOOP;
    procedure WMExitMenuLoop(var aMessage: TMessage); message WM_EXITMENULOOP;

    procedure BrowserCreatedMsg(var aMessage : TMessage); message CEF_AFTERCREATED;
    procedure BrowserDestroyMsg(var aMessage : TMessage); message CEF_DESTROY;
  public
        murl : string;
        respon : string;

  private
    FRM_EDITRANS : TfrmEditTrans;

  end;

var
  frmBrowser : TfrmBrowser;
  turl : string;

  app_browser : string;
  app_torrent : string;

implementation

{$R *.lfm}

// This is a demo with the simplest web browser you can build using CEF4Delphi and
// it doesn't show any sign of progress like other web browsers do.

// Remember that it may take a few seconds to load if Windows update, your antivirus or
// any other windows service is using your hard drive.

// Depending on your internet connection it may take longer than expected.

// Please check that your firewall or antivirus are not blocking this application
// or the domain "google.com". If you don't live in the US, you'll be redirected to
// another domain which will take a little time too.

// This demo uses a TChromium and a TCEFWindowParent

// Destruction steps
// =================
// 1. FormCloseQuery sets CanClose to FALSE calls TChromium.CloseBrowser which triggers the TChromium.OnClose event.
// 2. TChromium.OnClose sends a CEFBROWSER_DESTROY message to destroy CEFWindowParent1 in the main thread, which triggers the TChromium.OnBeforeClose event.
// 3. TChromium.OnBeforeClose sets FCanClose := True and sends WM_CLOSE to the form.

uses
  uCEFApplication, ui_main;

{ TfrmBrowser }
                          
procedure TfrmBrowser.FormCreate(Sender: TObject);
begin
  FCanClose   := False;
  FClosing    := False;
end;

procedure TfrmBrowser.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose := FCanClose;

  if not(FClosing) then
    begin
      FClosing := True;
      Visible  := False;
      Chromium1.CloseBrowser(True);
    end;
end;

procedure TfrmBrowser.Chromium1AfterCreated(Sender: TObject; const browser: ICefBrowser);
begin
  // Now the browser is fully initialized we can send a message to the main form to load the initial web page.
  PostMessage(Handle, CEF_AFTERCREATED, 0, 0);
end;

procedure TfrmBrowser.AddressEdtChange(Sender: TObject);
begin
end;

function EncodeUrl(url: string): string;
var
  x: integer;
  sBuff: string;
const
  SafeMask = ['A'..'Z', '0'..'9', 'a'..'z', '*', '@', '.', '_', '-'];
begin
  //Init
  sBuff := '';

  for x := 1 to Length(url) do
  begin
    //Check if we have a safe char
    if url[x] in SafeMask then
    begin
      //Append all other chars
      sBuff := sBuff + url[x];
    end
    else if url[x] = ' ' then
    begin
      //Append space
      sBuff := sBuff + '+';
    end
    else
    begin
      //Convert to hex
      sBuff := sBuff + '%' + IntToHex(Ord(url[x]), 2);
    end;
  end;

  Result := sBuff;
end;

function DecodeUrl(url: string): string;
var
  x: integer;
  ch: string;
  sVal: string;
  Buff: string;
begin
  //Init
  Buff := '';
  x := 1;
  while x <= Length(url) do
  begin
    //Get single char
    ch := url[x];

    if ch = '+' then
    begin
      //Append space
      Buff := Buff + ' ';
    end
    else if ch <> '%' then
    begin
      //Append other chars
      Buff := Buff + ch;
    end
    else
    begin
      //Get value
      sVal := Copy(url, x + 1, 2);
      //Convert sval to int then to char
      Buff := Buff + char(StrToInt('$' + sVal));
      //Inc counter by 2
      Inc(x, 2);
    end;
    //Inc counter
    Inc(x);
  end;
  //Return result
  Result := Buff;
end;

procedure TfrmBrowser.Chromium1AddressChange(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; const url: ustring);
var
  h : string;
  p : integer;
  o : integer;
  r : string;
  n : string;
begin

       if url='about:blank' then exit;

       if AnsiContainsStr(url,'#IDAYA') then
       begin

         h := DecodeUrl(url);
         o := AnsiPos('#IDAYA',h);
         r := AnsiMidStr(h,o+6,2048);


         if trim(r)='' then exit;
         if length(trim(r))> 8 then exit;
         frm_Main.OpenAyat(r);

       end;

       if AnsiContainsStr(url,'#HURUF') then
       begin

         h := DecodeUrl(url);
         o := AnsiPos('#HURUF',h);
         r := AnsiMidStr(h,o+6,2048);



         if trim(r)='' then exit;
            frm_Main.LoadPageAyatHuruf(r)
       end ;


       if AnsiContainsStr(url,'#KATA') then
       begin

         h := DecodeUrl(url);
         o := AnsiPos('#KATA',h);
         r := AnsiMidStr(h,o+5,2048);



         if trim(r)='' then exit;
            frm_Main.OpenKata(r)
       end ;

       if AnsiContainsStr(url,'#SIFAT') then
       begin
         h := DecodeUrl(url);
         o := AnsiPos('#SIFAT',h);
         r := AnsiMidStr(h,o+6,2048);

         if trim(r)='' then exit;
            frm_Main.ShowVideoTutorial(r);
       end ;


       if AnsiContainsStr(url,'#TEMA') then
       begin

         h := DecodeUrl(url);
         o := AnsiPos('#TEMA',h);
         r := AnsiMidStr(h,o+5,2048);
         if trim(r)='' then exit;
            frm_Main.ShowAyatTerkaitByTema(r) ;
       end ;


       if AnsiContainsStr(url,'#TAJWID') then
       begin

         h := DecodeUrl(url);

         o := AnsiPos('#TAJWID',h);
         r := AnsiMidStr(h,o+7,2048);

         if trim(r)='' then exit;
            frm_Main.OpenTajwid(r);

       end;

       if AnsiContainsStr(url,'#RESUME') then
       begin
       
         h := DecodeUrl(url);
         o := AnsiPos('#RESUME',h);
         r := Trim(AnsiMidStr(h, o + 7,10));
         frm_Main.OpenAyatNormalByAI(r);
       end;

       if AnsiContainsStr(url,'#GENERATE') then
       begin
         h := DecodeUrl(url);
         o := AnsiPos('#GENERATE',h);
         r := Trim(AnsiMidStr(h, o + 9,10));
         frm_Main.resumeTafsirAI(r);
       end;

       if AnsiContainsStr(url,'#TAFSIR') then
        begin

         h := DecodeUrl(url);
         o := AnsiPos('#TAFSIR',h);
         r := AnsiMidStr(h, o + 7,2048);
         p := AnsiPos('&page=',r);
         n := AnsiMidStr(r, p + 6,6);
         r := AnsiMidStr(r,1,p-1);

         r := Trim(r);

         if trim(r)='' then exit;

         if Dialogs.MessageDlg('Apakah Anda Akan Menterjemahkan dengan AI ( Google Gemini ) ?',
          mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
            frm_Main.TranslateTafsir(r,n)
         else
           begin
            FRM_EDITRANS.ID_X:= n;
            FRM_EDITRANS.KITAB:='TAFSIR';
            FRM_EDITRANS.Show;
           end;
        end;



 end;

procedure TfrmBrowser.Chromium1BeforeContextMenu(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const params: ICefContextMenuParams; const model: ICefMenuModel);
begin

 if (Chromium1.IsSameBrowser(browser)) and
    (respon='TRANSLATE BOOK')then
    begin
       model.Clear;
       model.AddItem(MINIBROWSER_CONTEXTMENU_TRANSLATE,    'Terjemahkan Ke Bahasa Indonesia');
    end;
    //else
    //   model.Clear;
end;

procedure TfrmBrowser.Chromium1ContextMenuCommand(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const params: ICefContextMenuParams; commandId: Integer;
  eventFlags: TCefEventFlags; out Result: Boolean);
begin


  if (Chromium1.IsSameBrowser(browser)) and
    (respon='TRANSLATE BOOK')then
     begin
      if commandId=MINIBROWSER_CONTEXTMENU_TRANSLATE then
        begin
          Chromium1.ClipboardCopy;
          ShowMessage('Translate Dengan AI ?');
          frm_Main.CopyTextToTranslate;
        end;

     end;
end;

procedure TfrmBrowser.Chromium1PopupShow(Sender: TObject;
  const browser: ICefBrowser; tampil: Boolean);
begin
  tampil := false
end;

procedure TfrmBrowser.Chromium1RunContextMenu(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const params: ICefContextMenuParams; const model: ICefMenuModel;
  const callback: ICefRunContextMenuCallback; var aResult: Boolean);
begin

end;

procedure TfrmBrowser.ck_AUtoRefreshChange(Sender: TObject);
begin
  tmAUtoRefresh.Enabled:=ck_AUtoRefresh.Checked;
end;

procedure TfrmBrowser.Chromium1BeforeClose(Sender: TObject; const browser: ICefBrowser);
begin
  FCanClose := True;
  PostMessage(Handle, WM_CLOSE, 0, 0);
end;

procedure TfrmBrowser.Chromium1BeforeDownload(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const suggestedName: ustring; const callback: ICefBeforeDownloadCallback);
begin
  try
    callback.Cont(downloaditem.SuggestedFileName,true);
    finally
    exit;
    end;

end;

procedure TfrmBrowser.Chromium1BeforePopup(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; const targetUrl,
  targetFrameName: ustring; targetDisposition: TCefWindowOpenDisposition;
  userGesture: Boolean; const popupFeatures: TCefPopupFeatures;
  var windowInfo: TCefWindowInfo; var client: ICefClient;
  var settings: TCefBrowserSettings;
  var extra_info: ICefDictionaryValue;
  var noJavascriptAccess: Boolean;
  var Result: Boolean);
var
  istor : boolean;
begin
  // For simplicity, this demo blocks all popup windows and new tabs
 // Result := (targetDisposition in [WOD_NEW_FOREGROUND_TAB, WOD_NEW_BACKGROUND_TAB, WOD_NEW_POPUP, WOD_NEW_WINDOW]);
 // Result :=  (targetDisposition in [  WOD_NEW_FOREGROUND_TAB, WOD_NEW_BACKGROUND_TAB, WOD_NEW_WINDOW, WOD_NEW_POPUP]);

  if ckOpenTab.Checked then
    begin
    Process1.CommandLine:=app_browser + ' "' + turl + '"';
    Process1.Execute;

    end
  else
    Chromium1.LoadURL(turl);

end;



procedure TfrmBrowser.Chromium1OpenUrlFromTab(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; const targetUrl: ustring;
  targetDisposition: TCefWindowOpenDisposition; userGesture: Boolean; out
  Result: Boolean);
begin
  // For simplicity, this demo blocks all popup windows and new tabs
  //Result := (targetDisposition in [WOD_NEW_FOREGROUND_TAB, WOD_NEW_BACKGROUND_TAB, WOD_NEW_POPUP, WOD_NEW_WINDOW]);
end;

procedure TfrmBrowser.Chromium1StatusMessage(Sender: TObject;
  const browser: ICefBrowser; const value: ustring);
begin
   if Chromium1.IsSameBrowser(browser) then
     begin
     turl:=value;

     end;

end;

procedure TfrmBrowser.Chromium1Close(Sender: TObject; const browser: ICefBrowser; var aAction : TCefCloseBrowserAction);
begin
  PostMessage(Handle, CEF_DESTROY, 0, 0);
  aAction := cbaDelay;
end;

procedure TfrmBrowser.Chromium1DownloadUpdated(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const callback: ICefDownloadItemCallback);
begin

end;

procedure TfrmBrowser.Chromium1LoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer);
var
  jscode : string;
begin
  jsCode:= 'document.getElementsByClassName("kFwPee")[0].style.display="none"';
  EURL.Text:=browser.MainFrame.Url;


end;

procedure TfrmBrowser.Chromium1LoadStart(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  transitionType: TCefTransitionType);
begin
  EURL.Text:= browser.MainFrame.Url;
end;

procedure TfrmBrowser.FormShow(Sender: TObject);
begin
  // You *MUST* call CreateBrowser to create and initialize the browser.
  // This will trigger the AfterCreated event when the browser is fully
  // initialized and ready to receive commands.

  // GlobalCEFApp.GlobalContextInitialized has to be TRUE before creating any browser
  // If it's not initialized yet, we use a simple timer to create the browser later.
  if not(Chromium1.CreateBrowser(CEFWindowParent1)) then Timer1.Enabled := True;
  FRM_EDITRANS := TfrmEditTrans.Create(Self);
  app_browser := ExtractFilePath(Application.ExeName) +
                 'support/app/iron/ironportable.exe';

end;

procedure TfrmBrowser.GoBtnClick(Sender: TObject);
begin
  // This will load the URL in the edit box
  Chromium1.LoadURL('https://duckduckgo.com/');
end;

procedure TfrmBrowser.spBackClick(Sender: TObject);
begin
  if Chromium1.CanGoBack then
  Chromium1.GoBack;
end;



procedure TfrmBrowser.spCopyClick(Sender: TObject);
begin
  EURL.SelectAll;
  EURL.CopyToClipboard;
end;

procedure TfrmBrowser.spNextClick(Sender: TObject);
begin
  if Chromium1.CanGoForward then
  Chromium1.GoForward;
end;

procedure TfrmBrowser.spTranslateClick(Sender: TObject);
var
  urlx : string;
  urlnow : string;
  stt : string;
  domain : string;

  domain_ext : string;
begin

  urlnow := EURL.text;

  // getdomain

  domain := ParseURI(EURL.text).Host;
  domain := AnsiReplaceStr(domain,'.','-');
  domain_ext := AnsiReplaceStr(EURL.Text,ParseURI(EURL.text).Host,'');
  stt    := '_x_tr_sl=en&_x_tr_tl=id&_x_tr_hl=id&_x_tr_pto=nui';
  urlnow := domain + '.translate.goog/' + domain_ext +'?'+ stt;
  urlnow := AnsiReplaceStr(urlnow,'https:///','');

 Chromium1.LoadURL('https://' + urlnow);


end;

procedure TfrmBrowser.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if not(Chromium1.CreateBrowser(CEFWindowParent1)) and not(Chromium1.Initialized) then
    Timer1.Enabled := True;
end;

procedure TfrmBrowser.tmAUtoRefreshTimer(Sender: TObject);
begin
  Chromium1.Reload;
end;

procedure TfrmBrowser.WMMove(var aMessage: TWMMove);
begin
  inherited;

  if (Chromium1 <> nil) then Chromium1.NotifyMoveOrResizeStarted;
end;

procedure TfrmBrowser.WMMoving(var aMessage: TMessage);
begin
  inherited;

  if (Chromium1 <> nil) then Chromium1.NotifyMoveOrResizeStarted;
end;

procedure TfrmBrowser.WMEnterMenuLoop(var aMessage: TMessage);
begin
  inherited;

  if (aMessage.wParam = 0) and (GlobalCEFApp <> nil) then GlobalCEFApp.OsmodalLoop := True;
end;

procedure TfrmBrowser.WMExitMenuLoop(var aMessage: TMessage);
begin
  inherited;

  if (aMessage.wParam = 0) and (GlobalCEFApp <> nil) then GlobalCEFApp.OsmodalLoop := False;
end;

procedure TfrmBrowser.BrowserCreatedMsg(var aMessage: TMessage);
begin

  AddressPnl.Enabled := True;
//  Chromium1.LoadURL(murl);
end;

procedure TfrmBrowser.BrowserDestroyMsg(var aMessage: TMessage);
begin
  CEFWindowParent1.Free;
end;

end.

