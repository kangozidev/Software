unit ui_translate_tafsir;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  DB,
  Forms,
  Controls,
  StrUtils,
  Graphics,
  Dialogs,
  DBCtrls,
  ExtCtrls,
  ubrowser,
  ZDataset,
  RxDBGrid,
  IdThreadComponent,
  fpjson,
  Clipbrd,
  Buttons,
  ComCtrls,
  fphttpclient,
  urlmon , DBGrids;

type

  { TfrmTranslate }

  TfrmTranslate = class(TForm)
    DBMemo2: TDBMemo;
    DSTafsirWeb: TDataSource;
    grdTranslate: TRxDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnBrowser: TPanel;
    Panel5: TPanel;
    pnTranslate: TPanel;
    progTrans: TProgressBar;
    spb_close: TSpeedButton;
    spb_SalinPrompt: TSpeedButton;
    spb_Simpan: TSpeedButton;
    spb_stop: TSpeedButton;
    spb_TransAllrows: TSpeedButton;
    spb_TransOneRow: TSpeedButton;
    spb_You: TSpeedButton;
    spb_Deepl: TSpeedButton;
    spb_ChatGPT: TSpeedButton;
    thrTranslateAI: TIdThreadComponent;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdTranslateCellClick(Column: TColumn);
    procedure grdTranslateDblClick(Sender: TObject);
    procedure spb_ChatGPTClick(Sender: TObject);
    procedure spb_DeeplClick(Sender: TObject);
    procedure spb_showtranslateClick(Sender: TObject);
    procedure spb_YouClick(Sender: TObject);
    procedure spb_SalinPromptClick(Sender: TObject);
    procedure spb_SimpanClick(Sender: TObject);
    procedure spb_stopClick(Sender: TObject);
    procedure spb_TransAllrowsClick(Sender: TObject);
    procedure spb_TransOneRowClick(Sender: TObject);
    procedure TranslateOne;
    procedure spb_closeClick(Sender: TObject);
    procedure TranslateMany;
    procedure thrTranslateAIRun(Sender: TIdThreadComponent);
  private
    FBrowser : TfrmBrowser;
    function TranslateUseGemini(s:string):string;
    function HasInternet: Boolean;
  public

  end;

var
  frmTranslate: TfrmTranslate;
  mode_trans : string='ONE';
implementation

uses ui_main;

{$R *.lfm}

{ TfrmTranslate }

procedure TfrmTranslate.TranslateOne;
var
  nash, tr : string;
  prompt : string;
