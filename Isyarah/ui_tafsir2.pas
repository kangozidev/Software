unit ui_tafsir2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  fpjson,
  fphttpclient,
  DB,
  ui_wait,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  StrUtils,
  Clipbrd,
  DBCtrls,
  ExtCtrls,
  RxDBGrid,
  HtmlView,
  IdThreadComponent,
  ZDataset,
  DBGrids,
  Buttons,
  ComCtrls,
  StdCtrls,
  Menus,
  ubrowser,
  urlmon,
  Grids,
  ATScrollBar;

type

  { TfrmTafsir2 }

  TfrmTafsir2 = class(TForm)
    DSBaris: TDataSource;
    grdKitab: TRxDBGrid;
    grdVolume: TRxDBGrid;
    grdVolume1: TRxDBGrid;
    Panel1: TPanel;
    DataSource1: TDataSource;
    DSVolume: TDataSource;
    DSPage: TDataSource;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    Panel4: TPanel;
    grd_Translate: TRxDBGrid;
    pnGPT: TPanel;
    scbRecord: TScrollBar;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    tbs_Source: TTabSheet;
    trdTerjemah: TIdThreadComponent;
    lbRec: TLabel;
    lbTotal: TLabel;
    PageControl1: TPageControl;
    pnl_Main: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnJudul: TPanel;
    pnl_browser: TPanel;
    pbar: TProgressBar;
    QVolume: TZQuery;
    QPage: TZQuery;
    DKitab: TZTable;
    spb_Translate: TSpeedButton;
    tbsArab: TTabSheet;
    tbsIndonesia: TTabSheet;
    DBaris: TZQuery;
    procedure dbSourceClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdKitabCellClick(Column: TColumn);
    procedure grdKitabDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdVolume1CellClick(Column: TColumn);
    procedure grdVolumeCellClick(Column: TColumn);
    procedure grd_TranslateCellClick(Column: TColumn);
    procedure mnRapikanClick(Sender: TObject);
    procedure mnSalinPartClick(Sender: TObject);
    procedure mnSalinAllClick(Sender: TObject);
    procedure QPageAfterOpen(DataSet: TDataSet);
    procedure QPageAfterScroll(DataSet: TDataSet);
    procedure grd_TranslateDblClick(Sender: TObject);
    procedure scbRecordChange(Sender: TObject);
    procedure spbCloseClick(Sender: TObject);
    procedure spb_closeClick(Sender: TObject);
    procedure spb_TranslateClick(Sender: TObject);
    procedure spCopyTerjemahClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure tbsIndonesiaShow(Sender: TObject);
    procedure tbs_SourceShow(Sender: TObject);
    procedure trdTerjemahRun(Sender: TIdThreadComponent);
  private
    FRM_Browser : TfrmBrowser;
    FRM_Wait : TfrmWait;
    FRM_AI   : TfrmBrowser;

   function AsktoGemini(s:string):string;
   procedure ShowTerjemah;
   function HasInternet: Boolean;

  public

  end;

var
  frmTafsir2: TfrmTafsir2;

implementation

uses ui_main;

{$R *.lfm}

{ TfrmTafsir2 }


function TfrmTafsir2.HasInternet: Boolean;
begin

     if URLDownloadToFile(nil, PChar('https://google.com'),
        PChar(ExtractFilePath(Application.ExeName) + 'inet.stat'), 0, nil) = 0 then
          Result := True
     else
         Result := false;


end;

procedure TfrmTafsir2.ShowTerjemah;
var
  h : TStringList;
  page : string = '';
  n,t:string;
begin

  With DBaris do
  begin
      first;
      while not eof do begin
      n :=  DBaris.FieldByName('nash').AsString;
      t :=  DBaris.FieldByName('translate').AsString;
      page := page + '<div dir="rtl" style="font-family:Nabi;font-size:16px;padding:14px">' + n +
                     '</div><br><br>' +
                     '<div dir="ltr" style="font-family:HvDTrial Pluto Sans Regular;'+
                     'font-size:14px;line-height:1.8;text-align:justify;'+
                     'background-color:#F0F7E2;padding:17px">' + t + '</div>' ;
      next;
      end;
  end;

   page := '<body style="background-color:#FEFEF4;padding:20px"><html>'  + page + '</html></body> ';
  try
  h := TStringList.Create;
  h.Text:=page;
  h.SaveToFile(ExtractFilePath(Application.ExeName)+ 'support/page/translate.htm');
  FRM_Browser.Chromium1.LoadURL(ExtractFilePath(Application.ExeName)+ 'support/page/translate.htm');


  finally
  h.free;
  end;

