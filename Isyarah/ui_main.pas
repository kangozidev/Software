unit ui_main;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  DateUtils,
  SysUtils,
  Math,
  DB,
  Forms,
  Controls,
  Graphics,
  StrUtils,
  Clipbrd,
  Dialogs,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
  DBCtrls,
  TplGifAnimatorUnit,
  cyPageControl,
  RxDBGrid,
  HtmlView,
  IdThreadComponent,
  atshapeline,
  GLShadowHDS,
  ZConnection,
  ZDataset,
  JvNavigationPane,
  DBGrids,
  Buttons,
  LCLIntf,
  FileCtrl,
  Menus,
  ShellCtrls,
  ExtDlgs,
  jwawinbase,
  RTTICtrls,
  TAGraph,
  TASeries,
  TASources,
  CodyCtrls,
  ui_wait,
  PasLibVlcPlayerUnit,
  PythonEngine,
  FXProgressBar,

  // Unit Internal Aplikasi
  ui_record,
  ui_tafsir2,
  ui_restranslate,
  ui_qori,
  ui_showkata,
  ui_hadist,
  ui_tafsir,
  ubrowser,
  ui_agreement,
  ui_regtajwid,
  ui_showhuruf,
  ui_message,
  ui_player,
  ui_keyboard,
  uregistration,
  ui_ask,
  uabout,
  ui_source,
  u_zsplash,
  ui_edtrans,
  ui_setting,
  ui_progres,
  ui_chatai,
  ujamu,
  ui_treekata,
  ui_statistika,
  ui_quiz,
  ui_translate_tafsir,
  ui_quotemaker,
  // ----------------

  jsonparser,
  fpjson,
  fphttpclient,
  fpdatasetform,
  opensslsockets,
  process,
  Types,
  pingsend,
  WinINet,
  urlmon,
  HtmlGlobals,
  HTMLUn2, Grids;

