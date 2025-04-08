unit utemplate;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls, DBCtrls, Buttons, Strutils, Menus,  Clipbrd,
   HtmlView;

type

  { TFtemplate }

  TFtemplate = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DMessage: TDBMemo;
    grdMessage: TDBGrid;
    GroupBox1: TGroupBox;
    HTMLV: THtmlViewer;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    MenuItem1: TMenuItem;
    mnPreview: TMenuItem;
    mnAddCName: TMenuItem;
    mnAddPIC: TMenuItem;
    mnAddIDC: TMenuItem;
    mnAddDate: TMenuItem;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    PopupMenu1: TPopupMenu;
    spAdd: TSpeedButton;
    spDelete: TSpeedButton;
    spDelete1: TSpeedButton;
    Splitter1: TSplitter;
    spPost: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure grdMessageCellClick(Column: TColumn);
    procedure mnAddCNameClick(Sender: TObject);
    procedure mnAddDateClick(Sender: TObject);
    procedure mnAddIDCClick(Sender: TObject);
    procedure mnAddPICClick(Sender: TObject);
    procedure mnPreviewClick(Sender: TObject);
    procedure spAddClick(Sender: TObject);
    procedure spDeleteClick(Sender: TObject);
    procedure spPostClick(Sender: TObject);
  private

  public
  fh : string;
  end;

var
  Ftemplate: TFtemplate;

implementation

{$R *.lfm}
uses umain;

{ TFtemplate }

procedure TFtemplate.spAddClick(Sender: TObject);
begin
  Fmain.DataMessage.Insert;
end;

procedure TFtemplate.grdMessageCellClick(Column: TColumn);
begin
  mnPreview.Click;
end;

procedure TFtemplate.FormShow(Sender: TObject);
begin
 fh := ExtractFilePath(Application.ExeName) + 'support/template/index.html';
 FMain.DataMessage.open;
 HTMLV.LoadFromFile(fh);
end;

procedure TFtemplate.mnAddCNameClick(Sender: TObject);
begin
   Clipboard.AsText := '@CName';
    DMessage.PasteFromClipboard;
end;

procedure TFtemplate.mnAddDateClick(Sender: TObject);
begin
      Clipboard.AsText := '@Date';
    DMessage.PasteFromClipboard;
end;

procedure TFtemplate.mnAddIDCClick(Sender: TObject);
begin
    Clipboard.AsText := '@IDC';
    DMessage.PasteFromClipboard;
end;

procedure TFtemplate.mnAddPICClick(Sender: TObject);
begin
      Clipboard.AsText := '@CPic';
    DMessage.PasteFromClipboard;
end;

procedure TFtemplate.mnPreviewClick(Sender: TObject);
var
  ht: TSTringList;
  s,pg : string;
begin
    pg := '<html><body style="background-image: url(back.png);"><br>'+
          '<table style="text-align: left; width: 94%; background-color: #FFFDD4;"'+
          'border="0" cellpadding="5" cellspacing="2">'+
          '<tbody><tr>'+
          '<td style="vertical-align: top;">'+
          '<span style="font-smooth: antialiased ;font-family: Microsoft Sans Serif;'+
          'font-weight: bold; color: red;">samawa<br><br></span>'+
          '<span style="font-smooth: antialiased ;font-family: Microsoft Sans Serif;">'+
          '<font size="-1">'+
          '[TEXT_MESSAGE]</font></span></td><tr></tbody><tabl></body></html> ' ;


    try
      ht :=TStringList.Create;
      s:= DMessage.Text;
      s:= AnsiReplaceText(s,#13#10,'<br>');

      ht.Text:=AnsiReplaceStr(pg,'[TEXT_MESSAGE]',s);
      ht.SaveToFile(fh);
    finally
      ht.Free;
    end;
     HTMLV.LoadFromFile(fh);

end;

procedure TFtemplate.spDeleteClick(Sender: TObject);
begin
   if Dialogs.MessageDlg('Hapus Data Ini ?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      FMain.DataMessage.Delete;
    end;
end;

procedure TFtemplate.spPostClick(Sender: TObject);
begin
  FMain.DataMessage.edit;
  FMain.DataMessage.Post;
end;

end.

