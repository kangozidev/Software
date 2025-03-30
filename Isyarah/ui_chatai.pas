unit ui_chatai;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  Math,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Messages,
  Clipbrd,
  Dialogs,
  ExtCtrls,
  LCLIntf,
  fpjson,
  DB,
  StdCtrls,
  Buttons,
  Menus,
  ComCtrls,
  DBCtrls,
  StrUtils,
  urlmon,
  PasLibVlcPlayerUnit,
  PythonEngine,
  Lcl.PythonGUIInputOutput,
  RxDBGrid,
  IdThreadComponent,
  HtmlView, JvNavigationPane,
  ZDataset,
  fphttpclient,
  DBGrids,
  RTTICtrls;

type

  { Tfrm_ChatAI }

  Tfrm_ChatAI = class(TForm)
    ckAutoBaca: TCheckBox;
    ckAnimate: TCheckBox;
    DSChatAI: TDataSource;
    edtTanya: TMemo;
    GRD_ChatAI: TRxDBGrid;
    Image1: TImage;
    JvOutlookSplitter1: TJvOutlookSplitter;
    lbAutoBaca: TLabel;
    lbAutoBaca1: TLabel;
    Memo1: TMemo;
    mm_Chat: TMemo;
    Panel10: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    pbarProcess: TTIProgressBar;
    PythonEngine1: TPythonEngine;
    sp_stopRequest: TSpeedButton;
    VLCPlayerMP3: TPasLibVlcPlayer;
    Panel3: TPanel;
    Panel4: TPanel;
    PythonGUIInputOutput1: TPythonGUIInputOutput;
    spAdd: TSpeedButton;
    spMic: TSpeedButton;
    spTanya: TSpeedButton;
    spSave: TSpeedButton;
    spBaca: TSpeedButton;
    thrd_ChatAI: TIdThreadComponent;
    Panel1: TPanel;
    Panel2: TPanel;
    tmr_ChatAI: TTimer;
    DTChatAI: TZTable;
    procedure edtTanyaChange(Sender: TObject);
    procedure edtTanyaKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure GRD_ChatAICellClick(Column: TColumn);
    procedure GRD_ChatAIDblClick(Sender: TObject);
    procedure mm_ChatChange(Sender: TObject);
    procedure mm_ChatDblClick(Sender: TObject);
    procedure PythonEngine1BeforeLoad(Sender: TObject);
    procedure spAddClick(Sender: TObject);
    procedure spBacaClick(Sender: TObject);
    procedure spMicClick(Sender: TObject);
    procedure spSaveClick(Sender: TObject);
    procedure spTanyaClick(Sender: TObject);
    procedure sp_stopRequestClick(Sender: TObject);
    procedure thrd_ChatAIRun(Sender: TIdThreadComponent);
    procedure thrd_ChatAITerminate(Sender: TIdThreadComponent);
    procedure tmr_ChatAITimer(Sender: TObject);
    procedure VLCPlayerMP3MediaPlayerEndReached(Sender: TObject);
  private
     function AsktoGemini(s:string):string;
     function AskToChatGPT(s:string):string;
     procedure Katakan(kalimat:string);
     function HasInternet: Boolean;
  public
    prompt : string;
    mode : string;
  end;

var
  frm_ChatAI: Tfrm_ChatAI;
  hit : integer;

  KALIMAT : string;
const
  OpenAI_API_Key = 'YOUR API KEY';
  API_URL = 'https://api.openai.com/v1/chat/completions';

implementation

uses ui_main;

{$R *.lfm}

{ Tfrm_ChatAI }

function Tfrm_ChatAI.AskToChatGPT(s:string):string;
var
    json: TJSONData;
    content: string;
    Client: TFPHTTPClient;
    RequestBody: TMemoryStream;
    Response: TStringStream;
    QueryJSON: string;

 begin
    // Persiapkan klien HTTP
    Client := TFPHTTPClient.Create(nil);
    Response := TStringStream.Create('');
    RequestBody := TMemoryStream.Create;



    try
      // Persiapkan kueri dalam format JSON
      QueryJSON :=
        '{"model": "gpt-3.5-turbo", "messages": [{"role": "user", "content": "' + s +'"}], '+
        '"max_tokens": 2048, "stop":["\n"]}';

      // Konversi JSON ke dalam TMemoryStream
      RequestBody.Write(QueryJSON[1], Length(QueryJSON));
      RequestBody.Position := 0;

      // Buat permintaan POST ke API
      Client.AddHeader('Authorization', 'Bearer ' + OpenAI_API_Key);
      Client.AddHeader('Content-Type', 'application/json');
      Client.RequestBody := RequestBody;


      Client.Post(API_URL, Response);

      // Tampilkan hasil respons
      json := GetJSON(Response.DataString) ;

      content := json.FindPath('choices[0].message.content').AsString;
      content := Trim(content);
      Result  := content;

    except
      on E: Exception do
      begin
        ShowMessage( 'Terdapat Error dalam Request :' + e.Message +' Coba Ulangi');
        Result := '';
        thrd_ChatAI.Terminate;
        tmr_ChatAI.Enabled:=false;

      end;
    end;

  // Bebaskan sumber daya
    Client.Free;
    Response.Free;
    RequestBody.Free;


