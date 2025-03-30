unit ui_regtajwid;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  DB,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  Buttons,
  Clipbrd,
  StdCtrls,
  DBCtrls,
  RxDBGrid,
  ZDataset,
  DBGrids,
  ExtCtrls;

type

  { TfrmRegTajwid }

  TfrmRegTajwid = class(TForm)
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBEdit1: TDBEdit;
    DSTajwid: TDataSource;
    edtCariHuruf: TEdit;
    grDTajwid: TRxDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    spb_Filter: TSpeedButton;
    spnDelete: TSpeedButton;
    spnSave: TSpeedButton;
    DTTajwid: TZQuery;
    procedure edtCariHurufChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grDTajwidCellClick(Column: TColumn);
    procedure spb_FilterClick(Sender: TObject);
    procedure spnSaveClick(Sender: TObject);
    procedure spnAddClick(Sender: TObject);
    procedure spnDeleteClick(Sender: TObject);
  private

  public

  end;

var
  frmRegTajwid: TfrmRegTajwid;

implementation

uses ui_main;

{$R *.lfm}

{ TfrmRegTajwid }

procedure TfrmRegTajwid.spnDeleteClick(Sender: TObject);
begin
   if Dialogs.MessageDlg('Hapus Data ini ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      DTTajwid.Delete;
    end;
end;

procedure TfrmRegTajwid.spnAddClick(Sender: TObject);
begin


end;

procedure TfrmRegTajwid.FormShow(Sender: TObject);
var
  h1 : string;
begin
  h1 := Clipboard.AsText;
  if h1='' then
     DTTajwid.close
  else
  begin
    DTTajwid.open;
    DTTajwid.Append;
    DBEdit1.SetFocus;
  end;

end;

procedure TfrmRegTajwid.edtCariHurufChange(Sender: TObject);
begin
  DTTajwid.Locate('h1',Trim(edtCariHuruf.Text),[loCaseInsensitive]);
end;

procedure TfrmRegTajwid.grDTajwidCellClick(Column: TColumn);
begin
  DTTajwid.edit;;
end;

procedure TfrmRegTajwid.spb_FilterClick(Sender: TObject);
begin
  DTTajwid.Filtered:=false;
end;

procedure TfrmRegTajwid.spnSaveClick(Sender: TObject);
begin
   if Dialogs.MessageDlg('Simpan Data ini ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin

    DTTajwid.Post;
    DTTajwid.edit;
    end;
end;

end.

