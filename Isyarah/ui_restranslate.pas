unit ui_restranslate;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  HtmlView;

type

  { TfrmResTranslate }

  TfrmResTranslate = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private

  public
    page : string;
  end;

var
  frmResTranslate: TfrmResTranslate;

implementation

{$R *.lfm}

{ TfrmResTranslate }

procedure TfrmResTranslate.FormShow(Sender: TObject);
begin
//  memo1.text := page;
end;

procedure TfrmResTranslate.Panel1Click(Sender: TObject);
begin

end;

end.