end;


function Tfrm_ChatAI.AsktoGemini(s:string):string;
var
    json: TJSONData;
    content: string;
    Client: TFPHTTPClient;
    RequestBody: TMemoryStream;
    Response: TStringStream;
    QueryJSON: string;
    gemini_ac : string;
begin

     // Persiapkan klien HTTP
    Client := TFPHTTPClient.Create(nil);
    Response := TStringStream.Create('');
    RequestBody := TMemoryStream.Create;

    frm_Main.SETTING_API  := frm_Main.GetRandomAPI;

    gemini_ac:= 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=' +
                frm_Main.SETTING_API ;

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
      // Konversi JSON ke dalam TMemoryStream
      RequestBody.Write(QueryJSON[1], Length(QueryJSON));
      RequestBody.Position := 0;

      // Buat permintaan POST ke API
      //Client.AddHeader('X-GEMINI-API-KEY', 'AIzaSyD_CLJafd0OT9gPbh-3WpENIIHIyZcwEfo');
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

        ShowMessage( 'Terdapat Error dalam Request yaitu : ' + e.Message + #13 + ', Coba Ulangi');
        thrd_ChatAI.Terminate;
        tmr_ChatAI.Enabled:=false;
        Result := '';
      end;
    end;

  // Bebaskan sumber daya
    Client.Free;
    Response.Free;
    RequestBody.Free;
    thrd_ChatAI.Terminate;
end;


procedure Tfrm_ChatAI.tmr_ChatAITimer(Sender: TObject);
begin

  inc(hit);
  pbarProcess.Position:=hit;
  if hit = 100 then
    hit:=0
end;

procedure Tfrm_ChatAI.VLCPlayerMP3MediaPlayerEndReached(Sender: TObject);
begin

end;

procedure Tfrm_ChatAI.FormShow(Sender: TObject);
begin

  hit := 0;
  DTChatAI.open;

  VLCPlayerMP3.VLC.Path:= ExtractFilePath(Application.ExeName) + 'support\vlc\';

  if DTChatAI.RecordCount=0 then
    mode := 'ADD'
  else
    mode := 'EDIT';

  mm_Chat.Text:= DTChatAI.FieldByName('jawaban').AsString;
  edtTanya.text := DTChatAI.FieldByName('tanya').AsString;

end;

procedure Tfrm_ChatAI.GRD_ChatAICellClick(Column: TColumn);
begin
  mode := 'EDIT';
  mm_Chat.Text:= DTChatAI.FieldByName('jawaban').AsString;
  edtTanya.text := DTChatAI.FieldByName('tanya').AsString;
end;

procedure Tfrm_ChatAI.GRD_ChatAIDblClick(Sender: TObject);
begin

   if Dialogs.MessageDlg('Hapus Chat ' + DTChatAI.FieldByName('tanya').AsString,
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      begin
        DTChatAI.Delete;
        mm_Chat.Text:= DTChatAI.FieldByName('jawaban').AsString;
        edtTanya.text := DTChatAI.FieldByName('tanya').AsString;
      end;

end;

procedure Tfrm_ChatAI.mm_ChatChange(Sender: TObject);
begin

end;

procedure Tfrm_ChatAI.mm_ChatDblClick(Sender: TObject);
begin
  if mm_Chat.ScrollBars= ssVertical then
  mm_Chat.ScrollBars:= ssNone
  else
    mm_Chat.ScrollBars:= ssVertical;
end;

procedure Tfrm_ChatAI.PythonEngine1BeforeLoad(Sender: TObject);
begin


end;

procedure Tfrm_ChatAI.spAddClick(Sender: TObject);
begin
  edtTanya.Clear;
  mm_Chat.Clear;
  mode := 'ADD';
end;

procedure Tfrm_ChatAI.spBacaClick(Sender: TObject);
begin

   if mm_Chat.Text='' then exit;

   if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     exit;
   end;

   if VLCPlayerMP3.IsPlay() then
   begin
     VLCPlayerMP3.Stop();
     exit;
   end
   else
   begin
        Katakan(mm_Chat.text);
   End;
end;

procedure Tfrm_ChatAI.spMicClick(Sender: TObject);
var
  scpy : string;
begin


  edtTanya.Clear;

  if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     exit;
   end;



 if Dialogs.MessageDlg('Anda akan menggunakan Pertanyaan dengan Suara , Time Out 10 Detik',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      Application.ProcessMessages;
      mm_Chat.Clear;
      scpy:=Memo1.Text;
      mode := 'ADD';
      PythonEngine1.ExecString(scpy);

    end;


end;

function Tfrm_ChatAI.HasInternet: Boolean;
begin

     if URLDownloadToFile(nil, PChar('https://google.com'),
        PChar(ExtractFilePath(Application.ExeName) + 'inet.stat'), 0, nil) = 0 then
          Result := True
     else
         Result := false;


end;



procedure Tfrm_ChatAI.spSaveClick(Sender: TObject);
begin

   if Dialogs.MessageDlg('Simpan Chat ' + edtTanya.text,
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
   begin
      if mode='ADD' then
         frm_Main.Koneksi.ExecuteDirect('insert into chatai(tanya,jawaban) ' +
                                   'values (' + QuotedStr(edtTanya.text) +',' +
                                   QuotedStr(mm_Chat.text) +')')

      else
        frm_Main.Koneksi.ExecuteDirect('update chatai  ' +
                                   ' set tanya=' + QuotedStr(edtTanya.text) +',' +
                                   ' jawaban=' + QuotedStr(mm_Chat.text) +
                                   ' where idx=' + DTChatAI.FieldByName('idx').AsString) ;
    end;

   spSave.Enabled:=false  ;
   DTChatAI.Refresh



end;

procedure Tfrm_ChatAI.spTanyaClick(Sender: TObject);
begin

   pbarProcess.Min:=0;
   pbarProcess.max:=100;

   if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     exit;
   end;

   if (Length(edtTanya.text)< 20) or
     (Length(edtTanya.text)> 1000) then
     begin
       ShowMessage('Teks Harus diantara 20 dan 1000 Karakter');
       exit;
     end;
     thrd_ChatAI.Active:=True;
     tmr_ChatAI.Enabled:=True;

end;

procedure Tfrm_ChatAI.sp_stopRequestClick(Sender: TObject);
begin
  tmr_ChatAI.Enabled:=false;
  pbarProcess.Position:=0;
  frm_Main.thrRequestAI.Terminate;

  ShowMessage('Request Dihentikan');
end;


procedure Tfrm_ChatAI.thrd_ChatAIRun(Sender: TIdThreadComponent);
var
    m : string;
    i :integer;
    t : string;
begin

    hit :=0;
    m := Trim(AsktoGemini(edtTanya.text)) ;
    t := 'Pertanyaan : ' + #13 + edtTanya.Text +#13#13 + 'Jawaban : ' + #13 ;
    if m<>'' then
       begin
        KALIMAT:='';
        m := AnsiReplaceText(m,'**','');
        m := AnsiReplaceText(m,';',#13);
        KALIMAT :=  m ;

        if ckAutoBaca.Checked then
           Katakan(KALIMAT);

        mm_Chat.Clear;
        mm_Chat.Text := t ;

        if ckAnimate.Checked then
           begin
            for i := 0  to Length(m) do
            begin
                mm_Chat.Text:= mm_Chat.Text + m[i];
                Sleep(14);
            end;

           end
        else
             mm_Chat.Text := t + m;


        spSave.Enabled:=true;
        tmr_ChatAI.Enabled:=false;

       end;
end;

procedure Tfrm_ChatAI.thrd_ChatAITerminate(Sender: TIdThreadComponent);
begin
  tmr_ChatAI.Enabled:=false;
  hit := 0 ;
  pbarProcess.Position:=0

end;

procedure Tfrm_ChatAI.Katakan(kalimat:string);
var
    s :string;
    f :TStringList;
    d : string;
begin
    kalimat := AnsiReplaceStr(kalimat,'*','');

    d := ExtractFilePath(Application.ExeName) + 'suara.py';

     s := 'from gtts import gTTS '+ #13 +
          'language = ''id'' '+ #13 +
          'text = """' + kalimat + '""" '+ #13 +
          'tts = gTTS(text=text, lang=language)'+ #13 +
          'tts.save("output.mp3")';

    DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'output.mp3'));
    try
      f := TStringList.Create;
      f.Add(s);
      f.SaveToFile(d );
    finally
    f.free;
    end;

    try
       PythonEngine1.ExecFile(d );
       VLCPlayerMP3.Play(ExtractFilePath(Application.ExeName) + 'output.mp3');
    except
      on e:exception do
      ShowMessage('Tidak Terhubung dengan Layanan GTTS , Periksa Koneksi Internet Anda');
    end;
end;
procedure Tfrm_ChatAI.edtTanyaKeyPress(Sender: TObject; var Key: char);
begin

  if Length(edtTanya.Text)>8 then
    if key=#13 then
      begin

        thrd_ChatAI.Active:=True;
        tmr_ChatAI.Enabled:=True;

      end;
end;

procedure Tfrm_ChatAI.edtTanyaChange(Sender: TObject);
begin

  if AnsiContainsStr(edtTanya.Text,'@') then
    begin
      edtTanya.Text:= AnsiReplaceStr(edtTanya.text,'@','');
      thrd_ChatAI.Active:=True;
      tmr_ChatAI.Enabled:=True;
    end;
end;


end.

