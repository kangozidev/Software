unit ui_message;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { Tfrm_Pesan }

  Tfrm_Pesan = class(TForm)
    Image1: TImage;
    lbMessage: TLabel;
  private

  public

  end;

var
  frm_Pesan: Tfrm_Pesan;

implementation

{$R *.lfm}

end.

