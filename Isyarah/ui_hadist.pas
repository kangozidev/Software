unit ui_hadist;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,ubrowser;

type

  { Tfrm_Hadist }

  Tfrm_Hadist = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    pnl_HadistWeb: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure FormShow(Sender: TObject);
  private
    FRM_HadistWeb : TfrmBrowser;
  public

  end;

var
  frm_Hadist: Tfrm_Hadist;

implementation

{$R *.lfm}

{ Tfrm_Hadist }


procedure Tfrm_Hadist.FormShow(Sender: TObject);
begin
  FRM_HadistWeb := TfrmBrowser.Create(self);
  FRM_HadistWeb.Parent:= pnl_HadistWeb;
  FRM_HadistWeb.Align:=alClient;
  FRM_HadistWeb.BorderStyle:=bsNone;
  FRM_HadistWeb.AddressPnl.Hide;
  FRM_HadistWeb.Chromium1.LoadURL('about:blank');
  FRM_HadistWeb.Show;
end;

end.

