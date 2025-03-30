unit ui_quotemaker;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  LCLIntf,
  DB,
  ExtCtrls,
  DBCtrls,
  Buttons,
  StdCtrls,
  ExtDlgs,
  Menus,
  ZDataset,
  RxDBGrid,
  FileUtil,
  TplLabelUnit,
  Math;

type

  { TfrmQuoteMaker }

  TfrmQuoteMaker = class(TForm)
    ColorDlg: TColorDialog;
    DSPic: TDataSource;
    DBImage1: TDBImage;
    EdHeader: TEdit;
    edFooter: TEdit;
    DlgFont: TFontDialog;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    lbFooter: TLabel;
    lbIsi: TLabel;
    edIsi: TMemo;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    mnSavPic: TMenuItem;
    OPic: TOpenPictureDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    lbHeader: TplLabel;
    pnIsi: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    GRDPic: TRxDBGrid;
    spbAdd: TSpeedButton;
    spbFooterLeft: TSpeedButton;
    spbFooterMid: TSpeedButton;
    spbHeaderDown: TSpeedButton;
    spbIsiDown: TSpeedButton;
    spbFooterDown: TSpeedButton;
    spbHeaderUp: TSpeedButton;
    spbIsiUp: TSpeedButton;
    spbFooterUp: TSpeedButton;
    spbIsiRight: TSpeedButton;
    spbDel: TSpeedButton;
    spbFooterRight: TSpeedButton;
    spbHeaderRight: TSpeedButton;
    spbWidth: TSpeedButton;
    spbHeight: TSpeedButton;
    spnSetFontHeader: TSpeedButton;
    spbHeaderMid: TSpeedButton;
    spbHeaderLeft: TSpeedButton;
    spSetCF_Titel: TSpeedButton;
    spSetCF_Footer: TSpeedButton;
    spSetCF_Main: TSpeedButton;
    spnSetFontIsi: TSpeedButton;
    spbIsiLeft: TSpeedButton;
    spbIsiMid: TSpeedButton;
    spnSetFontFooter: TSpeedButton;
    DTPic: TZTable;
    procedure edFooterChange(Sender: TObject);
    procedure EdHeaderChange(Sender: TObject);
    procedure edIsiChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbFooterClick(Sender: TObject);
    procedure lbFooterMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbFooterMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbFooterMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbHeaderClick(Sender: TObject);
    procedure lbHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbHeaderMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbHeaderMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbIsiClick(Sender: TObject);
    procedure lbIsiMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbIsiMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure lbIsiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnSavPicClick(Sender: TObject);
    procedure spbAddClick(Sender: TObject);
    procedure spbDelClick(Sender: TObject);
    procedure spbFooterDownClick(Sender: TObject);
    procedure spbFooterLeftClick(Sender: TObject);
    procedure spbFooterMidClick(Sender: TObject);
    procedure spbFooterRightClick(Sender: TObject);
    procedure spbFooterUpClick(Sender: TObject);
    procedure spbHeaderDownClick(Sender: TObject);
    procedure spbHeaderLeftClick(Sender: TObject);
    procedure spbHeaderMidClick(Sender: TObject);
    procedure spbHeaderRightClick(Sender: TObject);
    procedure spbHeaderUpClick(Sender: TObject);
    procedure spbHeightClick(Sender: TObject);
    procedure spbIsiDownClick(Sender: TObject);
    procedure spbIsiLeftClick(Sender: TObject);
    procedure spbIsiMidClick(Sender: TObject);
    procedure spbIsiRightClick(Sender: TObject);
    procedure spbIsiUpClick(Sender: TObject);
    procedure spbIsiUpDblClick(Sender: TObject);
    procedure spbWidthClick(Sender: TObject);
    procedure spnMOveRightClick(Sender: TObject);
    procedure spnSetFontFooterClick(Sender: TObject);
    procedure spnSetFontHeaderClick(Sender: TObject);
    procedure spnSetFontIsiClick(Sender: TObject);
    procedure spSetCF_FooterClick(Sender: TObject);
    procedure spSetCF_MainClick(Sender: TObject);
    procedure spSetCF_TitelClick(Sender: TObject);
  private
      StartDragX, StartDragY: Integer;
      IsDraging : boolean ;
  public

  end;

var
  frmQuoteMaker: TfrmQuoteMaker;

implementation

uses ui_main;

{$R *.lfm}

{ TfrmQuoteMaker }

procedure TfrmQuoteMaker.EdHeaderChange(Sender: TObject);
begin
  lbHeader.Caption:= EdHeader.text;
end;