end;

procedure TfrmTafsir2.grdKitabCellClick(Column: TColumn);
begin

  With QVolume do
  begin
    close;
    ParamByName('v_kitab').AsString:= DKitab.FieldByName('kitab').AsString;
    open;
    pnJudul.Caption:= DKitab.FieldByName('kitab').AsString + ' Jilid 1';
  end;
  With QPage do
  begin
    close;
    ParamByName('v_kitab').AsString:= DKitab.FieldByName('kitab').AsString;
    ParamByName('v_jilid').AsString:= QVolume.FieldByName('jilid').AsString;
    open;
  end;

   scbRecord.Min:=1;
   scbRecord.Max:=QPage.RecordCount;
   lbRec.Caption:=IntToStr(QPage.RecNo);
   lbTotal.Caption:=IntToStr(QPage.RecordCount);
   ShowTerjemah;
   pnJudul.Caption:= DKitab.FieldByName('kitab').AsString + ' ' + QVolume.FieldByName('Jilid').AsString;

end;

procedure TfrmTafsir2.grdKitabDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin


end;

procedure TfrmTafsir2.grdVolume1CellClick(Column: TColumn);
begin
  lbRec.Caption:=IntToStr(QPage.RecNo);
  scbRecord.Position:=QPage.RecNo;
  ShowTerjemah;
end;


procedure TfrmTafsir2.FormShow(Sender: TObject);
begin

  FRM_Browser := TfrmBrowser.Create(self);
  FRM_Browser.Parent := pnl_browser;
  FRM_Browser.BorderStyle:=bsNone;
  FRM_Browser.Align:=alClient;
  FRM_Browser.Show;

  FRM_Wait := TfrmWait.Create(self);

  FRM_AI   := TfrmBrowser.create(self);
  FRM_AI.Parent := pnGPT;
  FRM_AI.BorderStyle:=bsNone;
  FRM_AI.Align:=alClient;
  FRM_AI.murl:='http://chatgpt.com';
  FRM_AI.Show;

  grd_Translate.Width:= trunc(tbs_Source.Width/2);
  tbsArab.Show;

  if not DKitab.Active then
      DKitab.open;

  pnJudul.Caption:= DKitab.FieldByName('kitab').AsString + ' Jilid 1';
  With QVolume do
  begin
    close;
    ParamByName('v_kitab').AsString:= DKitab.FieldByName('kitab').AsString;
    open;
  end;
  With QPage do
  begin
    close;
    ParamByName('v_kitab').AsString:= DKitab.FieldByName('kitab').AsString;
    ParamByName('v_jilid').AsString:= QVolume.FieldByName('jilid').AsString;
    open;
  end;

   scbRecord.Min:=1;
   scbRecord.Max:=QPage.RecordCount;
   lbRec.Caption:=IntToStr(QPage.RecNo);
   lbTotal.Caption:=IntToStr(QPage.RecordCount);
   ShowTerjemah;
   pnJudul.Caption:= DKitab.FieldByName('kitab').AsString + ' ' + QVolume.FieldByName('Jilid').AsString;


end;


procedure TfrmTafsir2.FormCreate(Sender: TObject);
begin

end;

procedure TfrmTafsir2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     if trdTerjemah.Active then
         trdTerjemah.Active:=false;
       FRM_Browser.free;
       FRM_Wait.Free;
       self.close;
end;

procedure TfrmTafsir2.dbSourceClick(Sender: TObject);
begin
  QPage.edit;
  QPage.post;
end;

procedure TfrmTafsir2.grdVolumeCellClick(Column: TColumn);
begin
  With QPage do
  begin
    close;
    ParamByName('v_kitab').AsString:= DKitab.FieldByName('kitab').AsString;
    ParamByName('v_jilid').AsString:= QVolume.FieldByName('jilid').AsString;
    open;
    scbRecord.Min:=1;
    scbRecord.Max:=RecordCount;
    lbRec.Caption:=IntToStr(QPage.RecNo);
    lbTotal.Caption:=IntToStr(QPage.RecordCount);
    ShowTerjemah;
    pnJudul.Caption:= DKitab.FieldByName('kitab').AsString + ' ' + QVolume.FieldByName('Jilid').AsString;

  end;
