unit ui_statistika;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  Variants,
  SysUtils,
  DB,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ZAbstractRODataset,
  TAGraph,
  Clipbrd,
  ComCtrls,
  ExtCtrls,
  StdCtrls,
  DBCtrls,
  Math,
  TASources,
  TASeries,
  RxDBGrid,
  RxDBGridExportSpreadSheet,
  HtmlView,
  StrUtils,
  cyPageControl,
  ZDataset,
  DBGrids,
  ui_keyboard,
  ubrowser,
  Buttons,
  HtmlGlobals,
  Grids, Menus, Types;


type

  { TfrmStatistika }

  TfrmStatistika = class(TForm)
    CAhuruf: TAreaSeries;
    cbBILANGAN: TComboBox;
    Chart1: TChart;
    Chart2: TChart;
    CKata: TBarSeries;
    ckFilterKata: TCheckBox;
    cyPageControl1: TcyPageControl;
    DSCariKata: TDataSource;
    DSSumKata: TDataSource;
    DSSumHuruf: TDataSource;
    DSSumSurat: TDataSource;
    DSQuranHafsNumeric: TDataSource;
    DSAyatJummal: TDataSource;
    DSHuruf: TDataSource;
    DSKataByStat: TDataSource;
    DSKata: TDataSource;
    DSHurufJummal: TDataSource;
    DSSumAyat: TDataSource;
    DSSuratJummal: TDataSource;
    DSKataJummal: TDataSource;
    DTChartSource: TZQuery;
    DTHuruf: TZTable;
    DTKata: TZTable;
    DTHurufJummal: TZQuery;
    DTSumHuruf: TZQuery;
    DTSuratJummal: TZQuery;
    DTKataJummal: TZQuery;
    DTAyatJummal: TZQuery;
    edtCariKata: TEdit;
    edtCariKataSebaran: TEdit;
    EdtCariKataArabBasic: TEdit;
    edtCountKataCari: TEdit;
    edtCountKata: TEdit;
    edtCountAyat: TEdit;
    edtCountSurat: TEdit;
    EdtCariKataArab: TEdit;
    GRDCariKataSebaran: TRxDBGrid;
    GRDJummalAyat: TRxDBGrid;
    GRDJummalHuruf: TRxDBGrid;
    GRDJummalKata: TRxDBGrid;
    GRDJummalSurat: TRxDBGrid;
    Grd_Huruf: TRxDBGrid;
    Grd_Kata: TRxDBGrid;
    icobuku: TImageList;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LCHuruf: TListChartSource;
    LCJummal: TListChartSource;
    LCKata: TListChartSource;
    LCKatBasic: TListChartSource;
    DTKataByStat: TZQuery;
    mnEksportSurat: TMenuItem;
    mnEksportSurat1: TMenuItem;
    mnEksportKata: TMenuItem;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    pg_main: TPageControl;
    pnl_PageSebaran: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel2: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    pmAyat: TPopupMenu;
    pmKata: TPopupMenu;
    pnCariKataDalamSebaran: TPanel;
    pnl_Page: TPanel;
    pmSurat: TPopupMenu;
    ExportExcel: TRxDBGridExportSpreadSheet;
    GRDCariKata: TRxDBGrid;
    RxDBGrid1: TRxDBGrid;
    spbJummal: TSpeedButton;
    spbStat: TSpeedButton;
    spb_CariKataBasic: TSpeedButton;
    spb_Clean: TSpeedButton;
    spb_JummalAll: TSpeedButton;
    spb_CariKata: TSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    tbs_chart: TTabSheet;
    tbs_daftarayat: TTabSheet;
    tbs_Ayat: TTabSheet;
    tbs_Nash: TTabSheet;
    tbs_SebaranKata: TTabSheet;
    tbs_HisabJummal: TTabSheet;
    DTCariKata: TZQuery;
    DTGet: TZQuery;
    DTQuranHafsNumeric: TZTable;
    DTSumSurat: TZQuery;
    DTSumAyat: TZQuery;
    DTSumKata: TZQuery;
    DTGetSifat: TZQuery;
    DTDetilAyat: TZQuery;
    ZQuery2: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure cbBILANGANChange(Sender: TObject);
    procedure DTAyatJummalAfterOpen(DataSet: TDataSet);
    procedure DTAyatJummalAfterScroll(DataSet: TDataSet);
    procedure DTHurufAfterOpen(DataSet: TDataSet);
    procedure DTHurufJummalAfterOpen(DataSet: TDataSet);
    procedure DTKataAfterOpen(DataSet: TDataSet);
    procedure DTKataJummalAfterOpen(DataSet: TDataSet);
    procedure DTSumKataAfterOpen(DataSet: TDataSet);
    procedure DTSuratJummalAfterOpen(DataSet: TDataSet);
    procedure DTSuratJummalAfterScroll(DataSet: TDataSet);
    procedure EdtCariKataArabBasicDblClick(Sender: TObject);

    procedure EdtCariKataArabDblClick(Sender: TObject);
    procedure EdtCariKataArabKeyPress(Sender: TObject; var Key: char);
    procedure edtCariKataDblClick(Sender: TObject);
    procedure EdtCariKataIndonesiaDblClick(Sender: TObject);
    procedure EdtCariKataIndonesiaKeyPress(Sender: TObject; var Key: char);
    procedure edtCariKataKeyPress(Sender: TObject; var Key: char);
    procedure edtCariKataSebaranDblClick(Sender: TObject);
    procedure edtCariKataSebaranKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure GRDCariKataDblClick(Sender: TObject);
    procedure GRDCariKataSebaranDblClick(Sender: TObject);
    procedure GRDJummalAyatCellClick(Column: TColumn);
    procedure GRDJummalAyatDblClick(Sender: TObject);
    procedure GRDJummalAyatDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GRDJummalAyatTitleClick(Column: TColumn);
    procedure GRDJummalKataCellClick(Column: TColumn);
    procedure GRDJummalSuratDblClick(Sender: TObject);
    procedure GRDSumHurufDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GRDJummalHurufDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GRDJummalHurufTitleClick(Column: TColumn);
    procedure GRDJummalKataDblClick(Sender: TObject);
    procedure GRDJummalKataDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GRDJummalKataTitleClick(Column: TColumn);
    procedure GRDSumAyatDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GRDSumKataDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GRDSumSuratDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GRDJummalSuratCellClick(Column: TColumn);
    procedure GRDJummalSuratDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GRDJummalSuratTitleClick(Column: TColumn);
    procedure Grd_HurufDblClick(Sender: TObject);
    procedure Grd_HurufTitleClick(Column: TColumn);
    procedure Grd_KataDblClick(Sender: TObject);
    procedure Grd_KataTitleClick(Column: TColumn);
    procedure mnEksportKataClick(Sender: TObject);
    procedure mnEksportSurat1Click(Sender: TObject);
    procedure mnEksportSuratClick(Sender: TObject);
    procedure Panel6Click(Sender: TObject);

    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure spbJummalClick(Sender: TObject);
    procedure spbKalkulatorClick(Sender: TObject);
    procedure spbStatClick(Sender: TObject);
    procedure spb_CariKataBasicClick(Sender: TObject);
    procedure spb_CariKataClick(Sender: TObject);
    procedure spb_CleanClick(Sender: TObject);
    procedure spb_JummalAllClick(Sender: TObject);
    procedure tbs_SebaranKataContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    FRM_Calc : Tfrm_Keyboard;
    FRM_Page : TfrmBrowser;
    FRM_Page_Sebaran : TfrmBrowser;

    function LoadDataChart(sq:string):String;
    procedure extrakkata(ids:string;ida:string;k:string);
    procedure SortirSesuaiKolomQuery(d:TZQuery;k:string)  ;
    procedure LoadDataSuratAyatKataHuruf(ids:string);
    procedure LoadDataAyatKataHuruf(ids:string;ida:string);
    function SetWarnaJenis(huruf:String):String;
    function SetWarnaElemen(huruf:String):String;
    function ExtractJenis(kata:String):String;
    function SetTerjemahByID(id:string):string;
    procedure ShowAyat(ida:string);
    function JabarkanKata(ida:string):string;
    function JabarkanHuruf(ida:string):string;
    function JabarkanHurufPlain(ida:string):string;
    function SplitAyatPerHuruf(ayat:string;delimiter:string):String;
    procedure OpenPage(script:string;respon:string);
    function GetTerjemahByKata(kata:string):string;
    procedure TotalAllData;
    function SetInfoHijaiyah(k:String):string;
    function DivideBigNumber(A: string;B:String): string;
    function GetItem(sq:string):String;
    procedure SortirSesuaiKolomTabel(d:TZTable;k:string);
    procedure TampilkaAyatByVariasiTerjemahan(k:string);
  public
    const MAX_LENGTH = 100;  { Panjang maksimum bilangan }
    function SetWarnaHurufByJenis(h:string):string;
    procedure ShowSumDigit;
    function IsInteger(const S: string): Boolean;
  end;

