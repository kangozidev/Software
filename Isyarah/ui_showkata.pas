unit ui_showkata;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmShowKata }

  TfrmShowKata = class(TForm)
    lbKata: TLabel;
    lbTerjemah: TLabel;
    procedure FormShow(Sender: TObject);
  private

  public
   KATA:string;
   TERJEMAH:string;
  end;

var
  frmShowKata: TfrmShowKata;

implementation

{$R *.lfm}

{ TfrmShowKata }

procedure TfrmShowKata.FormShow(Sender: TObject);
begin
  lbKata.Caption:=KATA;
  lbTerjemah.Caption:=TERJEMAH;
end;

end.