end;

procedure TfrmTafsir2.grd_TranslateCellClick(Column: TColumn);
begin
  Clipboard.Clear;
  Clipboard.AsText:='Terjemahkan dari Bahasa Arab kedalam bahasa Indonesia kalimat berikut ini ''' +
                  DBaris.FieldByName('nash').AsString + '''';
end;


procedure TfrmTafsir2.mnRapikanClick(Sender: TObject);
begin

  if Dialogs.MessageDlg('Merapikan Halaman ini [Mengubah " . "  menjadi LR/CF] ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
    QPage.edit;
    DBMemo1.Text:= AnsiReplaceText(DBMemo1.Text,'.','.' + #13#10);
    end;
end;

procedure TfrmTafsir2.mnSalinPartClick(Sender: TObject);
begin

     Clipboard.AsText:='Terjemahkan Kedalam Bahasa Indonesia *' + DBMemo1.SelText + '*';
end;

procedure TfrmTafsir2.mnSalinAllClick(Sender: TObject);
begin
    DBMemo1.SelectAll;
    Clipboard.AsText:='Terjemahkan Kedalam Bahasa Indonesia *' + DBMemo1.SelText + '*';
end;

procedure TfrmTafsir2.QPageAfterOpen(DataSet: TDataSet);
begin

end;

procedure TfrmTafsir2.QPageAfterScroll(DataSet: TDataSet);
var
  kitab,jilid,hal:string;
begin

  kitab := DKitab.FieldByName('id').AsString;
  jilid := QVolume.FieldByName('jilid_angka').AsString;

  hal   := QPage.FieldByName('hal_angka').AsString;


  with DBaris do
  begin
    close;
    sql.Clear;
    sql.Add(' select * from tafser2_trans where nom=' + kitab + ' and jilid=' + jilid +
            ' and halaman=' + hal );
    open;
  end;


end;

procedure TfrmTafsir2.grd_TranslateDblClick(Sender: TObject);
var
  trj : string;
begin
  Clipboard.Clear;
   if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     exit;
   end;


  Clipboard.AsText:='Terjemahkan dari Bahasa Arab kedalam bahasa Indonesia kalimat berikut ini ''' +
                  DBaris.FieldByName('nash').AsString + '''';

  DBaris.edit;
  trj :=  AsktoGemini( 'Terjemahkan dari Bahasa Arab kedalam bahasa Indonesia kalimat berikut ini "' +
                  DBaris.FieldByName('nash').AsString + '"');
  DBaris.FieldByName('translate').AsString := trj;
  DBaris.post;
  ShowMessage('Baris ini Selesai Diterjemahkan');
  DBaris.edit;
end;


function TfrmTafsir2.AsktoGemini(s:string):string;
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
    s  := AnsiReplaceStr(s,')','\)');
    s  := AnsiReplaceStr(s,'(','\(');
    s  := AnsiReplaceStr(s,'`','\`');

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
      Result  :=  content;
    except
      on E: Exception do
      begin

      //  ShowMessage( 'Terdapat Error dalam Request yaitu : ' + e.Message + #13 + ', Coba Ulangi');
      //  thrd_Terjemah.Terminate;
       // tmr_ChatAI.Enabled:=false;
        Result := '[... Terjemahan Gagal ...]';
      end;
    end;

  // Bebaskan sumber daya
    Client.Free;
    Response.Free;
    RequestBody.Free;
   // thrd_Terjemah.Terminate;
end;


procedure TfrmTafsir2.scbRecordChange(Sender: TObject);
begin

  QPage.RecNo:=scbRecord.Position;
  lbRec.Caption:=IntToStr(QPage.RecNo);
  ShowTerjemah;

end;

procedure TfrmTafsir2.spbCloseClick(Sender: TObject);
begin
  if trdTerjemah.Active then
    trdTerjemah.Active:=false;
  FRM_Browser.free;
  FRM_Wait.Free;
  self.close;
end;

procedure TfrmTafsir2.spb_closeClick(Sender: TObject);
begin
  self.close;
end;

procedure TfrmTafsir2.spb_TranslateClick(Sender: TObject);
var
  i , j: integer;
  ts : TstringList;
  sq : string;
  kitab,jilid,hal,baris:string;
begin

   if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     exit;
   end;


  try
    ts := Tstringlist.Create;
    ts.Text:= DBMemo1.Text;

    j := ts.Count-1;
    pbar.Position:=0;
    pbar.Max:=j;
    kitab := DKitab.FieldByName('id').AsString;
    jilid := QVolume.FieldByName('jilid_angka').AsString;

    hal   := QPage.FieldByName('hal_angka').AsString;
    frm_Main.Koneksi.ExecuteDirect(' delete from tafser2_trans where nom=' + kitab + ' and jilid=' + jilid +
                                     ' and halaman=' + hal );

  for i := 0 to j do
  begin


      if  Length(trim(ts.Strings[i]))<>0 then
      begin

         baris := InttoStr(i);
         sq:= 'Insert Into tafser2_trans(nom,jilid,baris,halaman,nash,translate) values (' +
              kitab + ',' + jilid + ',' + baris + ',' + hal + ',' +
              QuotedStr(ts.strings[i]) + ',''-'')';
         frm_Main.Koneksi.ExecuteDirect(sq);
       end;

  end;
  QPage.Refresh;
  trdTerjemah.Active:=true;


  finally
    ts.free;
  end;


end;



procedure TfrmTafsir2.spCopyTerjemahClick(Sender: TObject);
begin
   DBMemo1.SelectAll;
   Clipboard.AsText:='Terjemahkan Kedalam Bahasa Indonesia *' + DBMemo1.SelText + '*';
end;

procedure TfrmTafsir2.SpeedButton1Click(Sender: TObject);
begin
  QPage.Prior;
  lbRec.Caption:=IntToStr(QPage.RecNo);
end;

procedure TfrmTafsir2.SpeedButton2Click(Sender: TObject);
begin
  QPage.Next;
  lbRec.Caption:=IntToStr(QPage.RecNo);
end;

procedure TfrmTafsir2.SpeedButton3Click(Sender: TObject);
begin
  DKitab.open;
  With QVolume do
  begin
    close;
    ParamByName('v_kitab').AsString:= DKitab.FieldByName('kitab').AsString;
    open;
  end;
  With QPage do
  begin
    close;
    ParamByName('v_kitab').AsString:= DKitab.FieldByName('kitab').AsString;
    ParamByName('v_jilid').AsString:= QVolume.FieldByName('jilid').AsString;
    open;
  end;
end;

procedure TfrmTafsir2.tbsIndonesiaShow(Sender: TObject);
begin
    ShowTerjemah;
end;

procedure TfrmTafsir2.tbs_SourceShow(Sender: TObject);
begin
  FRM_AI.Chromium1.LoadURL('https://gemini.google.com');
end;

procedure TfrmTafsir2.trdTerjemahRun(Sender: TIdThreadComponent);
var
     kitab,jilid,hal,trj:string;
     j : integer;
begin

  kitab := DKitab.FieldByName('id').AsString;
  jilid := QVolume.FieldByName('jilid_angka').AsString;

  hal   := QPage.FieldByName('hal_angka').AsString;
  with DBaris do
  begin
    close;
    sql.Clear;
    sql.Add(' select * from tafser2_trans where nom=' + kitab + ' and jilid=' + jilid +
            ' and halaman=' + hal );
    open;
    j := RecordCount;

    pbar.Min:=0;
    pbar.Max:=j;

    first;
    While not eof do
    begin
         pbar.Position:=RecNo;
         trj :=  AsktoGemini( 'Terjemahkan dari Bahasa Arab kedalam bahasa Indonesia kalimat berikut ini "' +
                 DBaris.FieldByName('nash').AsString + '"');
         edit;
         DBaris.FieldByName('translate').AsString := trj;
         post;
         sleep(3000);
         next;
    end;
  end;
  ShowMessage('Data ini Selesai Diterjemahkan');
  QPage.edit;
  QPage.FieldByName('terjemah').AsString:='Diterjemahkan';
  QPage.Post;
  trdTerjemah.Terminate;
end;




end.

