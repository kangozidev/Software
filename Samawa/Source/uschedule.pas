unit uschedule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls, Calendar, DBExtCtrls, Buttons, EditBtn, Menus, RTTICtrls, Clipbrd,
  DateTimePicker, VpCalendar, rxpickdate, rxtooledit, rxdbgrid,
  ZDataset, DateUtils, Grids;

type

  { TfrmSchedule }

  TfrmSchedule = class(TForm)
    ovCal: TDateEdit;
    DateFilter: TDateEdit;
    DsTugas: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    EReplaceNamaTugas: TEdit;
    DsDataTugas: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    mnHapus: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    pMenu: TPopupMenu;
    grdTugas: TrxDBGrid;
    spAllDate: TSpeedButton;
    spUse: TSpeedButton;
    spFilterByDate: TSpeedButton;
    spReplaceTgl: TSpeedButton;
    Splitter1: TSplitter;
    DTugas: TZQuery;
    DDataTugas: TZQuery;
    procedure DTugasAfterOpen(DataSet: TDataSet);
    procedure Edit1Change(Sender: TObject);
    procedure EReplaceNamaTugasKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure grdTugasCellClick(Column: TColumn);
    procedure mnHapusClick(Sender: TObject);
    procedure ovCalAcceptDate(Sender: TObject; var ADate: TDateTime;
      var AcceptDate: Boolean);
    procedure spAllDateClick(Sender: TObject);
    procedure spDeleteClick(Sender: TObject);
    procedure spFilterByDateClick(Sender: TObject);
    procedure spReplaceTglClick(Sender: TObject);
    procedure spUseClick(Sender: TObject);
  private

  public

  end;

var
  frmSchedule: TfrmSchedule;

implementation

uses umain;

{$R *.lfm}

{ TfrmSchedule }

procedure TfrmSchedule.grdTugasCellClick(Column: TColumn);
var
  j : string;
begin

  j := DTugas.Fields[0].AsString;

  DDataTugas.close;
  DDataTugas.ParamByName('vtugas').Value:= j;
  DDataTugas.open;
  EReplaceNamaTugas.Text:=j;
  ovCal.Date:= DTugas.Fields[1].AsDateTime;

end;



procedure TfrmSchedule.mnHapusClick(Sender: TObject);
begin

  FMain.ZKoneksi.ExecuteDirect('delete from data_terjadwal where j_tugas=' +
                                       QuotedStr(DTugas.Fields[0].AsString));
  DTugas.close;
  DTugas.open;

end;

procedure TfrmSchedule.ovCalAcceptDate(Sender: TObject; var ADate: TDateTime;
  var AcceptDate: Boolean);
begin

      if ovCal.Date<now then
     begin
       FMain.showpesan('Tanggal Lebih Kecil dari Tanggal Sekarang');
       ovCal.Date:=now;
     end;
end;

procedure TfrmSchedule.spAllDateClick(Sender: TObject);
begin

  DTugas.close;
  DTugas.sql.Clear;
  DTugas.sql.Add('select distinct J_Tugas as "Nama Tugas", J_tgl as Tanggal '+
                 'from data_terjadwal '+
                 'order by J_tgl asc');

  DTugas.open;
end;




procedure TfrmSchedule.spDeleteClick(Sender: TObject);
begin

  FMain.ZKoneksi.ExecuteDirect('delete from data_terjadwal where j_tugas=' +
                                QuotedStr(DTugas.Fields[0].AsString));
  DTugas.close;
  DTugas.open;

end;

procedure TfrmSchedule.spFilterByDateClick(Sender: TObject);
var
 d,m,y,t : string;