procedure TfrmQuoteMaker.edFooterChange(Sender: TObject);
begin
  lbFooter.Caption:= edFooter.text;
end;

procedure TfrmQuoteMaker.edIsiChange(Sender: TObject);
begin
  lbIsi.Caption:= edIsi.text;
end;

procedure TfrmQuoteMaker.FormShow(Sender: TObject);
begin
  DTPic.Open;
  lbHeader.Caption:= EdHeader.text;
  lbFooter.Caption:= edFooter.text;
  IsDraging:=false;
end;

procedure TfrmQuoteMaker.lbFooterClick(Sender: TObject);
begin
   ShowMessage(lbFooter.Font.Name);
end;

procedure TfrmQuoteMaker.lbFooterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if Button = mbLeft then
    begin
      StartDragX := X;
      StartDragY := Y;
      IsDraging:=true;
    end;
end;

procedure TfrmQuoteMaker.lbFooterMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    if IsDraging = True then
    begin
      lbFooter.Left := lbFooter.Left + (X - StartDragX);
      lbFooter.Top := lbFooter.Top + (Y - StartDragY);
   end;
end;

procedure TfrmQuoteMaker.lbFooterMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   StartDragX := 0;
   StartDragY := 0;
   IsDraging:=false;
end;

procedure TfrmQuoteMaker.lbHeaderClick(Sender: TObject);
begin
    ShowMessage(lbHeader.Font.Name);
end;

procedure TfrmQuoteMaker.lbHeaderMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    begin
      StartDragX := X;
      StartDragY := Y;
      IsDraging:=true;
    end;
end;

procedure TfrmQuoteMaker.lbHeaderMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   if IsDraging = True then
    begin
      lbHeader.Left := lbHeader.Left + (X - StartDragX);
      lbHeader.Top := lbHeader.Top + (Y - StartDragY);
   end;
end;

procedure TfrmQuoteMaker.lbHeaderMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   StartDragX := 0;
   StartDragY := 0;
   IsDraging:=false;
end;

procedure TfrmQuoteMaker.lbIsiClick(Sender: TObject);
begin
  ShowMessage(lbIsi.Font.Name);
end;

procedure TfrmQuoteMaker.lbIsiMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if Button = mbLeft then
    begin
      StartDragX := X;
      StartDragY := Y;
      IsDraging:=true;
    end;
end;

procedure TfrmQuoteMaker.lbIsiMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if IsDraging = True then
    begin
      lbIsi.Left := lbIsi.Left + (X - StartDragX);
      lbIsi.Top := lbIsi.Top + (Y - StartDragY);
   end;
end;

procedure TfrmQuoteMaker.lbIsiMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    StartDragX := 0;
   StartDragY := 0;
   IsDraging:=false;
end;

procedure TfrmQuoteMaker.mnSavPicClick(Sender: TObject);
  var
    R: TRect;
    Bitmap: TBitmap;
    f : integer;
    s : string;
    d,w,n:string;
    appdir : string;
    fileimage : string;
  begin

    Randomize;
    appdir := ExtractFilePath(Application.ExeName);
    f := RandomRange(11111111,99999999);

    Bitmap := TBitmap.Create;
    try
      R := Rect(0, 0, pnIsi.Width, pnIsi.Height);
      Bitmap.SetSize(pnIsi.Width,pnIsi.Height);
      Bitmap.Canvas.CopyRect(R, pnIsi.Canvas, R);
      Bitmap.SaveToFile(appdir + '/support/pictures/' +  inttostr(f) + '.bmp' );
      fileimage:= appdir + '/support/pictures/' +   inttostr(f) + '.bmp' ;
      OpenDocument(fileimage);
    finally
      Bitmap.Free;
    end ;



end;

procedure TfrmQuoteMaker.spbAddClick(Sender: TObject);
begin

  if OPic.Execute then
  begin
       DTPic.Append;
       DTPic.FieldByName('nama').AsString:= ExtractFileName(Opic.FileName);
       TBlobField(DTPic.FieldByName('gambar')).LoadFromFile(OPic.FileName);
       DTPic.Post;
  end;
end;

