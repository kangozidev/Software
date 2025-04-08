unit uregistration;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  IdChargenServer, ubarcodes,  StrUtils, Messages, LCLIntf, LCLType,
  Clipbrd;

type

  { TFregistration }

  TFregistration = class(TForm)
    BCode: TBarcodeQR;
    btSave: TButton;
    EAccCode: TEdit;
    EName: TEdit;
    EEMail: TEdit;
    EKota: TEdit;
    ESerial: TEdit;
    EProv: TComboBox;
    gbID: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbInfo: TLabel;
    lbget: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnbCode: TPanel;
    procedure BcodeDblClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lbgetClick(Sender: TObject);
  private

  public
    serial:string;
    nama:string;
    email:string;
    kota:string;
    prov:String;

  end;

var
  Fregistration: TFregistration;

implementation

uses umain;

{$R *.lfm}

{ TFregistration }

procedure TFregistration.FormShow(Sender: TObject);
var
  noser : integer;
  code: String;
  f : TStringList;

begin

  code :=  serial;

  BCode.Text:= nama + '|'+ email +'|' + kota + '|' + serial;

  try
   f:= TStringList.create;
   f.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'support/regact.cfd');


   EName.text := f.Strings[0];
   EEMail.text :=f.Strings[1];
   EKota.Text:= f.Strings[2];
   //EProv.text := f.Strings[];
   Eserial.Text:= LeftStr(serial,7);

  finally
    f.free;
  end;

end;

procedure TFregistration.btSaveClick(Sender: TObject);
  var
  f: TStringlist;
begin

  if (EName.Text='') or
     (EEmail.Text='') or
     (EKota.Text='') or
     (ESerial.Text='') or
     (EProv.Text='')  then
     begin
       ShowMessage('Isian Belum Lengkap');
       exit;
     end;
  try
  f:= TStringList.create;
  f.Add( EName.Text);
  f.Add( EEmail.Text);
  f.Add(EKota.Text);
  f.Add(LeftStr(serial,7));
  f.Add(EAccCode.Text);
  f.Add(EProv.Text);
  f.SaveToFile(ExtractFilePath(Application.ExeName)+ 'support/regact.cfd');

  FMain.ZKoneksi.ExecuteDirect('update konfigurasi set app_serial=' + QuotedStr(ESerial.Text));
  FMain.ZKoneksi.ExecuteDirect('update konfigurasi set app_aktivasi=' + QuotedStr(EAccCode.Text));
  FMain.ZKoneksi.ExecuteDirect('update konfigurasi set app_kota=' + QuotedStr(EKota.Text));
  FMain.ZKoneksi.ExecuteDirect('update konfigurasi set app_prov=' + QuotedStr(EProv.Text));
  FMain.ZKoneksi.ExecuteDirect('update konfigurasi set app_user=' + QuotedStr(EName.Text));

  finally
    f.free;
  end;

  ShowMessage('Kode Aktivasi Tersimpan, Silahkan Restart SamaWA');
  Application.Terminate;

end;

procedure TFregistration.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  if EName.Enabled=false then
  begin
  CloseAction:= caFree;
  end;
  Application.Terminate;



end;

procedure TFregistration.BcodeDblClick(Sender: TObject);
begin

  EAccCode.Enabled:=true;

end;

procedure TFregistration.lbgetClick(Sender: TObject);
var
  keyact : Int64;
begin
  keyact := StrtoInt('$' + AnsiLeftStr(serial,7));
  EAccCode.Text:=FloatToStr(Abs( keyact));
end;

end.

