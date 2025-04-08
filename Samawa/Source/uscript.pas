unit uscript;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls,  cyAdvGridPanel,  SynHighlighterPas, urlmon;

type

  { TfrmScriptWA }

  TfrmScriptWA = class(TForm)
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    SC6: TEdit;
    spCekServer: TSpeedButton;
    spSingkron: TSpeedButton;
    SS1: TEdit;
    SC5: TEdit;
    SC1: TEdit;
    SC2: TEdit;
    SS2: TEdit;
    SS3: TEdit;
    SC3: TEdit;
    SS4: TEdit;
    SC4: TEdit;
    SS5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SS6: TEdit;
    procedure FormShow(Sender: TObject);
    procedure spCekServerClick(Sender: TObject);
    procedure spSingkronClick(Sender: TObject);
    procedure SS1Change(Sender: TObject);
  private

  public

  end;

var
  frmScriptWA: TfrmScriptWA;

implementation

{$R *.lfm}

uses umain ;
{ TfrmScriptWA }

procedure TfrmScriptWA.FormShow(Sender: TObject);
begin

  With FMain do
    begin
    DConfiguration.close;
    DConfiguration.open;

    SC1.Text:= DConfiguration.FieldByName('SC_CANCEL_END').AsString;
    SC2.Text:= DConfiguration.FieldByName('SC_SEND_TEXT').AsString;;
    SC3.Text:= DConfiguration.FieldByName('SC_WITH_PICTURE').AsString;
    SC4.Text:= DConfiguration.FieldByName('SC_AUTOSEND_WITH_PICTURE').AsString;
    SC5.Text:= DConfiguration.FieldByName('SC_TEXTBOX_MESSAGE').AsString;
    SC6.Text:= DConfiguration.FieldByName('SC_CHECK_LOGIN').AsString;
    end;

end;

procedure TfrmScriptWA.spCekServerClick(Sender: TObject);
var
  versi_server:string;
  filep:string;
  mScript:TStringList;
begin

  mScript:= TStringList.create;
  versi_server := 'https://drive.google.com/uc?export=download&id=1pASbRFLBZJk5oYcYP4mso-Vf9isVZq_4';
  filep        := ExtractFilePath(Application.ExeName) + 'support/tempSWA.cfg';

  if URLDownloadToFile(nil, PChar(versi_server),
     PChar(filep), 0, nil) = 0 then
     begin
      mScript.LoadFromFile(ExtractFilePath(Application.ExeName) + 'support/tempSWA.cfg');
      SS1.Text:= mScript.Strings[5];
      SS2.Text:= mScript.Strings[7];
      SS3.Text:= mScript.Strings[9];
      SS4.Text:= mScript.Strings[11];
      SS5.Text:= mScript.Strings[13];
      SS6.Text:= mScript.Strings[15];
      SS1Change(Sender);
     end
  else
     FMain.showpesan('Periksa Koneksi Internet');


end;

procedure TfrmScriptWA.spSingkronClick(Sender: TObject);
begin


  SC1.Text:=SS1.Text;
  SC2.Text:=SS2.Text;
  SC3.Text:=SS3.Text;
  SC4.Text:=SS4.Text;
  SC5.Text:=SS5.Text;
  SC6.Text:=SS6.Text;

  if SC1.Text='' then
     begin
      FMain.showpesan('Singkonkan dengan  Server terlebih dahulu');
      exit;
     end;

  With FMain do
    begin

    DConfiguration.edit;
    DConfiguration.FieldByName('SC_CANCEL_END').AsString := SC1.Text;
    DConfiguration.FieldByName('SC_SEND_TEXT').AsString:=SC2.Text;
    DConfiguration.FieldByName('SC_WITH_PICTURE').AsString := SC3.Text;
    DConfiguration.FieldByName('SC_AUTOSEND_WITH_PICTURE').AsString:= SC4.Text;
    DConfiguration.FieldByName('SC_TEXTBOX_MESSAGE').AsString:=SC5.Text;
    DConfiguration.FieldByName('SC_CHECK_LOGIN').AsString :=SC6.Text;
    DConfiguration.post;

    end;

  SS1Change(Sender);
  Fmain.SetConfigAppSamawa;
  FMain.showpesan('Sinkronisasi Selesai');

end;

procedure TfrmScriptWA.SS1Change(Sender: TObject);
begin

  if SC1.Text = SS1.Text then
     SC1.Color:=$00F1F8DC else SC1.color :=$00C1C0FA;
  if SC2.Text = SS2.Text then
     SC2.Color:=$00F1F8DC else SC2.color :=$00C1C0FA;
  if SC3.Text = SS3.Text then
     SC3.Color:=$00F1F8DC else SC3.color :=$00C1C0FA;
  if SC4.Text = SS4.Text then
     SC4.Color:=$00F1F8DC else SC4.color :=$00C1C0FA;
  if SC5.Text = SS5.Text then
     SC5.Color:=$00F1F8DC else SC5.color :=$00C1C0FA;
  if SC6.Text = SS6.Text then
     SC6.Color:=$00F1F8DC else SC6.color :=$00C1C0FA;

end;

end.

