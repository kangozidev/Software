unit uphonebook;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  DBCtrls, StdCtrls, Buttons, ComCtrls, rxdbgrid,StrUtils;

type

  { TFphonebook }

  TFphonebook = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    ProgressBar1: TProgressBar;
    rxDBGrid1: TrxDBGrid;
    savDlg: TSaveDialog;
    spAdd: TSpeedButton;
    spDelete: TSpeedButton;
    spImport: TSpeedButton;
    spExport: TSpeedButton;
    spCLose: TSpeedButton;
    spPost: TSpeedButton;
    procedure spAddClick(Sender: TObject);
    procedure spCLoseClick(Sender: TObject);
    procedure spDeleteClick(Sender: TObject);
    procedure spExportClick(Sender: TObject);
    procedure spImportClick(Sender: TObject);
    procedure spPostClick(Sender: TObject);
  private

  public

  end;

var
  Fphonebook: TFphonebook;

implementation

{$R *.lfm}
uses
  umain;

{ TFphonebook }

procedure TFphonebook.spCLoseClick(Sender: TObject);
begin
  close;

end;

procedure TFphonebook.spDeleteClick(Sender: TObject);
begin
  if Dialogs.MessageDlg('Hapus Data Ini ?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      FMain.DataContact.Delete;
    end;
end;
// Ekspor ke CSV
procedure TFphonebook.spExportClick(Sender: TObject);
var
  s : Tstringlist;
begin

  try
  s := TStringList.create;
  s.Clear;

    with FMain.DataContact do
    begin
      First;
      while not Eof do
      begin
        s.Add(Fields[1].Asstring + ';' + Fields[2].Asstring + ';' +
              Fields[3].Asstring + ';' + Fields[4].Asstring + ';' +
              Fields[5].Asstring);
        Next;
      end;
    end;
    if savDlg.Execute then
      begin
      s.SaveToFile(savDlg.FileName);
      end;

    finally
    s.Free;
  end;

end;

// Impor CSV
procedure TFphonebook.spImportClick(Sender: TObject);
var
  s : TstringList;
  r,i : integer ;
  q : string;
begin

 if OpenDialog1.Execute then
  begin
    try
      s:=TStringList.create;
      s.LoadFromFile(OpenDialog1.FileName);
      r := s.Count;
      progressbar1.min := 0;
      ProgressBar1.max := r;
      FMain.ZKoneksi.ExecuteDirect('delete from contact');
      if (r> 0 ) and (AnsiContainsText(s.Text,';')=true) then
         begin
          for i := 0 to r -1 do
            begin
            ProgressBar1.Position:= i;
            Application.ProcessMessages;
             q := 'Insert Into contact (idc,cname,cpic,cnumber,cemail) ' +
                'values (''' + AnsiReplaceStr(s.Strings[i],';' ,''',''') + ''')';

             memo1.text := q;
             FMain.ZKoneksi.ExecuteDirect(q);
             Application.ProcessMessages;
            end;
            FMain.showpesan ('Sukses Impor');
         end;
      FMain.DataContact.Close;
      FMain.DataContact.open;

    finally
       s.Free;
    end;
  end;

end;

procedure TFphonebook.spPostClick(Sender: TObject);
begin
  FMain.DataContact.Edit;
  FMain.DataContact.post;
end;

procedure TFphonebook.spAddClick(Sender: TObject);
begin
 FMain.DataContact.Insert;
end;

end.

