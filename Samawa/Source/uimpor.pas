unit uImpor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, ActnList, Menus, StdActns, Buttons, StdCtrls, EditBtn, LCLIntf,
  ATGauge, fpstypes, fpspreadsheet, fpspreadsheetctrls, fpspreadsheetgrid,
  fpsActions, fpsallformats, JvSpecialProgress, DTAnalogGauge,
  TplProgressBarUnit, TplGradGaugeUnit, DateUtils;

type

  { TFImpor }

  TFImpor = class(TForm)
    ActionList1: TActionList;
    gProgress: TATGauge;
    btStartImpor: TButton;
    Button1: TButton;
    ckUseSeksi: TCheckBox;
    ckUseData: TCheckBox;
    ENamaPetugas: TComboBox;
    DateTugas: TDateEdit;
    ENamaTugas: TEdit;
    FileExit1: TFileExit;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbFile: TLabel;
    lbProgress: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    spSave: TSpeedButton;
    spSave1: TSpeedButton;
    spSample: TSpeedButton;
    spReload: TSpeedButton;
    sWorkbookSource1: TsWorkbookSource;
    sWorkbookTabControl1: TsWorkbookTabControl;
    MySheet: TsWorksheetGrid;
    sFontStyleAction1: TsFontStyleAction;
    sFontStyleAction2: TsFontStyleAction;
    sFontStyleAction3: TsFontStyleAction;

    procedure btStartImporClick(Sender: TObject);
    procedure ckUseDataChange(Sender: TObject);
    procedure ckUseSeksiClick(Sender: TObject);
    procedure FileOpen1Accept(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spReloadClick(Sender: TObject);
    procedure spSampleClick(Sender: TObject);
    procedure spSaveClick(Sender: TObject);
  private

  protected

  public

  end;

var
  FImpor: TFImpor;


implementation

{$R *.lfm}

uses
  umain,
  fpsUtils, fpsCSV;


// Membuka sebuah File Spreadsheet
procedure TFImpor.FileOpen1Accept(Sender: TObject);
var
  wb: TsWorkbook;
  sh: TsWorksheet;
  i: Integer;
begin
  wb := TsWorkbook.Create;
  case FileOpen1.Dialog.FilterIndex of
    1: wb.ReadfromFile(FileOpen1.Dialog.FileName);  // all spreadsheet files --> autodetect
    2: wb.ReadFromFile(FileOpen1.Dialog.FileName);  // all Excel files --> autodetect
    3: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfOOXML);   // Exel 2007+
    4: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfExcel8);  // Excel 97-2003
    5: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfExcel5);  // Excel 5.0
    6: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfExcel2);  // Excel 2.1
    7: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfopendocument);  // LibreOffice
    8: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfCSV);     // Text files
  else
    wb.Free;
    MessageDlg('File format not implemented.', mtError, [mbOk], 0);
    exit;
  end;
  sWorkbookSource1.LoadFromWorkbook(wb);
end;

// Memulai Impor Data
procedure TFImpor.btStartImporClick(Sender: TObject);
var
  sheet: TsWorksheet;
  i,j,x,m : integer;
  tg,ju:string;
  id: string;

begin
  sheet := MySheet.Worksheet;
  MySheet.SetFocus;
  btStartImpor.Enabled:=false;
  j := sheet.GetCellCount;
  m := j-63;
  id := UpperCase(RandomString(9));


  tg :=  Inttostr(YearOf(DateTugas.Date)) + '-' + Inttostr(MonthOf(DateTugas.Date)) +
       '-' + Inttostr(DayOf(DateTugas.Date));

  ju := ENamaTugas.text;
  FMain.ZKoneksi.ExecuteDirect('delete from data');
  Fmain.DataSend2.close;
  Fmain.DataSend2.open ;

  For x:= 1 to J do
      begin
      Application.ProcessMessages;
      lbProgress.Caption:=inttostr(x);

      gProgress.Progress:= round(x/m*1000);

        if sheet.ReadAsText(x,1)='' then
        begin
         Fmain.openDataSend2('select * from data');
         lbProgress.Caption:='IMPOR DATA SUKSES';
         exit;
        end;
;
         Fmain.DataSend2.insert;

         if ckUseData.Checked = true then
         begin

             For i := 1 to 7 do
             begin
              Fmain.DataSend2.Fields[i].Value:=  sheet.ReadAsText(x,i-1);
             end;

             Fmain.DataSend2.Fields[10].AsDateTime:= DateTugas.Date;
             Fmain.DataSend2.Fields[11].AsString:= ju;
             Fmain.DataSend2.Fields[12].AsString:= ENamaPetugas.text;
             Fmain.DataSend2.Fields[13].AsString:= id;
         end
         else
         begin

             For i := 1 to 7 do
             begin
              Fmain.DataSend2.Fields[i].Value:=  sheet.ReadAsText(x,i-1);
             end;
             Fmain.DataSend2.Fields[10].AsString:=  sheet.ReadAsText(x,8);
             Fmain.DataSend2.Fields[11].AsString:=  sheet.ReadAsText(x,7);
             Fmain.DataSend2.Fields[12].AsString:=  sheet.ReadAsText(x,6);
             Fmain.DataSend2.Fields[13].AsString:= id;
         end;

       Fmain.DataSend2.post;
       Application.ProcessMessages;
      end;


