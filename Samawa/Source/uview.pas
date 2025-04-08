unit uview;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  Buttons, StdCtrls, DBCtrls, rxdbgrid;

type

  { TFview }

  TFview = class(TForm)
    DBEdit8: TDBEdit;
    eIDC: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    EName: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    grdDataSend: TrxDBGrid;
    spAdd: TSpeedButton;
    spDelete: TSpeedButton;
    spPost: TSpeedButton;
    spCLose: TSpeedButton;
    procedure spAddClick(Sender: TObject);
    procedure spCLoseClick(Sender: TObject);
    procedure spDeleteClick(Sender: TObject);
    procedure spPostClick(Sender: TObject);
  private

  public

  end;

var
  Fview: TFview;

implementation

{$R *.lfm}
uses
  umain;

{ TFview }

// Menutup Form
procedure TFview.spCLoseClick(Sender: TObject);
begin

  close;

end;

// Menghapus Record Active
procedure TFview.spDeleteClick(Sender: TObject);
begin
   if Dialogs.MessageDlg('Delete this data ?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      FMain.DataSend2.Delete;
    end;
end;

// Menyimpan Hasil Perubahan
// Mereset Validasi
procedure TFview.spPostClick(Sender: TObject);
begin

  if EName.Text<>'' then
     if EIDC.Text<>'' then
        begin
        FMain.DataSend2.Edit;
        Fmain.DataSend2.FieldByName('Ccheck').Value:='';
        FMain.DataSend2.Post;

        end;

end;

//Menambah record baru
procedure TFview.spAddClick(Sender: TObject);
begin

  FMain.DataSend2.Insert;

end;



end.