var
  frmStatistika: TfrmStatistika;
  st     : TFSortType;
  SQ_SS  : string = '';
  SQ_SA  : string = '';
  SQ_SK  : string = '';
  SQ_SH  : string = '';
  BILANGAN : integer ;
  Tandai : boolean = false;



implementation

uses ui_main;

{$R *.lfm}

{ TfrmStatistika }

procedure TfrmStatistika.Grd_HurufDblClick(Sender: TObject);
var
  s:string;
  h : string;
  r : string;
begin

  h := DTHuruf.FieldByName('h1').AsString;

  DTKata.Filtered:=false;
  DTKata.Filter:='h=' + QuotedStr(h);
  DTKata.Filtered:=true;

  s := ' SELECT p.surat,COUNT(h1) AS j,"" as D ' +
       ' FROM ' +
       ' huruf h ' +
       ' INNER JOIN quran_pos p ' +
       ' ON h.gid=p.id ' +
       ' WHERE h1='+ QuotedStr (h)+
       ' GROUP BY ' +
       ' p.surat ' ;

  r := LoadDataChart(s);

  LCHuruf.DataPoints.Text := r;

  CAhuruf.Source := LCHuruf;


end;

procedure TfrmStatistika.Grd_HurufTitleClick(Column: TColumn);
begin
  SortirSesuaiKolomTabel(DTHuruf,Column.FieldName);
end;

procedure TfrmStatistika.Grd_KataDblClick(Sender: TObject);
var
  s,k,r : string;
begin

  k := DTKata.FieldByName('basic').AsString;
  s := ' SELECT k.nomor_surat,'+
       ' COUNT(k.nomor_surat) AS jk,'+
       ' "" as D FROM terjemah_kata k ' +
       ' WHERE k.basic=' + QuotedStr(k)  + ' ' +
       ' GROUP BY  ' +
       ' k.nomor_surat  ';

  r := LoadDataChart(s);
  LCKata.DataPoints.Text := r;

  CKata.Source := LCKata;

  DTKataByStat.close;
  DTKataByStat.ParamByName('v_basic').AsString:= k;
  DTKataByStat.open;
  TampilkaAyatByVariasiTerjemahan('basic');

end;

procedure TfrmStatistika.Grd_KataTitleClick(Column: TColumn);
begin
  SortirSesuaiKolomTabel(DTKata,Column.FieldName);
end;

procedure TfrmStatistika.mnEksportKataClick(Sender: TObject);
var
  f : integer;
begin
 randomize;
 f := RandomRange(10000,99999);
 ExportExcel.RxDBGrid := GRDJummalKata;
 ExportExcel.FileName:=ExtractFilePath(Application.ExeName) + '/support/temp/jummalkata' + Inttostr(f) +'.xls';
 ExportExcel.Execute;
end;

procedure TfrmStatistika.mnEksportSurat1Click(Sender: TObject);
var
  f : integer;
begin
 randomize;
  f := RandomRange(10000,99999);
   ExportExcel.RxDBGrid := GRDJummalAyat;
  ExportExcel.FileName:=ExtractFilePath(Application.ExeName) + '/support/temp/jummalayat' + Inttostr(f) +'.xls';
  ExportExcel.Execute;
end;

procedure TfrmStatistika.mnEksportSuratClick(Sender: TObject);
var
  f : integer;
begin
 randomize;
  f := RandomRange(10000,99999);
  ExportExcel.RxDBGrid := GRDJummalSurat;
  ExportExcel.FileName:=ExtractFilePath(Application.ExeName) + '/support/temp/jummalsurat' + Inttostr(f) +'.xls';
  ExportExcel.Execute;
end;

procedure TfrmStatistika.Panel6Click(Sender: TObject);
begin

end;


procedure TfrmStatistika.RxDBGrid1DblClick(Sender: TObject);
begin
 TampilkaAyatByVariasiTerjemahan('kata');

end;

procedure TfrmStatistika.spbJummalClick(Sender: TObject);
begin
  tbs_HisabJummal.Show;
end;

procedure TfrmStatistika.spbKalkulatorClick(Sender: TObject);
begin
  FRM_Calc.showModal;
end;

procedure TfrmStatistika.spbStatClick(Sender: TObject);
begin
  tbs_SebaranKata.show;
end;

procedure TfrmStatistika.spb_CariKataBasicClick(Sender: TObject);
begin

if EdtCariKataArabBasic.Text='' then exit;

 With DTSuratJummal do
     begin
      close;
      sql.Clear;
      sql.Add(' SELECT '+
              ' n.sura_mushaf_order as `surat`,'+
              ' count(aya_no) as `Jumlah Ayat`, '+
              ' sum(n.aya_words_count)  as `Jumlah Kata`,'+
              ' sum(n.aya_letters_count) as `Jumlah Huruf`, '+
              ' sum(aya_jomal) as `Jummal`'+
              ' FROM quran_hafs_numeric n '+
              ' WHERE sura_mushaf_order in (' +
              ' SELECT nomor_surat from terjemah_kata where basic=' +
              QuotedStr(EdtCariKataArabBasic.text) +  ') ' +
              ' Group by  n.sura_mushaf_order '   +
              ' order by n.sura_mushaf_order');
      open;
    end;

    With DTAyatJummal do
    begin
      sql.Clear;
      sql.Add(' SELECT n.ida as ida,' +
              ' n.sura_mushaf_order as ids,' +
              ' n.aya_no as ayat,' +
              ' n.aya_text,' +
              ' n.spoken_aya_text ,' +
              ' n.spoken_aya_words ,' +
              ' n.aya_letters ,' +
              ' n.aya_words_count  as `Jumlah Kata`, ' +
              ' n.aya_letters_count as `Jumlah Huruf`,  ' +
              ' aya_jomal as Jummal,' +
              ' sum_of_digit(concat(n.aya_letters_count,aya_jomal)) as SDG ' +
              ' FROM quran_hafs_numeric n ' +
              ' WHERE ida in (' +
              ' SELECT id_ayat  from terjemah_kata where basic=' +
              QuotedStr(EdtCariKataArabBasic.text) + ')' ) ;
      open;

   end;

    With DTKataJummal do
         begin
           close;
           sql.Clear;
           sql.Add(' SELECT ' +
                   ' ids, ' +
                   ' ida, ' +
                   ' kata, ' +
                   ' CHAR_LENGTH(trim(kata)) as JH,' +
                   ' COUNT(kata) AS terulang ,' +
                   ' getJummalKata(trim(kata)) as JMK ,' +
                   ' COUNT(kata) * getJummalKata(trim(kata)) as TJMK ' +
                   ' FROM quran_hafs_kata q ' +
                   ' INNER JOIN f_ref_kosakata f ' +
                   ' ON q.kata=f.arab ' +
                   ' Where f.basic=' + QuotedStr(EdtCariKataArabBasic.text) +
                   ' GROUP BY ids, ida, kata'+
                   ' ORDER by id asc');
           open;

       end;
    ShowSumDigit;
end;

