unit ui_agreement;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  LCLIntf,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  ColorSpeedButton,
  atshapeline;

type

  { TfrmAgreement }

  TfrmAgreement = class(TForm)
    ColorSpeedButton1: TColorSpeedButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    ShapeLine1: TShapeLine;
    procedure ColorSpeedButton1Click(Sender: TObject);
    procedure ColorSpeedButton2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure lbTutorialClick(Sender: TObject);
  private

  public

  end;

var
  frmAgreement: TfrmAgreement;

implementation

uses ui_main;

{$R *.lfm}

{ TfrmAgreement }

procedure TfrmAgreement.ColorSpeedButton1Click(Sender: TObject);
begin
  self.close;
  frm_Main.taawudz ;
end;

procedure TfrmAgreement.ColorSpeedButton2Click(Sender: TObject);
begin
  frm_Main.Close;
  Application.Terminate;
end;

procedure TfrmAgreement.Image4Click(Sender: TObject);
begin
  OpenDocument('https://sites.google.com/view/kangozicorner/home?authuser=0');
end;

procedure TfrmAgreement.Image5Click(Sender: TObject);
begin
  OpenDocument('https://www.pesantrenweb.com/');
end;

procedure TfrmAgreement.Image7Click(Sender: TObject);
begin
  OpenDocument('https://www.fsf.org/');
end;

procedure TfrmAgreement.lbTutorialClick(Sender: TObject);
begin
//  frm_Main.mnTutor.Click;
end;

end.

