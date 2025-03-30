unit ui_source;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Buttons,
  klabels,
  atshapeline;

type

  { TfrmDBSource }

  TfrmDBSource = class(TForm)
    Image1: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    KLinkLabel1: TKLinkLabel;
    KLinkLabel10: TKLinkLabel;
    KLinkLabel11: TKLinkLabel;
    KLinkLabel12: TKLinkLabel;
    KLinkLabel2: TKLinkLabel;
    KLinkLabel3: TKLinkLabel;
    KLinkLabel4: TKLinkLabel;
    KLinkLabel5: TKLinkLabel;
    KLinkLabel6: TKLinkLabel;
    KLinkLabel7: TKLinkLabel;
    KLinkLabel8: TKLinkLabel;
    KLinkLabel9: TKLinkLabel;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ShapeLine1: TShapeLine;
    spClode: TSpeedButton;
    procedure spClodeClick(Sender: TObject);
  private

  public

  end;

var
  frmDBSource: TfrmDBSource;

implementation

{$R *.lfm}

{ TfrmDBSource }

procedure TfrmDBSource.spClodeClick(Sender: TObject);
begin
  self.close;
end;

end.