procedure TfrmStatistika.spb_CariKataClick(Sender: TObject);
begin

 if EdtCariKataArab.Text='' then exit;

 With DTSuratJummal do
     begin
      close;
      sql.Clear;
      sql.Add(' SELECT '+
              ' n.sura_mushaf_order as `surat`,'+
              ' count(aya_no) as `Jumlah Ayat`, '+
              ' sum(n.aya_words_count)  as `Jumlah Kata`,'+
              ' sum(n.aya_letters_count) as `Jumlah Huruf`, '+
              ' sum(aya_jomal) as `Jummal`'+
              ' FROM quran_hafs_numeric n '+
              ' WHERE spoken_aya_words LIKE CONCAT(''%'',''\'''',''' + trim(EdtCariKataArab.text) +
              ''',''\'''',''%'')'+
              ' GROUP BY '+
              ' n.sura_mushaf_order');
      open;
    end;

    With DTAyatJummal do
    begin
      sql.Clear;
      sql.Add(' SELECT n.ida as ida,' +
              ' n.sura_mushaf_order as ids,' +
              ' n.aya_no as ayat,' +
              ' n.aya_text,' +
              ' n.spoken_aya_text ,' +
              ' n.spoken_aya_words ,' +
              ' n.aya_letters ,' +
              ' n.aya_words_count  as `Jumlah Kata`, ' +
              ' n.aya_letters_count as `Jumlah Huruf`,  ' +
              ' aya_jomal as Jummal,' +
              ' sum_of_digit(concat(n.aya_letters_count,aya_jomal)) as SDG ' +
              ' FROM quran_hafs_numeric n ' +
              ' WHERE spoken_aya_words LIKE CONCAT(''%'',''\'''',''' + trim(EdtCariKataArab.text) +
              ''',''\'''',''%'')');
      open;

   end;

   With DTKataJummal do
     begin
       close;
       sql.Clear;
       sql.Add(' SELECT ' +
               ' ids, ' +
               ' ida, ' +
               ' kata, ' +
               ' CHAR_LENGTH(trim(kata)) as JH,' +
               ' COUNT(kata) AS terulang ,' +
               ' getJummalKata(trim(kata)) as JMK ,' +
               ' COUNT(kata) * getJummalKata(trim(kata)) as TJMK ' +
               ' FROM quran_hafs_kata q ' +
               ' Where q.kata=' + QuotedStr(EdtCariKataArab.text) +
               ' GROUP BY ids, ida, kata'+
               ' ORDER by id asc');
       open;

   end;

   ShowSumDigit;
end;

procedure TfrmStatistika.spb_CleanClick(Sender: TObject);
begin
  DTKataJummal.Filtered:=false;
  EdtCariKataArab.Clear;
  EdtCariKataArabBasic.Clear;

  DTCariKata.Close;
  DTCariKata.SQL.Clear;
  DTCariKata.SQL.Add('select * from v_ref_kosakata where indonesia like' +
                    QuotedStr('%' + edtCariKata.text +'%'));
  DTCariKata.Open;

end;

procedure TfrmStatistika.spb_JummalAllClick(Sender: TObject);
begin

 With DTAyatJummal do
  begin

    sql.Clear;
    sql.Add(' SELECT n.ida as ida,' +
            ' n.sura_mushaf_order as ids ,' +
            ' n.aya_text as aya_text,' +
            ' n.aya_no as ayat,' +
            ' n.aya_words_count  as `Jumlah Kata`, ' +
            ' n.aya_letters_count as `Jumlah Huruf`,  ' +
            ' aya_jomal as Jummal,' +
            ' sum_of_digit(concat(n.aya_letters_count,aya_jomal)) as SDG ' +
            ' FROM quran_hafs_numeric n ' );
  open;

  end;

  With DTKataJummal do
  begin


    close;
    sql.Clear;
    sql.Add(' SELECT ids, ' +
            ' count(ida) as ida, ' +
            ' kata ,' +
            ' sum(JH) as `JH`,' +
            ' sum(terulang) as `Terulang`,' +
            ' sum(JMK) as `JMK`,' +
            ' sum(TJMK) as `TJMK`' +
            ' FROM F_JUMMAL_KATA' +
            ' GROUP BY ids,kata');
    open;

  end;

  With DTHurufJummal do
  begin

    close;
    sql.Clear;
    sql.Add(' SELECT h.ids, h.huruf,  r.nilai,'+
            ' count(ids) as terulang, '+
            ' sum(r.nilai) as jummal '  +
            ' FROM '+
            ' quran_hafs_huruf h '+
            ' INNER JOIN '+
            ' ref_jummal r ON h.huruf=r.huruf '+
            ' GROUP BY '+
            ' h.huruf  ');
    open;

  end;

  if EdtCariKataArab.text <> '' then
  begin
    DTKataJummal.Filtered:=false;
    DTKataJummal.Filter := 'kata=' + QuotedStr(EdtCariKataArab.text);
    DTKataJummal.Filtered:=True;

  end;

end;

procedure TfrmStatistika.tbs_SebaranKataContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TfrmStatistika.TampilkaAyatByVariasiTerjemahan(k:string);
var
   h : string = '';
   t : string = '';
   ts : TStringList;
begin

  with DTDetilAyat do
  begin
    close;
    SQL.Clear;

    if k='basic' then

      sql.Add('select distinct arab_harokat as `Kata`, Arti,nama_id as `Nama Surat`,id_ayat as `QS`,'+
              'ay as `Ayat` , terjemah , utsmani, ayat_utsmani from ' +
              'v_detil_ayat_kataterkait where basic=' +
             QuotedStr(DTKata.FieldByName('basic').AsString))
    else if k='kata' then
      sql.Add('select distinct arab_harokat as `Kata`,Arti,nama_id as `Nama Surat`,id_ayat as `QS`,'+
              'ay as `Ayat` , terjemah , utsmani, ayat_utsmani from ' +
              'v_detil_ayat_kataterkait where arab_harokat=' +
              QuotedStr(DTKataByStat.FieldByName('arab').AsString)) ;

    open;

    tbs_daftarayat.Caption:= 'Jumlah Ayat : ' + Inttostr(RecordCount) ;

    h :='<body style="background-color:#F0F7EA"> ' +
        '<table width=100% border=0>';

    while not eof do
     begin
       t := AnsiReplaceText(FieldByName('ayat_utsmani').AsString,FieldByName('Kata').AsString,
            '<span style="background:#A3F6B8">' + FieldByName('Kata').AsString + '</span>');

       h := h +   '<tr valign="top">' ;
       h := h +   '<td width=50% style="font-family:'+ frm_Main.FONT_LATIN + ';padding:15px;text-align:left">' +
                  FieldByName('terjemah').AsString +
                  '&nbsp;&nbsp; <b>(' + FieldByName('Nama Surat').AsString + '&nbsp;&nbsp;' +
                  FieldByName('QS').AsString + ') </b><br> ' +
                  FieldByName('Kata').AsString + ' Arti => <span style="background:#FFC4AE">' +
                  FieldByName('Arti').AsString + '</span>' +
                  '</td>'  +
                  '<td width=50% dir="rtl" style="font-family:'+ frm_Main.FONT_QR + ';font-size:20px;'+
                  'padding:12px;text-align:right">' +
                  t + '</td></tr>';

       next;
     end;

     h := h + '</table>';

     try
      ts := TStringList.create;
      ts.Text:= h;
      ts.SaveToFile(ExtractFilePath(Application.ExeName) + 'support/page/variasi.html');
      FRM_Page_Sebaran.Chromium1.LoadURL ( ExtractFilePath(Application.ExeName) + 'support/page/variasi.html');
     finally
      ts.Free;
     end;



  end;

end;


procedure TfrmStatistika.FormShow(Sender: TObject);
begin


  FRM_Page := TfrmBrowser.Create(self);
  FRM_Page.Parent := pnl_Page;
  FRM_Page.Align:=alClient;
  FRM_Page.AddressPnl.Hide;
  FRM_Page.BorderStyle:=bsnOne;
  FRM_Page.Show;

  FRM_Page_Sebaran := TfrmBrowser.Create(self);
  FRM_Page_Sebaran.Parent := pnl_PageSebaran;
  FRM_Page_Sebaran.Align:=alClient;
  FRM_Page_Sebaran.AddressPnl.Hide;
  FRM_Page_Sebaran.BorderStyle:=bsnOne;
  FRM_Page_Sebaran.Show;


  BILANGAN := 19;
  if not DTHuruf.Active then
  begin
    DTHuruf.open;

    DTKata.open;
    DTSuratJummal.Open;
    DTQuranHafsNumeric.open;
    DTCariKata.open;
  end;

   LoadDataSuratAyatKataHuruf('1');
   LoadDataAyatKataHuruf ('1','1');


end;

procedure TfrmStatistika.GRDCariKataDblClick(Sender: TObject);
begin
  EdtCariKataArab.text := DTCariKata.FieldByName('arab').AsString;
  EdtCariKataArabBasic.text := DTCariKata.FieldByName('basic').AsString;
end;

procedure TfrmStatistika.GRDCariKataSebaranDblClick(Sender: TObject);
 var
   s,k,r : string;
 begin

   k := DTCariKata.FieldByName('basic').AsString;
   s := ' SELECT k.nomor_surat,'+
        ' COUNT(k.nomor_surat) AS jk,'+
        ' "" as D FROM terjemah_kata k ' +
        ' WHERE k.basic=' + QuotedStr(k)  + ' ' +
        ' GROUP BY  ' +
        ' k.nomor_surat  ';

   r := LoadDataChart(s);
   LCKata.DataPoints.Text := r;

   CKata.Source := LCKata;

   DTKataByStat.close;
   DTKataByStat.ParamByName('v_basic').AsString:= k;
   DTKataByStat.open;
   TampilkaAyatByVariasiTerjemahan('kata');
end;

procedure TfrmStatistika.GRDJummalAyatCellClick(Column: TColumn);
begin
end;

procedure TfrmStatistika.GRDJummalAyatDblClick(Sender: TObject);
var
 ida : string;
 ids : string;
 rn : integer;
 d : string = '';
 i : integer;
begin


 for i := 0 to DTAyatJummal.FieldCount-1 do
 d := d + DTAyatJummal.Fields[i].AsString + ',' ;

  ids := DTAyatJummal.Fields[1].AsString;

  LoadDataAyatKataHuruf (ids,ida);

  rn := DTAyatJummal.RecNo;

  DTAyatJummal.RecNo := rn;

  if (EdtCariKataArab.text <> '') and
     (ckFilterKata.Checked) then
  begin
    DTKataJummal.Filtered:=false;
    DTKataJummal.Filter := 'kata=' + QuotedStr(EdtCariKataArab.text);
    DTKataJummal.Filtered:=True;

  end
  else
   DTKataJummal.Filtered:=false;

  ShowSumDigit;
  ida := DTAyatJummal.FieldByName('ida').AsString;
  ShowAyat(ida);


end;


procedure TfrmStatistika.GRDJummalAyatDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Nilai : Variant;
   v : integer;
begin

  //ShowMessage(BoolToStr(Tandai));

    Nilai := Column.Field.Value;

    if VarIsNumeric(nilai) then
    begin
      if nilai mod BILANGAN = 0 then
        GRDJummalAyat.Canvas.Font.Color:=clRed
      else
        GRDJummalAyat.Canvas.Font.Color:=clBlack;


    end;
      GRDJummalAyat.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmStatistika.GRDJummalAyatTitleClick(Column: TColumn);
begin
  SortirSesuaiKolomQuery(DTAyatJummal,Column.FieldName);
end;

procedure TfrmStatistika.GRDJummalKataCellClick(Column: TColumn);
var
  d : string = '';
  i : integer;
  ida : string;
begin

  Clipboard.Clear;

  for i := 0 to DTKataJummal.FieldCount-1 do
  d := d + DTKataJummal.Fields[i].AsString + ',' ;


  Clipboard.AsText := d;
end;

procedure TfrmStatistika.GRDJummalSuratDblClick(Sender: TObject);
var
  ida : string;
begin
   ida := DTAyatJummal.FieldByName('ida').AsString;
  ShowAyat(ida);
end;

procedure TfrmStatistika.GRDSumHurufDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Nilai : variant;
begin
    Nilai := Column.Field.Value;

    if VarIsNumeric(nilai) then
    begin

      if Nilai mod BILANGAN = 0 then
     //   GRDSumHuruf.Canvas.Font.Color:=clRed
      else
      //  GRDSumHuruf.Canvas.Font.Color:=clBlack;

    //  GRDSumHuruf.DefaultDrawColumnCell(Rect, DataCol, Column, State)

    end;

  //  GRDSumHuruf.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmStatistika.GRDJummalHurufDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Nilai : variant;
begin
    Nilai := Column.Field.Value;
  
    if VarIsNumeric(nilai) then
    begin

      if Nilai mod BILANGAN = 0 then
        GRDJummalHuruf.Canvas.Font.Color:=clRed
      else
        GRDJummalHuruf.Canvas.Font.Color:=clBlack;

      GRDJummalHuruf.DefaultDrawColumnCell(Rect, DataCol, Column, State)

    end;

    GRDJummalHuruf.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmStatistika.GRDJummalHurufTitleClick(Column: TColumn);
begin
  SortirSesuaiKolomQuery(DTHurufJummal,Column.FieldName);
end;




procedure TfrmStatistika.GRDJummalKataDblClick(Sender: TObject);
var
   ida : string;
begin

  if Dialogs.MessageDlg('Apakah Anda Akan mendari Kata ini didalam keseluruhan Surat ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin

    EdtCariKataArab.text := DTKataJummal.Fields[2].AsString;
  With DTSuratJummal do
     begin
      close;
      sql.Clear;
      sql.Add(' SELECT '+
              ' n.sura_mushaf_order as `surat`,'+
              ' count(aya_no) as `Jumlah Ayat`, '+
              ' sum(n.aya_words_count)  as `Jumlah Kata`,'+
              ' sum(n.aya_letters_count) as `Jumlah Huruf`, '+
              ' sum(aya_jomal) as `Jummal`'+
              ' FROM quran_hafs_numeric n '+
              ' WHERE spoken_aya_words LIKE CONCAT(''%'',''\'''',''' + trim(EdtCariKataArab.text) +
              ''',''\'''',''%'')'+
              ' GROUP BY '+
              ' n.sura_mushaf_order');
      open;
    end;

    With DTAyatJummal do
    begin
      sql.Clear;
      sql.Add(' SELECT n.ida as ida,' +
              ' n.sura_mushaf_order as ids,' +
              ' n.aya_no as ayat,' +
              ' n.aya_text,' +
              ' n.spoken_aya_text ,' +
              ' n.spoken_aya_words ,' +
              ' n.aya_letters ,' +
              ' n.aya_words_count  as `Jumlah Kata`, ' +
              ' n.aya_letters_count as `Jumlah Huruf`,  ' +
              ' aya_jomal as Jummal,' +
              ' sum_of_digit(concat(n.aya_letters_count,aya_jomal)) as SDG ' +
              ' FROM quran_hafs_numeric n ' +
              ' WHERE spoken_aya_words LIKE CONCAT(''%'',''\'''',''' + trim(EdtCariKataArab.text) +
              ''',''\'''',''%'')');
      open;

   end;

    end;


  ida := DTKataJummal.FieldByName('ida').AsString;
  ShowAyat(ida);

end;

procedure TfrmStatistika.GRDJummalKataDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Nilai : variant;
begin

  Nilai := Column.Field.Value;
  
    if VarIsNumeric(nilai) then
    begin

    if Nilai mod BILANGAN = 0 then
      GRDJummalKata.Canvas.Font.Color:=clRed
    else
      GRDJummalKata.Canvas.Font.Color:=clBlack;
    end;
  GRDJummalKata.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;


procedure TfrmStatistika.GRDJummalKataTitleClick(Column: TColumn);
begin
  SortirSesuaiKolomQuery(DTKataJummal,Column.FieldName);
end;

procedure TfrmStatistika.GRDSumAyatDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Nilai : variant;
begin
    Nilai := Column.Field.Value;

    if VarIsNumeric(nilai) then
    begin

      if Nilai mod BILANGAN = 0 then
       // GRDSumAyat.Canvas.Font.Color:=clRed
      else
      //  GRDSumAyat.Canvas.Font.Color:=clBlack;

     // GRDSumAyat.DefaultDrawColumnCell(Rect, DataCol, Column, State)

    end;

   // GRDSumAyat.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmStatistika.GRDSumKataDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Nilai : variant;
begin
    Nilai := Column.Field.Value;

    if VarIsNumeric(nilai) then
    begin

      if Nilai mod BILANGAN = 0 then
       // GRDSumKata.Canvas.Font.Color:=clRed
      else
      //  GRDSumKata.Canvas.Font.Color:=clBlack;

     // GRDSumKata.DefaultDrawColumnCell(Rect, DataCol, Column, State)

    end;

  //  GRDSumKata.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmStatistika.GRDSumSuratDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Nilai : variant;
begin
    Nilai := Column.Field.Value;

    if VarIsNumeric(nilai) then
    begin

      if Nilai mod BILANGAN = 0 then
       // GRDSumSurat.Canvas.Font.Color:=clRed
      else
      //  GRDSumSurat.Canvas.Font.Color:=clBlack;

     // GRDSumSurat.DefaultDrawColumnCell(Rect, DataCol, Column, State)

    end;

  //  GRDSumSurat.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmStatistika.GRDJummalSuratCellClick(Column: TColumn);
var
  ids ,ida: string;
  rn : integer;
  d : string = '';
  i : integer;
begin

  Clipboard.Clear;

  for i := 0 to DTSuratJummal.FieldCount-1  do
  d := d + DTSuratJummal.Fields[i].AsString + ',' ;

  Clipboard.AsText := d;



  SQ_SS:= DTSuratJummal.SQL.text;
  ids := DTSuratJummal.FieldByName('surat').AsString;
  LoadDataSuratAyatKataHuruf(ids);


  tbs_Ayat.Show;

  rn := DTSuratJummal.RecNo;

  DTSuratJummal.RecNo:=rn;

  if (EdtCariKataArab.text <> '') and
     (ckFilterKata.Checked) then
  begin
    DTKataJummal.Filtered:=false;
    DTKataJummal.Filter := 'kata=' + QuotedStr(EdtCariKataArab.text);
    DTKataJummal.Filtered:=True;

  end
  else
   DTKataJummal.Filtered:=false;

 ShowSumDigit;

end;


procedure TfrmStatistika.GRDJummalSuratDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Nilai : variant;
begin

  Nilai := Column.Field.Value;

  if Nilai mod BILANGAN = 0 then
    GRDJummalSurat.Canvas.Font.Color:=clRed
  else
    GRDJummalSurat.Canvas.Font.Color:=clBlack;

  GRDJummalSurat.DefaultDrawColumnCell(Rect, DataCol, Column, State);



end;


procedure TfrmStatistika.GRDJummalSuratTitleClick(Column: TColumn);
begin
  SortirSesuaiKolomQuery(DTSuratJummal,Column.FieldName);
end;

procedure TfrmStatistika.Button1Click(Sender: TObject);
var
  s : WideString;
begin
  with DTCariKata do
  begin
    close;
    open;
    Application.ProcessMessages;
    while not eof do
    begin

        extrakkata(Fields[0].AsString,Fields[1].AsString,Fields[3].AsString);
        next;
    end;
  end;
end;

procedure TfrmStatistika.cbBILANGANChange(Sender: TObject);
begin

  BILANGAN:= StrToInt(cbBILANGAN.Text);

  GRDJummalAyat.Refresh;
  GRDJummalSurat.Refresh;
  GRDJummalHuruf.Refresh;
  GRDJummalKata.Refresh;
  //GRDSumAyat.Refresh;
 // //GRDSumSurat.Refresh;
 // GRDSumHuruf.Refresh;
//  GRDSumKata.Refresh;

end;

procedure TfrmStatistika.DTAyatJummalAfterOpen(DataSet: TDataSet);
begin
  SQ_SA:= DTAyatJummal.SQL.text;
end;


procedure TfrmStatistika.DTAyatJummalAfterScroll(DataSet: TDataSet);
begin
  //
end;

procedure TfrmStatistika.DTHurufAfterOpen(DataSet: TDataSet);
var
  s:string;
  h : string;
  r : string;
begin

  h := DTHuruf.FieldByName('h1').AsString;

  DTKata.Filtered:=false;
  DTKata.Filter:='h=' + QuotedStr(h);
  DTKata.Filtered:=true;

  s := ' SELECT p.surat,COUNT(h1) AS j,"" as D ' +
       ' FROM ' +
       ' huruf h ' +
       ' INNER JOIN quran_pos p ' +
       ' ON h.gid=p.id ' +
       ' WHERE h1='+ QuotedStr (h)+
       ' GROUP BY ' +
       ' p.surat ' ;

  r := LoadDataChart(s);

  LCHuruf.DataPoints.Text := r;

  CAhuruf.Source := LCHuruf;


end;

procedure TfrmStatistika.DTHurufJummalAfterOpen(DataSet: TDataSet);
begin
  SQ_SH:= DTHurufJummal.SQL.text;
end;

procedure TfrmStatistika.DTKataAfterOpen(DataSet: TDataSet);
var
  s,k,r : string;
begin

  k := DTKata.FieldByName('basic').AsString;
  s := ' SELECT k.nomor_surat,'+
       ' COUNT(k.nomor_surat) AS jk,'+
       ' "" as D FROM terjemah_kata k ' +
       ' WHERE k.basic=' + QuotedStr(k)  + ' ' +
       ' GROUP BY  ' +
       ' k.nomor_surat  ';

  r := LoadDataChart(s);
  LCKata.DataPoints.Text := r;

  CKata.Source := LCKata;

  DTKataByStat.close;
  DTKataByStat.ParamByName('v_basic').AsString:= k;
  DTKataByStat.open;

end;

procedure TfrmStatistika.DTKataJummalAfterOpen(DataSet: TDataSet);
begin
  SQ_SK := DTKataJummal.SQL.text;
end;

procedure TfrmStatistika.DTSumKataAfterOpen(DataSet: TDataSet);
begin

end;

procedure TfrmStatistika.DTSuratJummalAfterOpen(DataSet: TDataSet);
begin

  SQ_SS:= DTSuratJummal.SQL.text;


end;

procedure TfrmStatistika.DTSuratJummalAfterScroll(DataSet: TDataSet);
var
s,r : string;
ids : string;
begin

  SQ_SS:= DTSuratJummal.SQL.text;
  ids := DTSuratJummal.FieldByName('surat').AsString;
  LoadDataSuratAyatKataHuruf(ids);
 // TotalAllData;


end;

procedure TfrmStatistika.EdtCariKataArabBasicDblClick(Sender: TObject);
begin
  EdtCariKataArabBasic.Clear;
end;


function TfrmStatistika.DivideBigNumber(A: string;B:String): string;
var
  i, digit, remainder: Integer;
  current: string;
  resultStr: string;
  pembagi:integer;
begin
  resultStr := '';
  remainder := 0;
  pembagi := StrToInt(B);

  for i := 1 to Length(A) do
  begin
    digit := Ord(A[i]) - Ord('0');
    remainder := remainder * 10 + digit;
    current := IntToStr(remainder div pembagi);
    if (resultStr <> '') or (current <> '0') then
      resultStr := resultStr + current;
    remainder := remainder mod pembagi;
  end;

  if resultStr = '' then
    resultStr := '0';

  Result := resultStr;
end;


function TfrmStatistika.SetTerjemahByID(id:string):string;
begin
  with DTGet do
   begin
     close;
     sql.Clear;
     sql.Add('select indoText from quran_id where id_ayat=' + QuotedStr(Trim(id)));
     open;
     Result := Fields[0].AsString;

   end;
end;


procedure TfrmStatistika.ShowAyat(ida:string);
var
  ayat_irab : string='';
  ayat_non_irab : string='';
  terjemahan : string='';
  kata_irab : string='';
  kata_plain :string='';
  huruf_plain : string='';
  divh : string;
  gbr : string;
  page : string;
begin

  ayat_irab  := GetItem('select teks_ayat from quran_id where id_ayat=' + QuotedStr(ida));
  //ayat_non_irab := DTAyatJummal.FieldByName('spoken_aya_text').AsString;
  terjemahan := '<div dir="ltr" style="font-family:HvDTrial Pluto Sans Regular;text-align:center;font-size:15px">' +
                SetTerjemahByID(ida) +
                '</div>';

  kata_irab := JabarkanKata(ida) ;

  kata_plain := JabarkanHuruf(ida);
  huruf_plain:= JabarkanHurufPlain(ida);
  divh := 'style="font-family:Nabi;font-size:24px;padding:15px" align=center dir="rtl">';

  ayat_irab :=  '<div ' + divh +  ayat_irab + '</div>';
  ayat_non_irab :=  '<div ' + divh +  ayat_non_irab + '</div>';
  terjemahan :=  '<div' + divh +  terjemahan + '</div><hr>';
  kata_irab :=  '<div ' + divh +  kata_irab + '</div>';
  kata_plain :=  '<div ' + divh +  kata_plain + '</div>';


  gbr := '<div align=center ><img src="arrow.png"/></div>';


  page :='<body style="background-color:#FBFBF6"> ' +
         '<div style="font-family:HvDTrial Pluto Sans Regular;font-size:17px;text-align:center">'+
         '<b>SUSUNAN KALIMAT</b> </div><br>'+
         '<table width=95% height=100% border=0 align="center" ' +
         'style="border: 1px solid #ddd;background-color:#F3F3E5" ><tr><td>' +
         ayat_irab +
         ayat_non_irab +
         terjemahan +
         gbr  +
         kata_irab +
         kata_plain +
         gbr +
         SetInfoHijaiyah(huruf_plain)  +

         '</td><tr></table></body>';

   OpenPage(page,'EKSTRAK');
   EdtCariKataArab.SetFocus;

end;


procedure TfrmStatistika.OpenPage(script:string;respon:string);
var
    s : TStringList;
begin
   try
       s := TStringList.Create;
       s.Text:= script;

       s.LoadFromFile(ExtractFilePath(Application.ExeName) + '/support/page/ayat.html');

       s.Text:= AnsiReplaceStr(s.Text,'$_DOCUMENT',script);
       s.SaveToFile(ExtractFilePath(Application.ExeName)  + '/support/page/ayatjummal2.html');

       FRM_Page.respon:=respon;
       FRM_Page.Chromium1.LoadURL(ExtractFilePath(Application.ExeName) + '/support/page/ayatjummal2.html');

  finally
   s.Free;
  end;

end;

procedure TfrmStatistika.EdtCariKataArabDblClick(Sender: TObject);
begin

  EdtCariKataArab.Clear;
  with DTSuratJummal do
  begin
    close;
    sql.Clear;
    sql.Add(' SELECT  '+
            ' n.sura_mushaf_order as `surat`,'+
            ' count(aya_no) as `Jumlah Ayat`, '+
            ' sum(n.aya_words_count)  as `Jumlah Kata`,  '+
            ' sum(n.aya_letters_count) as `Jumlah Huruf`,  '+
            ' sum(aya_jomal) as `Jummal`  '+
            ' FROM quran_hafs_numeric n '+
            ' GROUP BY   '+
            ' n.sura_mushaf_order '

            );
    open;

  end;
  DTKataJummal.Filtered:=false;
  LoadDataSuratAyatKataHuruf('1');

end;

procedure TfrmStatistika.EdtCariKataArabKeyPress(Sender: TObject; var Key: char);
begin
  {
   if key=#13 then
    begin
     With DTSuratJummal do
     begin
      close;
      sql.Clear;
      sql.Add(' SELECT '+
              ' n.sura_mushaf_order as `surat`,'+
              ' count(aya_no) as `Jumlah Ayat`, '+
              ' sum(n.aya_words_count)  as `Jumlah Kata`,'+
              ' sum(n.aya_letters_count) as `Jumlah Huruf`, '+
              ' sum(aya_jomal) as `Jummal`'+
              ' FROM quran_hafs_numeric n '+
              ' WHERE spoken_aya_words LIKE CONCAT(''%'',''\'''',''' + trim(EdtCariKataArab.text) +
              ''',''\'''',''%'')'+
              ' GROUP BY '+
              ' n.sura_mushaf_order');
      open;
    end;

    With DTAyatJummal do
    begin
      sql.Clear;
      sql.Add(' SELECT n.ida as ida,' +
              ' n.sura_mushaf_order as ids,' +
              ' n.aya_no as ayat,' +
              ' n.aya_text,' +
              ' n.spoken_aya_text ,' +
              ' n.spoken_aya_words ,' +
              ' n.aya_letters ,' +
              ' n.aya_words_count  as `Jumlah Kata`, ' +
              ' n.aya_letters_count as `Jumlah Huruf`,  ' +
              ' aya_jomal as Jummal,' +
              ' sum_of_digit(concat(n.aya_letters_count,aya_jomal)) as SDG ' +
              ' FROM quran_hafs_numeric n ' +
              ' WHERE spoken_aya_words LIKE CONCAT(''%'',''\'''',''' + trim(EdtCariKataArab.text) +
              ''',''\'''',''%'')');
      open;

   end;

   DTKataJummal.Filtered:=false;
   DTKataJummal.Filter := 'kata=' + QuotedStr(EdtCariKataArab.text);
   DTKataJummal.Filtered:=True;

end;
   TotalAllData;
   }
end;

procedure TfrmStatistika.edtCariKataDblClick(Sender: TObject);
begin

   edtCariKata.Clear;
   EdtCariKataArab.Clear;
   EdtCariKataArabBasic.Clear;

   DTCariKata.Close;
   DTCariKata.SQL.Clear;
   DTCariKata.SQL.Add('select * from v_ref_kosakata where indonesia like' +
                     QuotedStr('%' + edtCariKata.text +'%'));
   DTCariKata.Open;
end;

procedure TfrmStatistika.EdtCariKataIndonesiaDblClick(Sender: TObject);
begin

  EdtCariKataArab.Clear;
  with DTSuratJummal do
  begin
    close;
    sql.Clear;
    sql.Add(' SELECT  '+
            ' n.sura_mushaf_order as `surat`,'+
            ' count(aya_no) as `Jumlah Ayat`, '+
            ' sum(n.aya_words_count)  as `Jumlah Kata`,  '+
            ' sum(n.aya_letters_count) as `Jumlah Huruf`,  '+
            ' sum(aya_jomal) as `Jummal`  '+
            ' FROM quran_hafs_numeric n '+
            ' GROUP BY   '+
            ' n.sura_mushaf_order '

            );
    open;

  end;
  LoadDataSuratAyatKataHuruf('1');

end;

procedure TfrmStatistika.EdtCariKataIndonesiaKeyPress(Sender: TObject;
  var Key: char);
begin
      {
   if key=#13 then
    begin
     With DTSuratJummal do
     begin
      close;
      sql.Clear;
      sql.Add(' SELECT '+
              ' n.sura_mushaf_order as `surat`,'+
              ' count(aya_no) as `Jumlah Ayat`, '+
              ' sum(n.aya_words_count)  as `Jumlah Kata`,'+
              ' sum(n.aya_letters_count) as `Jumlah Huruf`, '+
              ' sum(aya_jomal) as `Jummal`'+
              ' FROM quran_hafs_numeric n '+
              ' WHERE n.ida in(SELECT t.id_ayat FROM terjemah_kata t WHERE t.indonesia Like' +
              QuotedStr(EdtCariKataIndonesia.text) + ')' +
              ' GROUP BY '+
              ' n.sura_mushaf_order');
      open;
    end;

    With DTAyatJummal do
    begin
      sql.Clear;
      sql.Add(' SELECT n.ida as ida,' +
              ' n.sura_mushaf_order as ids,' +
              ' n.aya_no as ayat,' +
              ' n.aya_text,' +
              ' n.spoken_aya_text ,' +
              ' n.spoken_aya_words ,' +
              ' n.aya_letters ,' +
              ' n.aya_words_count  as `Jumlah Kata`, ' +
              ' n.aya_letters_count as `Jumlah Huruf`,  ' +
              ' aya_jomal as Jummal,' +
              ' sum_of_digit(concat(n.aya_letters_count,aya_jomal)) as SDG ' +
              ' FROM quran_hafs_numeric n ' +
              ' where n.ida in(SELECT t.id_ayat FROM terjemah_kata t WHERE t.indonesia LIKE' +
              QuotedStr( EdtCariKataIndonesia.text) + ')' )  ;
      open;

   end;
end;
     TotalAllData; }
end;

procedure TfrmStatistika.edtCariKataKeyPress(Sender: TObject; var Key: char);
begin

  if key=#13 then
   begin
   DTCariKata.Close;
   DTCariKata.SQL.Clear;
   DTCariKata.SQL.Add('select * from v_ref_kosakata where indonesia like' +
                     QuotedStr('%'+edtCariKata.text+'%'));
   DTCariKata.Open;
   end;
end;

procedure TfrmStatistika.edtCariKataSebaranDblClick(Sender: TObject);
begin

   edtCariKataSebaran.Clear;

   DTCariKata.Close;
   DTCariKata.SQL.Clear;
   DTCariKata.SQL.Add('select * from v_ref_kosakata where indonesia like' +
                     QuotedStr('%' + edtCariKataSebaran.text +'%'));
   DTCariKata.Open;
end;

procedure TfrmStatistika.edtCariKataSebaranKeyPress(Sender: TObject;
  var Key: char);
begin
  if key=#13 then
   begin
   DTCariKata.Close;
   DTCariKata.SQL.Clear;
   DTCariKata.SQL.Add('select * from v_ref_kosakata where indonesia like' +
                     QuotedStr('%' + edtCariKataSebaran.text +'%'));
   DTCariKata.Open;
   end;
end;


procedure TfrmStatistika.SortirSesuaiKolomQuery(d:TZQuery;k:string)  ;
begin

   st := d.SortType;

   d.SortedFields:= QuotedStr( k);

   if st=stAscending  then
     d.SortType:= stDescending
     else
     d.SortType := stAscending;

  d.First;

end;

procedure TfrmStatistika.SortirSesuaiKolomTabel(d:TZTable;k:string)  ;
begin

   st := d.SortType;

   d.SortedFields:= QuotedStr( k);

   if st=stAscending  then
     d.SortType:= stDescending
     else
     d.SortType := stAscending;

  d.First;

end;

procedure TfrmStatistika.extrakkata(ids:string;ida:string;k:string);
var
  t : TStringList;
  i : integer;
begin
      k := AnsiReplaceStr(k,'[','');
      k := AnsiReplaceStr(k,']','');
      k := AnsiReplaceStr(k,'''','');
      k := AnsiReplaceStr(k,',',#13);
   t := TStringList.Create;
   t.Text:=TRim(k);
   for i := 0 to t.Count -1 do begin
   frm_Main.Koneksi.ExecuteDirect('INSERT INTO quran_hafs_huruf(ids,ida,huruf) VALUES ( ' +
             ids + ',' + QuotedStr(ida) + ',' + QuotedStr(TRIM(t.Strings[i])) + ')' );


end;

end;

function TfrmStatistika.LoadDataChart(sq:string):String;
var
    data : TStringList;
begin

    With DTChartSource do
    begin
      close;
      sql.Clear;
      sql.Add(sq);
      open;
      First;
      try
       data:=TStringList.create;
       while not eof do
       begin
         data.Add(Fields[0].AsString + '|' +
                  Fields[1].AsString + '|' +
                  '?|' +  Fields[2].AsString );
         next;
       end;
       Result:= data.Text;
       finally
       data.Free;

       end;


    end;


end ;

procedure TfrmStatistika.LoadDataAyatKataHuruf(ids:string;ida:string);
var
    r,s : string;

begin


  With DTKataJummal do
  begin
    close;
    sql.Clear;
    sql.Add(' SELECT ' +
            ' ids, ' +
            ' ida, ' +
            ' kata, ' +
            ' CHAR_LENGTH(trim(kata)) as JH,' +
            ' COUNT(kata) AS terulang ,' +
            ' getJummalKata(trim(kata)) as JMK ,' +
            ' COUNT(kata) * getJummalKata(trim(kata)) as TJMK ' +
            ' FROM quran_hafs_kata ' +
            ' Where ids=' + ids + ' and ida=' + QuotedStr(ida) +
            ' GROUP BY ids, kata'+
            ' ORDER by id asc');
    open;

  end;

  With DTHurufJummal do
  begin
    close;
    sql.Clear;
    sql.Add(' SELECT h.ids, h.huruf,  r.nilai,'+
            ' count(ids) as terulang, '+
            ' sum(r.nilai) as jummal '  +
            ' FROM '+
            ' quran_hafs_huruf h '+
            ' INNER JOIN '+
            ' ref_jummal r ON h.huruf=r.huruf '+
            ' where ids=' + ids +' and ida=' + QuotedStr(ida) +
            ' GROUP BY '+
            ' h.huruf  ');
    open;

  end;



end  ;

procedure TfrmStatistika.LoadDataSuratAyatKataHuruf(ids:string);
var
    r,s : string;
    w : string;
begin


  With DTAyatJummal do
  begin

    sql.Clear;
    sql.Add(' SELECT n.ida as ida,' +
            ' n.sura_mushaf_order as ids ,' +
            ' n.aya_text as aya_text,' +
            ' n.aya_no as ayat,' +
            ' n.aya_words_count  as `Jumlah Kata`, ' +
            ' n.aya_letters_count as `Jumlah Huruf`,  ' +
            ' aya_jomal as Jummal,' +
            ' sum_of_digit(concat(n.aya_letters_count,aya_jomal)) as SDG ' +
            ' FROM quran_hafs_numeric n ' +
            ' WHERE n.sura_mushaf_order= ' + ids );
  open;

  end;

  With DTKataJummal do
  begin


    close;
    sql.Clear;
    sql.Add(' SELECT ' +
            ' ids, ' +
            ' ida, ' +
            ' kata, ' +
            ' CHAR_LENGTH(trim(kata)) as JH,' +
            ' COUNT(kata) AS terulang ,' +
            ' getJummalKata(trim(kata)) as JMK ,' +
            ' COUNT(kata) * getJummalKata(trim(kata)) as TJMK ' +
            ' FROM quran_hafs_kata ' +
            ' Where ids=' + ids + ' '  +
            ' GROUP BY ids, kata'+
            ' ORDER by id asc');
    open;

  end;

  With DTHurufJummal do
  begin

    close;
    sql.Clear;
    sql.Add(' SELECT h.ids, h.huruf,  r.nilai,'+
            ' count(ids) as terulang, '+
            ' sum(r.nilai) as jummal '  +
            ' FROM '+
            ' quran_hafs_huruf h '+
            ' INNER JOIN '+
            ' ref_jummal r ON h.huruf=r.huruf '+
            ' where ids=' + ids + ' ' +
            ' GROUP BY '+
            ' h.huruf  ');
    open;

  end;



end;



function TfrmStatistika.ExtractJenis(kata:String):String;
var
    ts : TStringList;
    i : integer=0;
    h : string ='';

begin

    try
    ts := TStringList.Create;
    kata := AnsiReplaceStr(kata,'[','');
    kata := AnsiReplaceStr(kata,']','');
    kata := AnsiReplaceStr(kata,'''','');
    kata := AnsiReplaceStr(kata,',',#13#10);

    ts.text := trim(kata);
    h := '';

    for i := 0 to ts.Count-1 do
    begin
      h := h +
      '<tr>' +
      '<td width=30% align=center>' +
      SetWarnaJenis(ts.Strings[i])+
      '</td><td width=30% align=center>'+
      SetWarnaElemen(ts.Strings[i])+
      '</td><td width=30% align=center>'+
      '</td></tr>'
    end;
    Result :=  '<table width=90% align=center style="border: 1px solid #ddd;">' +  h + '</table>';

    finally
    ts.free;
    end;


end;


function TfrmStatistika.SetWarnaJenis(huruf:String):String;
begin
   with DTGet do
   begin
     close;
     sql.Clear;
     sql.Add('select qs from ref_jummal where huruf=' + QuotedStr(Trim(huruf)));
     open;
       huruf := huruf + '<div style="font-familiy:arial;font-size:12px">-' + Fields[0].AsString + '-</div>';
     if Fields[0].AsString='Syamsiyah' then
      Result := '<a  href=# style="color:#FA0A06;text-decoration: none">' + huruf + '</a>'
     else if  Fields[0].AsString= 'Qomariyah'  then
      Result := '<a  href=# style="color:#170202;text-decoration: none">' + huruf + '</a>'
     else
     Result :='';
   end;
end;

function TfrmStatistika.SetWarnaElemen(huruf:String):String;
begin

  with DTGet do
   begin
     close;
     sql.Clear;
     sql.Add('select elemen from ref_jummal where huruf=' + QuotedStr(Trim(huruf)));
     open;
      huruf := huruf + '<div style="font-familiy:arial;font-size:13px">-' + Fields[0].AsString + '-</div>';
     if Fields[0].AsString='Api' then
      Result := '<a  href=# style="color:#FF0C08;text-decoration: none">' + huruf + '</a>'
     else if Fields[0].AsString = 'Udara' then
      Result := '<a  href=# style="color:#35C833;text-decoration: none">' + huruf + '</a>'
     else if Fields[0].AsString = 'Tanah' then
      Result := '<a  href=# style="color:#010701;text-decoration: none">' + huruf + '</a>'
     else if Fields[0].AsString = 'Air' then
      Result := '<a  href=# style="color:#0360F8;text-decoration: none">' + huruf + '</a>'
     else
     Result :='';
   end;
end;

function TfrmStatistika.GetTerjemahByKata(kata:string):string;
begin


    with DTGet do
    begin
     close;
     sql.Clear;
     sql.Add('select indonesia from v_terjemahan_kata_byarab where kata=' + QuotedStr(Trim(kata)));
     open;

     Result :=FieldByName('indonesia').AsString;
  end;


end;




function TfrmStatistika.JabarkanKata(ida:string):string;
var
  page : string = '';
begin

  with DTGet do
   begin
    close;
    sql.Clear;
    sql.Add(' select  q.id_ayat,q.arab_harokat, q.indonesia ,ket FROM '+
            ' v_jabarkan_kata q '+
            ' where q.id_ayat='+ QuotedStr(ida)+
            ' ORDER BY '+
            ' q.id');


    open;

    while not eof do
    begin

    page := page + '<a style="text-decoration:none" href="#KATA_' + Fields[1].AsString + '">' +
                   '<div dir="ltr" class="btn btn-primary tooltip">' +
                   Fields[1].AsString +
                   '<span class="bottom">' + Fields[2].AsString+  '<br><br>' + Fields[3].AsString + '</span></div> '+
                   '</a>&nbsp;&nbsp; - &nbsp;&nbsp;' ;


     next;
    end;
   end;


  Result := page ;

  DTGet.close;
end;


function TfrmStatistika.JabarkanHuruf(ida:string):string;
var
  page : string = '';
begin

  with DTGet do
   begin
    close;
    sql.Clear;
    sql.Add(' select  q.id_ayat,q.arab, q.indonesia FROM '+
            ' v_jabarkan_kata q '+
            ' where q.id_ayat='+ QuotedStr(ida)+
            ' ORDER BY '+
            ' q.id');

    open;

    while not eof do
    begin

    page := page + '<a style="text-decoration:none" href="#KATA_' + Fields[1].AsString + '">' +
                   '<div dir="ltr" class="btn btn-primary tooltip">' +
                    Fields[1].AsString +
                   '<span class="bottom">' + Fields[2].AsString+  '</span></div> '+
                   '</a>&nbsp;&nbsp; - &nbsp;&nbsp;' ;


     next;
    end;
   end;


  Result := page ;

  DTGet.close;
end;

function TfrmStatistika.JabarkanHurufPlain(ida:string):string;
var
  page : string='';
  kata : String='';
begin


   with DTGet do
   begin
    close;
    sql.Clear;
    sql.Add(' select  q.id_ayat,q.arab, q.indonesia FROM '+
            ' v_jabarkan_kata q '+
            ' where q.id_ayat='+ QuotedStr(ida)+
            ' ORDER BY '+
            ' q.id');
    open;

    while not eof do
    begin
         kata := FieldByName('arab').AsString;
         page := page + '  ' + SplitAyatPerHuruf(kata,'') + ' -- ';


         next;
    end;
   Result := page;
   DTGet.close;

    end;

end;

function TfrmStatistika.SplitAyatPerHuruf(ayat:string;delimiter:string):String;
var

  i:integer;
  s,u,r : UTF8String;
  y : TStringList;

begin

  s :=  '';
  for i := 1 to Length(ayat) do
  begin
     s :=  TRim(s + UTF8Encode(AnsiMidStr(ayat,i,2)));
  end;

  s :=  AnsiReplaceStr(Utf8ToAnsi(s),'�','|');
  s :=  AnsiReplaceStr( s,' ',delimiter);
  s :=  AnsiReplaceStr( s,';;',';');
  s :=  AnsiReplaceStr( s,'|',#13);

  Result := s;


end;

function TfrmStatistika.SetInfoHijaiyah(k:String):string;
var
  has : string ='';
  info : string;
  i : integer;
  ts : TStringList;
begin


 try

 ts := TStringList.Create;
 ts.text :=  trim(k);
 ts.text := AnsiReplaceStr(ts.text,'--','&nbsp;..&nbsp;'+#13);

   for i := 0 to ts.Count -1 do
   begin
       With DTGet do
       begin
        close;
        sql.clear;
        sql.Add('select huruf2,nama,nilai,qs,arti,elemen from ref_jummal where huruf2=' +
                QuotedStr(Trim(ts.Strings[i])));
        open;
        info := 'Huruf : ' + Fields[0].AsString + '<br>' +
                'Nama : ' + Fields[1].AsString + '<br>' +
                'Jummal : ' + Fields[2].AsString + '<br>' +
                'Jenis : ' + Fields[3].AsString + '<br>' +
                'Elemen : ' +   Fields[5].AsString + '<br>' +
                'Arti : ' + Fields[4].AsString ;

        info := '<a style="color:#170202;text-decoration: none"  href=#"' +
                Fields[0].AsString  + '">' +
                '<div dir="ltr" class="btn btn-primary tooltip">' +
                //Fields[0].AsUTF8String +
                SetWarnaHurufByJenis(Fields[0].AsString) +
                '<span class="bottom">' +  info +  '</span></div></a>&nbsp;';


        has := has + ReplaceStr(Trim(ts.Strings[i]),Trim(Fields[0].AsString) ,info);



       end;


   end;
         Result := '<div style="font-family:Nabi;font-size:24px;padding:15px" align=center dir="rtl">' +
                  has + '</div>';
   finally
     ts.Free;
   end;
end;

function TfrmStatistika.GetItem(sq:string):String;
var
  r:string='';
begin

    With DTGet do
    begin
      close;
      sql.Clear;
      sql.Add(sq);
      open;
      r := r + Fields[0].AsString ;
      Result := Trim(r) ;
    end;

End;
function TfrmStatistika.SetWarnaHurufByJenis(h:string):string;
var
  k,e : string;
  wk : string;
  we : string;
begin

   //k := GetItem('select qs from ref_jummal where huruf=' + QuotedStr(h));

   With DTGetSifat do
   begin
    close;
    sql.clear;
    sql.add('select qs from ref_jummal where huruf=' + QuotedStr(h));
    open;
    k := FieldByName('qs').AsString;

   end;

   if k='Syamsiyah' then
      wk := '<span style="background:#F0FFCA">'
   else if k='Qomariyah' then
      wk := '<span style="background:#FFE4CA">'
   else
     wk := '';

   //e := GetItem('select elemen from ref_jummal where huruf=' + QuotedStr(h));

   With DTGetSifat do
   begin
    close;
    sql.clear;
    sql.add('select elemen from ref_jummal where huruf=' + QuotedStr(h));
    open;
    e := FieldByName('elemen').AsString;

   end;

   if e = 'Api' Then
     we := '<font color="#EB324E">' + h + '</font></span>'
   else if e = 'Air' Then
     we := '<font color="#3F8FD6">' + h + '</font></span>'
   else if e = 'Udara' then
    we  := '<font color="#A4E06D">' + h + '</font></span>'
   else if e = 'Tanah' then
    we :=  '<font color="#21595F">' + h + '</font></span>'
   else
    we := '';

   DTGetSifat.close;
   Result :=   wk + we  ;

end;

procedure TfrmStatistika.TotalAllData;
begin

     with DTSumSurat do
     begin
      close;
      sql.Clear;
      sql.Add(' SELECT Count(d.surat) as `surat`,' +
              ' Sum(d.`Jumlah Ayat`) as `Jumlah Ayat`,' +
              ' Sum(d.`Jumlah Kata`) as `Jumlah Kata`, ' +
              ' Sum(d.`Jumlah Huruf`) as `Jumlah Huruf`,' +
              ' Sum(d.`Jummal`) as `Jummal`' +
              ' from ( ' + SQ_SS + ' ) as d ');
      open;
     end;

     with DTSumAyat do
     begin
      close;
      sql.Clear;
      sql.Add(' SELECT count(d.ida) as ida,' +
              ' count(ayat) as ayat,' +
              ' sum(d.`Jumlah Kata`)  as `Jumlah Kata`, ' +
              ' sum(d.`Jumlah Huruf`) as `Jumlah Huruf`,  ' +
              ' sum(d.`Jummal`) as Jummal,' +
              ' sum(d.SDG) as SDG ' +
              ' FROM ' +
              ' ( ' + SQ_SA + ' ) as d');
      open;
     end;


     with DTSumKata do
     begin
      close;
      sql.Clear;
      sql.Add(' SELECT ' +
              ' count(d.kata) as kata, ' +
              ' sum(d.JH) as JH,' +
              ' sum(d.terulang) as terulang ,' +
              ' sum(d.JMK) as JMK ,' +
              ' sum(d.TJMK) as TJMK ' +
              ' FROM ' +
              ' ( ' + SQ_SK + ' ) as d');
      open;
     end;

     with DTSumHuruf do
     begin
      close;
      sql.Clear;
      sql.Add(' SELECT count(d.huruf) as huruf,'+
              ' sum(d.nilai) as nilai,'+
              ' sum(d.terulang) as terulang, '+
              ' sum(d.jummal) as jummal '  +
              ' FROM '+
              ' ( ' + SQ_SH + ' ) as d');
      open;
     end;


end;

procedure TfrmStatistika.ShowSumDigit;
begin

 edtCountKataCari.Text:= Inttostr(DTCariKata.RecordCount);
 edtCountKata.Text:= Inttostr(DTKataJummal.RecordCount);
 edtCountSurat.Text:= Inttostr(DTSuratJummal.RecordCount);
 edtCountAyat.Text:= Inttostr(DTAyatJummal.RecordCount);

end;

function TfrmStatistika.IsInteger(const S: string): Boolean;
var
  E: Integer;
  V: LongInt;
begin
  Val(S, V, E);
  Result := (E = 0);
end;

end.


