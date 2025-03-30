unit ui_keyboard;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  Buttons,
  StdCtrls;

type

  { Tfrm_Keyboard }

  Tfrm_Keyboard = class(TForm)
    EdtHuruf: TEdit;
    EdtAngka: TEdit;
    kb_ALIF: TSpeedButton;
    kb_RO: TSpeedButton;
    kb_ZA: TSpeedButton;
    kb_SIN: TSpeedButton;
    kb_SYIN: TSpeedButton;
    spb_Shad: TSpeedButton;
    spb_Dhad: TSpeedButton;
    spb_Tho: TSpeedButton;
    spb_Dha: TSpeedButton;
    spb_Aa: TSpeedButton;
    spb_Gha: TSpeedButton;
    kb_BA: TSpeedButton;
    spb_Fa: TSpeedButton;
    spb_Qo: TSpeedButton;
    spb_Kaf: TSpeedButton;
    spb_Lam: TSpeedButton;
    spb_Mim: TSpeedButton;
    spb_Nun: TSpeedButton;
    spb_Ha: TSpeedButton;
    spb_Waw: TSpeedButton;
    spb_Spase: TSpeedButton;
    kb_TA: TSpeedButton;
    kb_TSA: TSpeedButton;
    kb_JA: TSpeedButton;
    kb_ha: TSpeedButton;
    kb_KHO: TSpeedButton;
    kb_DAL: TSpeedButton;
    kb_DZAL: TSpeedButton;
    spb_Ya: TSpeedButton;
    spb_Hamzah: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;

    procedure CatatHuruf(Sender: TObject);
    procedure EdtHurufChange(Sender: TObject);
    procedure spb_SpaseClick(Sender: TObject);
  private
  public

  end;

var
  frm_Keyboard: Tfrm_Keyboard;

implementation

uses ui_statistika;


{$R *.lfm}

{ Tfrm_Keyboard }



procedure Tfrm_Keyboard.spb_SpaseClick(Sender: TObject);
begin
 EdtHuruf.text:=EdtHuruf.text + ' ';
end;

procedure Tfrm_Keyboard.CatatHuruf(Sender: TObject);
begin
  EdtHuruf.text:=EdtHuruf.text + TSpeedButton(Sender).Caption;
end;

procedure Tfrm_Keyboard.EdtHurufChange(Sender: TObject);
begin

end;


end.