end;

procedure TFImpor.ckUseDataChange(Sender: TObject);
begin

end;

procedure TFImpor.ckUseSeksiClick(Sender: TObject);
begin
  ENamaPetugas.Items.Clear;
  if ckUseSeksi.Checked then
  begin
      ENamaPetugas.Items.Add('PKD');
      ENamaPetugas.Items.Add('PLY');
      ENamaPetugas.Items.Add('PPR');
      ENamaPetugas.Items.Add('PW1');
      ENamaPetugas.Items.Add('PW2');
      ENamaPetugas.Items.Add('PW3');
      ENamaPetugas.Items.Add('PW4');
      ENamaPetugas.Items.Add('PW5');
      ENamaPetugas.ItemIndex:=0;
  end
  else
      ENamaPetugas.Text:= FMain.G_USER_APP;
end;

{ Saves the spreadsheet to the file selected by the FileSaveAs1 action }
procedure TFImpor.FileSaveAs1Accept(Sender: TObject);
var
  fmt: TsSpreadsheetFormat;
begin
  Screen.Cursor := crHourglass;
  try
    case FileSaveAs1.Dialog.FilterIndex of
      1: fmt := sfOOXML;                // Note: Indexes are 1-based here!
      2: fmt := sfExcel8;
      3: fmt := sfExcel5;
      4: fmt := sfExcel2;
      5: fmt := sfopendocument;
      6: fmt := sfCSV;
      7: fmt := sfWikiTable_WikiMedia;
    end;
    sWorkbookSource1.SaveToSpreadsheetFile(FileSaveAs1.Dialog.FileName, fmt);
  finally
    Screen.Cursor := crDefault;
  end;
end;

// Membuka file newbook.xls saat form dibuka
procedure TFImpor.FormShow(Sender: TObject);
var
  wb: TsWorkbook;
  sh: TsWorksheet;
  i: Integer;
  f: string;
begin
  wb := TsWorkbook.Create;
  f := ExtractFilePath(Application.ExeName) + 'support\newbook.xls';
 FileOpen1.Dialog.FileName:=f;
 lbFile.Caption:=f;
  case FileOpen1.Dialog.FilterIndex of
    1: wb.ReadfromFile(FileOpen1.Dialog.FileName);  // all spreadsheet files --> autodetect
    2: wb.ReadFromFile(FileOpen1.Dialog.FileName);  // all Excel files --> autodetect
    3: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfOOXML);   // Exel 2007+
    4: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfExcel8);  // Excel 97-2003
    5: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfExcel5);  // Excel 5.0
    6: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfExcel2);  // Excel 2.1
    7: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfopendocument);  // LibreOffice
    8: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfCSV);     // Text files
  else
    wb.Free;
    MessageDlg('File format not implemented.', mtError, [mbOk], 0);
    exit;
  end;
  sWorkbookSource1.LoadFromWorkbook(wb);
  ENamaTugas.Text:= 'Tugas_' + DateToStr(now);
  ENamaPetugas.Text:= FMain.G_USER_APP;
  DateTugas.Date:=now;
  btStartImpor.Enabled:=true;
  gProgress.Progress:=0;

end;

procedure TFImpor.spReloadClick(Sender: TObject);
var
  wb: TsWorkbook;
  sh: TsWorksheet;
  i: Integer;
  f: string;
begin
  wb := TsWorkbook.Create;
  f := ExtractFilePath(Application.ExeName) + 'support\newbook.xls';
 FileOpen1.Dialog.FileName:=f;
 lbFile.Caption:=f;
  case FileOpen1.Dialog.FilterIndex of
    1: wb.ReadfromFile(FileOpen1.Dialog.FileName);  // all spreadsheet files --> autodetect
    2: wb.ReadFromFile(FileOpen1.Dialog.FileName);  // all Excel files --> autodetect
    3: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfOOXML);   // Exel 2007+
    4: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfExcel8);  // Excel 97-2003
    5: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfExcel5);  // Excel 5.0
    6: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfExcel2);  // Excel 2.1
    7: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfopendocument);  // LibreOffice
    8: wb.ReadFromFile(FileOpen1.Dialog.FileName, sfCSV);     // Text files
  else
    wb.Free;
    MessageDlg('File format not implemented.', mtError, [mbOk], 0);
    exit;
  end;
  sWorkbookSource1.LoadFromWorkbook(wb);
  ENamaTugas.Text:= 'Tugas_' + DateToStr(now);
  ENamaPetugas.Text:= FMain.G_USER_APP;
  DateTugas.Date:=now;
  btStartImpor.Enabled:=true;

end;

procedure TFImpor.spSampleClick(Sender: TObject);
var
  a,n : string;
  appdir : String;
begin
  appdir := ExtractFilePath(Application.ExeName);
  a := appdir + 'support/blank/sample.xls';
  n := appdir + 'support/newbook.xls';
  CopyFile(PChar(a),PChar(n),true);
  opendocument(n);
end;

procedure TFImpor.spSaveClick(Sender: TObject);
begin

end;




end.