begin

 if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     thrTranslateAI.Terminate;
     exit;
   end;
  prompt:= frm_Main.SETTING_PROMPT_TRANS_TAFSIR;


 if Dialogs.MessageDlg('Terjemahkan Baris Ini dengan AI ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin

      nash := frm_Main.DTTafsirWeb.FieldByName('teks').AsString ;
      frm_Main.DTTafsirWeb.Edit;
      tr :=  TranslateUseGemini(AnsiReplaceText(prompt,'$KALIMAT',nash));

      frm_Main.DTTafsirWeb.FieldByName('translate').AsString := tr;
      frm_Main.DTTafsirWeb.Post;


      thrTranslateAI.Terminate;
    end;

end;

procedure TfrmTranslate.spb_TransOneRowClick(Sender: TObject);
begin
  mode_trans := 'one' ;
  thrTranslateAI.Active:=True;
end;

procedure TfrmTranslate.spb_TransAllrowsClick(Sender: TObject);
begin
  mode_trans := 'all'   ;
  thrTranslateAI.Active:=True;
end;

procedure TfrmTranslate.spb_stopClick(Sender: TObject);
begin
  thrTranslateAI.Terminate;
  ShowMessage('Penerjemahan dihentikan');
end;

procedure TfrmTranslate.grdTranslateDblClick(Sender: TObject);
begin
  mode_trans := 'one' ;
  thrTranslateAI.Active:=True;
end;

procedure TfrmTranslate.spb_ChatGPTClick(Sender: TObject);
begin
    FBrowser.Chromium1.LoadURL('https://chatgpt.com');
end;

procedure TfrmTranslate.spb_DeeplClick(Sender: TObject);
begin
    FBrowser.Chromium1.LoadURL('https://www.deepl.com/en/translator');
end;

procedure TfrmTranslate.spb_showtranslateClick(Sender: TObject);
begin

    with frm_Main.DTTafsirWeb do
    begin
      close;
      Filtered:= false;
      Filter  := 'translate=' + QuotedStr('-error translate--');
      Filtered:= true;
    end;
end;

procedure TfrmTranslate.spb_YouClick(Sender: TObject);
begin
    FBrowser.Chromium1.LoadURL('https://gemini.google.com');
end;

procedure TfrmTranslate.FormShow(Sender: TObject);
begin


end;

procedure TfrmTranslate.grdTranslateCellClick(Column: TColumn);
begin

end;

procedure TfrmTranslate.FormCreate(Sender: TObject);
begin

  FBrowser := TfrmBrowser.Create(self);
  FBrowser.Align:=alClient;
  FBrowser.Parent:=pnTranslate;
  FBrowser.BorderStyle:=bsnone;
  FBrowser.murl:='https://chatgpt.com';
  FBrowser.Show;

end;

procedure TfrmTranslate.spb_SalinPromptClick(Sender: TObject);
var
  nash : string;
begin

  nash := frm_Main.DTTafsirWeb.FieldByName('teks').AsString;
  if Length(trim(nash))>2 then
  Clipboard.AsText:= 'Terjemahkan ''' + trim(nash) + ''' dalam bahasa Indonesia';
 // ShowMessage('Prompt Penerjemahan disalin ke clipboard');
end;

procedure TfrmTranslate.spb_SimpanClick(Sender: TObject);
begin
      frm_Main.DTTafsirWeb.Edit;
      frm_Main.DTTafsirWeb.post;
end;

procedure TfrmTranslate.spb_closeClick(Sender: TObject);
begin
  self.close;
end;

procedure TfrmTranslate.TranslateMany;
var
  nash,trj,tr : string;
  prompt : string;
  i : integer = 0;
begin



 prompt:= frm_Main.SETTING_PROMPT_TRANS_TAFSIR;
 if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     thrTranslateAI.Terminate;
     exit;
   end;

 if Dialogs.MessageDlg('Terjemahkan Semua Baris dengan AI ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin

      With frm_Main.DTTafsirWeb do
      begin
        progTrans.Min:=1;
        progTrans.max := RecordCount ;
        //First;

        while not eof do
        begin
          progTrans.Position:=RecNo;
          nash := FieldByName('teks').AsString ;
          trj := trim(FieldByName('translate').AsString) ;
          if (trj='-error translate--') or (trj='') then
             begin
              Edit;
              tr :=  TranslateUseGemini(AnsiReplaceText(prompt,'$KALIMAT',nash));
              FieldByName('translate').AsString := tr;
              Post;

             end;
          sleep(3000);
          next;

        end;
        ShowMessage('Proses Selesai');
        thrTranslateAI.Terminate;
      end;
    end
 else
 thrTranslateAI.Terminate;

end;

procedure TfrmTranslate.thrTranslateAIRun(Sender: TIdThreadComponent);
begin

  if mode_trans='one' then
     TranslateOne
  else if mode_trans='all' then
     TranslateMany;
end;

function TfrmTranslate.HasInternet: Boolean;
begin

     if URLDownloadToFile(nil, PChar('https://google.com'),
        PChar(ExtractFilePath(Application.ExeName) + 'inet.stat'), 0, nil) = 0 then
          Result := True
     else
         Result := false;


end;
function TfrmTranslate.TranslateUseGemini(s:string):string;
var

    json: TJSONData;
    content: string;
    Client: TFPHTTPClient;
    RequestBody: TMemoryStream;
    Response: TStringStream;
    QueryJSON: string;
    gemini_ac : string;
    t : TStringList;
    j : integer;

begin

     // Persiapkan klien HTTP
    Client := TFPHTTPClient.Create(nil);
    Response := TStringStream.Create('');
    RequestBody := TMemoryStream.Create;

    frm_Main.SETTING_API:= frm_Main.GetRandomAPI;
    gemini_ac:= 'https://generativelanguage.googleapis.com/v1beta/models/'+
                'gemini-1.5-flash:generateContent?key=' + frm_Main.SETTING_API ;

    s  := AnsiReplaceStr(s,':','\:');
    s  := AnsiReplaceStr(s,'''','\''');
    s  := AnsiReplaceStr(s,'"','\"');
    s  := AnsiReplaceStr(s,'{','\{');
    s  := AnsiReplaceStr(s,'}','\}');
    s  := AnsiReplaceStr(s,'[','\[');
    s  := AnsiReplaceStr(s,']','\]');
    s  := AnsiReplaceStr(s,'-','\-');
    s  := AnsiReplaceStr(s,',','\,');
    s  := AnsiReplaceStr(s,';','\;');


    try
      // Persiapkan kueri dalam format JSON
      QueryJSON :=
        '{ '+
        '"contents": [{ '+
        '"parts": [{'+
        '"text": "'+ s + '" '+
        '}]'+
        '}] '+
        '}';
      RequestBody.Write(QueryJSON[1], Length(QueryJSON));
      RequestBody.Position := 0;

      Client.AddHeader('Content-Type', 'application/json');

      Client.RequestBody := RequestBody;
      Client.Post(gemini_ac, Response);

      // Tampilkan hasil respons
      json := GetJSON(Response.DataString) ;
      content := json.FindPath('candidates[0].content.parts[0].text').AsString;
      content := Trim(content);
      Result  := content;
    except
      on E: Exception do
      begin

        //ShowMessage( 'Terdapat Error dalam Request , Coba Ulangi');
        Result := '-error translate--';
      end;
    end;

    Client.Free;
    Response.Free;
    RequestBody.Free;
 //   thrTranslateAI.Terminate;

end;

end.