begin

 if DayOf(DateFilter.Date)<10 then
    d := '0' + Inttostr(DayOf(DateFilter.Date))
 else
    d :=  Inttostr(DayOf(DateFilter.Date))  ;


 if MonthOf(DateFilter.Date)<10 then
    m := '0' + Inttostr(MonthOf(DateFilter.Date))
 else
    m := Inttostr(MonthOf(DateFilter.Date));

 y := Inttostr(YearOf(DateFilter.Date));

 t := trim(y + '-' + m + '-'+ d);

  DTugas.close;
  DTugas.sql.Clear;
  DTugas.sql.Add('select distinct J_Tugas as "Nama Tugas", J_tgl as Tanggal '+
               //  'cast(julianday(j_tgl)-julianday(date()) as int) as "Sisa Hari" '+
                 'from data_terjadwal where j_tgl='+ QuotedStr(t) + ' ' +
                 'order by J_tgl asc');

  DTugas.open;
  if DTugas.IsEmpty then
     begin
       FMain.showpesan('Tidak Ada Tugas Pada Tanggal ini ');
       exit;
     end;
  EReplaceNamaTugas.Clear;
  ovCal.Date:=now;

end;

procedure TfrmSchedule.spReplaceTglClick(Sender: TObject);
var
 d,m,y,t : string;
begin

 if DayOf(ovCal.Date)<10 then
    d := '0' + Inttostr(DayOf(ovCal.Date))
 else
    d :=  Inttostr(DayOf(ovCal.Date))  ;


 if MonthOf(ovCal.Date)<10 then
    m := '0' + Inttostr(MonthOf(ovCal.Date))
 else
    m := Inttostr(MonthOf(ovCal.Date));

 y := Inttostr(YearOf(ovCal.Date));

 t := trim(y + '-' + m + '-'+ d);


  FMain.ZKoneksi.ExecuteDirect('Update data_terjadwal set '+
                                'j_tugas= ' + QuotedStr(EReplaceNamaTugas.Text) + ', ' +
                                'j_tgl = ' +QuotedStr( t )+ ' ' +
                                'where j_tugas= ' + QuotedStr(DTugas.Fields[0].AsString) );
  DTugas.close;
  DTugas.open;

  DDataTugas.close;
  DDataTugas.open;
end;

procedure TfrmSchedule.spUseClick(Sender: TObject);
begin

     FMain.ZKoneksi.ExecuteDirect('delete from data');
     FMain.ZKoneksi.ExecuteDirect('insert into data(' +
          'IDC,CNAME,CMessageHeader , CMessageContent, CMessageFooter, '+
          'CContact , CPic, CPost, J_Tugas,J_tgl,J_Pembuat) ' +
          'Select IDC,CNAME,CMessageHeader , CMessageContent, CMessageFooter, '+
          'CContact , CPic, CPost,J_tugas,J_tgl,J_Pembuat  from data_terjadwal where  ' +
          'J_id='+ QuotedStr(DTugas.Fields[2].AsString) );

     FMain.DataSend2.close;
     FMain.DataSend2.open;

end;

procedure TfrmSchedule.FormShow(Sender: TObject);
begin
  DTugas.close;
  DTugas.open;
  EReplaceNamaTugas.Text:=DTugas.Fields[0].AsString;
  ovCal.Date:= DTugas.Fields[1].AsDateTime;
  DateFilter.Date:=now;
end;

procedure TfrmSchedule.EReplaceNamaTugasKeyPress(Sender: TObject; var Key: char
  );
begin
  if key=#13 then
     if EReplaceNamaTugas.Text<>'' then
        begin
          FMain.ZKoneksi.ExecuteDirect('Update data_terjadwal set j_tugas= ' + QuotedStr(EReplaceNamaTugas.Text) +
                                       ' where j_tugas= ' + QuotedStr(DTugas.Fields[0].AsString));
          DTugas.close;
          DTugas.open;
        end;
end;



procedure TfrmSchedule.Edit1Change(Sender: TObject);
begin
  DTugas.close;
  DTugas.sql.Clear;
  DTugas.sql.Add('select distinct J_Tugas as "Nama Tugas", J_tgl as Tanggal '+
                 'from data_terjadwal where j_tugas like''%'+ Edit1.text + '%''');
  DTugas.open;
  EReplaceNamaTugas.Clear;
  ovCal.Date:=now;
end;

procedure TfrmSchedule.DTugasAfterOpen(DataSet: TDataSet);
var
j : string;
begin
    j := DTugas.Fields[0].AsString;

  DDataTugas.close;
  DDataTugas.ParamByName('vtugas').Value:=j;
  DDataTugas.open;

  EReplaceNamaTugas.Text:=DTugas.Fields[0].AsString;
end;

end.

