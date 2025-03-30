unit ui_ayatbyai;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { Tfrm_AyatByAI }

  Tfrm_AyatByAI = class(TForm)
    mmResponAI: TMemo;
    procedure FormShow(Sender: TObject);
  private

  public
     ai_respon: string;
  end;

var
  frm_AyatByAI: Tfrm_AyatByAI;

implementation

{$R *.lfm}

{ Tfrm_AyatByAI }

procedure Tfrm_AyatByAI.FormShow(Sender: TObject);
begin
  mmResponAI.Text:=ai_respon;
end;

end.

