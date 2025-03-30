unit ui_tafsir;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, FileCtrl, DB,uSimpleBrowser, StdCtrls,
  DBCtrls, Buttons, ComCtrls, ExtCtrls, kdialogs, RxDBGrid, ZDataset, DBGrids;

type

  { Tfrm_ManageTafsir }

  Tfrm_ManageTafsir = class(TForm)
    cbKitabTafsir: TComboBox;
    DSShowTafsir: TDataSource;
    dbImgView: TDBImage;
    DSShowImage: TDataSource;
    DSPageTafsir: TDataSource;
    DTShowImage: TZQuery;
    DTTafsirDoc: TZQuery;
    DTShowTafsir: TZQuery;
    edtGo: TEdit;
    edt_jilid: TEdit;
    GrdPageTafsir: TRxDBGrid;
    imgView: TImage;
    Label1: TLabel;
    Label3: TLabel;
    LsFile: TFileListBox;
    OFD: TKBrowseFolderDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DTPageTafsir: TZQuery;
    procedure edtGoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrdPageTafsirDblClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure LsFileClick(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private

  public
    KITAB : string;
    ID_AYAT : string;

  end;

var
  frm_ManageTafsir: Tfrm_ManageTafsir;

implementation

uses ui_main;

{$R *.lfm}

{ Tfrm_ManageTafsir }

procedure Tfrm_ManageTafsir.SpeedButton2Click(Sender: TObject);
begin
  if OFD.Execute then
  begin
    LsFile.Directory:=OFD.Folder;
    DTTafsirDoc.close;
    DTTafsirDoc.open;
  end;
end;

procedure Tfrm_ManageTafsir.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ManageTafsir.SpeedButton1Click(Sender: TObject);
var
  i : integer;
begin
  if edt_jilid.Text='' then
   begin
   exit  ;
   ShowMessage('Masukan Nomor Jilid');
   end;

  For i  := 0 to LsFile.Items.Count -1  do
  begin
    Application.ProcessMessages;
    DTTafsirDoc.Append;
    DTTafsirDoc.FieldByName('halaman').AsString:= edt_jilid.text + '_' + LsFile.Items.Strings[i];
    DTTafsirDoc.FieldByName('nopage').AsString := inttostr(i+1);
    TBlobField(DTTafsirDoc.FieldByName ('doc')).LoadFromFile(LsFile.Directory + '\' + LsFile.Items.Strings[i]);
    DTTafsirDoc.post;
  end;
end;

procedure Tfrm_ManageTafsir.FormShow(Sender: TObject);
begin

  {
  DTTafsirDoc.close;
  DTTafsirDoc.SQL.Clear;
  DTTafsirDoc.sql.Add('select * from ' + KITAB + ' limit 1');
  DTTafsirDoc.open;
  }
  edt_jilid.Clear;

  DTShowTafsir.close;
  DTShowTafsir.open;

  DTPageTafsir.Close;
  DTPageTafsir.open;
  DTPageTafsir.edit;

end;

procedure Tfrm_ManageTafsir.edtGoChange(Sender: TObject);
begin
  if edtGo.Text <> ''  then
   begin
   DTShowTafsir.Locate('idx',edtGo.Text,[loPartialKey]);
   end;
end;

procedure Tfrm_ManageTafsir.GrdPageTafsirDblClick(Sender: TObject);
begin
  DTPageTafsir.edit;
  DTPageTafsir.post;
end;

procedure Tfrm_ManageTafsir.Label2Click(Sender: TObject);
begin

end;

procedure Tfrm_ManageTafsir.LsFileClick(Sender: TObject);
begin
  try
  imgView.Picture.LoadFromFile(LsFile.FileName);
  except
  on e:exception do
   exit;
  end;

end;

procedure Tfrm_ManageTafsir.RxDBGrid1CellClick(Column: TColumn);
begin
  With DTShowImage do
       begin
         close;
         ParamByName('v_idx').AsString:= DTShowTafsir.FieldByName('idx').AsString;
         open;
       end;
end;

end.