procedure TfrmQuoteMaker.spbDelClick(Sender: TObject);
begin
  if Dialogs.MessageDlg('Hapus Gambar ini ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin

         DTPic.Delete;

    end;
end;

procedure TfrmQuoteMaker.spbFooterDownClick(Sender: TObject);
begin
  lbFooter.Top:=lbFooter.top + 4;
end;

procedure TfrmQuoteMaker.spbFooterLeftClick(Sender: TObject);
begin
  lbFooter.Alignment:= taLeftJustify ;
end;

procedure TfrmQuoteMaker.spbFooterMidClick(Sender: TObject);
begin
  lbFooter.Alignment:= taCenter ;
end;

procedure TfrmQuoteMaker.spbFooterRightClick(Sender: TObject);
begin
  lbFooter.Alignment:= taRightJustify ;
end;

procedure TfrmQuoteMaker.spbFooterUpClick(Sender: TObject);
begin
    lbFooter.Top:=lbFooter.top- 4;
end;

procedure TfrmQuoteMaker.spbHeaderDownClick(Sender: TObject);
begin
  lbHeader.Top:= lbHeader.Top + 4 ;
end;

procedure TfrmQuoteMaker.spbHeaderLeftClick(Sender: TObject);
begin
  lbHeader.Alignment:= taLeftJustify ;
end;

procedure TfrmQuoteMaker.spbHeaderMidClick(Sender: TObject);
begin
  lbHeader.Alignment:= taCenter ;
end;

procedure TfrmQuoteMaker.spbHeaderRightClick(Sender: TObject);
begin
  lbHeader.Alignment:= taRightJustify;
end;

procedure TfrmQuoteMaker.spbHeaderUpClick(Sender: TObject);
begin
  lbHeader.Top:= lbHeader.Top - 4 ;
end;

procedure TfrmQuoteMaker.spbHeightClick(Sender: TObject);
begin
   lbIsi.Height:= lbIsi.Height -3;
end;

procedure TfrmQuoteMaker.spbIsiDownClick(Sender: TObject);
begin
  lbIsi.Top:= lbIsi.Top + 4 ;
end;

procedure TfrmQuoteMaker.spbIsiLeftClick(Sender: TObject);
begin
  lbIsi.Alignment:= taLeftJustify ;
end;

procedure TfrmQuoteMaker.spbIsiMidClick(Sender: TObject);
begin
  lbIsi.Alignment:= taCenter ;
end;

procedure TfrmQuoteMaker.spbIsiRightClick(Sender: TObject);
begin
  lbIsi.Alignment:= taRightJustify ;
end;

procedure TfrmQuoteMaker.spbIsiUpClick(Sender: TObject);
begin
  lbIsi.Top:= lbIsi.Top - 4 ;
end;

procedure TfrmQuoteMaker.spbIsiUpDblClick(Sender: TObject);
begin

end;

procedure TfrmQuoteMaker.spbWidthClick(Sender: TObject);
begin
  lbIsi.Width:= lbIsi.Width -3;
end;

procedure TfrmQuoteMaker.spnMOveRightClick(Sender: TObject);
begin

end;

procedure TfrmQuoteMaker.spnSetFontFooterClick(Sender: TObject);
begin

   DlgFont.Font.Name:=lbFooter.Font.Name;

   if DlgFont.Execute then
   begin
     lbFooter.Font.Name:= DlgFont.Font.Name;
     lbFooter.Font.Size:=DlgFont.Font.Size;
     lbFooter.Font.Color:=DlgFont.Font.Color;
     lbFooter.Font.Style:=DlgFont.Font.Style;
   end;
end;

procedure TfrmQuoteMaker.spnSetFontHeaderClick(Sender: TObject);
begin

  DlgFont.Font.Name:=lbHeader.Font.Name;

  if DlgFont.Execute then
   begin
     lbHeader.Font.Name:= DlgFont.Font.Name;
     lbHeader.Font.Size:=DlgFont.Font.Size;
     lbHeader.Font.Color:=DlgFont.Font.Color;
     lbHeader.Font.Style:=DlgFont.Font.Style;
   end;
end;

procedure TfrmQuoteMaker.spnSetFontIsiClick(Sender: TObject);
begin

     DlgFont.Font.Name:=lbIsi.Font.Name;

   if DlgFont.Execute then
   begin
     lbIsi.Font.Name:= DlgFont.Font.Name;
     lbIsi.Font.Size:=DlgFont.Font.Size;
     lbIsi.Font.Color:=DlgFont.Font.Color;
     lbIsi.Font.Style:=DlgFont.Font.Style;
   end;

end;

procedure TfrmQuoteMaker.spSetCF_FooterClick(Sender: TObject);
begin
    if ColorDlg.Execute then
    lbFooter.Font.Color:=ColorDlg.Color;
end;

procedure TfrmQuoteMaker.spSetCF_MainClick(Sender: TObject);
begin
    if ColorDlg.Execute then
    lbIsi.Font.Color:=ColorDlg.Color;
end;

procedure TfrmQuoteMaker.spSetCF_TitelClick(Sender: TObject);
begin
  if ColorDlg.Execute then
    lbHeader.Font.Color:=ColorDlg.Color;
end;

end.

