unit ui_edtrans;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  DB,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  DBCtrls,
  ExtCtrls,
  Buttons,
  StdCtrls,
  BGRAResizeSpeedButton;

type

  { TfrmEditTrans }

  TfrmEditTrans = class(TForm)
    mTrans: TMemo;
    Panel1: TPanel;
    spClose: TSpeedButton;
    spSave1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure spCloseClick(Sender: TObject);
    procedure spSave1Click(Sender: TObject);
  private

  public
     ID_X : string;
     ISI : string;
     KAT : string;
     KITAB : string;
  end;

var
  frmEditTrans: TfrmEditTrans;

implementation

uses ui_main;

{$R *.lfm}

{ TfrmEditTrans }

procedure TfrmEditTrans.spCloseClick(Sender: TObject);
begin
  Self.close;
end;

procedure TfrmEditTrans.spSave1Click(Sender: TObject);
begin

  if KITAB='HADIST' then
  begin
    if Dialogs.MessageDlg('Apakah Anda Akan Menyimpan Data Terjemahan ?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      if KAT='SUNI' then
      begin
        frm_Main.Koneksi.ExecuteDirect('update hadist_suni set bhs_indonesia=' +
                                       QuotedStr(mTrans.text) + ' where id=' + ID_X);
        ShowMessage('Tersimpan');
        self.close;
      end
      else
      begin
        frm_Main.Koneksi.ExecuteDirect('update hadist_syiah set bhs_indonesia=' +
                                       QuotedStr(mTrans.text) + ' where id=' + ID_X);
        ShowMessage('Tersimpan');
        self.close;
      end
    end;
  end

  else if KITAB='TAFSIR' then
  begin
      frm_Main.Koneksi.ExecuteDirect('update tafser_trans set translate=' +
                                    QuotedStr(mTrans.text) + ' where idx=' + ID_X);
       ShowMessage('Tersimpan');
        self.close;
    end;
end;

procedure TfrmEditTrans.FormShow(Sender: TObject);
begin
  mTrans.Text:=ISI;
end;

end.

