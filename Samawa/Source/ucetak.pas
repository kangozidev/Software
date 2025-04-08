unit ucetak;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TfrmCetak }

  TfrmCetak = class(TForm)
    EJudul: TEdit;
    EPembuat: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    spCancel: TSpeedButton;
    spCetak: TSpeedButton;
    procedure spCancelClick(Sender: TObject);
    procedure spCetakClick(Sender: TObject);
  private

  public

  end;

var
  frmCetak: TfrmCetak;

implementation

uses umain;

{$R *.lfm}

{ TfrmCetak }

procedure TfrmCetak.spCetakClick(Sender: TObject);
var
  j:string;
  p:string;
begin

  j := EJudul.Text;
  p := EPembuat.Text;
  if j<>'' then
   if p<>'' then
   begin

    FMain.ZKoneksi.ExecuteDirect('delete from cetak');
    FMain.ZKoneksi.ExecuteDirect('insert into cetak values (' + QuotedStr(j) + ',' + QuotedStr(p) + ')' );
    FMain.DoCetakLaporan;
    close;
   end;
end;

procedure TfrmCetak.spCancelClick(Sender: TObject);
begin
  close;
end;

end.