type

  { Tfrm_Main }

  Tfrm_Main = class(TForm)
    ChartKata: TChart;
    CKata: TBarSeries;
    ckNext: TCheckBox;
    ckTerjemah: TCheckBox;
    ckUlang: TCheckBox;
    DSStatistikKataByAyat: TDataSource;
    DBImage1: TDBImage;
    DBText4: TDBText;
    DSBasicKataByHuruf: TDataSource;
    DTAyatJummal: TZQuery;
    DTGet: TZQuery;
    FLBook: TFileListBox;
    GRDVariasiKata: TRxDBGrid;
    HtmlViewer1: THtmlViewer;
    JvNavPanelHeader16: TJvNavPanelHeader;
    JvNavPanelHeader17: TJvNavPanelHeader;
    Label1: TLabel;
    Label4: TLabel;
    lbBasic: TLabel;
    lbKata: TLabel;
    lbPlain: TLabel;
    lb_StatKataHarokat: TLabel;
    lb_StatKataHuruf: TLabel;
    lb_StatKataPlain: TLabel;
    MenuItem12: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    mnToolbarDibawah: TMenuItem;
    mnToolAtas: TMenuItem;
    mnZilla: TMenuItem;
    mnArvo: TMenuItem;
    mnWorkSans: TMenuItem;
    mnMerry: TMenuItem;
    mnInterRegular: TMenuItem;
    mnPoppins: TMenuItem;
    mnKoleksi: TMenuItem;
    mnStatistika: TMenuItem;
    mnProgres: TMenuItem;
    mnQuizKata: TMenuItem;
    mnQuoteMaker: TMenuItem;
    Panel2: TPanel;
    pn_TranslateBook: TPanel;
    pnQuote_Maker: TPanel;
    Panel30: TPanel;
    Panel32: TPanel;
    pnl_Kitab: TPanel;
    pnl_Statistik: TPanel;
    pnl_Progress: TPanel;
    GRDStatistikKataByAyat: TRxDBGrid;
    Separator1: TMenuItem;
    spbAIBrowser: TMenuItem;
    mnCalivornia: TMenuItem;
    mnCabo: TMenuItem;
    mnPDMS_Jauhar: TMenuItem;
    mnSaleem: TMenuItem;
    mnHVD: TMenuItem;
    mnComicSans: TMenuItem;
    mnRaleway: TMenuItem;
    mnRoboto: TMenuItem;
    mnMOntesrat: TMenuItem;
    mnOpenSans: TMenuItem;
    mnBahnschrift: TMenuItem;
    mnnoorehira: TMenuItem;
    mnme_quran: TMenuItem;
    mnScheherazade: TMenuItem;
    mnIndoPak: TMenuItem;
    mnKufiStylistic: TMenuItem;
    mnReemKufi: TMenuItem;
    Panel31: TPanel;
    pnl_Tema: TPanel;
    pnl_DaftarAyatByTema: TPanel;
    pgDetil: TcyPageControl;
    DBText2: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DGetNumericByAyat: TZQuery;
    DSBookmark: TDataSource;
    DBText5: TDBText;
    DBText7: TDBText;
    DSDetilAyat: TDataSource;
    DBText1: TDBText;
    DBText6: TDBText;
    DSKataByStat: TDataSource;
    DSTemaTerkait: TDataSource;
    DTChartSource: TZQuery;
    DTGetItem: TZQuery;
    DTKataByStat: TZQuery;
    edtFilSurat: TEdit;
    edt_Cari: TEdit;
    JvNavPanelHeader11: TJvNavPanelHeader;
    JvNavPanelHeader15: TJvNavPanelHeader;
    Label11: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    lbBacaan: TLabel;
    MenuItem13: TMenuItem;
    mnShowPanelKiri: TMenuItem;
    mnShowPanelKanan: TMenuItem;
    mnShowPanelBawah: TMenuItem;
    mnSource: TMenuItem;
    mnTutorPDF: TMenuItem;
    mnTutor: TMenuItem;
    mnChatAI: TMenuItem;
    mnViewFullScreen: TMenuItem;
    mnViewCompact: TMenuItem;
    MenuItem3: TMenuItem;
    mnFiturHuruf: TMenuItem;
    mnFetaureTafsir: TMenuItem;
    mnFetaureTafLanjutan: TMenuItem;
    mnFetaureTajwid: TMenuItem;
    mnFetaureUraianKata: TMenuItem;
    mnBookMark: TMenuItem;
    mnFetaureAyat: TMenuItem;
    mnFeatureTema: TMenuItem;
    mnFeatureKata: TMenuItem;
    mnFeatureHadist: TMenuItem;
    mnFeatureSurat: TMenuItem;
    mnFeature: TMenuItem;
    mnOptions: TMenuItem;
    mnRepo: TMenuItem;
    mnKamiMendengar: TMenuItem;
    mnForntBaazi: TMenuItem;
    mnNeziri: TMenuItem;
    mnAttari: TMenuItem;
    mnLPQ: TMenuItem;
    mnNbai: TMenuItem;
    mnAlQalam: TMenuItem;
    mnTaawudz: TMenuItem;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    GRD_Bookmark: TRxDBGrid;
    Panel29: TPanel;
    pnChartKata: TPageControl;
    pnDetilKata: TPanel;
    pnl_DetilVariasiTerjamahKata: TPanel;
    pnNavPlay: TPanel;
    pbarAyat: TFXProgressBar;
    pnl_Ayat: TPanel;
    pmFontLatin: TPopupMenu;
    Separator10: TMenuItem;
    Separator11: TMenuItem;
    Separator8: TMenuItem;
    pbarTutorial: TFXProgressBar;
    hvResume: THtmlViewer;
    JvNavPanelHeader13: TJvNavPanelHeader;
    JvNavPanelHeader14: TJvNavPanelHeader;
    Label3: TLabel;
    Label9: TLabel;
    lbImam: TLabel;
    lbImam1: TLabel;
    lbImam2: TLabel;
    LCKata: TListChartSource;
    Panel1: TPanel;
    Panel20: TPanel;
    pmFont: TPopupMenu;
    Separator6: TMenuItem;
    Separator7: TMenuItem;
    Separator9: TMenuItem;
    spbTanyaGemini: TSpeedButton;
    spb_AyatBack: TSpeedButton;
    spb_AyatNext: TSpeedButton;
    spb_baca: TplGifAnimator;
    spb_CopyTema: TSpeedButton;
    spb_BackDaftar: TSpeedButton;
    spb_doc: TSpeedButton;
    spb_showHadist1: TSpeedButton;
    spb_showStatistika: TSpeedButton;
    spb_tampilkandaftar: TSpeedButton;
    spb_doc4: TSpeedButton;
    spb_doc5: TSpeedButton;
    spb_FontMinus: TSpeedButton;
    spb_SelectFont1: TSpeedButton;
    spb_tema: TSpeedButton;
    spb_Print: TSpeedButton;
    spb_FontPlus: TSpeedButton;
    spb_Horizon: TSpeedButton;
    spb_MarkRead2: TSpeedButton;
    spb_PlayHuruf1: TSpeedButton;
    spb_play: TSpeedButton;
    spb_PrintDaftar: TSpeedButton;
    spb_SelectFont: TSpeedButton;
    spb_SetTajwid: TSpeedButton;
    spb_Extrak: TSpeedButton;
    spb_Resume: TSpeedButton;
    spb_lang: TSpeedButton;
    spb_ShowResume: TSpeedButton;
    spb_Tajwid: TSpeedButton;
    spb_UpdateTajwid: TSpeedButton;
    spb_vertikal: TSpeedButton;
    spb_HapusBookmark: TSpeedButton;
    spb_record: TSpeedButton;
    SpeedButton59: TSpeedButton;
    SpeedButton60: TSpeedButton;
    Splitter1: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    spl_right: TSplitter;
    spn_setBookmark: TSpeedButton;
    tbs_Quote: TTabSheet;
    tbs_Quiz: TTabSheet;
    tbs_Kitab: TTabSheet;
    tbs_Statistik: TTabSheet;
    tbs_Progress: TTabSheet;
    tbs_DetilKata: TTabSheet;
    tbs_DetilTema: TTabSheet;
    tbs_Chart: TTabSheet;
    tbs_DetilVariasiTerjamahKata: TTabSheet;
    tbs_sample: TTabSheet;
    tbs_ChatAI: TTabSheet;
    tbs_history: TTabSheet;
    tbs_kemenag: TTabSheet;
    trPrompt: TTreeView;
    VLCPlayerMe: TPasLibVlcPlayer;
    VLCPlayerHelp: TPasLibVlcPlayer;
    pnl_Atas: TPanel;
    Panel9: TPanel;
    pnAgreement: TPanel;
    Panel23: TPanel;
    spb_GetHadist: TSpeedButton;
    spb_SelectSyaikh: TSpeedButton;
    spb_showHJ: TSpeedButton;
    spb_showHadist: TSpeedButton;
    spb_showKata: TSpeedButton;
    spb_showMushaf: TSpeedButton;
    spb_showSurat: TSpeedButton;
    spb_showAITools: TSpeedButton;
    spb_Progress: TSpeedButton;
    spb_showTema: TSpeedButton;
    spb_SimpanTemaHadist: TSpeedButton;
    tbs_Help: TTabSheet;
    tbs_agreement: TTabSheet;
    tbs_SusunaKata: TTabSheet;
    tbs_UraianTemaByAI: TTabSheet;
    thrRequestAI: TIdThreadComponent;
    ODF: TFontDialog;
    DSSebaranKata: TDataSource;
    DBMemo2: TDBMemo;
    DSShowHadist: TDataSource;
    DSDaftarHadistByKitab: TDataSource;
    DSDaftarKitabHadist: TDataSource;
    DSProgres: TDataSource;
    DSVariasiKata: TDataSource;
    DTDaftarKatautsmani: TStringField;
    edb_H1: TDBEdit;
    DBMemo1: TDBMemo;
    DSRefTajwid: TDataSource;
    DSRegKata: TDataSource;
    DSDaftarTafsir: TDataSource;
    dbTafsir: TDBMemo;
    DBText3: TDBText;
    DSHuruf: TDataSource;
    DSSifat: TDataSource;
    DSTafsir: TDataSource;
    DGetMinMaxPage: TZQuery;
    DsTema: TDataSource;
    DSTerjemahKata: TDataSource;
    DTDaftarKataarti: TStringField;
    DTDaftarKatabasic: TStringField;
    DTHuruf: TZQuery;
    DTTafsirWeb: TZQuery;
    DtTema: TZTable;
    DTTerjemahKata: TZQuery;
    DTDaftarKata: TZQuery;
    DTTerjemahKataarab1: TStringField;
    DTTerjemahKataarab_harokat1: TStringField;
    DTTerjemahKataid_ayat1: TStringField;
    DTTerjemahKatakata1: TStringField;
    DTTerjemahKatakata_arab1: TStringField;
    EdtTema: TEdit;
    DsSurat: TDataSource;
    DsAyat: TDataSource;
    Edt_CariKata: TEdit;
    grdKata: TRxDBGrid;
    GrdKitabHadist: TRxDBGrid;
    grdNomorHadist: TRxDBGrid;
    grd_DaftarAyat: TRxDBGrid;
    hvTerjemahHadist: THtmlViewer;
    ImageList1: TImageList;
    JvNavPanelHeader1: TJvNavPanelHeader;
    JvNavPanelHeader10: TJvNavPanelHeader;
    jvHadistJudul: TJvNavPanelHeader;
    JvNavPanelHeader12: TJvNavPanelHeader;
    JvNavPanelHeader2: TJvNavPanelHeader;
    JvNavPanelHeader3: TJvNavPanelHeader;
    JvNavPanelHeader4: TJvNavPanelHeader;
    JvNavPanelHeader5: TJvNavPanelHeader;
    JvNavPanelHeader6: TJvNavPanelHeader;
    JvNavPanelHeader7: TJvNavPanelHeader;
    JvNavPanelHeader8: TJvNavPanelHeader;
    JvNavPanelHeader9: TJvNavPanelHeader;
    Koneksi: TZConnection;
    Label12: TLabel;
    Label5: TLabel;
    lb_JumlahData: TLabel;
    lb_Mufassir: TLabel;
    lb_Tema: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    OPD: TOpenPictureDialog;
    Panel22: TPanel;
    pg_Keyboard: TPageControl;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    MenuItem9: TMenuItem;
    mnAbout: TMenuItem;
    MenuItem2: TMenuItem;
    mnExit: TMenuItem;
    mnFontPageMinus: TMenuItem;
    MenuItem11: TMenuItem;
    mn_SalinAyat: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    mnFontPagePlus: TMenuItem;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    pnl_Hadist: TPanel;
    pnl_book: TPanel;
    pnl_DaftarAyat: TPanel;
    pg_Right: TPageControl;
    pnl_AyatBottom: TPanel;
    Panel3: TPanel;
    pnl_Mushaf: TPanel;
    pn_MenuAyat: TPanel;
    pg_Tafsir: TPageControl;
    Panel4: TPanel;
    pnl_PgMain: TPanel;
    pg_Ayat: TcyPageControl;
    pgTengah: TPageControl;
    pnl_Surat1: TPanel;
    pnl_Surat2: TPanel;
    pnl_CaptionAyatSurat: TPanel;
    PopupMenu1: TPopupMenu;
    pm_ShowAyat: TPopupMenu;
    Process1: TProcess;
    grd_DaftarTafsir: TRxDBGrid;
    GrdRegKata: TRxDBGrid;
    Separator2: TMenuItem;
    Separator3: TMenuItem;
    pnl_Main: TPanel;
    pg_Left: TcyPageControl;
    Grd_Surat: TRxDBGrid;
    grdTema: TRxDBGrid;
    Separator4: TMenuItem;
    spb_CopasHadist: TSpeedButton;
    spb_Normal1: TSpeedButton;
    spb_Kata: TSpeedButton;
    spb_MarkRead: TSpeedButton;
    spb_Normal: TSpeedButton;
    spb_PlayHuruf: TSpeedButton;
    spb_Quote: TSpeedButton;
    spb_EditTranslate: TSpeedButton;
    spb_TranslateGemini: TSpeedButton;
    spb_SourceTafsir: TSpeedButton;
    spb_TafsirTranslated: TSpeedButton;
    spb_TafsirWeb: TSpeedButton;
    spb_Huruf: TSpeedButton;
    spb_KeyA: TSpeedButton;
    SpeedButton10: TSpeedButton;
    spb_KeyE: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    spb_KeyB: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    spb_KeyC: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton37: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    spb_KeyD: TSpeedButton;
    SpeedButton40: TSpeedButton;
    SpeedButton41: TSpeedButton;
    SpeedButton42: TSpeedButton;
    SpeedButton43: TSpeedButton;
    SpeedButton44: TSpeedButton;
    SpeedButton45: TSpeedButton;
    SpeedButton46: TSpeedButton;
    SpeedButton47: TSpeedButton;
    SpeedButton48: TSpeedButton;
    SpeedButton49: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton50: TSpeedButton;
    SpeedButton51: TSpeedButton;
    SpeedButton52: TSpeedButton;
    SpeedButton53: TSpeedButton;
    SpeedButton54: TSpeedButton;
    SpeedButton55: TSpeedButton;
    SpeedButton56: TSpeedButton;
    SpeedButton57: TSpeedButton;
    SpeedButton58: TSpeedButton;
    spb_Tafsir_lanjutan: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Splitter2: TSplitter;
    tbs_latin: TTabSheet;
    tbs_Hijaiyah: TTabSheet;
    tbs_Hadist: TTabSheet;
    tbs_ShowHadist: TTabSheet;
    tbs_ShowMushaf: TTabSheet;
    tbs_VariasiKata: TTabSheet;
    tbs_ShowTajwid: TTabSheet;
    tbs_kata: TTabSheet;
    tbs_Huruf: TTabSheet;
    tbs_DaftarKata: TTabSheet;
    tbs_DaftarTafsir: TTabSheet;
    tbs_TafsirText: TTabSheet;
    tbs_TafsirWeb: TTabSheet;
    tbs_showAyat: TTabSheet;
    tbs_Pustaka: TTabSheet;
    tbs_Ayat: TTabSheet;
    tbs_Book: TTabSheet;
    tbs_ShowBayan: TTabSheet;
    tbs_showDaftarAyat: TTabSheet;
    tbs_Surat: TTabSheet;
    tbs_Tafsir: TTabSheet;
    tbs_Tema: TTabSheet;
    DtSurat: TZTable;
    DtAyat: TZQuery;
    DTTafsir: TZQuery;
    DTTajwid: TZQuery;
    DTSifat: TZQuery;
    DTHijaiyah: TZQuery;
    DTDaftarTafsir: TZQuery;
    DTVariasiKata: TZQuery;
    VLCPlayerAyat: TPasLibVlcPlayer;
    DTRegKata: TZTable;
    DTGetData: TZQuery;
    DTRefTajwid: TZQuery;
    DTDaftarKitabHadist: TZTable;
    DTDaftarHadistByKitab: TZQuery;
    DTShowHadist: TZQuery;
    VLCPlayerTerjemah: TPasLibVlcPlayer;
    DTDaftarKataUnique: TZQuery;
    DTProgres: TZTable;
    DTSebaranKata: TZQuery;
    DTHurufHijaiyah: TZQuery;
    DTTemaTerkait: TZQuery;
    DTDetilAyat: TZQuery;
    DTSetting: TZTable;
    DTBookmark: TZTable;
    KOneksi_Tajwid: TZConnection;
    DTGetTerjemah: TZQuery;
    DTBasicKataByHuruf: TZQuery;
    DTShowAllSurat: TZQuery;
    DTStatistikKataByAyat: TZQuery;
    procedure ckUlangChange(Sender: TObject);
    procedure DBImage1Click(Sender: TObject);
    procedure DBText4DblClick(Sender: TObject);
    procedure DtAyatAfterOpen(DataSet: TDataSet);
    procedure DtAyatAfterScroll(DataSet: TDataSet);
    procedure DTDaftarHadistByKitabAfterOpen(DataSet: TDataSet);
    procedure DTDaftarKitabHadistAfterOpen(DataSet: TDataSet);
    procedure edb_H1Change(Sender: TObject);
    procedure dbTerjemahDblClick(Sender: TObject);
    procedure edtFilSuratChange(Sender: TObject);
    procedure edtFilSuratDblClick(Sender: TObject);
    procedure EdtTemaKeyPress(Sender: TObject; var Key: char);
    procedure edt_CariChange(Sender: TObject);
    procedure edt_CariDblClick(Sender: TObject);
    procedure Edt_CariKataChange(Sender: TObject);
    procedure Edt_CariKataKeyPress(Sender: TObject; var Key: char);
    procedure edt_CariKeyPress(Sender: TObject; var Key: char);
    procedure FLBookDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdKataDblClick(Sender: TObject);
    procedure GrdKitabHadistCellClick(Column: TColumn);
    procedure grdNomorHadistCellClick(Column: TColumn);
    procedure GrdRegKataCellClick(Column: TColumn);
    procedure GrdRegKataDblClick(Sender: TObject);
    procedure GrdSifatHurufDblClick(Sender: TObject);
    procedure grdTemaDblClick(Sender: TObject);
    procedure GRDVariasiKataCellClick(Sender: TObject);
    procedure grdVariasiKataDblClick(Sender: TObject);
    procedure GRD_BookmarkDblClick(Sender: TObject);
    procedure grd_DaftarAyatCellClick(Column: TColumn);
    procedure grd_DaftarAyatDblClick(Sender: TObject);
    procedure grd_DaftarTafsirDblClick(Sender: TObject);
    procedure GRD_DetilAyatBasicDblClick(Sender: TObject);
    procedure GRD_DetilAyatHarokatDblClick(Sender: TObject);
    procedure GRD_DetilAyatPlainDblClick(Sender: TObject);
    procedure Grd_SuratDblClick(Sender: TObject);
    procedure Grd_SuratDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

    procedure hvResumeAyatHotSpotClick(Sender: TObject; const SRC: ThtString;
      var Handled: Boolean);
    procedure hvResumeTemaByAyatHotSpotClick(Sender: TObject;
      const SRC: ThtString; var Handled: Boolean);
    procedure lbBasicClick(Sender: TObject);
    procedure lbKataClick(Sender: TObject);
    procedure lbPlainClick(Sender: TObject);
    procedure lbTaawuzClick(Sender: TObject);
    procedure lbTaawuzDblClick(Sender: TObject);
    procedure lb_FahdClick(Sender: TObject);
    procedure MenuItem47Click(Sender: TObject);
    procedure mnAboutClick(Sender: TObject);
    procedure mnAllBySurahClick(Sender: TObject);
    procedure mnPDMS_JauharClick(Sender: TObject);
    procedure mnPustakaClick(Sender: TObject);
    procedure mnSaleemClick(Sender: TObject);
    procedure mnToolAtasClick(Sender: TObject);
    procedure mnToolbarDibawahClick(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
   // procedure pn_MenuAyatClick(Sender: TObject);
    procedure setFontLatin(Sender: TObject);
    procedure mnIndoPakClick(Sender: TObject);
    procedure mnAlQalamClick(Sender: TObject);
    procedure mnAttariClick(Sender: TObject);
    procedure mnBookMarkClick(Sender: TObject);
    procedure mnChatAIClick(Sender: TObject);
    procedure mnDoaKumaylClick(Sender: TObject);
    procedure mnExitClick(Sender: TObject);
    procedure mnForntBaaziClick(Sender: TObject);
    procedure mnHelpClick(Sender: TObject);
    procedure mnJawsanClick(Sender: TObject);
    procedure mnKamiMendengarClick(Sender: TObject);
    procedure mnKoleksiClick(Sender: TObject);
    procedure mnKoleksiTafsirClick(Sender: TObject);
    procedure mnKufiStylisticClick(Sender: TObject);
    procedure mnLPQClick(Sender: TObject);
    procedure mnNbaiClick(Sender: TObject);
    procedure mnme_quranClick(Sender: TObject);
    procedure mnnoorehiraClick(Sender: TObject);
    procedure mnOpenSansClick(Sender: TObject);
    procedure mnOptionsClick(Sender: TObject);
    procedure mnPopHurufClick(Sender: TObject);
    procedure mnProgresClick(Sender: TObject);
    procedure mnQuizKataClick(Sender: TObject);
    procedure mnQuoteMakerClick(Sender: TObject);
    procedure mnReemKufiClick(Sender: TObject);
    procedure mnRepoClick(Sender: TObject);
    procedure mnScheherazadeClick(Sender: TObject);
    procedure mnShowPanelBawahClick(Sender: TObject);
    procedure mnShowPanelKananClick(Sender: TObject);
    procedure mnShowPanelKiriClick(Sender: TObject);
    procedure mnSourceClick(Sender: TObject);
    procedure mnSuaraAlamClick(Sender: TObject);
    procedure mnTaawudzClick(Sender: TObject);
    procedure mnTanyaClick(Sender: TObject);
    procedure mnTutorClick(Sender: TObject);
    procedure mnViewCompactClick(Sender: TObject);
    procedure mnViewFullScreenClick(Sender: TObject);
    procedure mn_ShowHadistClick(Sender: TObject);
    procedure mn_koleksiBukuClick(Sender: TObject);
    procedure Neirizi(Sender: TObject);
    procedure pbarAyatClick(Sender: TObject);
    procedure pbarTutorialClick(Sender: TObject);
    procedure pg_LeftChange(Sender: TObject);
    procedure rbNunClick(Sender: TObject);
    procedure GRDVariasiKataCellClick(Column: TColumn);
    procedure spbAIBrowserClick(Sender: TObject);
    procedure spbTanyaGeminiClick(Sender: TObject);
    procedure spb_Tafsir_lanjutanClick(Sender: TObject);
    procedure spb_BackDaftarClick(Sender: TObject);
    procedure spb_CopasHadistClick(Sender: TObject);
    procedure spb_CopyTemaClick(Sender: TObject);
    procedure spb_CorpusClick(Sender: TObject);
    procedure spb_doc2Click(Sender: TObject);
    procedure spb_docClick(Sender: TObject);
    procedure spb_EditTranslateClick(Sender: TObject);
    procedure spb_ExtrakClick(Sender: TObject);
    procedure spb_GenerateClick(Sender: TObject);
    procedure spb_HapusBookmarkClick(Sender: TObject);
    procedure spb_HorizonClick(Sender: TObject);
    procedure spb_HurufClick(Sender: TObject);
    procedure spb_JummalClick(Sender: TObject);
    procedure spb_KataClick(Sender: TObject);
    procedure spb_kemenagClick(Sender: TObject);
    procedure spb_KeyboardArabicKataClick(Sender: TObject);
    procedure spb_langClick(Sender: TObject);
    procedure spb_LocClick(Sender: TObject);
    procedure spb_MarkReadClick(Sender: TObject);
    procedure spb_PDFClick(Sender: TObject);
    procedure GetResumeKata;
    procedure spb_playClick(Sender: TObject);
    procedure spb_PlayHuruf1Click(Sender: TObject);
    procedure spb_PlayHurufClick(Sender: TObject);
    procedure spb_PrintClick(Sender: TObject);
    procedure spb_PrintDaftarClick(Sender: TObject);
    procedure spb_QuoteClick(Sender: TObject);
    procedure spb_recordClick(Sender: TObject);
    procedure spb_ResumeClick(Sender: TObject);
    procedure spb_SelectFont1Click(Sender: TObject);
    procedure spb_SelectFontClick(Sender: TObject);
    procedure spb_showAskClick(Sender: TObject);
    procedure spb_showHadist1Click(Sender: TObject);
    procedure spb_showHadistClick(Sender: TObject);
    procedure spb_showStatistikaClick(Sender: TObject);
    procedure spb_showMushafClick(Sender: TObject);
    procedure spb_ShowResumeClick(Sender: TObject);
    procedure spb_SimpanResuemKataClick(Sender: TObject);
    procedure spb_SimpanResumeAyatClick(Sender: TObject);
    procedure spb_SimpanTemaHadistClick(Sender: TObject);
    procedure spb_TafsirTranslatedClick(Sender: TObject);
    procedure resumeTafsirAI(ida:string);
    procedure spb_tampilkandaftarClick(Sender: TObject);
    procedure spb_temaClick(Sender: TObject);
    procedure spb_TranslateGeminiClick(Sender: TObject);
    procedure spb_TranslateGPTClick(Sender: TObject);
    procedure spb_UpdateTajwidClick(Sender: TObject);
    procedure spb_vertikalClick(Sender: TObject);
    procedure FilterByAbjad(Sender: TObject);
    procedure spb_TranslateAIClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FilterByHijaiyah(Sender: TObject);
    procedure spb_GetHadistClick(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure SpeedButton60Click(Sender: TObject);
    procedure spn_setBookmarkClick(Sender: TObject);
    procedure tbs_agreementShow(Sender: TObject);
    procedure tbs_DetilAyatBasicShow(Sender: TObject);
    procedure tbs_DetilTemaShow(Sender: TObject);
    procedure tbs_DetilVariasiTerjamahKataShow(Sender: TObject);
    procedure tbs_kataShow(Sender: TObject);
    procedure thrRequestAIRun(Sender: TIdThreadComponent);
    procedure thrRequestAITerminate(Sender: TIdThreadComponent);
    procedure TrdBacaRun(Sender: TIdThreadComponent);
    procedure img_QDocMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbQoriClick(Sender: TObject);
    procedure mnFontPageMinusClick(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure mnFontPagePlusClick(Sender: TObject);
    procedure mnSalinClick(Sender: TObject);
    procedure mnSalinGPTClick(Sender: TObject);
    procedure mn_SalinAyatClick(Sender: TObject);
    procedure PopupNotifier1Close(Sender: TObject; var CloseAction: TCloseAction
      );
    procedure spb_BacaClick(Sender: TObject);
    procedure spb_AyatBackClick(Sender: TObject);
    procedure spb_AyatNextClick(Sender: TObject);
    procedure spb_BaghowiClick(Sender: TObject);
    procedure spb_F1Click(Sender: TObject);
    procedure spb_F2Click(Sender: TObject);
    procedure spb_F3Click(Sender: TObject);
    procedure spb_F4Click(Sender: TObject);
    procedure spb_F5Click(Sender: TObject);
    procedure spb_harokatClick(Sender: TObject);
    procedure spb_IbnuKatsirClick(Sender: TObject);
    procedure spb_MiqbasClick(Sender: TObject);
    procedure spb_PilihKitabTafsirClick(Sender: TObject);
    procedure spb_QurthubiClick(Sender: TObject);
    procedure spb_SaadiClick(Sender: TObject);
    procedure spb_SelectSyaikhClick(Sender: TObject);
    procedure spb_showAyatClick(Sender: TObject);
    procedure spb_showHJClick(Sender: TObject);
    procedure spb_showKataClick(Sender: TObject);
    procedure spb_showSuratClick(Sender: TObject);
    procedure spb_showTafsirClick(Sender: TObject);
    procedure spb_showTahsinClick(Sender: TObject);
    procedure spb_showTemaClick(Sender: TObject);
    procedure spb_SourceTafsirClick(Sender: TObject);
    procedure spb_TafsirWebClick(Sender: TObject);
    procedure spb_ThobariClick(Sender: TObject);
    procedure spb_WasithClick(Sender: TObject);
    procedure spb_SetTajwidClick(Sender: TObject);
    procedure spb_NormalClick(Sender: TObject);
    procedure spb_TahsinClick(Sender: TObject);
    procedure spb_TajwidClick(Sender: TObject);
    procedure str_BookClick(Sender: TObject);
    procedure trPromptDblClick(Sender: TObject);
    procedure VLCPlayerAyatMediaPlayerEndReached(Sender: TObject);
    procedure VLCPlayerAyatMediaPlayerPlaying(Sender: TObject);
    procedure VLCPlayerAyatMediaPlayerPositionChanged(Sender: TObject;
      po: Single);
    procedure VLCPlayerAyatMediaPlayerStopped(Sender: TObject);
    procedure VLCPlayerHelpMediaPlayerPositionChanged(Sender: TObject;
      po: Single);
    procedure VLCPlayerTerjemahMediaPlayerEndReached(Sender: TObject);
    procedure VLCPlayerTerjemahMediaPlayerPlaying(Sender: TObject);
    procedure VLCPlayerTerjemahMediaPlayerStopped(Sender: TObject);

  private

    // Form Unit Internal App
    FRM_Quiz : TfrmQuiz;
    FRM_ChatAI : Tfrm_ChatAI;
    FRM_Record : Tfrm_RecordAudio;
    FRM_Qori : Tfrm_Qori;
    FRM_browser : TfrmBrowser;
    FRM_book : TfrmBrowser;
    FRM_Doc  : TfrmBrowser;
    FRM_Tajwid : TfrmRegTajwid;
    FRM_Ayat : TfrmBrowser;
    FRM_Tafsir : TfrmBrowser;
    FRM_Mushaf : TfrmBrowser;
    FRM_DaftarAyat : TfrmBrowser;
    FRM_Huruf : Tfrm_ShowHuruf;
    FRM_Pesan : Tfrm_Pesan;
    FRM_Player : Tfrm_Player;
    FRM_Keyboard : Tfrm_Keyboard;
    FRM_Hadist : TfrmBrowser;
    FRM_VariasiTerjemahKata : TfrmBrowser;
    FRM_DaftarAyatByTema: TfrmBrowser;
    FRM_Kemenag : TfrmBrowser;
    FRM_ASk    : Tfrm_Ask;
    FRM_About  : TFAbout;
    FRM_SPLASH : TFZSplash;
    FRM_EDITRANS : TfrmEditTrans;
    FRM_Progress : TfrmProgress;
    FRM_Agree : TfrmAgreement;
    FRM_Wait : TfrmWait;
    FRM_Statistika : TfrmStatistika;
    FRM_Setting : TfrmSetting;
    Fregistration : TFregistration;
    FRM_Kata : TfrmShowKata;
    FRM_Tafsir2 : TfrmTafsir2;
    FRM_QuoteMaker : TfrmQuoteMaker;
    FRM_Jamu : TfrmJamu;
    FRM_DBSource : TfrmDBSource;
    FRM_Translate_Tafsir : TfrmTranslate;
    FRM_ResTranslate: TfrmResTranslate;
    // --------------
    function GetVolumeID(DriveChar: Char): string;
    procedure LoadAwal ;
    procedure LoadAyatBySurat(nosurat:string);
    procedure LoadTafsir(kitab:integer);
    procedure LoadDaftarPerKata(ida:string);
    procedure LoadTerjemahHv(ida:string);
    procedure PlayAyat;
    procedure PlayTerjemah;
    function  SplitAyatPerHuruf(ayat:string;delimiter:string):String;
    procedure OpenDocAyat(id:string);
    procedure DisableButtonNav;
    procedure DisableButtonTafsir;
    procedure LoadPageAyatTahsin;
    procedure LoadPageAyatTajwid;
    procedure LoadPageAyatNormalByAI;
    procedure LoadPageAyatResume(ida:string);
    procedure LoadPageAyatTafsirSingkat(ida:string);
    procedure LoadPageAyatTafsirLanjutan(ida:string;kitab:string);
    procedure LoadPageAyatKata;
    procedure LoadPageInQuote;
    function LoadPageTerjemah(ida:string):string;
    function LoadPageTafsirSesuaiKitab(ida:string;kitab:string):string;
    procedure LoadDaftarTafsirByAyat(ida : String);
    procedure LoadDaftarAyat;
    procedure TahsinAyatPerHuruf;
    procedure LoadTafsirWeb(ida:string;nom_kitab:integer);
    procedure LoadTafsirWebPlain;
    procedure LoadTafsirWebTranslated;
    function TranslateUseChatGPT(s:string):string;
    function TranslateUseGemini(s:string):string;
    function TranslateUseGeminiNoThread(s:string):string;

    procedure TajwidAyat;
    procedure ConnectDB;
    procedure btCreateIniClick;
    //function GetInfoHijaiyah(huruf:string):string;
    function GetVariasiKata(kata:UTF8String):UTF8String;
    procedure GenerateTemplateTerjemahan(ida:string;nom:integer);
    function TandaKeyPadaAyat(ayat:string;kata:string):string;
    procedure ShutDownDB;
    function EkstrakKata(kata:string):string;
    function SetWarnaHuruf(h:UTF8String):string;
    function SetWarnaSifatHuruf(h:UTF8String;kolom:string;sifat:string):string;
    procedure StatistikKata(k:UTF8String);
    function GetItem(sq:string):String;
    procedure GetHadistSesuaiTemaByAI;
    procedure TranslateHadistByGemini;
    procedure TranslateHadistByGPT;
    function HasLAN: Boolean;
    function HasInternet: Boolean;
    function LoadPageTemaTerkait(id:string):string;
    procedure LoadResumeKataByAI;
    procedure ShowDaftarByTema(tema:string);
    function LoadDataChart(sq:string):String;
    procedure ChartSebaranKata(s:string;k:string);
    procedure OpenPageHv(script:string;hv:THtmlViewer;f:string);
    function SetTerjemahByID(id:string):string;
    function GetMacAddress:string;
    procedure TampilkaAyatByVariasiTerjemahan(k:string);
    procedure ShowAllBySurat(n:string);
    procedure ShowAllTerjemahBySurat(n:string);
//    procedure ShowEkstrakAyat(ida:string);
    function JabarkanKata(ida:string):string;
    function JabarkanHuruf(ida:string):string;
    function JabarkanHurufPlain(ida:string):string;
    function SetInfoHijaiyah(k:String):string;
    procedure LoadPageAyatLanguage(ida:string);
    function LoadPageTerjemahLang(utf:boolean;ida:string):string;
    procedure  LoadStatistikKata(ida:string);

  public

      PEMBACA   : string;
      ID_AYAT   : string;
      TAFSIR    : integer;
      DIR_APP   : string;
      FONT_QR   : string;
      FONT_LATIN : string;
      TIPE_S    : string;
      FONT_S    : integer;
      KEY_WORD_ARB  : string;
      KEY_WORD_TRJ : string;
      DAFTAR_AYAT : string;
      VI_TERJEMAH : string;
      LOCK_ID : string;
      MARK_READ : string;
      DO_THREAD : string;
      RESUME_TEMA : string;
      KATA_NOW : string;
      RESUME_KATA : string;
      RESUME_AYAT : string;
      GEMINI_URL : string;
      TEMA_NOW : string;
      KITAB_TAFSIR_NOW :string;
      ISI_TAFSIR_NOW : string;

      SETTING_API : string;
      SETTING_PROMPT_RESUME_KATA : string;
      SETTING_PROMPT_RESUME_TEMA : string;
      SETTING_PROMPT_RESUME_AYAT : string;
      SETTING_PROMPT_TRANS_TAFSIR : string;
      SETTING_PROMPT_TRANS_HADIST : string;
      SETTING_TYPE : string;
      procedure Katakan(kalimat:string);
      procedure ShowInfodrWeb(h : string;tipe:string;nom:string);

       // Penyederhanaan Prosedur

      procedure OpenTahsin(huruf:string);
      procedure OpenTajwid(huruf:string);
      procedure OpenTafsir(kalimat:string;nom:string);
      procedure OpenPage(script:string;respon:string);
      procedure OpenPageAyat(tipe:string);
      procedure OpenKata(k:UTF8String);
      procedure OpenAyat(id:string);
      procedure OpenAyatNormalByAI(id:string);
      procedure LoadPageAyatHuruf(huruf:string);
      procedure JawabPertanyaan(tanya:string);
      procedure taawudz;
      procedure LoadPageKataHuruf(kata:string);
      procedure OpenAyatByID(ida:string);
      procedure ShowAgree;
      procedure OpenSetting;
      procedure TranslateTafsir(h:UTF8String;n:string);
      function GetRandomAPI:string;
      procedure CekAct;
      function GetTafsir(ida:string):string;
      function GetJummal(k:string;s:string;d:string):string;
      function GetSifatHuruf(h:String; kolom:string;nama_sifat:string):string;
      procedure ShowAyatTerkaitByTema(tema:string);
      procedure LoadPageShowTema(ida:string);
      procedure OpenDaftarAyatByKataArab(k:UTF8String);
      function ToArabicNumber(num: Integer): String;
      function GetInfoHijaiyah(huruf:string):string;
      function GetFakataHuruf(h:string;ida:string):string;
      function SetWarnaHurufByJenis(h:string):string;
      procedure ShowEkstrakAyat(ida:string);
      procedure ShowTranslateTafsir(ida:string;nom:integer);
      procedure ShowVideoTutorial(k:string);
      procedure LoadQuoteQuran(ida:string);
      procedure CopyTextToTranslate;
      function GetdataBySQL(s:string):string;
      procedure CreatePagByIDAyat(ida:string);
  end;

var
  frm_Main: Tfrm_Main;
  p1,p2:integer;
  CheckingInternet: Boolean;
  LANConnState: Boolean;

const


  //API_URL = 'https://api.openai.com/v1/chat/completions';
  AUDIO_TERJEMAH ='https://archive.org/download/AlQuran-terjemahan-indonesia-tanpa-bahasa-arab/' ;
  //KEMENAG_LINK ='https://quran.kemenag.go.id/quran/per-ayat/';
  QURAN_ENC = 'https://quranenc.com/id/browse/indonesian_complex/';


implementation

{$R *.lfm}


procedure Tfrm_Main.LoadAwal ;
begin


  tbs_agreement.show;
  pnDetilKata.height :=0;
  //pnDetilKata.Height:=0;
  pgTengah.ShowTabs:=false;
  pg_Tafsir.ShowTabs:=false;
 // pnl_Atas.Align:=alBottom;
  tbs_Surat.show;
  tbs_showDaftarAyat.show;
  tbs_DaftarKata.show;

  // Mengambil Nilai Parameter Default
  OpenSetting;

  // Set Variabel Global
  TAFSIR          := 1;
  ID_AYAT         := '1:1';
  PEMBACA         := DIR_APP + 'support/audio/qori/';
  FONT_QR         := 'Nabi';
  //FONT_LATIN      := 'HvDTrial Pluto Sans Regular';
  //FONT_LATIN      := 'Lupina Demo Regular';
  FONT_LATIN      := 'Bahnschrift';
  GEMINI_URL      := 'AIzaSyA8iVXYTBUVhUTJduKMZGoHIF9yQZxc6iY';
  TIPE_S          := 'normal';
  FONT_S          := 30;
  VI_TERJEMAH     := 'vertikal' ;
  MARK_READ       := 'TERJEMAH' ;
  RESUME_TEMA     := '';
  RESUME_AYAT     := '';
  KITAB_TAFSIR_NOW:= 'THOBARI';
  ISI_TAFSIR_NOW := '';

  // Set Lokasi Folder Book
  FLBook.Directory:= DIR_APP + 'support\book\';

  DtSurat.open;
  TIPE_S:='normal';

  DtTema.open;
  DTProgres.open;
  DTBookmark.Open;
  tbs_Agreement.show;
  ShowAgree;

  spb_baca.FileName := DIR_APP + '\support\gif\play3.gif';
  trPrompt.FullCollapse;
  WindowState:=wsMaximized;

end;

procedure Tfrm_Main.btCreateIniClick;
var
  f : TStringList;
  l : string;
  c : string;
begin

  // Create My.INI
  l := ExtractFilePath(Application.ExeName) + 'support\database\maria\data';
  l := AnsiReplaceStr(l,'\','/');

  f:=TStringList.Create;
    f.Clear;

  f.Add('[mysqld]');
  f.Add('port=6363');
  f.Add('datadir=' + trim(l));
  f.Add('bind=0.0.0.0');

  f.Add('[client]');

  l := ExtractFilePath(Application.ExeName) + 'support\database\maria\lib\plugin';
  f.Add('plugin-dir=' + l);

  c := ExtractFilePath(Application.ExeName) + 'support\database\maria\data\my.ini';

  f.SaveToFile(Pchar(c));

end;


function Tfrm_Main.GetVolumeID(DriveChar: Char): string;
var
 MaxFileNameLength, VolFlags, SerNum: DWord;
begin
  if GetVolumeInformation(PAnsiChar(DriveChar + ':\'), nil, 0, @SerNum, MaxFileNameLength, VolFlags, nil, 0)
  then
  begin
    Result := IntToHex(SerNum * 15,8) + IntToHex(SerNum * 3,8) ;
  end
  else
    Result := '';
end;

// Prosedur Konek ke Database MariaDB
procedure Tfrm_Main.ConnectDB;
var
  cmd : string;
begin
  DIR_APP := ExtractFilePath(Application.ExeName);


 try
  with koneksi do
  begin
     Protocol:='MariaDB-10';
     HostName:='127.0.0.1';
     Port:=6363;
     LibraryLocation:=DIR_APP + 'support/libmariadb.dll';
     User:='isyarah';
     Password:='allahuakbar';
     Database:='isyarahdb2';
     Connect;
  end;
 except
   on e:Exception do
   begin
        btCreateIniClick;
        cmd  := PChar(DIR_APP + 'support/database/maria/bin/mariadbd.exe');
        Process1.ShowWindow:=swoHIDE;
        Process1.CommandLine:=cmd;
        Process1.Execute;
        Koneksi.Connect;
   end;

 end;

 with KOneksi_Tajwid do
 begin
     Database:= PChar(DIR_APP + 'support/database/sql/tajwid.db3');
     LibraryLocation:= PChar(DIR_APP + '/support/sqlite3.dll');
     Protocol:='sqlite-3';
     Connect;
 end;
end;

//CURL dengan Gemini/Bard
function Tfrm_Main.TranslateUseGemini(s:string):string;
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

    SETTING_API:= GetRandomAPI;
    //https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=
    gemini_ac:= 'https://generativelanguage.googleapis.com/v1beta/models/'+
                'gemini-1.5-flash:generateContent?key=' + SETTING_API ;

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

        ShowMessage( 'Terdapat Error dalam Request , Coba Ulangi');
        Result := '';
      end;
    end;

    Client.Free;
    Response.Free;
    RequestBody.Free;
    thrRequestAI.Terminate;

end;

function Tfrm_Main.TranslateUseGeminiNoThread(s:string):string;
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

    SETTING_API:= GetRandomAPI;
    gemini_ac:= 'https://generativelanguage.googleapis.com/v1beta/models/'+
                'gemini-1.5-flash:generateContent?key=' + SETTING_API ;

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

        ShowMessage( 'Terdapat Error dalam Request , Coba Ulangi');
        Result := '';
      end;
    end;

    Client.Free;
    Response.Free;
    RequestBody.Free;

end;


//CURL dengan ChatGPT
function Tfrm_Main.TranslateUseChatGPT(s:string):string;
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
        ShowMessage( 'Terdapat Error dalam Request , Coba Ulangi');
      end;
    end;

  // Bebaskan sumber daya
    Client.Free;
    Response.Free;
    RequestBody.Free;
    thrRequestAI.Terminate;

end;

// Prosedur Membaca Menggunakan Python Wrapper
procedure Tfrm_Main.Katakan(kalimat:string);
var
    s :string;
    f :TStringList;
begin
    kalimat := AnsiReplaceStr(kalimat,'"','`');

    s :='from gtts import gTTS'+ #13 +
        'from soundplay import playsound'+ #13 +
        'def text_to_speech(text, filename):'+ #13 +
        '    tts = gTTS(text, lang=''id'', tld=''com'',slow=False)'+ #13 +
        '    tts.save(filename)'+ #13+

        '    playsound(filename)'+#13+
        'text = "' + kalimat + '"'+#13+
        'filename = "output.mp3"'+#13+
        'text_to_speech(text, filename)';
    try
      f := TStringList.Create;
      f.Add(s);
      f.SaveToFile(DIR_APP + 'suara.py');
    finally
    f.free;
    end;

    try
       //PythonEngine1.ExecFile(DIR_APP + 'suara.py');
    except
      on e:exception do
      ShowMessage('Tidak Terhubung dengan Layanan GTTS , Periksa Koneksi Internet Anda');
    end;
end;

procedure Tfrm_Main.ShowInfodrWeb(h : string;tipe:string;nom:string);
var
    c : string ='';
    r : string ='';
    u : string ='';
    i : integer;
    y,s : TStringList;
begin

  if tipe='huruf' then
  begin

    try
    if Length(h)<5 then
    begin

     // FRM_Huruf.pg_Huruf.ShowTabs:=false;

      With DTHuruf do
      begin
        close;
        SQL.Clear;
        SQL.Add('select * from hijaiyah where trim(arab)=' + QuotedStr(h)) ;
        Open;
      end;
         FRM_Huruf.spb_Makhraj.Caption:= ' Tutorial : "' + DTHuruf.FieldByName('arab').AsString  + '"';

      With DTSifat do
      begin
        close;
        SQL.Clear;
        SQL.Add('select * from v_sifat_huruf where arab=' + QuotedStr(h));
        Open;
        FRM_Huruf.spb_Sifat.Caption:= ' Tutorial : "' + DTSifat.FieldByName('nama').AsString  + '"';
      end;


      c := SplitAyatPerHuruf(DtAyat.FieldByName('teks_ayat').AsString,' ');
      try
        y := TStringList.Create;
        y.Text:=c;

        for i := 0 to y.Count -1 do
        begin

          if y.Strings[i]<>'' then
           begin
             if y.Strings[i]=h then
             u := u + '<a style="color:green;text-decoration: none;" href="#HURUF' +
                  y.Strings[i] + '">' + y.Strings[i] + '</a>' + ''
             else
             u := u + '<a style="color:hotpink;text-decoration: none;" href="#HURUF' +
                  y.Strings[i] + '">' + y.Strings[i] + '</a>' + '' ;
           end;

        end;
        r :=  '<body style="background-color:#F0F7E2"><br><br><div dir="rtl" align="center" '+
              'style="font-size:'+ IntToStr(FONT_S) +  'px;font-family:'+
              FONT_QR +';line-height:2.5">' + u  + '</div><br><br>';

      finally
        y.free;
      end;

       try
       s := TStringList.Create;
       s.Text:=r ;
       s.SaveToFile(DIR_APP + 'support\page\h.html');
       FRM_Ayat.Chromium1.LoadURL(DIR_APP + 'support\page\h.html');

      finally
       s.Free;
      end;

     end;

    except
      on e:exception do begin
        ShowMessage('Ada Error , Ulang Lagi');
        exit;
      end;
    end;
  end ;

end;

procedure Tfrm_Main.TahsinAyatPerHuruf;
var
  h,u,r : UTF8String;
  y,s  : TStringList;
  i : integer;
begin

  h := SplitAyatPerHuruf(DtAyat.FieldByName('teks_ayat').AsString,' ');

  try
    y := TStringList.Create;
    y.Text:=h;
    u := '<div dir="rtl">' ;

    for i := 0 to y.Count -1 do
    begin
      if y.Strings[i]<>'' then
       u := u + '<a style="color:hotpink;text-decoration: none;" href="#' +
            y.Strings[i] + '">' + y.Strings[i] + '</a>' + '' ;
    end;

    r :=  '<div align="center" style="font-size:'+ Inttostr(FONT_S)  +'px;font-family:'+ FONT_QR +'">' + u  +
          '</div>';


   s := TStringList.Create;
   s.Text:=r;
   s.SaveToFile(DIR_APP + 'support\page\h.html');
   FRM_Doc.Chromium1.LoadURL(DIR_APP + 'support\page\h.html');


  finally
    y.free;
    s.free;
  end;

end;

// Membuka Grid Daftar Terjemah Per Kata pada Panel Kanan
procedure Tfrm_Main.LoadDaftarPerKata(ida:string);
begin
  ida := DtAyat.FieldByName('id_ayat').AsString;

  With DTTerjemahKata do
  begin
    close;
    ParamByName('v_ida').AsString:=ida;
    open;
  end;

  With DTDaftarKata do
  begin
    close;
    ParamByName('v_ida').AsString:=ida;
    open;
  end;

  FRM_Mushaf.Chromium1.LoadURL('about:blank');

end;

// Membuka Halaman Tafsir sesuai Kitab Yang Dipilih

procedure Tfrm_Main.LoadTafsir(kitab:integer);
var
  ida : string;
begin
  ida := DtAyat.FieldByName('id_ayat').AsString;

  With DTTafsir do
  begin
    close;
    ParamByName('v_nom').AsInteger:=kitab;
    ParamByName('v_ida').AsString:=ida;
    Open;
  end;

  LoadTafsirWebPlain;
  tbs_Tafsir.show;


end;

// Membuka Terjemah Menggunakan HTMViewer
procedure Tfrm_Main.LoadTerjemahHv(ida:string);
var
  h : string;
begin

  h := DtAyat.FieldByName('tafsir').AsString;
  h := AnsiReplaceStr(h,#13,'<br>');
  h := '<div width="100%" align="justify">' + h + '</div>';

end;

// Prosedur Dijalankan pada Saat Form Show
procedure Tfrm_Main.FormShow(Sender: TObject);
begin
  FRM_SPLASH.Showmodal;
  LoadAwal;

end;

procedure Tfrm_Main.grdKataDblClick(Sender: TObject);
begin

  FRM_Kata.KATA:= DTTerjemahKata.FieldByName('utsmani').AsString;
  FRM_Kata.TERJEMAH:=DTTerjemahKata.FieldByName('arti').AsString;
  FRM_Kata.ShowModal;

end;



procedure Tfrm_Main.GrdKitabHadistCellClick(Column: TColumn);
begin

  with DTDaftarHadistByKitab do
  begin
    close;
    ParamByName('v_kitab').AsString:= DTDaftarKitabHadist.FieldByName('kitab').AsString;
    open;
  end;

end;

procedure Tfrm_Main.grdNomorHadistCellClick(Column: TColumn);
var
  kitab,nomor:string;
  trj : string;
begin

  kitab := DTDaftarKitabHadist.FieldByName('kitab').AsString;
  nomor := DTDaftarHadistByKitab.FieldByName('nomor').AsString;
  jvHadistJudul.Caption:= kitab + ' Hadist Nomor :' + nomor;


  With DTShowHadist do
  begin
   close;
   sql.Clear;
   sql.Add('select * from v_hadist where kitab=' + QuotedStr(kitab) + ' and nomor=' + nomor );
   open;


   trj := FieldByName('terjemah').AsString;
   trj := AnsiReplaceStr(trj,#13,'<br>');
   trj := AnsiReplaceStr(trj,':**','</b><hr>');
   trj := AnsiReplaceStr(trj,'**','<br><b>');
   trj := AnsiReplaceStr(trj,'. ',' ');
   trj := AnsiReplaceStr(trj,'.','<br><br>');
   trj := AnsiReplaceStr(trj,'*','');
   trj := AnsiReplaceStr(trj,'" ','');
   trj := AnsiReplaceStr(trj,'"',' ');
   trj := AnsiReplaceStr(trj,'''','');
   hvTerjemahHadist.LoadFromString('<div style="font-family:Bahnschrift;'+
                                   'padding:20px;line-height:1.2;text-align:left;font-size:20px">' +
                                   trj +'</div>');
  end;

end;

procedure Tfrm_Main.GrdRegKataCellClick(Column: TColumn);
var
  resumeai : string;
begin

  KATA_NOW := DTRegKata.FieldByName('arab_harokat').AsString;

  resumeai := GetItem('select resumeai from terjemah_kata where arab_harokat=' +QuotedStr(KATA_NOW));

   {
  hvResumeKata.LoadFromString('');
  if resumeai<>'' then
   OpenPageHv(resumeai,hvResumeKata,'resumekata.htm')
  else
   OpenPageHv('',hvResumeKata,'resumekata.htm');
  }
end;

procedure Tfrm_Main.GrdRegKataDblClick(Sender: TObject);
var

  df_ayat : string;
  df_id_ayat : string;
  i : integer;
begin

  i := 0;
  tbs_Ayat.show;
  lbKata.Caption:= DTRegKata.FieldByName('utsmani').AsString ;
  With DTGetData do
  begin
    close;
    sql.Clear;
    sql.Add('select distinct id_ayat from terjemah_kata where utsmani=' +
            QuotedStr(DTRegKata.FieldByName('utsmani').AsString ));

    Open;
    df_id_ayat := '''';

    KEY_WORD_ARB := DTRegKata.FieldByName('arab_harokat').AsString;

    While not eof do
    begin

      df_id_ayat := df_id_ayat + FieldByName('id_ayat').AsString + ''',''' ;
      next;

    end;
    df_id_ayat := AnsiMidStr(df_id_ayat,1,Length(df_id_ayat)-2);
  end;


  With DTAyat do
  begin
    close;
    sql.Clear;
    sql.Add('select * from v_ShowdaftarAyat where id_ayat in(' + df_id_ayat  + ')');
    open;
    tbs_showDaftarAyat.show;
    lb_Tema.Caption:= 'Mengandung Kata " '+ DTRegKata.FieldByName('arab').AsString + ' "';
    lb_JumlahData.Caption:= 'Jumlah Ayat : ' + IntToStr(RecordCount);

  end;

  LoadDaftarAyat;
  DisableButtonNav;
  spb_Normal.Flat:=false;

end;

procedure Tfrm_Main.GrdSifatHurufDblClick(Sender: TObject);
var
   cf : string;
begin

  cf := DIR_APP + 'support\video\huruf_sifat\' + DTSifat.FieldByName('vid').AsString  ;
  if FileExists(cf) then
  begin
    FRM_Player.FILE_MEDIA:= cf ;
    FRM_Player.ShowModal;
  end
  else
     ShowMessage('File Tutorial Belum tersedia');

end;

procedure Tfrm_Main.grdTemaDblClick(Sender: TObject);
begin
  ShowDaftarByTema(DtTema.FieldByName('tema').AsString);
end;

procedure Tfrm_Main.GRDVariasiKataCellClick(Sender: TObject);
begin
  //ChartSebaranKata(DTKataByStat.FieldByName('utsmani').AsString,'kata');
  //StatistikKata(DTKataByStat.FieldByName('utsmani').AsString);
end;

procedure Tfrm_Main.ShowDaftarByTema(tema:string);
var
  df_ayat : string;
  urtem : string;
begin

  RESUME_TEMA :='';
  tbs_Ayat.show;

  DtTema.Locate('tema',tema,[loPartialKey]);

  df_ayat:= DTTema.FieldByName('ayat').AsString;
  df_ayat := '''' + AnsiReplaceStr(df_ayat ,', ',''',''');
  df_ayat :=  AnsiReplaceStr(df_ayat ,' ',''',''');

  With DTAyat do
  begin

    close;
    sql.Clear;
    sql.Add('select * from v_ShowdaftarAyat where id_ayat in(' + df_ayat  + ''')');
    open;

    tbs_showDaftarAyat.show;
    lb_Tema.Caption:= DtTema.FieldByName('tema').AsString;
    lb_JumlahData.Caption:= 'Jumlah Ayat : ' + IntToStr(RecordCount);


  end;
  LoadDaftarAyat;
  DisableButtonNav;
  spb_Normal.Flat:=false;
  tbs_UraianTemaByAI.show;
  urtem:= DtTema.FieldByName('resume').AsString;
  urtem:=AnsiReplaceStr(urtem,'*','');
  urtem:=AnsiReplaceStr(urtem,#10,'<br>');
  OpenPageHv(urtem,hvResume,'resumetema.htm' )

end;

procedure Tfrm_Main.grdVariasiKataDblClick(Sender: TObject);
var

  df_ayat : string;
  df_id_ayat : string;

begin

  tbs_Ayat.show;

  With DTGetData do
  begin
    close;
    sql.Clear;
    sql.Add('select distinct id_ayat from terjemah_kata where utsmani=' +
            QuotedStr(DTVariasiKata.FieldByName('utsmani').AsString ));
    Open;
    KEY_WORD_ARB := DTVariasiKata.FieldByName('arab_harokat').AsString;
    df_id_ayat := '''';

    While not eof do
    begin

      df_id_ayat := df_id_ayat + FieldByName('id_ayat').AsString + ''',''' ;
      next;

    end;
    df_id_ayat := AnsiMidStr(df_id_ayat,1,Length(df_id_ayat)-2);
  end;


  With DTAyat do
  begin
    close;
    sql.Clear;
    sql.Add('select * from v_ShowdaftarAyat where id_ayat in(' + df_id_ayat  + ')');
    open;
    tbs_showDaftarAyat.show;
    lb_Tema.Caption:= 'Mengandung Kata " '+ DTVariasiKata.FieldByName('utsmani').AsString + ' "';
    lb_JumlahData.Caption:= 'Jumlah Ayat : ' + IntToStr(RecordCount);

  end;
  DisableButtonNav;
  spb_Normal.Flat:=false;

end;

procedure Tfrm_Main.GRD_BookmarkDblClick(Sender: TObject);
var
  nosurat : String;
  id : string;
begin

  id := DTBookmark.FieldByName('surat_ayat').AsString;
  nosurat:= DTBookmark.FieldByName('nosurat').AsString;
  DtAyat.sql.Clear;
  DtAyat.sql.Add('select * from v_ShowdaftarAyat where nomor_surat=' + nosurat);
  DtAyat.open;
  OpenAyat(id);

  lb_Tema.Caption:= DTBookmark.FieldByName('name_arabic').AsString +
                        ' ( ' + DTBookmark.FieldByName('name_indonesia').AsString + ' ) ';
  lb_JumlahData.Caption:= 'Jumlah Ayat :' + DTBookmark.FieldByName('jumlah_ayat').AsString;


end;


procedure Tfrm_Main.dbTerjemahDblClick(Sender: TObject);
begin
   if Dialogs.MessageDlg('Simpan Perubahan Terjemahan ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin

    DTTafsir.edit;
    DTTafsir.post;

    end;
end;

procedure Tfrm_Main.edtFilSuratChange(Sender: TObject);
begin
  DtSurat.Filtered:=false;
  DtSurat.Filter := 'nama_surat like' + QuotedStr('*'+edtFilSurat.text+'*');
  DtSurat.Filtered:=true;
  DtSurat.First;
end;

procedure Tfrm_Main.edtFilSuratDblClick(Sender: TObject);
begin
   edtFilSurat.Clear;
  DtSurat.Filtered:=false;
end;

procedure Tfrm_Main.edb_H1Change(Sender: TObject);
var
  ba : String;
begin
  lbBacaan.Caption:='';
  ba := Trim(AnsiReplaceStr(DTRefTajwid.FieldByName('h1').AsUTF8String,'<br>',''));
  lbBacaan.Caption:=ba;
end;

procedure Tfrm_Main.DtAyatAfterOpen(DataSet: TDataSet);
begin

  ID_AYAT:= DtAyat.FieldByName('id_ayat').AsString;
  LoadDaftarPerKata(ID_AYAT);
  LoadDaftarAyat;

end;

procedure Tfrm_Main.DtAyatAfterScroll(DataSet: TDataSet);
begin

 LoadQuoteQuran(ID_AYAT);

end;

procedure Tfrm_Main.DTDaftarHadistByKitabAfterOpen(DataSet: TDataSet);
var
  kitab,nomor:string;
  trj : string;
begin

  kitab := DTDaftarKitabHadist.FieldByName('kitab').AsString;
  nomor := DTDaftarHadistByKitab.FieldByName('nomor').AsString;
  jvHadistJudul.Caption:= kitab + ' Hadist Nomor :' + nomor;

  With DTShowHadist do
  begin
       close;
       sql.Clear;
       sql.Add('select * from v_hadist where kitab=' + QuotedStr(kitab) + ' and nomor=' + nomor );
       open;

       trj := FieldByName('terjemah').AsString;
       trj := AnsiReplaceStr(trj,#13,'<br>');
       trj := AnsiReplaceStr(trj,':**','</b><hr>');
       trj := AnsiReplaceStr(trj,'**','<br><b>');
       trj := AnsiReplaceStr(trj,'. ',' ');
       trj := AnsiReplaceStr(trj,'.','<br><br>');
       trj := AnsiReplaceStr(trj,'*','');
       trj := AnsiReplaceStr(trj,'"','');
       trj := AnsiReplaceStr(trj,'"',' ');
       trj := AnsiReplaceStr(trj,'''','');
       trj := trim(trj);

       hvTerjemahHadist.LoadFromString('<div style="font-family:Bahnschrift;'+
                                       'padding:20px;line-height:1.2;text-align:left;font-size:20px">' +
                                       trj +'</div>');
  end;

end;

procedure Tfrm_Main.DTDaftarKitabHadistAfterOpen(DataSet: TDataSet);
begin

  With DTDaftarHadistByKitab do
  begin

   close;
   ParamByName('v_kitab').AsString:= DTDaftarKitabHadist.FieldByName('kitab').AsString;
   open;

  end;

end;


procedure Tfrm_Main.ckUlangChange(Sender: TObject);
begin
  ckNext.Checked:= not ckUlang.Checked;
end;

procedure Tfrm_Main.DBImage1Click(Sender: TObject);
begin
 if OPD.Execute then
  begin
       DTHuruf.Edit;
       TBlobField(DTHuruf.FieldByName('gbr')).LoadFromFile(OPD.FileName);
       DTHuruf.post;
  end;
end;

procedure Tfrm_Main.DBText4DblClick(Sender: TObject);
begin
    spb_SetTajwid.Enabled:=True;
end;


procedure Tfrm_Main.EdtTemaKeyPress(Sender: TObject; var Key: char);
begin

  if key=#13 then
   begin
   if Length(EdtTema.text)>3 then
    begin
         DtTema.Filtered:=false;
         DtTema.Filter:='tema like ' + QuotedStr('*'+ EdtTema.text+'*');
         DtTema.Filtered:=true;
    end
    else
   DtTema.Filtered:=false;

   end;

end;

procedure Tfrm_Main.edt_CariChange(Sender: TObject);
begin
  KEY_WORD_TRJ :=edt_Cari.text;

end;

procedure Tfrm_Main.edt_CariDblClick(Sender: TObject);
begin
  edt_Cari.Clear;
end;

procedure Tfrm_Main.Edt_CariKataChange(Sender: TObject);
begin

  if tbs_Hijaiyah.showing then
   begin
    if Length(Edt_CariKata.Text)> 3 then
    begin
      DTRegKata.Filtered:=false;
      DTRegKata.Filter := 'arab like' + QuotedStr('*' + Edt_CariKata.Text + '*');
      DTRegKata.Filtered:=True;

    end
    else
       DTRegKata.Filtered:=false;
  end;

  if tbs_latin.showing then
   begin
    if Length(Edt_CariKata.Text)> 3 then
    begin
      DTRegKata.Filtered:=false;
      DTRegKata.Filter := 'kata like' + QuotedStr('*' + Edt_CariKata.Text + '*');
      DTRegKata.Filtered:=True;

    end
    else
       DTRegKata.Filtered:=false;
  end;

end;

procedure Tfrm_Main.Edt_CariKataKeyPress(Sender: TObject; var Key: char);
begin

  if key=#13 then
  begin
   if Length(Edt_CariKata.Text)> 3 then
    begin
      DTRegKata.Filtered:=false;
      DTRegKata.Filter := 'kata like' + QuotedStr('*' + Edt_CariKata.Text + '*');
      DTRegKata.Filtered:=True;

    end
  else
     DTRegKata.Filtered:=false;
  end;
end;

procedure Tfrm_Main.edt_CariKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then
  begin
    If Length(edt_Cari.text)>3 then
    begin
         KEY_WORD_TRJ :=  edt_Cari.text ;
         DtAyat.close;
         DtAyat.sql.Clear;
         DTAyat.SQL.Add('select * from v_ShowdaftarAyat where indoText like' +
                        QuotedStr('%' + edt_Cari.text + '%') + 'limit 400');
         DtAyat.open;

         If DtAyat.IsEmpty then
          ShowMessage('Tidak Ditemukan Kata ' + edt_Cari.text )
         else
         begin
          tbs_showDaftarAyat.show;
          lb_JumlahData.Caption:= 'Terdapat ' + Inttostr(DtAyat.RecordCount) + ' Ayat ';
          lb_Tema.Caption:='Mengandung Terjemah Kata "' + edt_Cari.Text + '"';

         end;
    end;
  end;

end;

procedure Tfrm_Main.FLBookDblClick(Sender: TObject);
var
  book : string ;
begin

  book := FLBook.FileName;
  tbs_Book.show;
  FRM_book.respon:='TRANSLATE BOOK';
  FRM_book.Chromium1.LoadURL(book);



end;

procedure Tfrm_Main.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

  Koneksi.Disconnect;
  ShutDownDB;
  FRM_ChatAI.PythonEngine1.Free;
  Free;

end;

procedure Tfrm_Main.FormCreate(Sender: TObject);
begin

  ConnectDB;


  FRM_Qori := Tfrm_Qori.Create(self);
  FRM_ManageTafsir := Tfrm_ManageTafsir.Create(self);
  FRM_SPLASH := TFZSplash.create(self);
  FRM_EDITRANS := TfrmEditTrans.Create(self);

  FRM_ResTranslate := TfrmResTranslate.Create(self);
  FRM_ResTranslate.Parent := pn_TranslateBook;
  FRM_ResTranslate.Align:=alClient;
  FRM_ResTranslate.BorderStyle:=bsNone;
  FRM_ResTranslate.Show;

  FRM_Wait := TfrmWait.Create(self);      ;
  FRM_Setting := TfrmSetting.create(self);
  Fregistration := TFregistration.Create(self);
  FRM_Kata := TfrmShowKata.Create(self);
  FRM_Tajwid := TfrmRegTajwid.create(self);
  FRM_Agree := TfrmAgreement.create(self);
  FRM_Pesan := Tfrm_Pesan.create(self); ;
  FRM_Record := Tfrm_RecordAudio.Create(self);

  FRM_DaftarAyat := TfrmBrowser.Create(self);
  FRM_DaftarAyat.Parent := pnl_DaftarAyat;
  FRM_DaftarAyat.Align:=alClient;
  FRM_DaftarAyat.BorderStyle:=bsNone;
  FRM_DaftarAyat.Show;



  FRM_Progress := TfrmProgress.Create(self);
  FRM_Progress.Parent := pnl_Progress;
  FRM_Progress.Align:=alClient;
  FRM_Progress.BorderStyle:=bsNone;
  FRM_Progress.Show;


  FRM_DBSource := TfrmDBSource.Create(self);

  FRM_Quiz := TfrmQuiz.Create(self);
  FRM_Quiz.Parent := tbs_Quiz;
  FRM_Quiz.Align:=alClient;
  FRM_Quiz.BorderStyle:=bsNone;
  FRM_Quiz.Show;

  FRM_About  := TFAbout.Create(self);

  FRM_Statistika := TfrmStatistika.Create(Self);
  FRM_Statistika.Parent := pnl_Statistik;
  FRM_Statistika.Align:=alClient;
  FRM_Statistika.BorderStyle:=bsNone;
  //FRM_Statistika.show;


  FRM_book := TfrmBrowser.create(self);
  FRM_book.Parent := pnl_book;
  FRM_book.Align:=alClient;
  FRM_book.BorderStyle:=bsNone;
  FRM_book.AddressPnl.Hide;
  FRM_book.show;

  FRM_Mushaf := TfrmBrowser.create(self);
  FRM_Mushaf.Parent := pnl_Mushaf;
  FRM_Mushaf.Align:=alClient;
  FRM_Mushaf.BorderStyle:=bsNone;
  FRM_Mushaf.AddressPnl.Hide;
  FRM_Mushaf.show;


  FRM_VariasiTerjemahKata := TfrmBrowser.create(self);
  FRM_VariasiTerjemahKata.Parent := pnl_DetilVariasiTerjamahKata;
  FRM_VariasiTerjemahKata.Align:=alClient;
  FRM_VariasiTerjemahKata.BorderStyle:=bsNone;
  FRM_VariasiTerjemahKata.AddressPnl.Hide;
  FRM_VariasiTerjemahKata.show;



  FRM_DaftarAyatByTema := TfrmBrowser.create(self);
  FRM_DaftarAyatByTema.Parent := pnl_DaftarAyatByTema;
  FRM_DaftarAyatByTema.Align:=alClient;
  FRM_DaftarAyatByTema.BorderStyle:=bsNone;
  FRM_DaftarAyatByTema.AddressPnl.Hide;
  FRM_DaftarAyatByTema.show;


  FRM_browser := TfrmBrowser.create(self);
  FRM_browser.Parent := tbs_ShowBayan;
  FRM_browser.Align:=alClient;
  FRM_browser.BorderStyle:=bsNone;
  FRM_browser.Show;

  FRM_Kemenag := TfrmBrowser.create(self);
  FRM_Kemenag.Parent := tbs_kemenag;
  FRM_Kemenag.Align:=alClient;
  FRM_Kemenag.BorderStyle:=bsNone;
  FRM_Kemenag.Show;


  //FRM_ASk    := Tfrm_Ask.Create(self);
  FRM_Translate_Tafsir := TfrmTranslate.Create(self);
  FRM_Tafsir := TfrmBrowser.Create(self);
  FRM_Tafsir.Parent := tbs_TafsirWeb;
  FRM_Tafsir.Align:=alClient;
  FRM_Tafsir.BorderStyle:=bsNone;
  FRM_Tafsir.Show;

  FRM_Ayat := TfrmBrowser.Create(self);
  FRM_Ayat.Parent := pnl_Ayat;
  FRM_Ayat.Align:=alClient;
  FRM_Ayat.BorderStyle:=bsNone;
  FRM_Ayat.Show;
  FRM_Player := Tfrm_Player.Create(self);
  FRM_Jamu := TfrmJamu.Create(self);  ;

  FRM_ChatAI := Tfrm_ChatAI.Create(self);
  FRM_ChatAI.Parent := tbs_ChatAI;
  FRM_ChatAI.BorderStyle:=bsNone;
  FRM_ChatAI.Align:=alClient;
  FRM_ChatAI.PythonEngine1.SetPythonHome(ExtractFilePath(Application.ExeName) + 'support\python') ;
  FRM_ChatAI.PythonEngine1.DllPath:=ExtractFilePath(Application.ExeName) + 'support\python';
  FRM_ChatAI.PythonEngine1.LoadDll;
  FRM_ChatAI.Show;


  FRM_QuoteMaker := TfrmQuoteMaker.Create(self);
  FRM_QuoteMaker.Parent := pnQuote_Maker;
  FRM_QuoteMaker.Align:=alClient;
  FRM_QuoteMaker.BorderStyle:=bsNone;
  FRM_QuoteMaker.Show;

  FRM_Tafsir2 := TfrmTafsir2.Create(self);
  FRM_Tafsir2.Parent := pnl_Kitab;
  FRM_Tafsir2.Align:=alClient;
  FRM_Tafsir2.BorderStyle:=bsNone;
 // FRM_Tafsir2.Show;


  VLCPlayerAyat.VLC.Path:= ExtractFilePath(Application.ExeName) + 'support\vlc\';
  VLCPlayerTerjemah.VLC.Path:= ExtractFilePath(Application.ExeName) + 'support\vlc\';
  VLCPlayerMe.VLC.Path:= ExtractFilePath(Application.ExeName) + 'support\vlc\';
  VLCPlayerHelp.VLC.Path:= ExtractFilePath(Application.ExeName) + 'support\vlc\';
  VLCPlayerAyat.SetAudioVolume(80);
  VLCPlayerTerjemah.SetAudioVolume(80);
  VLCPlayerMe.SetAudioVolume(90);
  VLCPlayerHelp.SetAudioVolume(40);
  CekAct;


end;


function Tfrm_Main.SplitAyatPerHuruf(ayat:string;delimiter:string):String;
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

function RemoveEnter(const input: string): string;
var
  i: Integer;
  resultString: string;
begin
  resultString := '';
  for i := 1 to Length(input) do
  begin
    if (input[i] <> #10) and (input[i] <> #13) then
      resultString := resultString + input[i];
  end;
  RemoveEnter := resultString;
end;


procedure Tfrm_Main.GenerateTemplateTerjemahan(ida:string;nom:integer);
var
  h,awal,akhir,sql : UTF8String;
  i : integer;
  tsql : TStringList;
begin

  h := AnsiReplaceStr(ISI_TAFSIR_NOW,';',',');
  h := AnsiReplaceStr(h,'..','__');
  h := RemoveEnter(h);
  h := AnsiReplaceStr(h,'.',''');INSERT INTO ' +
       '`tafser_trans`(`id_ayat`,`nom`,`teks`) VALUES(''' + ida + ''',' +
       IntToStr(nom) + ',''' );

  h := AnsiReplaceStr(h,#13#10,'');

  awal := 'INSERT INTO `tafser_trans`(`id_ayat`,`nom`,`teks`) VALUES(''' + ida + ''',' +
          IntToStr(nom) + ',''';
  akhir:= ''');';

  sql := AnsiReplaceStr(awal + h + akhir,';',';'+ #13#10) ;

  try

    tsql := TStringList.Create;
    tsql.Text := sql;
    Koneksi.ExecuteDirect('delete from `tafser_trans` where nom=' + IntToStr(TAFSIR) +
                          ' and id_ayat=''' + ida + '''');
    For  i := 0 to tsql.Count - 1 do
         begin

           Koneksi.ExecuteDirect(tsql.Strings[i]);
         end;

    Koneksi.ExecuteDirect('delete from `tafser_trans` where trim(teks)=''''');

  finally
    tsql.Free;
  end;

  ShowMessage('Proses Generate Selesai ');

  ShowTranslateTafsir(ida,nom);



end;


procedure Tfrm_Main.LoadTafsirWebPlain;
var
  s : TStringList;
  a : string;
  script : string;
begin

  a := AnsiReplaceStr(DTTafsir.FieldByName('nass').AsString ,'.','<br><br>');
  script:=  '<body style="background-image:url(paper2.jpg)"><div '+
            ' dir="rtl" style="font-family:'+ FONT_QR +';font-size:18px;padding:20px">' + a + '<div>';

  try
     s := TStringList.Create;
     s.Text:=script;

     s.SaveToFile(DIR_APP + 'support\page\h.html');
     FRM_Tafsir.respon:= 'TAFSIR';
     FRM_Tafsir.Chromium1.LoadURL(DIR_APP + 'support\page\h.html');

   finally
        s.free;
   end;


end;

procedure Tfrm_Main.LoadTafsirWebTranslated;
var
  s : TStringList;
  html ,nom , terjemah , teks: String;
  img,imge:string;
  ayat_trj:string;
  trj : string;
begin


  img := ExtractFilePath(Application.ExeName) + '/support/translate.png';
  imge := ExtractFilePath(Application.ExeName) + '/support/edit.png';

   With DTTafsirWeb do
   begin
     close;
     ParamByName('v_nom').AsInteger:= TAFSIR;
     ParamByName('v_ida').AsString:= ID_AYAT;
     open;

     ayat_trj     := DtAyat.FieldByName('teks_ayat').AsString;
     trj := DtAyat.FieldByName('indoText').AsString;

     html :=  '<body style="background-image:url(paper1.jpg)" > '+
              '<div style="font-family:'+ FONT_QR +';Font-size:23px;text-align:center">' + ayat_trj + '</div>'+
              '<div style="font-family:' + FONT_LATIN + ';Font-Size:18px;text-align:center">' +
              trj + '</div><hr>';

     While not eof do
      begin
       teks         := DTTafsirWeb.FieldByName('teks').AsString ;
       nom          := DTTafsirWeb.FieldByName('idx').AsString;
       terjemah     := DTTafsirWeb.FieldByName('translate').AsString;

       html         := html +  '<div align="justify" style="font-family:' + FONT_LATIN + ';'+
                      'font-size:15px;Line-height:1.8;'+
                      'color:#616D90;'+
                      'padding: 5px"><b>' + terjemah + '</div>';
       next;
      end;
   end;
     html :=  html+'</body>';



   try
     s := TStringList.Create;
     s.Text:=html;

     s.SaveToFile(DIR_APP + 'support\page\h.html');
     FRM_Tafsir.respon:= 'TAFSIR';
     FRM_Tafsir.Chromium1.LoadURL(DIR_APP + 'support\page\h.html');

   finally
        s.free;
   end;
  tbs_TafsirWeb.show;



end;

procedure Tfrm_Main.LoadTafsirWeb(ida:string;nom_kitab:integer);
begin


   With DTTafsirWeb do
   begin
     close;
     ParamByName('v_nom').AsInteger:= nom_kitab;
     ParamByName('v_ida').AsString:= ida;
     open;

     if IsEmpty then
     begin

      if Dialogs.MessageDlg('Belum Ada Template Terjemahan .. , Generate ?',
        mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
         GenerateTemplateTerjemahan(ID_AYAT,TAFSIR)
        else
         exit;
     end
     else
     begin
      if Dialogs.MessageDlg('Terdapat Template Terjemahan .. , Generate Ulang ?',
        mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
         Koneksi.ExecuteDirect(' Delete from tafser_trans where id_ayat=' +  QuotedStr(ID_AYAT) +
                               ' and nom=' + Inttostr(nom_kitab) );
         GenerateTemplateTerjemahan(ID_AYAT,TAFSIR)
        end
        else
         ShowTranslateTafsir(ida,nom_kitab);

     end;

   end;
end;

procedure Tfrm_Main.grd_DaftarAyatCellClick(Column: TColumn);
begin

  ID_AYAT := DtAyat.FieldByName('id_ayat').AsString;
  LoadDaftarPerKata(ID_AYAT);
  LoadDaftarTafsirByAyat(ID_AYAT);

end;

procedure Tfrm_Main.grd_DaftarAyatDblClick(Sender: TObject);
begin

  tbs_showAyat.show;
  ID_AYAT := DtAyat.FieldByName('id_ayat').AsString;

  LoadDaftarPerKata(ID_AYAT);
  LoadDaftarTafsirByAyat(ID_AYAT);
  LoadPageAyatTafsirSingkat(ID_AYAT);

end;

procedure Tfrm_Main.grd_DaftarTafsirDblClick(Sender: TObject);
var
  id : integer;
  na : string;
begin


  id := DTDaftarTafsir.FieldByName('taf_no').AsInteger;
  na := DTDaftarTafsir.FieldByName('nameE').AsString;
  KITAB_TAFSIR_NOW := na ;
  // Nomor Kitab Tafsir
  TAFSIR := id;

  MARK_READ := UpperCase('TAFSIR ' + na);

  LoadPageAyatTafsirLanjutan(ID_AYAT,na);
  tbs_showAyat.show;



end;

procedure Tfrm_Main.GRD_DetilAyatBasicDblClick(Sender: TObject);
var
  Ida : string;
begin
  KEY_WORD_ARB := DTDetilAyat.FieldByName('kata').AsString;
  Ida := DTDetilAyat.FieldByName('QS').AsString;
  OpenAyatByID(ida);
end;

procedure Tfrm_Main.GRD_DetilAyatHarokatDblClick(Sender: TObject);
var
  Ida : string;
begin
  KEY_WORD_ARB := DTDetilAyat.FieldByName('kata').AsString;
  Ida := DTDetilAyat.FieldByName('QS').AsString;
  OpenAyatByID(ida);
end;

procedure Tfrm_Main.GRD_DetilAyatPlainDblClick(Sender: TObject);
var
  Ida : string;
begin
  KEY_WORD_ARB := DTDetilAyat.FieldByName('kata').AsString;
  Ida := DTDetilAyat.FieldByName('QS').AsString;
  OpenAyatByID(ida);
end;

procedure Tfrm_Main.LoadAyatBySurat(nosurat:string);

begin

    With DtAyat do
    begin

      close;
      sql.Clear;
      sql.Add('select * from v_ShowdaftarAyat where nomor_surat=' + nosurat);
      open;
      lb_Tema.Caption:= DtSurat.FieldByName('name_arabic').AsString +
                        ' ( ' + DtSurat.FieldByName('name_indonesia').AsString + ' ) ';
      lb_JumlahData.Caption:= 'Jumlah Ayat :' + IntToStr(RecordCount);

    end;

end;

procedure Tfrm_Main.Grd_SuratDblClick(Sender: TObject);
var
   surat : string;

begin

  pnDetilKata.height :=0;
  surat := DtSurat.FieldByName('idx').AsString;
  LoadAyatBySurat(surat);
  tbs_showDaftarAyat.show;
  tbs_Ayat.show;
  KEY_WORD_ARB := '';
  KEY_WORD_TRJ := '';



end;

procedure Tfrm_Main.Grd_SuratDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if DtSurat.FieldByName('tipe').AsString='Madinah' then
    Grd_Surat.Canvas.Font.Color:=$005654AB
  else
    Grd_Surat.Canvas.Font.Color:=clBlack;

  Grd_Surat.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;



procedure Tfrm_Main.hvResumeAyatHotSpotClick(Sender: TObject;
  const SRC: ThtString; var Handled: Boolean);
begin
   ShowDaftarByTema(Trim(AnsiMidStr(SRC,2,300)));
end;

procedure Tfrm_Main.hvResumeTemaByAyatHotSpotClick(Sender: TObject;
  const SRC: ThtString; var Handled: Boolean);
begin
   ShowAyatTerkaitByTema(Trim(AnsiMidStr(SRC,2,300)));
end;

procedure Tfrm_Main.lbBasicClick(Sender: TObject);
begin
  ChartSebaranKata(lbBasic.Caption,'basic');
  TampilkaAyatByVariasiTerjemahan('basic') ;
end;

procedure Tfrm_Main.lbKataClick(Sender: TObject);
begin
  ChartSebaranKata(lbKata.Caption,'kata');
  TampilkaAyatByVariasiTerjemahan('kata') ;
end;

procedure Tfrm_Main.lbPlainClick(Sender: TObject);
begin
  ChartSebaranKata(lbPlain.Caption,'plain');
  TampilkaAyatByVariasiTerjemahan('plain') ;
end;


procedure Tfrm_Main.lbTaawuzClick(Sender: TObject);
begin
  mnOptions.Enabled:=true;
end;

procedure Tfrm_Main.lbTaawuzDblClick(Sender: TObject);
begin
  spb_SetTajwid.Enabled:=True;
end;

procedure Tfrm_Main.lb_FahdClick(Sender: TObject);
begin

  tbs_Book.Show;

  FRM_book.Chromium1.LoadURL(DIR_APP + 'support\mushaf\' + TLabel(Sender).Caption + '.pdf');

end;

procedure Tfrm_Main.MenuItem47Click(Sender: TObject);
begin
   // OpenDocument(DIR_APP + 'support/Tutorial Isyarah.chm');
end;


procedure Tfrm_Main.mnAboutClick(Sender: TObject);
begin
  FRM_About.ShowModal;
end;

procedure Tfrm_Main.mnAllBySurahClick(Sender: TObject);
begin
  ShowAllBySurat(DtSurat.FieldByName('idx').AsString);
  tbs_showDaftarAyat.show;
end;

procedure Tfrm_Main.mnPDMS_JauharClick(Sender: TObject);
begin

   FONT_QR:= '_PDMS_Jauhar';
  OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.mnPustakaClick(Sender: TObject);
var
   book : string;
begin
  tbs_ayat.Show;
  tbs_Book.Show;
  tbs_Pustaka.show;
  pn_TranslateBook.Height:=0;
  book := FLBook.Directory + FLBook.Items[0];
  FRM_book.respon:='TRANSLATE BOOK';
  FRM_book.Chromium1.LoadURL(book);

end;

procedure Tfrm_Main.mnSaleemClick(Sender: TObject);
begin
   FONT_QR:= '_PDMS_Saleem_QuranFont';
  OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.mnToolAtasClick(Sender: TObject);
begin
  pnl_Atas.Align:=alTop;
end;

procedure Tfrm_Main.mnToolbarDibawahClick(Sender: TObject);
begin
   pnl_Atas.Align:=alBottom;
end;

procedure Tfrm_Main.Panel9Click(Sender: TObject);
begin

end;

procedure Tfrm_Main.setFontLatin(Sender: TObject);
begin
  FONT_LATIN :=  TMenuItem(Sender).Caption;
  OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.mnIndoPakClick(Sender: TObject);
begin

 FONT_QR:= 'AlQuran IndoPak by QuranWBW';
 OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.mnAlQalamClick(Sender: TObject);
begin

  FONT_QR:= 'Al Qalam Quran';
  OpenPageAyat(TIPE_S);


end;

procedure Tfrm_Main.mnAttariClick(Sender: TObject);
begin

  FONT_QR:= 'Attari_Quran';
  OpenPageAyat(TIPE_S);


end;

procedure Tfrm_Main.mnBookMarkClick(Sender: TObject);
begin
  tbs_history.show;
end;

procedure Tfrm_Main.mnChatAIClick(Sender: TObject);
begin

  tbs_sample.show;
  SETTING_API:= GetRandomAPI;
  FRM_ChatAI.Show;
  tbs_ChatAI.show;
  pg_Left.show;

end;

procedure Tfrm_Main.mnDoaKumaylClick(Sender: TObject);
begin

end;

procedure Tfrm_Main.mnExitClick(Sender: TObject);
begin

  Koneksi.Disconnect;
  ShutDownDB;
  FreeOnRelease;
  Free;
  Application.Terminate;

end;

procedure Tfrm_Main.mnForntBaaziClick(Sender: TObject);
begin

    FONT_QR:= 'KFGQPC BAZZI Uthmanic Script';
    OpenPageAyat(TIPE_S);

end;

procedure Tfrm_Main.mnHelpClick(Sender: TObject);
begin
  OpenDocument(DIR_APP + 'support/tutorial_isyarah.pdf');
end;

procedure Tfrm_Main.mnJawsanClick(Sender: TObject);
begin

end;

procedure Tfrm_Main.mnKamiMendengarClick(Sender: TObject);
begin

    OpenDocument('https://drive.google.com/drive/folders/1E5ytRto0UrZ2BkmxG8rV2RUs014mC7BH?usp=sharing');

end;

procedure Tfrm_Main.mnKoleksiClick(Sender: TObject);
begin
  FRM_Tafsir2.ShowModal;
end;

procedure Tfrm_Main.mnKoleksiTafsirClick(Sender: TObject);
begin
  FRM_Tafsir2.show;
end;

procedure Tfrm_Main.mnKufiStylisticClick(Sender: TObject);
begin
   FONT_QR:= 'KFGQPC Kufi Stylistic';
  OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.mnLPQClick(Sender: TObject);
begin

     FONT_QR:= 'LPMQ Isep Misbah';
     OpenPageAyat(TIPE_S);

end;

procedure Tfrm_Main.mnNbaiClick(Sender: TObject);
begin

    FONT_QR:= 'Nabi';
    OpenPageAyat(TIPE_S);

end;

procedure Tfrm_Main.mnme_quranClick(Sender: TObject);
begin
  FONT_QR:= 'me_quran';
  OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.mnnoorehiraClick(Sender: TObject);
begin

  FONT_QR:= 'noorehira';
  OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.mnOpenSansClick(Sender: TObject);
begin
 FONT_LATIN:= 'Open Sans';
 OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.mnOptionsClick(Sender: TObject);
begin

  DTSetting.open;
  DTSetting.Edit;
  FRM_Setting.ShowModal;

end;

procedure Tfrm_Main.mnPopHurufClick(Sender: TObject);
var

   h : String;
   t : TStringList;
   f : integer;
   g : string;

begin

     With DTGetData do
     begin
       close;
       sql.Clear;
       sql.Add('select gid, standard from quran_global order by gid asc');
       open;

       while not eof do
        begin
          h := FieldByName('standard').AsString;
          h := SplitAyatPerHuruf(h,'');
          g := FieldByName('gid').AsString;
          try
          t := TStringList.Create;
          t.Clear;
          t.Text:=h;
          Caption:= g;
             for f := 0 to t.Count -1 do
                  begin
                    Koneksi.ExecuteDirect('insert into huruf(gid,huruf) values(' + g + ',' +
                    QuotedStr(t.Strings[f]) + ')');
                  end;

          finally
          t.free
          end;
          next;
        end;

     end;


end;

procedure Tfrm_Main.mnProgresClick(Sender: TObject);
begin

  DTProgres.close;
  DTProgres.open;
  tbs_Progress.show;
  pg_Left.Visible:= False;

end;

procedure Tfrm_Main.mnQuizKataClick(Sender: TObject);
begin

  tbs_Quiz.show;
  FRM_Quiz.show;
  pg_Left.Visible:=True;

end;

procedure Tfrm_Main.mnQuoteMakerClick(Sender: TObject);
begin

 tbs_Ayat.Show;
 tbs_Quote.show;

end;

procedure Tfrm_Main.mnReemKufiClick(Sender: TObject);
begin
 FONT_QR:= 'Reem Kufi';
 OpenPageAyat(TIPE_S);

end;

procedure Tfrm_Main.mnRepoClick(Sender: TObject);
begin
  OpenDocument('https://drive.google.com/drive/folders/1F90gJzOoBH41Tc7gLU9VFD6I-rYDvwV8?usp=sharing');
end;

procedure Tfrm_Main.mnScheherazadeClick(Sender: TObject);
begin
  FONT_QR:= 'Scheherazade';
  OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.mnShowPanelBawahClick(Sender: TObject);
begin
    pnl_Atas.Visible:= mnShowPanelBawah.Checked;
end;

procedure Tfrm_Main.mnShowPanelKananClick(Sender: TObject);
begin
    pg_Right.Visible:= mnShowPanelKanan.Checked;
end;

procedure Tfrm_Main.mnShowPanelKiriClick(Sender: TObject);
begin
  pg_Left.Visible:= mnShowPanelKiri.Checked;
end;

procedure Tfrm_Main.mnSourceClick(Sender: TObject);
begin
  FRM_DBSource.ShowModal;
end;

procedure Tfrm_Main.mnSuaraAlamClick(Sender: TObject);
begin

end;

procedure Tfrm_Main.mnTaawudzClick(Sender: TObject);
begin

  VLCPlayerHelp.Stop();
  taawudz;

end;

procedure Tfrm_Main.mnTanyaClick(Sender: TObject);
begin

   if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     exit;
   end;


  VLCPlayerAyat.Stop();
  VLCPlayerTerjemah.Stop();
 // FRM_ASk.ShowModal;
end;

procedure Tfrm_Main.mnTutorClick(Sender: TObject);
begin

  pg_Left.hide;
  pg_Right.hide;
  spl_right.hide;
  pnl_Atas.hide;


  tbs_Ayat.show;
  tbs_Help.Show;
  VLCPlayerHelp.PlayNormal(DIR_APP + 'support\tutorial\pengantar.mkv');

end;


procedure Tfrm_Main.mnViewCompactClick(Sender: TObject);
begin
  pg_Left.show;
  pg_Right.show;
  spl_right.show;
  pnl_Atas.show
end;

procedure Tfrm_Main.mnViewFullScreenClick(Sender: TObject);
begin
  pg_Left.Hide;
  spl_right.hide;
  pg_Right.Hide;
  pnl_Atas.hide;
end;


procedure Tfrm_Main.mn_ShowHadistClick(Sender: TObject);
begin
  FRM_Hadist.ShowModal;
end;

procedure Tfrm_Main.mn_koleksiBukuClick(Sender: TObject);
begin
  tbs_Book.show;
  tbs_Pustaka.show;
end;

procedure Tfrm_Main.Neirizi(Sender: TObject);
begin
  FONT_QR:= 'Neirizi';
  OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.pbarAyatClick(Sender: TObject);
var
  yo : TPoint;
  x : word ;
  po : Single;

begin

  x := Mouse.CursorPos.X - pbarAyat.Left   ;
  po   := x / pbarAyat.Width * 100;

  pbarAyat.Value:=trunc(po);
  VLCPlayerAyat.SetVideoPosInPercent(po);


end;

procedure Tfrm_Main.pbarTutorialClick(Sender: TObject);
var
  yo : TPoint;
  x : word ;
  po : Single;

begin

  x := Mouse.CursorPos.X - pbarTutorial.Left   ;
  po   := x / pbarTutorial.Width * 100;

  pbarTutorial.Value:=trunc(po);
  VLCPlayerHelp.SetVideoPosInPercent(po);

end;

procedure Tfrm_Main.pg_LeftChange(Sender: TObject);
begin

end;

procedure Tfrm_Main.rbNunClick(Sender: TObject);
begin

    TIPE_S := 'tajwid';
    LoadPageAyatTajwid;
    tbs_showAyat.show;
    MARK_READ := 'TAJWID' ;

end;

procedure Tfrm_Main.GRDVariasiKataCellClick(Column: TColumn);
begin
  OpenKata(DTKataByStat.FieldByName('arab').AsString);
end;

procedure Tfrm_Main.spbAIBrowserClick(Sender: TObject);
begin
  OpenDocument(DIR_APP + 'support/AIBrowser.exe');
end;

procedure Tfrm_Main.spbTanyaGeminiClick(Sender: TObject);
begin
  if not spb_Resume.Flat then
       resumeTafsirAI(ID_AYAT)
  else if not spb_Tafsir_lanjutan.Flat then
       LoadTafsirWeb(ID_AYAT,TAFSIR)
  else if not spb_Kata.Flat then
       GetResumeKata;

end;


procedure Tfrm_Main.spb_Tafsir_lanjutanClick(Sender: TObject);
begin

  Splitter1.Height:=0;
  pnDetilKata.height :=0;
  LoadDaftarTafsirByAyat(ID_AYAT);
  LoadPageAyatTafsirLanjutan(ID_AYAT,KITAB_TAFSIR_NOW);
  tbs_DaftarTafsir.show;
  tbs_Ayat.show;
  tbs_Surat.show;
  DisableButtonTafsir;
  spb_Tafsir_lanjutan.Flat:=false;
  TIPE_S := 'lanjutan' ;
  spbTanyaGemini.Visible:=True;
  spbTanyaGemini.Caption:='Terjemahkan Tafsir';

  if MARK_READ='' then
     MARK_READ :=' TAFSIR THOBARI';

end;

procedure Tfrm_Main.spb_BackDaftarClick(Sender: TObject);
begin
  tbs_showDaftarAyat.show;
  LoadDaftarPerKata(ID_AYAT);
end;

procedure Tfrm_Main.spb_CopasHadistClick(Sender: TObject);
var
   s : string;
begin
   hvTerjemahHadist.SelectAll;
   s := hvTerjemahHadist.SelText;
   Clipboard.AsText:=DBMemo2.text  + #13#13 + s;

   ShowMessage('Hadist ini dan terjemahannya disalin ke Clipboard');
end;


procedure Tfrm_Main.spb_CopyTemaClick(Sender: TObject);
begin
 Clipboard.AsText:= hvResume.SelText;
end;

procedure Tfrm_Main.spb_CorpusClick(Sender: TObject);
var
   surat : string;
   ayat : string;
   url : string;
begin
  //

  surat := DtAyat.FieldByName('nomor_surat').AsString;
  ayat  := DtAyat.FieldByName('nomor_ayat').AsString;

  url := 'https://corpus.quran.com/treebank.jsp?chapter=' + surat +'&verse=' + ayat ;
  FRM_Ayat.respon:='';
  FRM_Ayat.Chromium1.LoadURL(url);


end;

procedure Tfrm_Main.spb_doc2Click(Sender: TObject);
begin
    ShowAllTerjemahBySurat(DtSurat.FieldByName('idx').AsString);
    tbs_showDaftarAyat.show;
end;



procedure Tfrm_Main.spb_docClick(Sender: TObject);
var
   hal    : integer;
   url    : string;
   i      : integer;
begin

   hal := DtAyat.FieldByName('halaman').AsInteger + 1;
   url := DIR_APP + 'support\mushaf\erdi.pdf' + '#page=' + Inttostr( hal ) ;

   FRM_Mushaf.Chromium1.LoadURL(trim(url));
   tbs_ShowMushaf.show;

end;

procedure Tfrm_Main.spb_EditTranslateClick(Sender: TObject);
var
   id : string;
   kat : string;
begin

   id  := DTShowHadist.FieldByName('id').AsString;
   kat := DTShowHadist.FieldByName('kat').AsString;

   if kat='syiah' then
    begin
       With DTGetData do
       begin
         close;
         sql.Clear;
         sql.Add ('select * from hadist_syiah where id=' + id);
         open;
         FRM_EDITRANS.ID_X:= id;
         FRM_EDITRANS.KAT:= 'SYIAH';
         FRM_EDITRANS.KITAB:='HADIST';
         FRM_EDITRANS.ISI:=FieldByName('bhs_indonesia').AsString;
         FRM_EDITRANS.ShowModal;
       end;

    end
   else
   begin
        With DTGetData do
        begin
          close;
          sql.Clear;
          sql.Add ('select * from hadist_suni where id=' + id);
          open;
          FRM_EDITRANS.ID_X:= id;
          FRM_EDITRANS.KAT:= 'SUNI';
          FRM_EDITRANS.KITAB:='HADIST';
          FRM_EDITRANS.ISI:=FieldByName('bhs_indonesia').AsString;
          FRM_EDITRANS.ShowModal;
        end;

       end

end;

procedure Tfrm_Main.spb_ExtrakClick(Sender: TObject);
begin
  DisableButtonNav;
  spb_Extrak.Flat:=false;
  Splitter1.Height:=0;
  pnDetilKata.height :=0;
  TIPE_S := 'extrak';
  ShowEkstrakAyat(ID_AYAT);
  LoadDaftarPerKata(ID_AYAT);
  LoadStatistikKata(ID_AYAT);

end;

procedure Tfrm_Main.spb_GenerateClick(Sender: TObject);
begin

end;

procedure Tfrm_Main.spb_HapusBookmarkClick(Sender: TObject);
begin
  DTBookmark.Delete;
  DTBookmark.Refresh;
end;

procedure Tfrm_Main.spb_HorizonClick(Sender: TObject);
begin

  VI_TERJEMAH := 'horizaontal';
  //LoadPageAyatNormal;
  OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.LoadPageAyatHuruf(huruf:string);
var

  terjemah     : string = '' ;
  script       : string = '' ;
  hal          : string = '' ;
 // perhuruf     : string = '' ;
  sifat_huruf  : string = '' ;
  legend_huruf : string = '' ;
  ayat_plain   : string = '' ;
 // key_huruf    : string = '' ;
  huruf_now    : string;
  deskripsi    : string = '' ;
  //jummal       : string = '' ;
  daftar_huruf : TstringList;
  transliterasi :string;
begin


  if Length(huruf)<5 then
    begin

      With DTHuruf do
      begin
        close;
        SQL.Clear;
        SQL.Add('select * from hijaiyah where trim(arab)=' + QuotedStr(huruf)) ;
        Open;

        deskripsi := '<table width=100% style="border: 1px solid #ddd;background-color:#F3F3E5" >'+
                     '<tr><td style="font-family:'+
                     FONT_LATIN + ';font-size:14px;line-height:1.6;text-align:left">' +
                     FieldByName('deskripsi').AsString+
                     '</td></tr></table>';
      end;

      With DTSifat do
      begin
        close;
        SQL.Clear;
        SQL.Add('select * from v_sifat_huruf where arab=' + QuotedStr(huruf));
       Open;
      end;

      With DTBasicKataByHuruf do
      begin
       close;
       sql.Clear;
       sql.Add('select * from v_jumlah_kata_arabbasic where h=' + QuotedStr(huruf) + ' order by jk desc');
       open;

      end;

   end;
   tbs_Huruf.show;


//  halaman := DtAyat.FieldByName('fteks_ayat').ASstring;

  DTHurufHijaiyah.open;
  DTHurufHijaiyah.First;
  ayat_plain := Trim(DtAyat.FieldByName('fteks_ayat').ASstring);

  if huruf='' then
   huruf := Trim(AnsiMidStr(ayat_plain,1,2));


  while not DTHurufHijaiyah.EOF do
   begin
   ayat_plain  := AnsiReplaceStr( ayat_plain, DTHurufHijaiyah.FieldByName('arab').AsString,
               '<font color="' + SetWarnaHuruf(DTHurufHijaiyah.FieldByName('arab').AsString) + '">' +
               '<a style="color:inherit;text-decoration: none;" href="#HURUF' +
               DTHurufHijaiyah.FieldByName('arab').AsString + '">' +
               DTHurufHijaiyah.FieldByName('arab').AsString + '</a></font>');

   DTHurufHijaiyah.next;

   end;


  terjemah  := DtAyat.FieldByName('indoText').AsString ;

  transliterasi :=  '<div style="color:#E18D4B;font-family:' + FONT_LATIN +
                     ';font-size:14px;text-align:center"><b> ' +
                     DtAyat.FieldByName('transliterasi').AsString + '</b></div><br>';

  script    := '<div dir="rtl" style="font-size:'+
               IntToStr(FONT_S) +'px;font-family:' + FONT_QR + ';line-height:1.8">' + ayat_plain  + '<br>' +
               '</div>';

  hal       := hal + '<table width=100% border=0 ><tr>'+
               '<td valign="top" dir="rtl" width="100%" style="text-align:right;padding:11px;">' +
               script +  '</td></tr></table>';

  huruf_now := '<table align=center width=100% style="border: 1px solid #ddd; '+
               'background-color:#F0FDF2" ;padding:15px><tr>'+
               '<td colspan=2 style="font-family:'+ FONT_LATIN +
               ';font-size:13px;text-align:center;background-color:#FF555">'+
               'HURUF</td></tr>'+
               '<td width=20% style="font-family:'+ FONT_QR +';font-size:50px;text-align:center">' + huruf +
               '</td></tr><tr>'+
               '<td width=80% style="font-family:'+ FONT_LATIN +';font-size:16px;text-align:justify;padding:20px">'+
               GetInfoHijaiyah(huruf) + '</td>' +
               '</tr></table><br>';

  // Penjelasan Sifat Huruf
  legend_huruf:= '<hr><table border=0 width=100% style="padding-left:20px;background-color:none;'+
                 'font-family:' + FONT_LATIN + ';font-size:14px;text-align:left;'+
                 'border: 0px solid #ddd"><tr >'+
                 '<td style="background-color:red" width=4%>'+
                 '</td><td style="padding:4px" >  Hams + Syiddah </td>' +
                 '<td style="background-color:blue" width=4%>'+
                 '</td><td style="padding:4px"> Hams + Rakhawah </td>' +
                 '<td style="background-color:green" width=4%></td>'+
                 '<td style="padding:4px"> Jahr + Syiddah </td>' +
                 '<td style="background-color:hotpink" width=4%></td>'+
                 '<td style="padding:4px"> Jahr + Rakhawah </td>' +
                 '<td style="background-color:black" width=4%></td>'+
                 '<td style="padding:4px"> Jahr + Tawasut </td></tr>' +
                 '</table>';


  sifat_huruf:= '<table width=100% style="padding:20px;background-color:#F9F7E8;'+
                'border: 1px solid #ddd;" valign="top"> '+
                '<tr><td colspan=2>' + '&nbsp;' + '</td></tr>' +
                '<tr><td width=50% style="font-family:' + FONT_LATIN + ';font-size:14px;">'+
                'SIFAT LAZIMAH</td><td width=50% style="font-family:' + FONT_LATIN + ';font-size:14px;">'+
                'SIFAT `ARIDHAH</td></tr>'+
                '<tr><td style="padding:20px;line-height:1.5">'+
                GetSifatHuruf(huruf,'s1','Hams') +
                GetSifatHuruf(huruf,'s1','Jahr') +
                GetSifatHuruf(huruf,'s2','Syiddah') +
                GetSifatHuruf(huruf,'s2','Rakhawah') +
                GetSifatHuruf(huruf,'s2','Tawasut') +
                GetSifatHuruf(huruf,'s2','Tawasut') +
                GetSifatHuruf(huruf,'s3','Isti`la`') +
                GetSifatHuruf(huruf,'s3','Istifal') +
                GetSifatHuruf(huruf,'s4','Itbaq') +
                GetSifatHuruf(huruf,'s4','Infitah') +
                GetSifatHuruf(huruf,'s5','Ismat') +
                GetSifatHuruf(huruf,'s5','Idzlaq') +
                '</td><td width=50% style="padding:20px;line-height:1.5;vertical-align: top" >' +
                GetSifatHuruf(huruf,'s6','Safir') +
                GetSifatHuruf(huruf,'s6','Istitalah') +
                GetSifatHuruf(huruf,'s6','Qalqalah') +
                GetSifatHuruf(huruf,'s6','Tafasy') +
                GetSifatHuruf(huruf,'s6','Lin') +
                GetSifatHuruf(huruf,'s6','Inhiraf') +
                GetSifatHuruf(huruf,'s6','Takrir') +
                deskripsi +
                '</td></tr>'+
                '</table>';

  ayat_plain := SplitAyatPerHuruf(DtAyat.FieldByName('standard').AsString,'-');


  daftar_huruf := TStringList.create;
  daftar_huruf.Clear;
  daftar_huruf.Text := ayat_plain;

  terjemah := '<div width=50% valign=top style="font-family:' + FONT_LATIN + ';' +
              'font-size:17px;text-align:justify;padding:11px;">' + terjemah + '</div>';


  hal       := '<body  style="background-color:#FEFEF4">' +
               '<table width=100% border=0 ><tr>'+
               '<td colspan=2 style="font-family:' + FONT_LATIN + ';font-size:17px;text-align:center">'+
               '<b>SIFAT HURUF</b><hr><br></td></tr>'+
               '<tr>' +
               '<td width="70%" valign="top">' + hal +  transliterasi + terjemah +
               '</td><td valign=top>' + huruf_now + '</td>'+
               '</tr>'+
               '<tr><td colspan=2 style="text-align:center">' + '' + '</td></tr>'+
               '<tr><td colspan=2 style="text-align:center">' + legend_huruf + '</td></tr>'+

               '<tr><td colspan=2>' + sifat_huruf + '<br></tr>' +
               '<tr><td colspan=2 style="background-color:none">'+
               '</td></tr><tr><td colspan=2 style="postition:relative">' +//+ jummal +
               '</td></tr></table></div></body>';

  OpenPage(hal, 'HURUF');

  HtmlViewer1.LoadFromString(GetFakataHuruf(huruf,ID_AYAT));



end;

function Tfrm_Main.GetSifatHuruf(h:String; kolom:string;nama_sifat:string):string;
var
  desc : string;
  link : string;
begin

  desc := GetItem('select `descrip` from `sifat_huruf` where `nama`= ' + QuotedStr(nama_sifat));
  link := GetItem('select `vid` from `sifat_huruf` where `nama`= ' + QuotedStr(nama_sifat));
  if link<>'' then
   link :=  '&nbsp; (<a href="#SIFAT' + link + '">Tutorial</a>) &nbsp;' ;

  Result := '<div style="font-family:' + FONT_LATIN + ';font-size:14px;'+
              'background-color:'+ SetWarnaSifatHuruf(h,kolom,nama_sifat) + ';'+
              'text-align:justify" >' +
              '<b>' + nama_sifat + '</b><br>' +
              desc +  link +
              '</div><hr>' ;

end;


procedure Tfrm_Main.spb_HurufClick(Sender: TObject);
begin
  Splitter1.Height:=0;
  pnDetilKata.height :=0;
  TIPE_S := 'huruf';
  LoadPageAyatHuruf('');
  tbs_showAyat.show;
  tbs_Ayat.show;
  MARK_READ := 'HURUF' ;
  tbs_Ayat.show;
  DisableButtonNav;
  spb_Huruf.Flat:=false;
  tbs_DaftarKata.show;
  tbs_Surat.show;

end;

procedure Tfrm_Main.spb_JummalClick(Sender: TObject);
begin

    TIPE_S := 'numeric';


end;

procedure Tfrm_Main.spb_KataClick(Sender: TObject);
begin

  OpenKata('');
  DisableButtonNav;
  spb_Kata.Flat:=false;
  TIPE_S := 'kata';
  MARK_READ := 'PER KATA DAN HURUF' ;
  tbs_DaftarKata.show;

  OpenKata(DTDaftarKata.FieldByName('arab_harokat').AsString);
  tbs_DetilKata.show;
  tbs_Chart.show;
  Splitter1.Height:=5;
  spbTanyaGemini.Visible:=True;
  spbTanyaGemini.Caption:='Resume "Kata"';
end;

procedure Tfrm_Main.spb_kemenagClick(Sender: TObject);
var
   s,a : string;

begin

  if not HasInternet then
   begin
    ShowMessage('Tidak Ada Koneksi Internet');
    exit;
   end;

  s := DtAyat.FieldByName('nomor_surat').AsString;
  a := DtAyat.FieldByName('nomor_ayat').AsString;

  FRM_Kemenag.Chromium1.LoadURL('about:blank');
  FRM_Kemenag.Chromium1.LoadURL(QURAN_ENC + s +'/' + a);
  tbs_kemenag.Show;

end;

procedure Tfrm_Main.spb_KeyboardArabicKataClick(Sender: TObject);
begin
  DTRegKata.Filtered:=false;
  FRM_Keyboard.ShowModal;
end;

procedure Tfrm_Main.spb_langClick(Sender: TObject);
begin
  Splitter1.Height:=0;
  DisableButtonNav;
  spb_lang.Flat:=false;
  pnDetilKata.height :=0;
  TIPE_S := 'language';
  LoadPageAyatLanguage(ID_AYAT);

end;

procedure Tfrm_Main.spb_LocClick(Sender: TObject);
begin

  pnDetilKata.height :=0;
  //pnDetilKata.Height:=0;
   DtAyat.close;
   DtAyat.sql.Clear;
   DTAyat.SQL.Add('select * from v_ShowdaftarAyat where id_ayat=' + QuotedStr(LOCK_ID) );
   DtAyat.open;
   OpenAyat(DtAyat.FieldByName('id_ayat').AsString);

end;

procedure Tfrm_Main.spb_MarkReadClick(Sender: TObject);
var
   ida : string;
   sq : string;
begin

   ida := ID_AYAT;

   case  MARK_READ of

   'TERJEMAH' : sq:= 'UPDATE quran_read set terjemah=1 where id_ayat=' + QuotedStr(ida);
   'TAJWID' : sq:= 'UPDATE quran_read set tajwid=1 where id_ayat=' + QuotedStr(ida);
   'PER KATA DAN HURUF' : sq:= 'UPDATE quran_read set perkata=1 where id_ayat=' + QuotedStr(ida);
   'HURUF' : sq:= 'UPDATE quran_read set  huruf=1 where id_ayat=' + QuotedStr(ida);
   'TAFSIR THOBARI' : sq:= 'UPDATE quran_read set thobari=1 where id_ayat=' + QuotedStr(ida);
   'TAFSIR IBN KATSIR' : sq:= 'UPDATE quran_read set ibn_katsir=1 where id_ayat=' + QuotedStr(ida);
   'TAFSIR SAADI' : sq:= 'UPDATE quran_read set saadi=1 where id_ayat=' + QuotedStr(ida);
   'TAFSIR QURTHUBI' : sq:= 'UPDATE quran_read set qurtubi=1 where id_ayat=' + QuotedStr(ida);
   'TAFSIR BAGHOWI' : sq:= 'UPDATE quran_read set baghowi=1 where id_ayat=' + QuotedStr(ida);
   'TAFSIR I`ROOB' : sq:= 'UPDATE quran_read set irob=1 where id_ayat=' + QuotedStr(ida);
   'TAFSIR WASITH' : sq:= 'UPDATE quran_read set Wasith=1 where id_ayat=' + QuotedStr(ida);
   'TAFSIR AL-MIQBAS' : sq:= 'UPDATE quran_read set miqbas=1 where id_ayat=' + QuotedStr(ida);
   'TAFSIR AL-MIZAN' : sq:= 'UPDATE quran_read set al_mizan=1 where id_ayat=' + QuotedStr(ida);
   'TAFSIR NAMUUNAH' : sq:= 'UPDATE quran_read set namuunah=1 where id_ayat=' + QuotedStr(ida);
   'TAFSIR AN-NOOR' : sq:= 'UPDATE quran_read set noor=1 where id_ayat=' + QuotedStr(ida);
   'TAFSIR TANWIR' : sq:= 'UPDATE quran_read set tanwir=1 where id_ayat=' + QuotedStr(ida);
   end;


  if Dialogs.MessageDlg('Apakah Anda Sudah Memahami ' + MARK_READ + ' QS : ' + ID_AYAT + ' ?' ,
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
    Koneksi.ExecuteDirect(sq);
    ShowMessage('Alhamdulillah ... Semoga Bermanfaat') ;

  end;
end;

procedure Tfrm_Main.spb_PDFClick(Sender: TObject);
begin

  DeleteFile(PChar(DIR_APP + 'support/page/ayat.pdf'));
  FRM_Ayat.Chromium1.PrintToPDF(PChar(DIR_APP + 'support/page/ayat.pdf'));
  OpenDocument(PChar(DIR_APP + 'support/page/ayat.pdf'));
end;

procedure Tfrm_Main.GetResumeKata;
begin

  if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     exit;
   end;

   DO_THREAD := 'Uraikan Kata';
   thrRequestAI.Active:=True;
   FRM_Wait.ShowModal;


end;

procedure Tfrm_Main.spb_playClick(Sender: TObject);
var
   f :string;
begin
  f := AnsiReplaceStr(ID_AYAT,':','_') + '.wav';
  if FileExists(PChar(DIR_APP + 'support/audio/rekam/' + f)) then
   begin
       VLCPlayerMe.Play(PChar(DIR_APP + 'support/audio/rekam/' + f));
   end
  else
  ShowMessage('Tidak Ada File Rekaman Anda pada Ayat ini');

end;

procedure Tfrm_Main.spb_PlayHuruf1Click(Sender: TObject);
var
   cf : string;
begin

  cf := DTRefTajwid.FieldByName('url').AsString ;
  if cf <> '' then
     ShowVideoTutorial(cf)
  else
     ShowMessage('Tutorial Belum Tersedia');
end;

procedure Tfrm_Main.spb_PlayHurufClick(Sender: TObject);
var
   cf : string;
begin

  cf :=  DTHuruf.FieldByName('vid').AsString  ;
  if Trim(cf)='' then
   ShowMessage('Link Tutorial Belum Tersedia')
  else
   ShowVideoTutorial(cf);
end;

procedure Tfrm_Main.spb_PrintClick(Sender: TObject);
begin
  FRM_Ayat.Chromium1.Print;
end;

procedure Tfrm_Main.spb_PrintDaftarClick(Sender: TObject);
begin
  FRM_DaftarAyat.Chromium1.Print;
end;

procedure Tfrm_Main.spb_QuoteClick(Sender: TObject);
begin

  pnDetilKata.height :=0;
  //pnDetilKata.Height:=0;
  LoadPageInQuote;
  DisableButtonNav;
  spb_Quote.Flat:=false;
  tbs_showAyat.show;
  tbs_Ayat.show;
  tbs_Surat.show;

  tbs_DaftarKata.show;
  pnl_Ayat.Enabled:=false;
end;

procedure Tfrm_Main.spb_recordClick(Sender: TObject);
var
   f :string;
begin
  f := AnsiReplaceStr(ID_AYAT,':','_') + '.wav';
  FRM_Record.file_name:=DIR_APP + 'support/audio/rekam/' + f;
  FRM_Record.Show;

end;

procedure Tfrm_Main.spb_ResumeClick(Sender: TObject);
begin
  DisableButtonNav;
  spb_Resume.Flat:=false;
  Splitter1.Height:=0;
  pnDetilKata.height :=0;
  TIPE_S := 'resume';
  LoadPageAyatResume(ID_AYAT);
  LoadDaftarPerKata(ID_AYAT);
  tbs_DaftarKata.show;
  spbTanyaGemini.Visible:=True;
  spbTanyaGemini.Caption:='Resume "Ayat"';
end;

procedure Tfrm_Main.spb_SelectFont1Click(Sender: TObject);
begin
  pmFontLatin.PopUp(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure Tfrm_Main.spb_SelectFontClick(Sender: TObject);
begin
  pmFont.PopUp(Mouse.CursorPos.X,Mouse.CursorPos.Y);

end;

procedure Tfrm_Main.spb_showAskClick(Sender: TObject);
begin
  VLCPlayerAyat.Stop();
  VLCPlayerTerjemah.Stop();
  //FRM_ASk.ShowModal;
end;

procedure Tfrm_Main.spb_showHadist1Click(Sender: TObject);
begin
  pg_Left.hide;
  FRM_Tafsir2.show;
  tbs_Kitab.Show;

end;

procedure Tfrm_Main.spb_showHadistClick(Sender: TObject);
begin
  pg_Left.Visible:=True;
 // ShowMessage(SETTING_TYPE);
  if not DTDaftarHadistByKitab.Active then
      DTDaftarKitabHadist.open;

  if SETTING_TYPE='True' then
   DTDaftarKitabHadist.Filtered:=false
  else
  begin
   DTDaftarKitabHadist.Filter:='kat=''suni''';
   DTDaftarKitabHadist.Filtered:=True;
  end;

  tbs_hadist.show;
  tbs_ShowHadist.show;

end;

procedure Tfrm_Main.spb_showStatistikaClick(Sender: TObject);
begin

 FRM_Statistika.show;

 tbs_Surat.show;
 tbs_Statistik.show;
 FRM_Statistika.tbs_SebaranKata.show ;
 pg_Left.Visible:= false;

end;

procedure Tfrm_Main.spb_showMushafClick(Sender: TObject);
begin

  tbs_Ayat.show;
  tbs_ShowMushaf.show;
  FRM_Mushaf.Chromium1.LoadURL(DIR_APP + 'support\mushaf\erdi.pdf');

end;

procedure Tfrm_Main.spb_ShowResumeClick(Sender: TObject);
begin

  DisableButtonNav;
  //tbs_SusunaKata.show;
  LoadPageAyatResume(ID_AYAT);
  spb_ShowResume.Flat:=false;

end;

procedure Tfrm_Main.spb_SimpanResuemKataClick(Sender: TObject);
begin

  if RESUME_KATA = '' then exit ;

  if Dialogs.MessageDlg('Simpan Resume Tata Bahasa Arab Kata ini ?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      Koneksi.ExecuteDirect('update terjemah_kata set resumeai=' + QuotedStr(RESUME_KATA) + ' where '+
                            'arab_harokat=' + QuotedStr(KATA_NOW));
      ShowMessage('Tersimpan');
      DTTerjemahKata.Refresh;
    end;

  RESUME_KATA := '';

end;

procedure Tfrm_Main.spb_SimpanResumeAyatClick(Sender: TObject);
begin

  if RESUME_AYAT = '' then exit;

  if Dialogs.MessageDlg('Apakah Anda Akan Menyimpan Resume ini ?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin

      Koneksi.ExecuteDirect('update quran_resume set resumeai=' + QuotedStr(RESUME_AYAT) +
                           ' where id_ayat=' + QuotedStr(ID_AYAT));
      DtAyat.Refresh;
    end;

  RESUME_AYAT := '';
  LoadPageAyatResume(ID_AYAT);

end;

procedure Tfrm_Main.spb_SimpanTemaHadistClick(Sender: TObject);
begin

 if RESUME_TEMA = '' then exit;

 if Dialogs.MessageDlg('Simpan Resume Hadist Per Tema ?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      Koneksi.ExecuteDirect('update tema set resume=' + QuotedStr(RESUME_TEMA) + ' where '+
                            'id=' + DtTema.FieldByName('id').AsString);
      ShowMessage('Tersimpan');
      DtTema.Refresh;
    end;

 RESUME_TEMA := '';

end;

procedure Tfrm_Main.spb_TafsirTranslatedClick(Sender: TObject);
begin

  LoadTafsirWebTranslated;
  tbs_TafsirWeb.show;
  DisableButtonTafsir;
  spb_TafsirTranslated.Flat:=false;

end;

procedure Tfrm_Main.TranslateHadistByGemini;
var
   trj : string;
   cmd : string;
   id  : string;
   pj  : integer;
   kat : string;
begin

   cmd := DTShowHadist.FieldByName('nass').AsString ;


   id  := DTShowHadist.FieldByName('id').AsString;
   kat := DTShowHadist.FieldByName('kat').AsString;



   pj := Length(DTShowHadist.FieldByName('nass').AsUTF8String);

   if pj>2500 then
    begin

     ShowMessage('Teks Terlalu Panjang (>2500)');
     exit;
    end;


   trj := TranslateUseGemini(AnsiReplaceText(SETTING_PROMPT_TRANS_HADIST,'$KALIMAT',cmd) );

   if trj = '' then exit;

   trj := trj + #13+#13+#13 + '<hr>(Penerjemahan dan/atau Resume oleh Gemini > ' +
          FormatDateTime('dd-mmm-yyyy', now) +')';
   thrRequestAI.Terminate;
   if trj='' then
    begin
    ShowMessage('Penerjemahan Gagal');
    exit;

    end
   else
   begin

     ShowMessage('Penerjemahan Sukses');
     if kat='suni' then
     Koneksi.ExecuteDirect('update hadist_suni set bhs_indonesia=' + QuotedStr(trj) + ' where '+
                              'id=' + QuotedStr(id))
     else
     Koneksi.ExecuteDirect('update hadist_syiah set bhs_indonesia=' + QuotedStr(trj) + ' where '+
                              'id=' + QuotedStr(id));

     grdNomorHadistCellClick(grdNomorHadist.Columns[0]);
     DTDaftarHadistByKitab.Refresh;
   end;

end;

procedure Tfrm_Main.TranslateHadistByGPT;
var
   trj : string;
   cmd : string;
   id  : string;
   pj  : integer;
   kat : string;
begin

   cmd := 'Terjemahkan kedalam bahasa Indonesia ~' +
          DTShowHadist.FieldByName('nass').AsUTF8String + '~';

   id  := DTShowHadist.FieldByName('id').AsString;
   kat := DTShowHadist.FieldByName('kat').AsString;



   pj := Length(DTShowHadist.FieldByName('nass').AsUTF8String);

   if pj>1000 then
    begin

     ShowMessage('Teks Terlalu Panjang (>1000)');
     exit;
    end;


   trj := TranslateUseChatGPT(cmd);

   if Dialogs.MessageDlg('Terjemahan OpenAI => :' + trj + '" Apa sudah cukup bagus ?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
     if kat='suni' then

      Koneksi.ExecuteDirect('update hadist_suni set bhs_indonesia=' +
                             QuotedStr(trj) + ' where '+
                            'id=' + QuotedStr(id))
     else
       Koneksi.ExecuteDirect('update hadist_syiah set bhs_indonesia=' +
                             QuotedStr(trj) + ' where '+
                            'id=' + QuotedStr(id));


    end ;


end;

procedure Tfrm_Main.resumeTafsirAI(ida:string);
var
   res : string;
begin

  pnDetilKata.height :=0;
  TIPE_S := 'resume';

  res := Trim(DtAyat.FieldByName('resumeai').AsString);

   if res='Belum Generate ..' then
   begin

    if not HasInternet then
    begin
     ShowMessage('Tidak Ada Koneksi Internet');
     exit;
    end;

    DO_THREAD := 'Resume Ayat By Gemini' ;
    thrRequestAI.Active:=true;
    FRM_Wait.ShowModal;
    end
  else
  begin

   if Dialogs.MessageDlg('Telah dibuat Resume sebelumnya , Apakah Akan di Resume Ulang ?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin

     if not HasInternet then
     begin
          ShowMessage('Tidak Ada Koneksi Internet');
          exit;
     end;

     DO_THREAD := 'Resume Ayat By Gemini' ;
     thrRequestAI.Active:=true;
     FRM_Wait.ShowModal;
    end
   else
   begin
     LoadPageAyatResume(ida);
     exit;

   end;
  end;


  if Dialogs.MessageDlg('Apakah Anda Akan Menyimpan Resume ini ?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin

      Koneksi.ExecuteDirect('update quran_resume set resumeai=' + QuotedStr(RESUME_AYAT) +
                           ' where id_ayat=' + QuotedStr(ID_AYAT));
      DtAyat.Refresh;
    end;

  RESUME_AYAT := '';
  LoadPageAyatResume(ID_AYAT);


end;

procedure Tfrm_Main.spb_tampilkandaftarClick(Sender: TObject);
var
   surat : string;

begin

  pnDetilKata.height :=0;
  //pnDetilKata.Height:=0;
  surat := DtSurat.FieldByName('idx').AsString;
  LoadAyatBySurat(surat);
  tbs_showDaftarAyat.show;
  tbs_Ayat.show;
  KEY_WORD_ARB := '';
  KEY_WORD_TRJ := '';
end;

procedure Tfrm_Main.spb_temaClick(Sender: TObject);
begin

  DisableButtonNav;
  spb_Tema.Flat:=false;
  tbs_DetilTema.show;
  TIPE_S := 'tema';
  MARK_READ := 'PER TEMA' ;
  pnDetilKata.height:= 340;
  Splitter1.Height:=5;
  LoadPageShowTema(ID_AYAT);


end;

procedure Tfrm_Main.CopyTextToTranslate;
var
   pg : string;
begin

   if not HasInternet then
    begin
     ShowMessage('Tidak Ada Koneksi Internet');
     exit;
    end;

   if Length(pg)<2500  then
    begin
        pg := Clipboard.AsText ;
        if Length(pg)=0 then
           exit;
       FRM_ResTranslate.Memo1.Clear;
       FRM_ResTranslate.Memo1.text := TranslateUseGeminiNoThread('Terjemahkan Dalam Bahasa Indonesia "' + pg + '"');
       FRM_ResTranslate.Show;
    end
   else
   begin
    ShowMessage('Teks Terlalu Panjang');
   end;

   pn_TranslateBook.Height:=240;

   Clipboard.Clear;

end;

procedure Tfrm_Main.spb_TranslateGeminiClick(Sender: TObject);
begin

   if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     exit;
   end;

   if trim(DTShowHadist.FieldByName('terjemah').AsString)<>'' then
   begin
   if Dialogs.MessageDlg('Hadist ini telah diterjemahkan , apakah akan diterjemahkan ulang ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin


    DO_THREAD := 'Translate Hadist Dengan Gemini';
    thrRequestAI.Active:=True;
    FRM_Wait.ShowModal;


    end;

   end
   else
   begin
     DO_THREAD := 'Translate Hadist Dengan Gemini';
    thrRequestAI.Active:=True;
    FRM_Wait.ShowModal;
   end;

end;

procedure Tfrm_Main.spb_TranslateGPTClick(Sender: TObject);
begin
   if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     exit;
   end;


  DO_THREAD := 'Translate Hadist Dengan GPT' ;
  thrRequestAI.Active:=True;
  FRM_Wait.ShowModal;

end;

procedure Tfrm_Main.spb_UpdateTajwidClick(Sender: TObject);
begin
  if not HasInternet then
  begin
  ShowMessage('Tidak Ada Akses Internet');
  exit;
  end;
  FRM_Jamu.ShowModal;
end;

procedure Tfrm_Main.spb_vertikalClick(Sender: TObject);
begin

  VI_TERJEMAH := 'vertikal';
 // LoadPageAyatNormal;
  OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.FilterByAbjad(Sender: TObject);
begin
  if tbs_latin.Showing then
     Edt_CariKata.text := Edt_CariKata.text + TSpeedButton (sender).Caption;



end;

procedure Tfrm_Main.spb_TranslateAIClick(Sender: TObject);
begin

end;



procedure Tfrm_Main.SpeedButton2Click(Sender: TObject);
begin
      FRM_book.Chromium1.LoadURL(DIR_APP + 'support\mushaf\Mushaf E-Sharief.pdf');
end;

procedure Tfrm_Main.FilterByHijaiyah(Sender: TObject);
begin

  if tbs_Hijaiyah.showing then
     Edt_CariKata.text := Edt_CariKata.text + TSpeedButton (sender).Caption;


end;

procedure Tfrm_Main.spb_GetHadistClick(Sender: TObject);
begin

   if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     exit;
   end;

  DO_THREAD := 'Telusuri Hadist Sesuai Tema';
  thrRequestAI.Active:=true;
  FRM_Wait.ShowModal;


end;

procedure Tfrm_Main.SpeedButton59Click(Sender: TObject);
begin
  Edt_CariKata.Clear;
end;

procedure Tfrm_Main.SpeedButton60Click(Sender: TObject);
begin
 Edt_CariKata.Clear;
end;

procedure Tfrm_Main.spn_setBookmarkClick(Sender: TObject);
begin

   if Dialogs.MessageDlg('Anda Akan Menandai QS ini ?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      begin

        Koneksi.ExecuteDirect('delete from bookmark where surat_ayat=' + QuotedStr(ID_AYAT));
        Koneksi.ExecuteDirect('insert into bookmark(surat,surat_ayat,nosurat) values (' +
                              QuotedStr(DtAyat.FieldByName('fsurat').AsString) + ',' +
                              QuotedStr(ID_AYAT) + ',' + DtAyat.FieldByName('nomor_surat').AsString+')'  );
        DTBookmark.Refresh;
      end;

end;

procedure Tfrm_Main.tbs_agreementShow(Sender: TObject);
begin

end;

procedure Tfrm_Main.tbs_DetilAyatBasicShow(Sender: TObject);
begin

  with DTDetilAyat do
  begin
    close;
    SQL.Clear;
    sql.Add('select distinct arab_harokat as `Kata`,Arti,nama_id as `Nama Surat`,id_ayat as `QS`,'+
            'ay as `Ayat`  from ' +
            'v_detil_ayat_kataterkait where basic=' +
            QuotedStr(lbBasic.Caption));
    open;

  end;


end;

procedure Tfrm_Main.tbs_DetilTemaShow(Sender: TObject);
begin

end;

procedure Tfrm_Main.tbs_DetilVariasiTerjamahKataShow(Sender: TObject);
begin

  with DTDetilAyat do
  begin
    close;
    SQL.Clear;
    sql.Add('select distinct arab_harokat as `Kata`,Arti,nama_id as `Nama Surat`,id_ayat as `QS`,'+
            'ay as `Ayat`  from ' +
            'v_detil_ayat_kataterkait where arab_harokat=' +
            QuotedStr(lbKata.Caption));
    open;

  end;

end;




procedure Tfrm_Main.tbs_kataShow(Sender: TObject);
var
   k : string;
   resumeai:string;
begin
  tbs_VariasiKata.show;
  kATA_NOW := DTRegKata.FieldByName('arab_harokat').AsString;
  resumeai := GetItem('select resumeai from terjemah_kata where arab_harokat=' +QuotedStr(kATA_NOW));

 end;

procedure Tfrm_Main.thrRequestAIRun(Sender: TIdThreadComponent);
begin

    if DO_THREAD = 'Resume Ayat By Gemini' then
        LoadPageAyatNormalByAI
    else if DO_THREAD ='Translate Hadist Dengan GPT' then
        TranslateHadistByGPT
    else if DO_THREAD ='Translate Hadist Dengan Gemini' then
        TranslateHadistByGemini
    else if DO_THREAD ='Telusuri Hadist Sesuai Tema' then
        GetHadistSesuaiTemaByAI
    else if DO_THREAD ='Uraikan Kata' then
        LoadResumeKataByAI;


end;


procedure Tfrm_Main.GetHadistSesuaiTemaByAI;
var
   urtem : string;
   tema : string;
begin

  tema  := DtTema.FieldByName('tema').AsString ;
  urtem := TranslateUseGemini(AnsiReplaceText(SETTING_PROMPT_RESUME_TEMA,'$KALIMAT', tema ));

   if urtem = '' then  exit;

  urtem := urtem + #13#13#13 + '<hr>(Resume oleh Gemini > ' + FormatDateTime('dd-mmm-yyyy', now) +')';
  RESUME_TEMA := urtem;
  urtem :=AnsiReplaceStr(urtem,'*','');
  urtem :=AnsiReplaceStr(urtem,#10,'<br>');

  OpenPageHv(urtem,hvResume,'resumetema.htm');
  tbs_UraianTemaByAI.show;

end;

procedure Tfrm_Main.thrRequestAITerminate(Sender: TIdThreadComponent);
begin
  FRM_Wait.close;
end;

procedure Tfrm_Main.TrdBacaRun(Sender: TIdThreadComponent);
var
   pengantar : string;
begin

   pengantar := 'Berikut ini Penjelasan tentang Surat ' +
                DtAyat.FieldByName('nama_surat').AsString +
                ' atau Surat ke ' +
                DtAyat.FieldByName('nomor_surat').AsString +
                ' Ayat ke ' +
                DtAyat.FieldByName('nomor_ayat').AsString ;


   Katakan(pengantar + ' menurut ' + DtAyat.FieldByName('alwajiz').AsString);

end;



procedure Tfrm_Main.img_QDocMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  p1 := X;
  p2 := Y;
end;

procedure Tfrm_Main.lbQoriClick(Sender: TObject);
begin
     FRM_Qori.ShowModal;
end;

procedure Tfrm_Main.mnFontPageMinusClick(Sender: TObject);
begin

  FONT_S:= FONT_S - 2;
  OpenPageAyat(TIPE_S);


end;

procedure Tfrm_Main.MenuItem3Click(Sender: TObject);
begin
  FRM_ManageTafsir.ShowModal;
end;

procedure Tfrm_Main.mnFontPagePlusClick(Sender: TObject);
begin
  FONT_S:= FONT_S + 2 ;

  OpenPageAyat(TIPE_S);
end;


procedure Tfrm_Main.mnSalinClick(Sender: TObject);
begin
  dbTafsir.SelectAll;
  Clipboard.AsText:= dbTafsir.SelText;
end;

procedure Tfrm_Main.mnSalinGPTClick(Sender: TObject);
var
   c : string;
begin
   c := 'Terjemahkan  kedalam bahasa indonesia ~'  +   dbTafsir.SelText + '~';

   c := AnsiReplaceStr(c,'(',':');
   c := AnsiReplaceStr(c,')',':');
   c := AnsiReplaceStr(c,#13#10,'\n\n');

   ShowMessage(TranslateUseChatGPT(c));

end;

procedure Tfrm_Main.mn_SalinAyatClick(Sender: TObject);
begin
  Clipboard.AsText:= DtAyat.FieldByName('teks_ayat').AsUTF8String;
end;

procedure Tfrm_Main.PopupNotifier1Close(Sender: TObject;
  var CloseAction: TCloseAction);
begin

end;

procedure Tfrm_Main.spb_BacaClick(Sender: TObject);
begin


   if AnsiContainsStr(lbImam.Caption,'Offline') then
   begin
      if ( VLCPlayerAyat.IsPlay() ) or
      ( VLCPlayerTerjemah.IsPlay() )
      then
      begin
        VLCPlayerAyat.stop  ;;
        exit;
      end
      else
      begin
       PlayAyat;
       exit;
      end ;
   end;

   if not HasInternet  then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     VLCPlayerAyat.stop   ;
     VLCPlayerTerjemah.Stop;
     ckUlang.Checked:=false;
     ckNext.Checked:=false;
     ckTerjemah.Checked:=false;

   end
   else
   begin
   if ( VLCPlayerAyat.IsPlay() ) or
      ( VLCPlayerTerjemah.IsPlay() ) then
      VLCPlayerAyat.stop
      else
      begin
      PlayAyat;
      end;
   end;

end;

procedure Tfrm_Main.PlayAyat;
var
  nos,noa:string;
  f:string;
begin

  nos := DTAyat.FieldByName('nomor_surat').AsString;
  noa := DTAyat.FieldByName('nomor_ayat').AsString;

  nos := DupeString('0', 3 - Length(nos)) + nos ;
  noa := DupeString('0', 3 - Length(noa)) + noa ;

  f := nos+noa + '.mp3' ;

  VLCPlayerAyat.Play(PEMBACA + f);

  tbs_Ayat.Show;
  tbs_showAyat.show;


end;

procedure Tfrm_Main.spb_AyatBackClick(Sender: TObject);
begin

    DtAyat.Prior;
    ID_AYAT := DtAyat.FieldByName('id_ayat').AsString;


    OpenPageAyat(TIPE_S);

   // LoadDaftarTafsirByAyat(ID_AYAT);
    LoadDaftarPerKata(ID_AYAT);

    //LoadTafsir(TAFSIR);

    tbs_showAyat.Show;
    spb_AyatBack.Visible:=true;

end;

procedure Tfrm_Main.spb_AyatNextClick(Sender: TObject);
begin

   if not DtAyat.EOF then
   begin
    DtAyat.Next;
    ID_AYAT := DtAyat.FieldByName('id_ayat').AsString;

    OpenPageAyat(TIPE_S);

    LoadDaftarPerKata(ID_AYAT);
    tbs_showAyat.Show;
    spb_AyatNext.Visible:=true;
   end;

end;

procedure Tfrm_Main.spb_BaghowiClick(Sender: TObject);
begin
  LoadTafsir(5);
  TAFSIR := 5 ;
  lb_Mufassir.Caption:='Tafsir Baghowy';
end;

procedure Tfrm_Main.spb_F1Click(Sender: TObject);
begin
  FONT_QR:='Attari_Quran';
  OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.spb_F2Click(Sender: TObject);
begin
 FONT_QR:='LPMQ Isep Misbah';
 OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.spb_F3Click(Sender: TObject);
begin
 FONT_QR:='Al Qalam Quran Majeed';
 OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.spb_F4Click(Sender: TObject);
begin
 FONT_QR:='Al Qalam Quran 2';
 OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.spb_F5Click(Sender: TObject);
begin
 FONT_QR:='Al_Mushaf';
 OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.spb_harokatClick(Sender: TObject);
begin
  FONT_QR:='teks_ayat';
  OpenPageAyat(TIPE_S);
end;

procedure Tfrm_Main.spb_IbnuKatsirClick(Sender: TObject);
begin
  LoadTafsir(2);
  TAFSIR := 2 ;
  lb_Mufassir.Caption:='Tafsir Ibnu Katsir';
end;


procedure Tfrm_Main.spb_MiqbasClick(Sender: TObject);
begin
  LoadTafsir(9);
  TAFSIR := 9 ;
  lb_Mufassir.Caption:='Tafsir Ibnu Abbas';
end;

procedure Tfrm_Main.spb_PilihKitabTafsirClick(Sender: TObject);
var
  ida:string;
begin
  ida :=  DTAyat.FieldByName('id_ayat').AsString;

end;

procedure Tfrm_Main.spb_QurthubiClick(Sender: TObject);
begin
 LoadTafsir(4);
 TAFSIR := 4 ;
 lb_Mufassir.Caption:='Tafsir Qurthubi';
end;

procedure Tfrm_Main.spb_SaadiClick(Sender: TObject);
begin
  LoadTafsir(3);
  TAFSIR := 3 ;
  lb_Mufassir.Caption:='Tafsir As-Saadi';
end;

procedure Tfrm_Main.spb_SelectSyaikhClick(Sender: TObject);
begin
  {
   if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     exit;
   end;  }
  FRM_Qori.ShowModal;
end;

procedure Tfrm_Main.spb_showAyatClick(Sender: TObject);
begin
  tbs_showAyat.show;
  tbs_Ayat.show;
  DisableButtonNav;
  spb_Normal.Flat:=false;
end;

procedure Tfrm_Main.spb_showHJClick(Sender: TObject);
begin

  tbs_Surat.show;
  FRM_Statistika.show;
  tbs_Statistik.show;
  FRM_Statistika.tbs_HisabJummal.show ;
  pg_Left.Visible:= false;

end;

procedure Tfrm_Main.spb_showKataClick(Sender: TObject);
begin

  if not DTRegKata.Active then
    DTRegKata.open;

  tbs_kata.show;
  tbs_Ayat.show;
  tbs_showAyat.show;
  tbs_DaftarKata.show;
  pnDetilKata.height :=0;
  pg_Left.Visible:= True;

end;

procedure Tfrm_Main.spb_showSuratClick(Sender: TObject);
begin

  tbs_Surat.show;
  tbs_Ayat.show;
  tbs_showAyat.show;
  pg_Left.Visible:= True;
  pnDetilKata.height :=0;

end;

procedure Tfrm_Main.spb_showTafsirClick(Sender: TObject);
var
  ida:string;
begin
  MARK_READ := 'TAFSIR THOBARI' ;
  ida :=  DTAyat.FieldByName('id_ayat').AsString;
  ID_AYAT:= ida;
  tbs_Ayat.show;

  With DTTafsir do
  begin
    close;
    ParamByName('v_nom').AsInteger:=TAFSIR;
    ParamByName('v_ida').AsString:=ida;
    Open;
  end;


  LoadTafsirWebPlain;
  LoadDaftarTafsirByAyat(ID_AYAT);
  tbs_Tafsir.show;
  tbs_DaftarTafsir.show;

end;

procedure Tfrm_Main.spb_showTahsinClick(Sender: TObject);
begin

  TIPE_S := 'tahsin';
  LoadPageAyatTahsin;
  tbs_showAyat.show;
  tbs_Ayat.show;


end;

procedure Tfrm_Main.spb_showTemaClick(Sender: TObject);
begin

  tbs_Tema.show;
  tbs_Ayat.show;
  tbs_showAyat.show;
  pnDetilKata.height :=0;
  pg_Left.Visible:= True;
end;

procedure Tfrm_Main.spb_SourceTafsirClick(Sender: TObject);
begin
  DisableButtonTafsir;
  LoadTafsirWebPlain;
  tbs_TafsirWeb.show;
  spb_SourceTafsir.Flat:=false;
end;

procedure Tfrm_Main.spb_TafsirWebClick(Sender: TObject);
begin

  tbs_TafsirWeb.Show;
  //LoadTafsirWeb;
  DisableButtonTafsir;
  spb_TafsirWeb.Flat:=false;

end;

procedure Tfrm_Main.OpenDocAyat(id:string);
var
 h : string;
 s : TStringList;
begin

   h:=  '<div dir="rtl">' +  SplitAyatPerHuruf(DtAyat.FieldByName('standard').AsString,'') + '</div>';

   s := TStringList.Create;
   s.Text:= h;
   s.SaveToFile(ExtractFilePath(Application.ExeName) + 'h.html');
   FRM_Doc.Chromium1.LoadURL(ExtractFilePath(Application.ExeName) + 'h.html');

end;


procedure Tfrm_Main.spb_ThobariClick(Sender: TObject);
begin

  LoadTafsir(1);
  TAFSIR := 1 ;
  lb_Mufassir.Caption:='Tafsir Ath-Thobari';
  DisableButtonTafsir;


end;

procedure Tfrm_Main.spb_WasithClick(Sender: TObject);
begin

  LoadTafsir(8);
  TAFSIR := 8 ;
  lb_Mufassir.Caption:='Tafsir Al-Wasith Thonthowy';

end;

procedure Tfrm_Main.TajwidAyat;
var
 h : string;
 c : string;
 s : TStringList;
begin
  DTTajwid.close;
  DTTajwid.open;
  DTTajwid.First;

  h := DtAyat.FieldByName('teks_ayat').ASstring;
  while not DTTajwid.eof do
   begin
      c := DTTajwid.FieldByName('h1').ASstring ;

      h := AnsiReplaceStr(h,c,'<span style="background: '+ DTTajwid.FieldByName('warna').ASstring +
           '">'+c+'</span>');

      DTTajwid.next;
   end;
  h :=  '<div align="center" style="font-size:'+ Inttostr(FONT_S)  +'px;font-family:' + FONT_QR + '">' +
        h  + '</div>';
  s := TStringList.Create;
  s.Text:=h;
  s.SaveToFile(ExtractFilePath(Application.ExeName) + 'h.html');
  FRM_Doc.Chromium1.LoadURL(ExtractFilePath(Application.ExeName) + 'h.html');
  s.free;

end;

procedure Tfrm_Main.spb_SetTajwidClick(Sender: TObject);
begin
  FRM_Tajwid.ShowModal;
end;

procedure Tfrm_Main.spb_NormalClick(Sender: TObject);
begin

    pnDetilKata.height :=0;
    Splitter1.Height:=0;
    TIPE_S := 'normal' ;
    KEY_WORD_ARB := '';
    KEY_WORD_TRJ := '';
    MARK_READ := 'TERJEMAH' ;

    LoadPageAyatTafsirSingkat(ID_AYAT);
    tbs_showAyat.show;
    tbs_Ayat.show;
    DisableButtonNav;
    spb_Normal.Flat:=false;
    tbs_Surat.show;

    LoadDaftarPerKata(ID_AYAT);
    tbs_DaftarKata.show;

end;

procedure Tfrm_Main.spb_TahsinClick(Sender: TObject);
begin

    TIPE_S := 'tahsin';
    LoadPageAyatTahsin;
    tbs_showAyat.show;
    tbs_Ayat.show;
    DisableButtonNav;
    tbs_DaftarKata.show;
end;

procedure Tfrm_Main.spb_TajwidClick(Sender: TObject);
begin
  Splitter1.Height:=0;
  pnDetilKata.height :=0;
  //pnDetilKata.Height:=0;
  TIPE_S := 'tajwid';
  MARK_READ := 'TAJWID' ;

  LoadPageAyatTajwid;
  tbs_showAyat.show;
  tbs_Ayat.show;

  tbs_Ayat.show;
  DisableButtonNav;
  tbs_Surat.show;

  spb_Tajwid.Flat:=false;
  tbs_DaftarKata.show;


end;

procedure Tfrm_Main.str_BookClick(Sender: TObject);
begin

end;

procedure Tfrm_Main.trPromptDblClick(Sender: TObject);
var
  p : string;
begin

  p := trPrompt.Selected.Text;

  if AnsiContainsStr(p,'*') then
  begin
        FRM_ChatAI.edtTanya.Clear;
        FRM_ChatAI.mm_Chat.Clear;
        FRM_ChatAI.mode := 'ADD';
        FRM_ChatAI.edtTanya.Text:= AnsiReplaceStr(p,'*','');

  end;

end;

procedure Tfrm_Main.VLCPlayerAyatMediaPlayerEndReached(Sender: TObject);
begin

  if ckTerjemah.Checked then
   begin
   PlayTerjemah ;
   exit;
   end
  else if ckUlang.Checked then
   begin
   PlayAyat;
   exit;
   end
  else if ckNext.Checked then
   begin
    if not DTAyat.EOF then
     begin
        spb_AyatNext.click ;
        PlayAyat;
     end
     else
        begin
         VLCPlayerAyat.Stop();
         ckNext.Checked:=false;
         exit;
        end;
   end;

end;

procedure Tfrm_Main.VLCPlayerAyatMediaPlayerPlaying(Sender: TObject);
begin
  spb_baca.Animate:=true;
end;

procedure Tfrm_Main.VLCPlayerAyatMediaPlayerPositionChanged(Sender: TObject;
  po: Single);
begin
   pbarAyat.Value := Trunc(VLCPlayerAyat.GetVideoPosInPercent);
end;

procedure Tfrm_Main.VLCPlayerAyatMediaPlayerStopped(Sender: TObject);
begin
   spb_baca.Animate:=false;
   pbarAyat.Value:=0;
end;

procedure Tfrm_Main.VLCPlayerHelpMediaPlayerPositionChanged(Sender: TObject;
  po: Single);
begin
  pbarTutorial.Value := Trunc(VLCPlayerHelp.GetVideoPosInPercent);
end;

procedure Tfrm_Main.VLCPlayerTerjemahMediaPlayerEndReached(Sender: TObject);
begin

  if ckNext.Checked then
     if not DTAyat.EOF then
        begin
        spb_AyatNext.click;
        PlayAyat;
        end

     else
        begin
         VLCPlayerTerjemah.Stop();
         exit;
        end;
  if ckUlang.Checked then PlayAyat;

end;

procedure Tfrm_Main.VLCPlayerTerjemahMediaPlayerPlaying(Sender: TObject);
begin
   spb_baca.Animate:=true;
end;

procedure Tfrm_Main.VLCPlayerTerjemahMediaPlayerStopped(Sender: TObject);
begin
   spb_baca.Animate:=false;
end;

procedure Tfrm_Main.OpenTahsin(huruf:string);
begin

    if Length(huruf)<5 then
    begin

      With DTHuruf do
      begin
        close;
        SQL.Clear;
        SQL.Add('select * from hijaiyah where trim(arab)=' + QuotedStr(huruf)) ;
        Open;
      end;

      With DTSifat do
      begin
        close;
        SQL.Clear;
        SQL.Add('select * from v_sifat_huruf where arab=' + QuotedStr(huruf));
       Open;
      end;

   end;
    tbs_Huruf.show;

end;

procedure Tfrm_Main.OpenPageHv(script:string;hv:THtmlViewer;f:string);
var
    s : TStringList;
begin
   try
       s := TStringList.Create;
       s.Text:= script;
       s.SaveToFile(DIR_APP + '/support/page/'+ f +'.html');
       hv.LoadFromFile(DIR_APP + '/support/page/' + f + '.html');

  finally
   s.Free;
  end;

end;

procedure Tfrm_Main.OpenPage(script:string;respon:string);
var
    s : TStringList;
begin
   try
       s := TStringList.Create;
       s.Text:= script;

       s.LoadFromFile(DIR_APP + '/support/page/ayat.html');

       s.Text:= AnsiReplaceStr(s.Text,'$_DOCUMENT',script);
       s.SaveToFile(DIR_APP + '/support/page/ayat2.html');

       FRM_Ayat.respon:=respon;
       FRM_Ayat.Chromium1.LoadURL(DIR_APP + '/support/page/ayat2.html');

  finally
   s.Free;
  end;

end;

procedure Tfrm_Main.OpenTajwid(huruf:string);
var
    vh : string;
begin
    vh := Trim(AnsiReplaceStr(huruf,'@',''));

     if AnsiContainsStr(huruf,'@') then
     begin
       With DTRefTajwid do
       begin
         close;
         sql.Clear;
         sql.Add('select * from v_showtajwid where TRIM(h1)=' + QuotedStr( vh ));
         Open;
         tbs_ShowTajwid.Show;
       end;
     end;
end;

procedure Tfrm_Main.OpenTafsir(kalimat:string;nom:string);
var
    teks : string;
begin

  teks :=  TranslateUseChatGPT('Terjemahkan ke bahasa indonesia ~' + kalimat + '~');
  teks := AnsiReplaceStr(teks,'''','`');
  teks := AnsiReplaceStr(teks,'"','`');

  if Dialogs.MessageDlg('Terjemahan OpenAI => :' + teks + '" Apa sudah cukup bagus ?',
     mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    Koneksi.ExecuteDirect('update tafser_trans set translate=' + QuotedStr(teks) +
                         ' where idx=' + nom);
    ShowMessage('Selesai');

  end
  else
  begin
    teks :=  TranslateUseChatGPT('Terjemahkan Belum cukup akurat , ' +
             'coba terjemahkan lagi kedalam Bahasa Indonesia ~' + kalimat + '~');
    teks := AnsiReplaceStr(teks,'''','`');
    teks := AnsiReplaceStr(teks,'"','`');

    Koneksi.ExecuteDirect('update tafser_trans set translate=' + QuotedStr(teks) +
                         ' where idx=' + nom);
    ShowMessage('Selesai');

  end;

end;

procedure Tfrm_Main.LoadPageAyatTahsin;
var
  daftar_kata : TStringList;
  script,halaman,perhuruf ,hal: string;
  ayat,ayat2 : string;
  terjemah : string;
  i : integer;
  key_huruf:string;

begin
  try
      ayat := SplitAyatPerHuruf(DtAyat.FieldByName('teks_ayat').AsString,' ');

      try
        daftar_kata      := TStringList.Create;
        daftar_kata.Text := ayat;
        halaman := '';

        for i := 0 to daftar_kata.Count -1 do
        begin

          if daftar_kata.Strings[i]<>'' then
           halaman := halaman + '<span style="color:hotpink;">' +
                daftar_kata.Strings[i]  +'</span>';
        end;


      ayat2 := SplitAyatPerHuruf(DtAyat.FieldByName('standard').AsString,' ');

      daftar_kata.Clear;
      daftar_kata.Text := ayat2;

       for i := 0 to daftar_kata.Count -1 do
        begin

           key_huruf := GetInfoHijaiyah(daftar_kata.Strings[i]);

          if key_huruf<>'' then

           perhuruf := perhuruf + '<a style="color:green;text-decoration: none;" href="#HURUF' +
                       daftar_kata.Strings[i] + '"><div dir="ltr" class="btn btn-primary tooltip">' +
                       daftar_kata.Strings[i] +
                     '<span class="bottom">' +  key_huruf +  '</span></div></a>'
          else
                 perhuruf := perhuruf + '&nbsp;&nbsp;&nbsp;&nbsp;' ;
       end;

        terjemah:= '<div style="font-family:' + FONT_LATIN + ';font-size:17px;'+
                   'text-align:center"><b>' +
                    DtAyat.FieldByName('indoText').AsString + '</b></div>';

        perhuruf := terjemah + '<div dir="rtl" style="cursor:pointer;background-color:#F0EFDB"><hr>' +
                    perhuruf + '</div>';

        script :=  '<div dir="rtl" align="center" style="font-size:'+
                   IntToStr(FONT_S) +'px;font-family:' + FONT_QR +';line-height:2.1";>' + halaman +
                   '<br>' + perhuruf + '</div>';




        hal       := '<body style="background-color:#F0F7E2">';
        hal       := hal + '<table width=100% border=0><tr><td width="100%" valign="top" style=";'+
                     'padding:15px">' + script  +
                     '<br><br></td></tr></table>';

      finally
        daftar_kata.free;
      end;

      OpenPage(hal, 'HURUF');

    except

      on e:Exception do exit;

    end ;
    DisableButtonNav;

end;

procedure Tfrm_Main.LoadPageAyatTajwid;
var

  terjemah     : string;
  hukum        : string;
  huruf        : string;
  halaman      : string;
  script       : string;
  hal          : string;
  ayat_plain   : string;
  ur_taj       : string;
  sebab        : string;
  transliterasi : string;
begin

  DTTajwid.close;
  DTTajwid.open;
  DTTajwid.First;

  halaman := DtAyat.FieldByName('fteks_ayat').ASstring;

  DTTajwid.Filtered:=false;

  DTTajwid.First;

  ur_taj := '<table width=90% align=right style="border: 1px solid #ddd;padding:13px;'+
            'background-color:#F9F7E8">' +
            '<tr style="font-family:' + FONT_LATIN + ';font-size:13px;text-align:center;'+
            'background-color:none;line-height:2.0">'+
            '<td> Tajwid </td></tr>';

  while not DTTajwid.eof do
   begin

      hukum   :=  DTTajwid.FieldByName('hukum').ASstring ;
      huruf   :=  DTTajwid.FieldByName('h1').ASstring ;
      sebab   :=  DTTajwid.FieldByName('sebab').AsString;
      halaman :=  AnsiReplaceStr(halaman,huruf,'<span style="background: '+
                  DTTajwid.FieldByName('warna').ASstring +'">'+
                  '<a style="color:black;text-decoration: none;" href="#TAJWID@' + huruf +
                  '">' +
                  huruf + '</a></span>');

      if AnsiContainsText(halaman,huruf) then
      begin
       ur_taj:= ur_taj + '<tr style="font-family:' + FONT_LATIN + ';font-size:13px;'+
                'text-align:left"><td>' +
                '<div style="font-family:' + FONT_QR + ';line-height:1.8;font-size:30px;">' +
                huruf + '</div><div>' + hukum + '</div><div style="text-align:left">' + sebab +
                '</div></td>' +
                '</tr>' ;
      end;
      DTTajwid.next;

   end;
    ur_taj:= ur_taj + '</table>';

  DTHurufHijaiyah.open;
  DTHurufHijaiyah.First;
  ayat_plain := DtAyat.FieldByName('fteks_ayat').ASstring;

  transliterasi :=  '<div style="color:#E18D4B;font-family:' + FONT_LATIN +
                     ';font-size:14px;text-align:center"><b> ' +
                     DtAyat.FieldByName('transliterasi').AsString + '</b></div><br>';

  while not DTHurufHijaiyah.EOF do
   begin
   ayat_plain  := AnsiReplaceStr( ayat_plain, DTHurufHijaiyah.FieldByName('arab').AsString,
               '<font color="' + SetWarnaHuruf(DTHurufHijaiyah.FieldByName('arab').AsString) + '">' +
               DTHurufHijaiyah.FieldByName('arab').AsString + '</font>');

   DTHurufHijaiyah.next;

   end;

  terjemah  := DtAyat.FieldByName('indoText').AsString ;
  script :=  '<div style="font-size:'+
              IntToStr(FONT_S) +'px;font-family:' + FONT_QR + ';line-height:2.2;padding:10px">' +
              halaman  + transliterasi + '</div><br><div style="text-align:justify;'+
              'font-family:' + FONT_LATIN + ';font-size:17px">' +
              terjemah + '</div>';

  hal    := '<table width=100% border=0><tr><td valign="top" dir="rtl" width="60%" '+
           'style="text-align:right">' +
           script +   '</td><td width="30%" valign="top" style="font-family:'+
           '' + FONT_LATIN + ';font-size:17px;' +
           'text-align:left" >' +
           ur_taj + '</td></tr></table>';

  hal   := '<div style="font-family:' + FONT_LATIN + ';font-size:17px;text-align:center">'+
           '<b>TAJWID ( HUKUM BACAAN )</b> <hr></div><br>'+ hal ;

  hal   := '<body style="background-color:#FEFEF4"><div>'+
           '</div><table width=100%><tr><td width="100%" valign="top">' + hal  +
           '</div>';

  OpenPage(hal, 'TAJWID');

end;

procedure Tfrm_Main.LoadPageAyatTafsirSingkat(ida:string);
var

  ayat,terjemah : string;
  saadi : string = '';
  script,hal : string;
  transliterasi : string;
begin

   script    := '';

   if KEY_WORD_ARB <> '' then
   begin
      ayat   :=  DtAyat.FieldByName('usmani').AsString;
      ayat   := TandaKeyPadaAyat(ayat, KEY_WORD_ARB);
   end
   else
      ayat   :=  DtAyat.FieldByName('teks_ayat').AsString;

   transliterasi :=  '<div style="color:#E18D4B;font-family:' + FONT_LATIN +
                     ';font-size:14px;text-align:center"><b> ' +
                     DtAyat.FieldByName('transliterasi').AsString + '</b></div>';

   script  :=  '<div dir="rtl" align="right" style="font-size:'+
                  IntToStr(FONT_S) +'px;padding:10px;font-family:' + FONT_QR +
                  ';line-height:2.2">' + ayat + '</div><br><br>';

   terjemah  := LoadPageTerjemah(ida);

   hal       := '<body style="background-color:#FEFEF4">';
   hal       := hal + '<div style="font-family:' + FONT_LATIN + ';font-size:17px;text-align:center">'+
                  '<b>TAFSIR SINGKAT</b><br></div>';


   if VI_TERJEMAH = 'vertikal' then
   hal       := hal + '<hr><table width=100%><tr><td width="100%" valign="top">' + script +  transliterasi +
                '</td></tr><tr><td valign=top>' + terjemah + '</td></tr></table>'
   else
   hal       := hal + '<hr><table width=100%><tr><td width="30%" valign="top">' + script +  transliterasi +
                '</td><td width=2%></td><td width=68% valign=top >' + terjemah + '</td></tr></table>' ;

   hal := hal ;
   OpenPage(hal,'');

   DisableButtonNav;


end;

procedure Tfrm_Main.LoadPageAyatTafsirLanjutan(ida:string;kitab:string);
var

  ayat , terjemah : string;
  tafsir_lanjutan : string = '';
  script,hal : string;
  transliterasi : string;
begin

   script    := '';

   if KEY_WORD_ARB <> '' then
   begin
      ayat   :=  DtAyat.FieldByName('usmani').AsString;
      ayat   := TandaKeyPadaAyat(ayat, KEY_WORD_ARB);
   end
   else
      ayat   :=  DtAyat.FieldByName('teks_ayat').AsString;

  transliterasi :=  '<div style="color:#E18D4B;font-family:' + FONT_LATIN +
                     ';font-size:14px;text-align:center"><b> ' +
                     DtAyat.FieldByName('transliterasi').AsString + '</b></div><br>';

   script  :=  '<div dir="rtl" align="right" style="font-size:'+
                  IntToStr(FONT_S) +'px;padding:10px;font-family:' + FONT_QR +
                  ';line-height:2.2">' + ayat + '</div><br><br>';

   terjemah    := DtAyat.FieldByName('indoText').AsString ;
   terjemah    := '<div style="font-family:' + FONT_LATIN + ';font-size:17px;text-align:justify">' +
                   terjemah + '</div><br><br>';

   tafsir_lanjutan     := LoadPageTafsirSesuaiKitab(ida,KITAB_TAFSIR_NOW);

   hal       := '<body style="background-color:#FEFEF4">';
   hal       := hal + '<div style="font-family:' + FONT_LATIN + ';font-size:17px;text-align:center">'+
                  '<b>TAFSIR LANJUTAN</b><hr></div>'+ hal ;



   if VI_TERJEMAH = 'vertikal' then
   hal       := hal + '<table width=100%><tr><td width="100%" valign="top">' + script+ transliterasi + terjemah +
                '</td></tr><tr><td valign=top style="padding:15px;background-color:#F3F3E5">' +
                tafsir_lanjutan + '</td></tr></table>'
   else
   hal       := hal + '<table width=100%><tr><td width="30%" valign="top">' + script +  transliterasi + terjemah +
                '</td><td width=5%></td><td valign=top width=65% ' +
                'style="padding:15px;background-color:#F3F3E5">' +
                tafsir_lanjutan + '</td></tr></table>' ;

   hal := hal ;
   OpenPage(hal,'');
   DisableButtonNav;


end;


procedure Tfrm_Main.LoadPageAyatResume(ida:string);
var

  ayat : string;
  terjemah_id : string;
  script,hal : string;
  resume : String = '';
  gbr : string;
  transliterasi : string;
begin

   script    := '';

   if KEY_WORD_ARB <> '' then
   begin
      ayat   :=  DtAyat.FieldByName('usmani').AsString;
      ayat   := TandaKeyPadaAyat(ayat, KEY_WORD_ARB);
   end
   else
      ayat   :=  DtAyat.FieldByName('teks_ayat').AsString;


   script  :=  '<div dir="rtl" align="right" style="font-size:'+
               IntToStr(FONT_S) +'px;padding:10px;font-family:' + FONT_QR +
               ';line-height:2.2">' + ayat + '</div><br><br>';

   terjemah_id    := DtAyat.FieldByName('indoText').AsString ;
   terjemah_id    := '<div style="font-family:' + FONT_LATIN + ';font-size:17px">' +
                   terjemah_id + '</div>';

  transliterasi :=  '<div style="color:#E18D4B;font-family:' + FONT_LATIN +
                     ';font-size:14px;text-align:center"><b> ' +
                     DtAyat.FieldByName('transliterasi').AsString + '</b></div><br>';

   resume := DtAyat.FieldByName('resumeai').AsString;
   resume :=  '<div style="font-family:' + FONT_LATIN + ';Font-Size:15px;text-align:justify">' +
             resume + '</div>';

   hal       :=  '<body style="background-color:#FEFEF4">';
   hal       := hal + '<div style="font-family:' + FONT_LATIN + ';font-size:17px;text-align:center">'+
                '<b>RESUME DENGAN AI</b><br></div>'+ hal ;


  
   if VI_TERJEMAH = 'vertikal' then
   hal       := hal + '<hr><table width=100%><tr><td width="100%" valign="top">' + script+ transliterasi + terjemah_id +
                '</td></tr><tr><td style="padding:15px;background-color:#F3F3E5">' +
                resume + '</td></tr></table>'
   else
   hal       := hal + '<hr><table width=100%><tr><td width="30%" valign="top">' + script + transliterasi + terjemah_id +
                '</td><td width=5%></td><td valign=top width=65% ' +
                'style="padding:15px;background-color:#F3F3E5">' +
                resume + '</td></tr></table>' ;

   OpenPage(hal,'RESUME_AYAT') ;



end;

procedure Tfrm_Main.LoadPageAyatNormalByAI;
var

  tema,ayat , resume : string;
  hal : string;
  cmd : string;

begin
  ayat  := DtAyat.FieldByName('teks_ayat').AsString;

  resume := TranslateUseGemini(AnsiReplaceText(SETTING_PROMPT_RESUME_AYAT,'$KALIMAT',ayat));
  if resume = '' then exit;
  resume := resume + #13#13#13 + '<hr>(Resume oleh Gemini > ' + FormatDateTime('dd-mmm-yyyy', now) +')';
  resume := AnsiReplaceStr(resume, '**' ,'');
  resume := AnsiReplaceStr(resume, #10 ,'<br>');
  RESUME_AYAT := resume;

  hal       := '<body style="background-color:#FEFEF4">';
  tema := LoadPageTemaTerkait(ID_AYAT);

end;

function Tfrm_Main.LoadPageTafsirSesuaiKitab(ida:string;kitab:string):string;
var
 has : string = '';
 t : string;
begin


  t := GetItem('select count(id_ayat) as j from v_tafser_trans where id_ayat=' + QuotedStr(ida) +
       ' and NameE=' + QuotedStr(kitab));


  if t = '0' then
  begin

    with DTGet do
    begin
         close;
         sql.Clear;
         sql.Add(' SELECT * FROM v_showtafsir v '+
                 ' INNER JOIN mufassir m '+
                 ' ON v.nom=m.ID '+
                 ' WHERE id_ayat=' + QuotedStr(ida) + ' AND m.nameE=' + QuotedStr(kitab));

         open;

         While not eof do
          begin
           has := has + '<div style="color:#0E0E0B;font-family:'+ FONT_LATIN +
                  ';font-size:15px;text-align:justify;"><b>Tafsir : ' + FieldByName('NameE').AsString +
                  '</b></div><hr>' +
                  '<div dir="rtl" valign="top" style="color:#0E0E0B;font-family:'+ FONT_QR +
                  ';font-size:16px">'+
                  Trim(FieldByName('nass').AsString)  +'</div>';
           next;

          end;

         ISI_TAFSIR_NOW := FieldByName('nass').AsString;

    end;

  end
  else   // Jika Sudah pernah ditranslate
  begin
    with DTGet do
    begin
         close;
         sql.Clear;
         sql.Add(' SELECT teks,translate,NameE FROM v_tafser_trans  '+
                 ' WHERE id_ayat=' + QuotedStr(ida) + ' AND NameE=' + QuotedStr(kitab) +
                 ' order by idx');

         open;

         has :=   '<div valign="top" style="color:#0E0E0B;font-family:'+ FONT_LATIN +
                  ';font-size:13px;text-align:justify;"><b>Tafsir : ' + FieldByName('NameE').AsString +
                  '</b></div>' ;
         While not eof do
          begin
           has := has + '<div dir="rtl" style="color:#0E0E0B;font-family:'+ FONT_QR +
                  ';font-size:17px;padding:30px">'+
                  Trim(FieldByName('teks').AsString)  + '</div>'+
                  '<div dir="ltr" style="padding:20px;text-align:justify;color:#0E0E0B;'+
                  'font-family:'+FONT_LATIN +';font-size:15px;'+
                  'Background-color:#FFFFF0">'+
                  Trim(FieldByName('translate').AsString)  + '</div>';

           next;

          end;

    end;
  end;

  Result :=has;
end;

function Tfrm_Main.LoadPageTerjemah(ida:string):string;
var
  terjemah : string;
  i : integer;
begin

   terjemah := GetTafsir(ida);
   terjemah := '<div style="padding: 0px 10px 10px 10px;width:98%;text-align:justify;font-family:'+
               '' + FONT_LATIN + ';'+
               'font-size:16px;background-color:#F3F3E5;line-height:1.5">' +
               terjemah + '</div>';

    for i := 1 to 20 do
    begin
      terjemah := AnsiReplaceStr(terjemah,IntToStr(i) + '.', IntToStr(i) + '|');
    end;

   terjemah := AnsiReplaceStr(terjemah, 'a.', 'a|');
   terjemah := AnsiReplaceStr(terjemah, 'b.', 'b|');
   terjemah := AnsiReplaceStr(terjemah, 'c.', 'c|');
   terjemah := AnsiReplaceStr(terjemah, 'd.', 'd|');
   terjemah := AnsiReplaceStr(terjemah, 'e.', 'e|');
   terjemah := AnsiReplaceStr(terjemah, 'f.', 'f|');
   terjemah := AnsiReplaceStr(terjemah, 'g.', 'g|');
   terjemah := AnsiReplaceStr(terjemah, 'a.s.', 'as');
   terjemah := AnsiReplaceStr(terjemah,'.'+#13, '.' + '<br><br>');
   terjemah := AnsiReplaceStr(terjemah,'. ', '.' + '<br><br>');
 //  terjemah := AnsiReplaceStr(terjemah,'. ', '.' + '<br><br>');

   terjemah := AnsiReplaceStr(terjemah,'|', '.' );

    if KEY_WORD_TRJ <> ''  then
      terjemah:= AnsiReplaceText(terjemah,KEY_WORD_TRJ,'<span style="background:#FFF222">' +
      KEY_WORD_TRJ + '</span>');

   Result := terjemah;

end;

procedure Tfrm_Main.LoadPageAyatKata;
var
  halaman:string;
  script :string;
  arti : string;
  terjemah : string;
  item_kata:string;
  dasar_kata : string;
  k: string;
  variasi_kata : string;
  hal : string;
begin

   halaman   :=  DtAyat.FieldByName('usmani').AsString;

   With DTDaftarKata do
   begin

        First;

        While Not Eof do
         begin

             item_kata :=  FieldByName('arab_harokat').AsString;
             dasar_kata := FieldByName('basic').AsString;
             variasi_kata := GetVariasiKata(dasar_kata);
             arti      :=  FieldByName('arti').AsString;

             halaman   :=  AnsiReplaceStr(halaman,item_kata,'<a style="color:black;text-decoration: '+
                           'none;" href="#KATA' +
                           dasar_kata + '"><div class="btn btn-primary tooltip">' +
                           item_kata +
                           '</a><span class="bottom">' +  item_kata + '<br>' +
                           arti +
                           '<div dir="ltr">Akar Kata ' +  dasar_kata + '</div>' +
                           variasi_kata +
                           '</span></div>') ;


             next;
         end;
   end;

   script :=   '<div width="90%" dir="rtl" align="center" '+
               'style="padding: 10px 10px 10px 10px;font-size:'+
                IntToStr(FONT_S) +'px;font-family:' + FONT_QR +
                ';line-height:2.2;cursor:pointer">' +
                halaman  + '</div><br>';

   terjemah:= '<div style="font-family:' + FONT_LATIN + ';font-size:17px;text-align:center"><b>' +
              DtAyat.FieldByName('indoText').AsString + '</b></div>';

    hal       := '<body style="background-color:#FEFEF4">';
    hal       := hal + '<table width=100%><tr><td width="100%" valign="top">' + script + terjemah +
                    '</td></tr></table>';


   OpenPage(hal  ,'KATA');

end;

function Tfrm_Main.GetInfoHijaiyah(huruf:string):string;
var
  sifat : string;
begin

  if AnsiContainsStr(huruf,'&nbsp;') then
      Result :=''
  else
  begin

    With DTHijaiyah do
    begin
      close;
      ParamByName('v_arab').AsString:=huruf;
      Open;
      sifat :=   FieldByName('arti_huruf').AsString;

      Result :=sifat;
  end;

  end;
end;

procedure Tfrm_Main.OpenPageAyat(tipe:string);
begin

  if tipe = 'normal' then
   spb_Normal.Click
  else if tipe = 'lanjutan' then
   spb_Tafsir_lanjutan.Click
  else if tipe = 'tahsin' then
   LoadPageAyatTahsin
  else if tipe = 'tajwid' then
   spb_Tajwid.Click
  else if tipe = 'quote' then
   spb_Quote.Click
  else if tipe = 'kata' then
    spb_Kata.Click
  else if tipe = 'tema' then
    spb_tema.Click
  else if tipe = 'huruf' then
    spb_Huruf.Click
  else if tipe = 'resume' then
    spb_Resume.Click
  else if tipe = 'extrak' then
    spb_Extrak.Click
  else if tipe = 'language' then
    spb_lang.Click;

  tbs_showAyat.Show;
  //tbs_DaftarKata.show;

end;

procedure Tfrm_Main.LoadDaftarTafsirByAyat(ida : String);
begin

  With DTDaftarTafsir do
  begin
    close;
    ParamByName('v_ida').AsString:= ida;
    Open;

    if SETTING_TYPE='True' then
       DTDaftarTafsir.Filtered:=False
    else
    begin
       DTDaftarTafsir.Filter:='kat=''suni''' ;
       DTDaftarTafsir.Filtered:=True;  ;
    end;

  end;

end;

procedure Tfrm_Main.OpenKata(k:UTF8String);
var

  halaman:string;
  script :string;
  terjemah : string;
  item_kata:string;
  resumeai : string;
  hal : string;
  transliterasi:string;
begin

  try
    KATA_NOW := k;

    With DTGetData do
    begin
      close;
      sql.Clear;
      sql.Add('select basic,utsmani,arab from v_terjemahkata where arab_harokat=' + QuotedStr(trim(k)) );
      open;
    end;


    if Length(k)> 50 then exit;

    tbs_VariasiKata.show;

     With DTVariasiKata do
     begin

      close;
      sql.Clear;
      sql.Add(' select distinct utsmani, kata2 ' +
              ' from v_terjemahkata where basic=' + QuotedStr(DTGetData.FieldByName('basic').AsString) +
              ' order by utsmani');

      Open;
     end;

     halaman   :=  ' ' + DtAyat.FieldByName('usmani').AsString;

      With DTDaftarKataUnique do
      begin

           close;
           ParamByName('v_ida').AsString:=ID_AYAT;
           open;

           First;

           While Not Eof do
            begin

                item_kata :=  FieldByName('arab_harokat').AsString;

                halaman   :=  AnsiReplaceStr(halaman,' ' + item_kata ,
                              '<a style="color:black;text-decoration: none;" '+
                              'href="#KATA' + item_kata + '"> ' + item_kata + '</a>');

                next;
            end;
      end;

      halaman := AnsiReplaceStr(halaman, k +'</a>', '<span style="background-color:#FDF785"> ' +
                                         k + '</span></a>');


      script :=   '<div width="90%" dir="rtl" '+
                  'style="padding: 10px 10px 10px 10px;font-size:'+
                   IntToStr(FONT_S ) +'px;font-family:' + FONT_QR +
                   ';color:A2F111;line-height:1.8;cursor:pointer">' +
                   halaman  + '</div><br>';

      terjemah:=  DtAyat.FieldByName('indoText').AsString ;
      terjemah    := '<div style="font-family:' + FONT_LATIN + ';font-size:17px;text-align:justify">' +
                   terjemah + '</div><br><br>';

      ChartSebaranKata(DTGetData.FieldByName('basic').AsString,'basic');
      DTKataByStat.close;
      DTKataByStat.ParamByName('v_basic').AsString:= DTGetData.FieldByName('basic').AsString;
      DTKataByStat.open;

      pnDetilKata.Height:= 190;

     transliterasi :=  '<div style="color:#E18D4B;font-family:' + FONT_LATIN +
                   ';font-size:14px;text-align:center"><b> ' +
                   DtAyat.FieldByName('transliterasi').AsString + '</b></div><br>';

     hal       := '<body style="background-color:#FAFCF6">';

     hal := '<div style="font-family:' + FONT_LATIN + ';font-size:17px;text-align:center">'+
                  '<b>URAIAN PER KATA</b><hr></div><br>'+ hal ;

     resumeai := GetItem('select resumeai from terjemah_kata where arab_harokat=' +QuotedStr(k));
     resumeai := '<div style="font-family:' + FONT_LATIN + ';font-size:14px;text-align:justify">' +
                   resumeai + '</div>';

     hal       := hal + '<table width=100%><tr><td width="33%" valign="top">' + script + transliterasi + terjemah+
                  '</td><td width=3%></td><td width=62% style="padding:15px;background-color:#F3F3E5">' +
                  resumeai + '</td></tr></table>' ;



      OpenPage(hal  ,'KATA');

      StatistikKata(Trim(k));
      TampilkaAyatByVariasiTerjemahan('kata') ;
  except
    on e:Exception do
    begin
      ShowMessage(e.Message);
      exit;
    end;

  end;
end;

function Tfrm_Main.GetVariasiKata(kata:UTF8String):UTF8String;
var
  has : string;
begin

  With DTGetData do
  begin

    close;
    sql.Clear;
    sql.Add(' select distinct utsmani, basic, indonesia from terjemah_kata where basic=' +
             QuotedStr(kata) +  ' order by utsmani');
    Open;
    has := has  + '<div align="center">Terdapat ' + IntToStr(RecordCount) +
           ' Variasi Kata | Terjemah dari Akar Kata  </div>';

    Result := '<div dir="ltr" align="left" style="line-height:1.8">'+ has +'</div>' ;

   close;
  end;

end;
procedure Tfrm_Main.DisableButtonNav;
begin

   spb_Normal.Flat:=true;
   spb_Huruf.Flat:=true;
   spb_Kata.Flat:=true;
   spb_Quote.Flat:=true;
   spb_ShowResume.Flat:=true;
   spb_Tajwid.Flat:=true;
   pnl_Ayat.Enabled:=true;
   spb_tema.Flat:=True;
   spb_Extrak.Flat:=True;
   spb_Resume.Flat:=True;
   spb_lang.Flat:=True;
   spbTanyaGemini.Visible:=false;
   spb_Tafsir_lanjutan.Flat:=True;


end;

procedure Tfrm_Main.DisableButtonTafsir;
begin

  spb_TafsirWeb.Flat:=true;
  spb_SourceTafsir.Flat:=true;
  spb_TafsirTranslated.Flat:=true;

end;

function Tfrm_Main.TandaKeyPadaAyat(ayat:string;kata:string):string;
var
  hasil : string;
begin

  hasil := '<span style="background-color:#FFF333">' + kata + '</span>';
  hasil := AnsiReplaceStr(ayat,kata,hasil);

  Result := hasil;

end;
procedure Tfrm_Main.LoadDaftarAyat;
var
  has : string;
  s   : TStringList;
  i   : integer;
  w   : string;
begin

  has := '<table width=100% border=0 >';
  i := 0;

  With DtAyat do
  begin

   First;

   While Not EOF do
    begin
     inc(i);
     if Odd(i) then
        w := '#FFFFF9'
     else
        w := '#FFFFF2';

     has := has + '<tr style="background-color:' + w +';padding:0px">'+
            '<td width=50% ><div style="font-family:' + FONT_LATIN + ';font-size:15px;'+
            'padding: 9px;">' +
            '<a style="color:black;text-decoration: none;" href="#IDAYA' +
            FieldByName('id_ayat').AsString + '">' +
            FieldByName('indoText').AsString + '</a></div></td>' +
            '<td width=50%><div dir="rtl" style="font-family:'+ FONT_QR + ';font-size:23px;padding: 9px;">' +
            '<a style="color:black;text-decoration: none;" href="#IDAYA' +
            FieldByName('id_ayat').AsString + '">' +
            FieldByName('teks_ayat').AsString + '</a></div><br></td>' +
            '</tr>';
     Next;

    end;

  has := AnsiReplaceText(has,KEY_WORD_TRJ,'<span style="background:#FFF222">' +  KEY_WORD_TRJ +
         '</span>');
  has := has + '</table>';

   First;
 try
     s := TStringList.Create;
     s.Text:= has;

     s.SaveToFile(DIR_APP + 'support\page\daftar.html');
     FRM_DaftarAyat.respon:= 'AYAT';
     FRM_DaftarAyat.Chromium1.LoadURL(DIR_APP + 'support\page\daftar.html');

     finally
          s.free;
     end;
  end;
end;
procedure Tfrm_Main.OpenAyat(id:string);
begin

  ID_AYAT:= id;
  TIPE_S:='normal';
  DtAyat.Locate('ID_AYAT',id,[loPartialKey]);
  LoadDaftarPerKata(ID_AYAT);
  LoadPageAyatTafsirSingkat(ID_AYAT);
  tbs_DaftarKata.show;
  tbs_showAyat.show;

end;
procedure Tfrm_Main.ShutDownDB;
var
  cmd :string;
begin

  koneksi.Connected:=false;
  cmd  := PChar( 'taskkill /IM mariadbd.exe /F');

  Process1.ShowWindow:=swoHIDE;
  Process1.CommandLine:=cmd;
  Process1.Execute;

end;
procedure Tfrm_Main.LoadPageInQuote;
var
  script : string;
  ayat : string;
  halaman : string;
  terjemah : string;
begin

  ayat := DtAyat.FieldByName('teks_ayat').AsString;

  script := '<div valign="center" height="100%" width="80%" dir="rtl" ' +
            'style="text-align:center;font-family:' +
            FONT_QR  + ';font-size:' + IntToStr(FONT_S) + 'px;color:white;padding:20px">' +
            ayat + '</div></body>';


  terjemah:= '<div style="text-align:center;font-family:' + FONT_LATIN + ';'+
             'font-size:22px;color:white"><b>' +
             DtAyat.FieldByName('indoText').AsString + '</b></div>';

  halaman:= '<body  style="background-image:url(back.jpg);padding:30px">' +
            script + terjemah +
            '</body>' ;

  OpenPage(halaman ,'QUOTE');
  TIPE_S:= 'quote';


end;

procedure Tfrm_Main.PlayTerjemah;
var
  nos,noa:string;
  f:string;
  dir : string;
begin

  nos := DTAyat.FieldByName('nomor_surat').AsString;
  noa := DTAyat.FieldByName('nomor_ayat').AsString;

  nos := DupeString('0', 3 - Length(nos)) + nos ;
  noa := DupeString('0', 3 - Length(noa)) + noa ;

  f := nos+noa + 'Terjemahan.mp3' ;

  dir := Pchar(DIR_APP +  'support\audio\terjemah\' + nos + '\' + nos + '\' + f ) ;
  VLCPlayerTerjemah.Play(dir);

  tbs_Ayat.Show;
  tbs_showAyat.show;


end;

procedure Tfrm_Main.JawabPertanyaan(tanya:string);
var
  s : string;
begin

  // Baca Ayat

  if AnsiContainsText(tanya,'Baca') then
  begin

    s := Trim(AnsiReplaceText(tanya,'baca',''));
    s := 'select * from v_ShowdaftarAyat where ai_baca_suratayat like' +QuotedStr('%' + s ) ;

    DtAyat.Close;
    DTAyat.SQL.Clear;
    DtAyat.SQL.Add(s);
    DtAyat.open;

    if DtAyat.IsEmpty then
    begin
     ShowMessage('Tidak Ditemukan');
     exit ;
    end;

    ID_AYAT := DtAyat.FieldByName('id_ayat').AsString;
    OpenAyat(ID_AYAT);
    PlayAyat;

  end;

  if AnsiContainsText(tanya,'Tema') then
  begin

       s := AnsiReplaceText(tanya,'Cari','');
       s := AnsiReplaceText(s,'terjemah','');
       s := AnsiReplaceText(s,'Ayat','');
       s := AnsiReplaceText(s,'Yang','');
       s := AnsiReplaceText(s,'termasuk','');
       s := AnsiReplaceText(s,'tema','');
       s := AnsiReplaceText(s,'mengandung','');
       s := Trim(s);

       DtTema.Filtered:=false;
       DtTema.Filter:='tema like ' + QuotedStr('*'+ s +'*');
       DtTema.Filtered:=true;
       tbs_Tema.Show;
  end
  else
   DtTema.Filtered:=false;
  if AnsiContainsText(tanya,'Cari') then
  begin
     //
     s := AnsiReplaceText(tanya,'Cari','');
     s := AnsiReplaceText(s,'terjemah','');
     s := AnsiReplaceText(s,'Ayat','');
     s := AnsiReplaceText(s,'Yang','');
     s := AnsiReplaceText(s,'mengandung','');
     s := AnsiReplaceText(s,'kata','');
     s := Trim(s);


     DtAyat.close;
     DtAyat.sql.Clear;
     DTAyat.SQL.Add('select * from v_ShowdaftarAyat where indoText like' +
                    QuotedStr('%' + s + '%') + 'limit 400');
     DtAyat.open;

     If DtAyat.IsEmpty then
      ShowMessage('Tidak Ditemukan')
     else
     begin
      tbs_showDaftarAyat.show;
      lb_JumlahData.Caption:= 'Terdapat ' + Inttostr(DtAyat.RecordCount) + ' Ayat ';
      lb_Tema.Caption:='Mengandung Terjemah Kata "' + s + '"';
      KEY_WORD_TRJ :=  s;
     end;

  end;



end;

procedure Tfrm_Main.taawudz;
begin

  Application.ProcessMessages;
  pg_Left.show;

  pg_Right.Show;
  spl_right.show;
  pnl_Atas.show;

  tbs_showDaftarAyat.show;

  LoadAyatBySurat('1');
  LoadPageAyatTafsirSingkat(ID_AYAT);
  Application.ProcessMessages;
  Sleep(2000);
  VLCPlayerAyat.PlayNormal(DIR_APP+ 'support\audio\taawudz.mp3');


end;

procedure Tfrm_Main.LoadPageKataHuruf(kata:string);
var
  halaman:string;
  script :string;
  arti : string;
  terjemah : string;
  item_kata:string;
  dasar_kata : string;
  k: string;
  variasi_kata : string;
  hal : string;
begin


   halaman   :=  DtAyat.FieldByName('usmani').AsString;

   With DTDaftarKata do
   begin
        First;
        While Not Eof do
         begin

             item_kata :=  FieldByName('arab_harokat').AsString;
             dasar_kata := FieldByName('basic').AsString;
             variasi_kata := GetVariasiKata(dasar_kata);
             arti      :=  FieldByName('arti').AsString;

             halaman   :=  AnsiReplaceStr(halaman,item_kata,
                           '<a style="color:black;text-decoration: none;" href="#KATA' +
                           item_kata + '">' +
                           item_kata + '</a>');
             next;
         end;
   end;

   script :=   '<div width="90%" dir="rtl" align="center" '+
               'style="padding: 10px 10px 10px 10px;font-size:'+
                IntToStr(FONT_S ) +'px;font-family:' + FONT_QR +
                ';color:A2F111;line-height:2.8;cursor:pointer">' +
                halaman  + '</div><br>';

   terjemah:= '<div style="font-family:' + FONT_LATIN + ';'+
              'font-size:17px;text-align:center"><b>' +
              DtAyat.FieldByName('indoText').AsString + '</b></div>';

   hal       := '<body style="background-color:#FEFEF4">';
   hal       := hal + '<table width=100%><tr><td width="100%" valign="top">'
                + script + terjemah +
                '</td></tr></table>';

   OpenPage(hal  ,'KATA');

end;

function Tfrm_Main.EkstrakKata(kata:string):string;
var
  script : string;
  huruf : string;
  basic : string;
  key_huruf:string;
  daftar_kata :TStringList;
  perhuruf:string;
begin

  With DTGetData do
  begin
   close;
   sql.Clear;
   sql.Add('select arab,basic from v_terjemahkata where arab_harokat=' + QuotedStr(kata));
   open;
   huruf :=  SplitAyatPerHuruf(FieldByName('arab').AsString,' ');
   basic :=  FieldByName('basic').AsString;
  end;

  With DTGetData do
  begin
   close;
   sql.Clear;
   sql.Add('select * from v_terjemahkata where arab_harokat=' + QuotedStr(kata));
   open;

   if not IsEmpty then
   begin

    huruf :=  SplitAyatPerHuruf(FieldByName('arab').AsString,' ');

      try
       daftar_kata := TStringList.Create;
       daftar_kata.Clear;
       daftar_kata.Text := huruf;


       perhuruf :='';
       for i := 0 to daftar_kata.Count -1 do
        begin

           key_huruf := GetInfoHijaiyah(daftar_kata.Strings[i]);

          if key_huruf<>'' then

           perhuruf := perhuruf + '<a style="color:green;text-decoration: none;" href="#HURUF' +
                       daftar_kata.Strings[i] + '"><div dir="ltr" class="btn btn-primary tooltip">' +
                       daftar_kata.Strings[i] +
                     '<span class="bottom">' +  key_huruf +  '</span></div></a>'
          else
                 perhuruf := perhuruf + '&nbsp;&nbsp;&nbsp;&nbsp;' ;


       end;

      finally
      daftar_kata.free;
      end;

    script := '<table width=100% height=150px border=0  style="background-color:#FBFFF6">'+
              '<tr style="font-size:15px">' +
              '<td width=33% style="text-align:center">Kata </td> ' +
              '<td width=33% style="text-align:center">Huruf Pembentuk</td> ' +
              '<td width=33% style="text-align:center">Huruf Dasar </td> ' +
              '</tr>' +
              '<tr>' +
              '<td valign=top style="font-size:40px;font-family:'+ FONT_QR + ';text-align:center">' +
              kata + '<br>' +
              '<div style="font-size:19px"><b>' + FieldByName('arti').AsString +'<b></div></td>' +
              '<td valign=top dir="rtl" style="font-size:40px;font-family:'+ FONT_QR +
              ';text-align:center">' +
              perhuruf  + '</td>' +
              '<td valign=top style="font-size:40px;font-family:'+ FONT_QR + ';text-align:center">' +
              FieldByName('basic').AsString  + '</td>'+
              '</tr>' +
              '</table>';

   script := '<hr><div style="font-family:' + FONT_LATIN + ';font-size:20px;line-height:1.8">' +
             script + '</div>';
   end;


  end;

  Result := script;

end;

procedure Tfrm_Main.OpenAyatByID(ida:string);
begin

   DtAyat.close;
   DtAyat.sql.Clear;
   DTAyat.SQL.Add('select * from v_ShowdaftarAyat where id_ayat=' + QuotedStr(ida) );
   DtAyat.open;

   OpenAyat(DtAyat.FieldByName('id_ayat').AsString);
end;

procedure Tfrm_Main.ShowAgree;
begin
  FRM_Agree.Parent := pnAgreement;
  FRM_Agree.BorderStyle:=bsnone;
  FRM_Agree.Align:=alClient;
  FRM_Agree.Show;
end;

function Tfrm_Main.SetWarnaHuruf(h:UTF8String):string;
begin

  With DTGetData do
  begin
    close;
    sql.Clear;
    sql.Add('select concat(s1,''-'',s2) as s from hijaiyah where arab=' + QuotedStr(h));
    open;

    if Fields[0].AsString='Hams-Syiddah' then
       Result := 'red'
    else if Fields[0].AsString='Hams-Rakhawah' then
        Result := 'blue'
    else if Fields[0].AsString='Jahr-Syiddah' then
        Result := 'green'
    else if Fields[0].AsString='Jahr-Rakhawah' then
        Result := 'hotpink'
    else if Fields[0].AsString='Jahr-Tawasut' then
        Result := 'black'
  end;

end;

function Tfrm_Main.SetWarnaSifatHuruf(h:UTF8String;kolom:string;sifat:string):string;
begin


  With DTGetData do
  begin
    close;
    sql.Clear;
    sql.Add('select ' + kolom + ' as s from hijaiyah where arab=' + QuotedStr(h));
    open;

    if Fields[0].AsString=sifat then
    Result:= '#FFF444'
    else
    Result:='none';
  end;

end;

procedure Tfrm_Main.StatistikKata(k:UTF8String);
var

  har_sama : string;
  hur_sama : string;
  bas_sama : string;

  h,b:string;
begin


  har_sama := GetItem('select count(*) as j from terjemah_kata where arab_harokat=' + QuotedStr(k));
  h := GetItem('select arab from terjemah_kata where arab_harokat=' + QuotedStr(k));
  hur_sama := GetItem('select count(*) as j from terjemah_kata where arab=' + QuotedStr(h));
  b := GetItem('select basic from terjemah_kata where arab_harokat=' + QuotedStr(k));
  bas_sama := GetItem('select count(*) as j from terjemah_kata where basic=' + QuotedStr(b));

  lbKata.Caption:= k;
  lb_StatKataHarokat.Caption:='Kata : ' + har_sama;
  lbPlain.Caption:=h;
  lb_StatKataPlain.Caption:='Plain : ' + hur_sama;
  lbBasic.Caption:=b;
  lb_StatKataHuruf.Caption:='Huruf Dasar : ' + bas_sama;


end;

function Tfrm_Main.GetItem(sq:string):String;
var
  r:string;
begin

    With DTGetItem do
    begin
      close;
      sql.Clear;
      sql.Add(sq);
      open;
      r := r + Fields[0].AsString ;
      Result := Trim(r) ;
    end;

End;

procedure Tfrm_Main.OpenAyatNormalByAI(id:string);
begin

  ID_AYAT := id;
  DO_THREAD := 'Resume Ayat By Gemini' ;
  thrRequestAI.Active:=true;
  try
  FRM_Wait.ShowModal;

  except
    on e:Exception do
    exit
  end;

end;

function Tfrm_Main.HasLAN: Boolean;
begin
  LANConnState := InternetGetConnectedState(@LANConnState,0);
  Result := LANConnState;
end;

function Tfrm_Main.HasInternet: Boolean;
begin

     if URLDownloadToFile(nil, PChar('https://google.com'),
        PChar(DIR_APP + 'inet.stat'), 0, nil) = 0 then
          Result := True
     else
         Result := false;


end;

function Tfrm_Main.LoadPageTemaTerkait(id:string):string;
var
  h:string;
begin

  h := '<div style="font-family:' + FONT_LATIN + '">Tema Terkait : </div>';

  With DTTemaTerkait do
  begin
    close;
    ParamByName('v_ida').AsString:= id;
    open;
    TEMA_NOW:= FieldByName('tema').AsString;
    h := h + '<hr><ul>';
    while not eof do
     begin
       h := h + '<li><div><a style="font-family:' + FONT_LATIN +
                ';color:#A47149;text-decoration:none" href="#TEMA' + FieldByName('tema').AsString +'">' +
                FieldByName('tema').AsString + '</div></li>';
       next;
     end;
    h := h + '</ul>';
    close;
  end;

  Result := h
end;

function Tfrm_Main.LoadDataChart(sq:string):String;
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

procedure Tfrm_Main.ChartSebaranKata(s:string;k:string);
var
sq,res : string;
begin

  if k='basic' then
      sq := 'SELECT k.nomor_surat,COUNT(k.nomor_surat) AS jk,"" as D FROM terjemah_kata k ' +
           'WHERE trim(k.basic)=' + QuotedStr(trim(s))  + ' ' +
           'GROUP BY  ' +
           'k.nomor_surat  '
  else if k='plain' then
      sq := 'SELECT k.nomor_surat,COUNT(k.nomor_surat) AS jk,"" as D FROM terjemah_kata k ' +
           'WHERE trim(k.arab)=' + QuotedStr(trim(s))  + ' ' +
           'GROUP BY  ' +
           'k.nomor_surat  '
  else if k='kata' then
      sq := 'SELECT k.nomor_surat,COUNT(k.nomor_surat) AS jk,"" as D FROM terjemah_kata k ' +
           'WHERE trim(k.arab_harokat)=' + QuotedStr(trim(s))  + ' ' +
           'GROUP BY  ' +
           'k.nomor_surat  '   ;



  res := LoadDataChart(sq);
  LCKata.DataPoints.Text := res;

  CKata.Source := LCKata;
  ChartKata.Title.Text.Text:='Sebaran Kata  = ' + QuotedStr(s)   ;

end;

procedure Tfrm_Main.LoadResumeKataByAI;
var
   has : string;
   kata  : string;
begin


  kata := KATA_NOW ;
  if kata='' then exit;


  has := TranslateUseGemini(AnsiReplaceText(SETTING_PROMPT_RESUME_KATA,'$KALIMAT',kata));
  if has = '' then exit;

  has := AnsiReplaceStr(has, #10,'<br>');
  has := AnsiReplaceStr(has ,'<br>**','<br><b>');
  has := AnsiReplaceStr(has ,'** ','</b> ');
  has := AnsiReplaceStr(has ,'**<br>','</b><br>');
  has := AnsiReplaceStr(has ,'*','');
  has := has + '<br><br><br>' + '<hr>(Resume oleh Gemini > ' + FormatDateTime('dd-mmm-yyyy', now) +')';

  RESUME_KATA:= has;


  if Dialogs.MessageDlg('Simpan Resume Tata Bahasa Arab Kata ini ?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      Koneksi.ExecuteDirect('update terjemah_kata set resumeai=' + QuotedStr(RESUME_KATA) + ' where '+
                            'arab_harokat=' + QuotedStr(KATA_NOW));
      ShowMessage('Tersimpan');
      DTTerjemahKata.Refresh;
    end;


  spb_Kata.Click;

end;

procedure Tfrm_Main.OpenSetting;
begin

  With DTSetting do
  begin
    close;
    open;
    SETTING_PROMPT_RESUME_KATA :=  FieldByName('req_resKata').AsString;
    SETTING_PROMPT_RESUME_TEMA :=  FieldByName('req_resTema').AsString;
    SETTING_PROMPT_RESUME_AYAT :=  FieldByName('req_resAyat').AsString;
    SETTING_PROMPT_TRANS_TAFSIR := FieldByName('req_transTafsir').AsString;
    SETTING_PROMPT_TRANS_HADIST := FieldByName('req_transHadist').AsString;
    SETTING_TYPE := FieldByName('kitab_syiah').AsString;
  end;

end;

procedure Tfrm_Main.TranslateTafsir(h:UTF8String;n:string);
var
   t : string ;
begin

   if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     exit;
   end;

   DO_THREAD:='TRANSLATE TAFSIR';
   thrRequestAI.Active:=True;


   t :=  TranslateUseGemini(AnsiReplaceText(SETTING_PROMPT_TRANS_TAFSIR,'$KALIMAT',h) );

   if t = '' then  exit;


   t := AnsiReplaceStr(t,'''','`');
   t := AnsiReplaceStr(t,'"','`');

   Koneksi.ExecuteDirect('update tafser_trans set translate=' + QuotedStr(t) + ' where idx=' + n);
   ShowMessage('Selesai');

   //LoadTafsirWeb;

end;

function Tfrm_Main.GetRandomAPI:string;
var
   j : integer;
   t : TStringList;
begin
    // acak API
      DTSetting.open;
      try
        t := TStringList.create;
        if DTSetting.FieldByName('useapi2').AsString='False' then
           t.Text:= Trim(DTSetting.FieldByName('api').AsString)
        else
           t.Text:= Trim(DTSetting.FieldByName('api2').AsString);
        j := t.Count;
        Randomize;

        Result := t.Strings[RandomRange(0,j-1)];
      finally
      t.Free;
      end;


end;


// Prosedur Activasi
procedure Tfrm_Main.CekAct;
var

  serial : string;
  fc : string;
  f : TStringList;
  act : String = '';
  i : integer =0;
  cek : string;
  ser : string;
begin

  // Dapatkan DriveSerial
  serial :=  GetMacAddress;
  ser := AnsiReverseString(serial);

  for i := 0 to length(ser) do
   begin
      act := act + intTostr(ord(ser[i])+19);
   end;
  fc :=ExtractFilePath(Application.ExeName)+ 'support/regact.cfd';

  try

   if not FileExists(fc) then
   begin
     try
       f:= TStringList.create;
       f.Add('kangozi');
       f.Add('shedelphi@gmail.com');
       f.Add('Banda Aceh');
       f.Add(serial);
       f.Add('12345678910');
       f.SaveToFile(fc);
     finally
       f.Free;
     end;
   end;


   f:= TStringList.create;
   f.LoadFromFile(PChar(ExtractFilePath(Application.ExeName)+ 'support/regact.cfd'));

   cek :=  f.Strings[4];

   if (cek<>act)  then
   begin
    // tmCekInet.Enabled:=false;

     Fregistration.nama:=f.Strings[0];
     Fregistration.email:=f.Strings[1];
     Fregistration.kota:=f.Strings[2];
     Fregistration.EAccCode.Text:='INVALID KEY';
     Fregistration.serial:=serial;
     Fregistration.gbID.Caption:='Belum Terdaftar';
     Fregistration.EAccCode.Enabled:=true;
     Fregistration.showModal;
     exit;
   end;

   finally
     f.free;
   end;

end;

function Tfrm_Main.GetMacAddress:string;
var
  AProcess:TProcess;
  AStringList:TStringList;
  aw,ak,i:integer;
  mac,serial : string ;
  amac: string;
begin

  // Buat Objek TProcess baru
  AProcess := TProcess.Create(nil);
  // Buat Objek AStringlist baru
  AStringList := TStringList.Create;
  With AProcess do
  begin
      // Menjalankan cmd untuk mendapatkan MacAdres ( Hanya untuk Windows )
      // Untuk Linux kami belum mencoba
      // Kemungkinan output penulisannnya beda
      // Sehingga perlu diubah kode untuk mendapatkan MacAdress
       CommandLine := 'wmic baseboard get serialnumber';
       Options := AProcess.Options + [poWaitOnExit, poUsePipes,poNoConsole];
       Execute;
       sleep(2000);
       // hasil eksekusi ditampilkan pada AStringList;
       AStringList.LoadFromStream(Output);

  end;
  AStringList.Text:=trim(AStringList.Text);

  // Ambil nilai MAcAdress pada Baris ke 3 ASTringList
  amac := trim(AStringList.Strings[2]) ;



  Result := amac;

  Aprocess.Destroy;
  AStringList.Destroy;

end;

function Tfrm_Main.GetTafsir(ida:string):string  ;
begin

  with DTGetTerjemah do
  begin
   sql.Clear;
   sql.Add('select * from v_ShowAyat where id_ayat=' + QuotedStr(ida));
   open;

   if Not IsEmpty then
     Result := FieldByName('tafsir').AsString
   else
     Result := '';
   close;
  end;

end;

function Tfrm_Main.GetJummal(k:string;s:string;d:string):string;
var
  h : string;
begin
  With DTGetData do
  begin
   close;
   sql.Clear;
   sql.Add('select ' + s + ',' + d +' from quran_numeric where id_ayat=' + QuotedStr(ID_AYAT) );
   open;

   h := '<table width=100% border=0 style="border: 1px solid #ddd;padding:15px"><tr>' +
        '<td colspan=2 style="background-color:#E7F1E9;text-align:center;padding:15px;'+
        'font-family:' + FONT_LATIN + ';Font-Size:14px">' + k + '</td></tr><tr>' +
        '<td width=20% style="background-color:#BCEFC9;text-align:center;padding:15px;'+
        'font-family:' + FONT_LATIN + ';Font-Size:18px">' + Fields[0].AsString + '</td>'+
        '<td width=80% style="background-color:#BCEFC9;text-align:center;padding:15px;'+
        'font-family:' + FONT_QR + ';Font-Size:18px">' + Fields[1].AsString + '</td>'+
        '</tr>' +
        '</table><br>';

   Result := h;
  end;
end;

procedure Tfrm_Main.TampilkaAyatByVariasiTerjemahan(k:string);
var
   h : string = '';
   t : string = '';
   ts : TStringList;
begin

  with DTDetilAyat do
  begin
    close;
    SQL.Clear;

    if k='plain' then

      sql.Add('select distinct arab_harokat as `Kata`, Arti,nama_id as `Nama Surat`,id_ayat as `QS`,'+
              'ay as `Ayat` , terjemah , utsmani, ayat_utsmani from ' +
              'v_detil_ayat_kataterkait where arab=' +
             QuotedStr(lbPlain.Caption))
    else if k='kata' then
      sql.Add('select distinct arab_harokat as `Kata`,Arti,nama_id as `Nama Surat`,id_ayat as `QS`,'+
              'ay as `Ayat` , terjemah , utsmani, ayat_utsmani from ' +
              'v_detil_ayat_kataterkait where arab_harokat=' +
              QuotedStr(lbKata.Caption))
    else if k='basic' then
      sql.Add('select distinct arab_harokat as `Kata`,Arti,nama_id as `Nama Surat`,id_ayat as `QS`,'+
              'ay as `Ayat` , terjemah , utsmani, ayat_utsmani from ' +
              'v_detil_ayat_kataterkait where basic=' +
              QuotedStr(lbBasic.Caption));

    open;


    h :='<body style="background-color:#FFFBF6"> ' +
        '<table width=100% border=0>';

    while not eof do
     begin
       t := AnsiReplaceText(FieldByName('ayat_utsmani').AsString,FieldByName('Kata').AsString,
            '<span style="background:#A3F6B8">' + FieldByName('Kata').AsString + '</span>');



       h := h +   '<tr valign="top">' ;
       h := h +   '<td width=50% style="font-family:'+ FONT_LATIN + ';padding:15px;text-align:left">' +
                  FieldByName('terjemah').AsString +
                  '&nbsp;&nbsp; <b>(' + FieldByName('Nama Surat').AsString + '&nbsp;&nbsp;' +
                  FieldByName('QS').AsString + ') </b><br> ' +
                  FieldByName('Kata').AsString + ' Arti => <span style="background:#FFC4AE">' +
                  FieldByName('Arti').AsString + '</span>' +
                  '</td>'  +
                  '<td width=50% dir="rtl" style="font-family:'+ FONT_QR + ';font-size:20px;'+
                  'padding:12px;text-align:right">' +
                  t + '</td></tr>';

       next;
     end;

     h := h + '</table>';

     try
      ts := TStringList.create;
      ts.Text:= h;
      ts.SaveToFile(DIR_APP + 'support/page/variasi.html');
      FRM_VariasiTerjemahKata.Chromium1.LoadURL ( DIR_APP + 'support/page/variasi.html');
     finally
      ts.Free;
     end;



  end;

end;


procedure Tfrm_Main.ShowAyatTerkaitByTema(tema:string);
var
    df_ayat : string;
    h : string = '';
    ts : TStringList;
begin

    DtTema.Locate('tema',tema,[loPartialKey]);
    TEMA_NOW := tema;
    df_ayat:= DTTema.FieldByName('ayat').AsString;
    df_ayat := '''' + AnsiReplaceStr(df_ayat ,', ',''',''');
    df_ayat :=  AnsiReplaceStr(df_ayat ,' ',''',''');

    With DTGetData do
    begin

      close;
      sql.Clear;
      sql.Add('select * from v_ShowdaftarAyat where id_ayat in(' + df_ayat  + ''')');
      open;

    h := '<body style="background:#ECF9F9"><table width=100%>';
    pnl_Tema.Caption:=tema + ' ( ' + IntToStr(RecordCount) + ' Ayat )' ;
    while not eof do
     begin

       h := h +   '<tr valign="top">' ;
       h := h +   '<td width=50% style="font-family:'+ FONT_LATIN + ';padding:15px;text-align:left">' +
                  FieldByName('indoText').AsString +
                  '&nbsp;&nbsp;<b>(' + FieldByName('nama_surat').AsString + '&nbsp;&nbsp;' +
                  FieldByName('nomor_ayat').AsString + ') </b>'+
                  '</td>'  +
                  '<td width=50% dir="rtl" style="font-family:'+ FONT_QR + ';font-size:20px;'+
                  'padding:12px;text-align:right">' +
                  FieldByName('teks_ayat').AsString + '</td></tr>';

       next;
     end;

     h := h + '</table></body>';

     try

      ts := TStringList.create;
      ts.Text:= h;
      ts.SaveToFile(DIR_APP + 'support/page/tema.html');
      FRM_DaftarAyatByTema.Chromium1.LoadURL ( DIR_APP + 'support/page/tema.html');

     finally
      ts.Free;
     end;
    end;

end;

procedure Tfrm_Main.LoadPageShowTema(ida:string);
var

  halaman :string;
  script :string;
  terjemah : string;
  hal : string;
  tema : string;
  urtem : string;
  transliterasi:string;
begin

   halaman :=  DtAyat.FieldByName('usmani').AsString;
   tema    := LoadPageTemaTerkait(ida);
   ShowAyatTerkaitByTema(TEMA_NOW);




   script :=  '<div dir=rtl width="100%" dir="rtl" '+
              'style="padding:10x;font-size:'+
              IntToStr(FONT_S ) +'px;font-family:' + FONT_QR +
              ';color:A2F111;line-height:2.8;cursor:pointer;text-align:right">' +
              halaman  + '</div><br>';

   transliterasi :=  '<div style="color:#E18D4B;font-family:' + FONT_LATIN +
                      ';font-size:14px;text-align:center"><b> ' +
                      DtAyat.FieldByName('transliterasi').AsString + '</b></div><br>';

   terjemah:= '<div style="font-family:' + FONT_LATIN + ';'+
              'font-size:17px;text-align:justify"><b>' +
              DtAyat.FieldByName('indoText').AsString + '</b></div>';

   hal       := '<body style="background:#FAFCF6">';
   hal       := hal +
                '<div style="font-family:' + FONT_LATIN + ';'+
                'font-size:17px;text-align:center"><b>TEMA ( KANDUNGAN AYAT ) </b><hr></div>' +
                '<table width=100% border=0 style="padding:16px">'+
                '<tr>' +
                '<td width=68% style="background-color:none;padding:15px;">' + script +
                transliterasi + terjemah + '</td>'+
                '<td style="background-color:#F2F2E2;padding:15px;" valign="top">' + tema +
                '</td></tr></table>';

   OpenPage(hal  ,'TEMA');

   tbs_UraianTemaByAI.show;

   urtem:= GetItem('select resume from tema where tema=' + QuotedStr(TEMA_NOW));


   urtem:=AnsiReplaceStr(urtem,'*','');
   urtem:=AnsiReplaceStr(urtem,#10,'<br>');
   OpenPageHv(urtem,hvResume,'resumetema.htm' ) ;

end;

procedure Tfrm_Main.OpenDaftarAyatByKataArab(k:UTF8String);
begin
    If Length(k)>3 then
    begin
         KEY_WORD_ARB :=  k ;
         DtAyat.close;
         DtAyat.sql.Clear;
         DTAyat.SQL.Add('select * from v_ShowdaftarAyat where usmani like' +
                        QuotedStr('%' + k + '%') + 'limit 400');
         DtAyat.open;

         If DtAyat.IsEmpty then
          ShowMessage('Tidak Ditemukan Kata ' + k )
         else
         begin
          tbs_showDaftarAyat.show;
          lb_JumlahData.Caption:= 'Terdapat ' + Inttostr(DtAyat.RecordCount) + ' Ayat ';
          lb_Tema.Caption:='Mengandung Terjemah Kata "' + k + '"';

         end;
    end;
    pnDetilKata.height :=0;

end;

procedure Tfrm_Main.ShowAllBySurat(n:string);
var
  h : WideString = '';
  ns : string = '';
  s  : TStringList;
begin

  with DTShowAllSurat do
  begin
      close;
      ParamByName('v_nosurat').AsString := n ;
      open;

      while not eof do
       begin
        ns := ToArabicNumber( FieldByName('nomor_ayat').AsInteger);
        h :=  h + '<a style="color:black;text-decoration: none;" href="#IDAYA' +
              FieldByName('id_ayat').AsString + '">' +
              FieldByName('teks_ayat').AsUTF8String + ' {'  +
             ns + '} </a>&nbsp;';
        next;
       end;
      close;
      h :=    '<body style="background-color:#F9F3E5">' +
              '<br><br><table width=90% dir="rtl" align=center '+
              'style="border: 1px solid #ddd;background-color:#F3F3E5;padding:10x;font-size:'+
              IntToStr(FONT_S ) +'px;font-family:' + FONT_QR +
              ';color:A2F111;line-height:2.4;cursor:pointer;text-align:justify">' +
              '<tr><td style="padding:20px">' + h  + '</td></tr></table>'+
              '</table>';

  end;

  try
       s := TStringList.Create;
       s.Text:= h;

       s.LoadFromFile(DIR_APP + '/support/page/ayat.html');

       s.Text:= AnsiReplaceStr(s.Text,'$_DOCUMENT',h);
       s.SaveToFile(DIR_APP + '/support/page/nash.html');

       //FRM_DaftarAyat.respon:=respon;
       FRM_DaftarAyat.Chromium1.LoadURL(DIR_APP + '/support/page/nash.html');

  finally
   s.Free;
  end;
end;


function Tfrm_Main.ToArabicNumber(num: Integer): String;
const
  ArabicDigits: array[0..9] of WideChar = (WideChar(#$0660), WideChar(#$0661), WideChar(#$0662),
  WideChar(#$0663), WideChar(#$0664), WideChar(#$0665), WideChar(#$0666), WideChar(#$0667),
  WideChar(#$0668), WideChar(#$0669));
var
  numStr, arabicStr: String;
  i: Integer;
begin
  numStr := IntToStr(num);
  arabicStr := '';

  for i := 1 to Length(numStr) do
  begin
    if (numStr[i] >= '0') and (numStr[i] <= '9') then
      arabicStr := arabicStr + String(ArabicDigits[Ord(numStr[i]) - Ord('0')])
    else
      arabicStr := arabicStr + numStr[i];
  end;


  Result := arabicStr;
end;

procedure Tfrm_Main.ShowAllTerjemahBySurat(n:string);
var
  h : string = '';
  ns : string = '';
  s : TStringList;
begin


  with DTShowAllSurat do
  begin
      close;
      ParamByName('v_nosurat').AsString := n ;
      open;

      while not eof do
       begin
        ns :=  FieldByName('nomor_ayat').AsString;

        h := h + '<a style="color:black;text-decoration: none;" href="#IDAYA' +
             FieldByName('id_ayat').AsString + '">' +
             FieldByName('terjemah').AsUTF8String + ' {'  +
             ns + '} </a>&nbsp;<br><br>';
        next;
       end;
      close;
      h :=    '<body style="background-color:#F9F3E5">' +
              '<br><br><table width=90% dir="ltr" align=center '+
              'style="border: 1px solid #ddd;background-color:#F3F3E5;padding:10x;font-size:' +
              '14px;'+
              'font-family:' + FONT_LATIN +
              ';color:A2F111;line-height:1.5;cursor:pointer;text-align:justify">' +
              '<tr><td style="padding:20px">' + h  + '</td></tr></table>'+
              '</table>';

  end;


  try
       s := TStringList.Create;
       s.Text:= h;

       s.LoadFromFile(DIR_APP + '/support/page/ayat.html');

       s.Text:= AnsiReplaceStr(s.Text,'$_DOCUMENT',h);
       s.SaveToFile(DIR_APP + '/support/page/terjemah.html');

       //FRM_DaftarAyat.respon:=respon;
       FRM_DaftarAyat.Chromium1.LoadURL(DIR_APP + '/support/page/terjemah.html');

  finally
   s.Free;
  end;



end;

procedure Tfrm_Main.ShowEkstrakAyat(ida:string);
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
  transliterasi:string;
begin

  ayat_irab  := DTAyat.FieldByName('usmani').AsString;
  //ayat_non_irab := DTAyatJummal.FieldByName('spoken_aya_text').AsString;
  terjemahan := '<div style="font-family:HvDTrial Pluto Sans Regular;text-align:center;font-size:15px">' +
                SetTerjemahByID(DTAyat.Fields[4].AsString) +
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

  transliterasi :=  '<div style="color:#E18D4B;font-family:' + FONT_LATIN +
                     ';font-size:14px;text-align:center"><b> ' +
                     DtAyat.FieldByName('transliterasi').AsString + '</b></div><br>';

  page :='<body style="background-color:#FBFBF6"> ' +
         '<div style="font-family:' + FONT_LATIN + ';font-size:17px;text-align:center">'+
         '<b>SUSUNAN KALIMAT</b> </div><br>'+
         '<table width=95% height=100% border=0 align="center" ' +
         'style="border: 1px solid #ddd;background-color:#F3F3E5" ><tr><td>' +
         ayat_irab +
         transliterasi +
         ayat_non_irab +
         terjemahan +
         gbr  +
         kata_irab +
         kata_plain +
         gbr +
         SetInfoHijaiyah(huruf_plain)  +
         '</td><tr></table></body>';

   OpenPage(page,'EKSTRAK');

end;

function Tfrm_Main.JabarkanKata(ida:string):string;
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

    page := page + '<a style="text-decoration:none" href="#SUSUNAN_' + Fields[1].AsString + '">' +
                   '<div dir="ltr" class="btn btn-primary tooltip">' +
                   Fields[1].AsString +
                   '<span class="bottom">' + Fields[2].AsString+  '<br><br>' + Fields[3].AsString +
                   '</span></div> '+
                   '</a>&nbsp;&nbsp; - &nbsp;&nbsp;' ;


     next;
    end;
   end;


  Result := page ;

  DTGet.close;
end;


function Tfrm_Main.JabarkanHuruf(ida:string):string;
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

    page := page + '<a style="text-decoration:none" href="#SUSUNAN' + Fields[1].AsString + '">' +
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

function Tfrm_Main.JabarkanHurufPlain(ida:string):string;
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

function Tfrm_Main.SetTerjemahByID(id:string):string;
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

function Tfrm_Main.SetInfoHijaiyah(k:String):string;
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
        info := 'Huruf : ' + Fields[0].AsUTF8String + '<br>' +
                'Nama : ' + Fields[1].AsString + '<br>' +
                'Jummal : ' + Fields[2].AsString + '<br>' +
                'Jenis : ' + Fields[3].AsString + '<br>' +
                'Elemen : ' +   Fields[5].AsString + '<br>' +
                'Arti : ' + Fields[4].AsString ;

        info := '<a style="color:#170202;text-decoration: none"  href=#"' +
                Fields[0].AsString  + '">' +
                '<div dir="ltr" class="btn btn-primary tooltip">' +
                SetWarnaHurufByJenis(Fields[0].AsUTF8String) +
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

procedure Tfrm_Main.LoadPageAyatLanguage(ida:string);
var

  ayat : string;
  terjemah_id : string;
  terjemah_utf8 : string;
  terjemah_latin : string;
  script,hal : string;
  transliterasi:string;
begin

   script    := '';

   if KEY_WORD_ARB <> '' then
   begin
      ayat   :=  DtAyat.FieldByName('usmani').AsString;
      ayat   := TandaKeyPadaAyat(ayat, KEY_WORD_ARB);
   end
   else
      ayat   :=  DtAyat.FieldByName('teks_ayat').AsString;


   script  :=  '<div dir="rtl" align="right" style="font-size:'+
                  IntToStr(FONT_S) +'px;padding:10px;font-family:' + FONT_QR +
                  ';line-height:2.2">' + ayat + '</div><br><br>';

   terjemah_id    := DtAyat.FieldByName('indoText').AsString ;
   terjemah_id    := '<div style="font-family:' + FONT_LATIN + ';font-size:17px">' +
                   terjemah_id + '</div>';

   terjemah_utf8  := LoadPageTerjemahLang(true,ida);
   terjemah_latin := LoadPageTerjemahLang(false,ida);
   terjemah_latin := '<table width=100% style="background-color:#F7F4EB;padding:14px;'+
                     'border: 1px solid #ddd;">'+
                     '<tr><td style="font-family:' + FONT_LATIN + ';font-size:9px">' +
                     terjemah_latin + '</tr><td></table>';

   transliterasi :=  '<div style="color:#E18D4B;font-family:' + FONT_LATIN +
                     ';font-size:14px;text-align:center"><b> ' +
                     DtAyat.FieldByName('transliterasi').AsString + '</b></div><br>';

   hal       :=  '<body style="background-color:#FEFEF4">';
   hal       :=  hal + '<div style="font-family:' + FONT_LATIN + ';font-size:17px;text-align:center">'+
                 '<b>TERJEMAH MULTI BAHASA</b> <hr></div><br>' ;

   hal       :=  hal + '<table width=100% border=0><tr><td width="49%" valign="top">' +
                 script + transliterasi + terjemah_id + '<br><br>'  +
                 terjemah_latin +
                 '</td><td width=2%></td><td width="49%" valign=top>'+
                 '<table width=100% style="background-color:#FAFFF0;padding:5px;'+
                 'border: 1px solid #ddd;">'+
                 '<tr><td style="padding:14px">' +
                 terjemah_utf8 + '</tr><td></table> </td></tr></table>';

   hal := hal ;
   OpenPage(hal,'');


end;
function Tfrm_Main.LoadPageTerjemahLang(utf:boolean;ida:string):string;
var
  teks : string;
  has : string='';
begin

 if utf = True then
 begin
  teks := GetItem('select ibrani from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:30px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa Ibrani:</p>' + teks + '</div><hr>';
  teks := GetItem('select chinese from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:25px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa China:</p>' + teks + '</div><hr>';
  teks := GetItem('select korea from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:25px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa Korea:</p>' + teks + '</div><hr>';
  teks := GetItem('select thai from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:25px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa Thailand:</p>' + teks + '</div><hr>';
  teks := GetItem('select hindi from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:25px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa Hindi:</p>' + teks + '</div><hr>';
  teks := GetItem('select gujarat from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:25px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa Gujarat:</p>' + teks + '</div><hr>';
  teks := GetItem('select jepang from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:25px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa Jepang:</p>' + teks + '</div><hr>';
  teks := GetItem('select cannada from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:25px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa Cannada:</p>' + teks + '</div><hr>';
  result := has;

 end
 else
 begin
  teks := GetItem('select english from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:23px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa Inggris:</p>' + teks + '</div><hr>';
  teks := GetItem('select france from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:23px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa Perancis:</p>' + teks + '</div><hr>';
  teks := GetItem('select German from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:23px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa Jerman:</p>' + teks + '</div><hr>';
  teks := GetItem('select Russia from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:23px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa Rusia:</p>' + teks + '</div><hr>';
  teks := GetItem('select dutch from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:23px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa Belanda:</p>' + teks + '</div><hr>';
  teks := GetItem('select Swedish from v_lang_1 where id_ayat= '+ QuotedStr(ida));
  has := has + '<div style="font-family:Bahnschrift;font-size:23px">'+
         '<p style="font-family:Bahnschrift;font-size:15px">Bahasa Swedia:</p>' + teks + '</div><hr>';
  result := has;

end;


end;

function Tfrm_Main.GetFakataHuruf(h:string;ida:string):string;
var
  ja : string;
  js : string;
  jt : string;
  s , a : string;
  p : integer;
begin

   p := AnsiPos(':',ida);
   s := trim(AnsimidStr(ida,1,p-1));
   a := trim(AnsimidStr(ida,p+1,6));

   js := GetItem(' SELECT COUNT(huruf) AS j FROM quran_hafs_huruf ' +
                 ' WHERE huruf=' + QuotedStr(h) + ' and ids=' + s +
                 ' GROUP BY ids');

   ja := GetItem(' SELECT COUNT(huruf) AS j FROM quran_hafs_huruf ' +
                 ' WHERE huruf=' + QuotedStr(h) + ' and ida=' + quotedstr(ida) +
                 ' GROUP BY ida');

   jt := GetItem(' SELECT COUNT(huruf) AS j FROM quran_hafs_huruf  WHERE huruf=' + QuotedStr(h) );
   Result := '<center><br>FAKTA HURUF ' + h +
             '<br><br><hr><b>Total Dalam A-Quran</b><br>' +
             jt +   '<br>' +
             '<b>Total Dalam Surat</b><br>' +
             js +   '<br>' +
             '<b>Total Dalam Ayat</b><br>' +
             ja +'</center>';

end;

function Tfrm_Main.SetWarnaHurufByJenis(h:string):string;
var
  k,e : string;
  wk : string;
  we : string;
begin

   k := GetItem('select qs from ref_jummal where huruf=' + QuotedStr(h));

    if k='Syamsiyah' then
      wk := '<span style="background:#F0FFCA">'
   else if k='Qomariyah' then
      wk := '<span style="background:#FFE4CA">'
   else
     wk := '';

   e := GetItem('select elemen from ref_jummal where huruf=' + QuotedStr(h));
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


   Result :=   wk + we  ;

end;

procedure Tfrm_Main.ShowTranslateTafsir(ida:string;nom:integer);
begin

 With DTTafsirWeb do
   begin
     close;
     ParamByName('v_nom').AsInteger:= nom;
     ParamByName('v_ida').AsString:= ida;
     open;
end;

  FRM_Translate_Tafsir.show;
end;

procedure Tfrm_Main.ShowVideoTutorial(k:string);
var
  html : string;
  s : TStringList;
begin



  html :=  '<div><iframe width="100%" height="100%" src="https://www.youtube.com/embed/'+ k + '" '+
           'frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media;'+
           'gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin"'+
           'allowfullscreen></iframe></div> ';


  try
       s := TStringList.Create;
       s.Text:= html;


       s.SaveToFile(DIR_APP + '/support/page/video.html');
       OpenDocument(DIR_APP + '/support/page/video.html');


  finally
   s.Free;
  end;


end;

procedure Tfrm_Main.LoadStatistikKata(ida:string);
var
  nomor_surat: string;
  posn : integer;
  sq : string;
begin

  posn := AnsiPos(':',ida);
  nomor_surat:= AnsiMidStr(ida,1,posn-1);


   sq := ' SELECT d.id, d.kata,d.j as ja ,s.j as js,t.j as jt from '+
         ' (SELECT k.id , k.kata,COUNT(k.kata) AS j FROM quran_hafs_kata k  '+
         ' WHERE k.ida=' + QuotedStr(ida)  +
         ' GROUP BY k.kata   '+
         ' ) AS d   '+
         ' INNER JOIN    '+
         ' (SELECT k.kata,COUNT(k.kata) AS j FROM quran_hafs_kata k   '+
         ' WHERE k.ids =' + nomor_surat +
         ' GROUP BY k.kata   '+
         ' ) AS s   '+
         ' ON d.kata=s.kata   '+
         ' INNER JOIN   '+
         ' (SELECT k.kata,COUNT(k.kata) AS j FROM quran_hafs_kata k  '+
         ' GROUP BY k.kata   '+
         ' ) AS t      '+
         ' ON    '+
         ' d.kata=t.kata   '+
         ' ORDER BY  id';

  With DTStatistikKataByAyat do
    begin
     close;
     sql.Clear;
     sql.Add(sq);
     open;
    end;

  tbs_SusunaKata.show;
end;

procedure Tfrm_Main.LoadQuoteQuran(ida:string);
var

  c_isi: string;
  c_footer : string;

begin

  c_isi := GetItem('select indotext from quran_id where id_ayat=' + QuotedStr(ida) );
  c_footer := GetItem('select ket from v_quote_footer where id_ayat=' + QuotedStr(ida) );

  FRM_QuoteMaker.edIsi.Text:= c_isi ;
  FRM_QuoteMaker.edFooter.Text:= c_footer;



end;

procedure Tfrm_Main.CreatePagByIDAyat(ida:string);
var
  pg : string;
begin







end;

function Tfrm_Main.GetdataBySQL(s:string):string;
begin

 With DTGetData do
  begin
   close;
   sql.Clear;
   sql.Add(s);
   open;
   result := fields[0].AsString;
  end;

end;

end.

