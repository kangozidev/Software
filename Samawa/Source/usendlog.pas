unit usendlog;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, ComCtrls,Controls, Graphics, Dialogs, Buttons, ExtCtrls,
  RTTICtrls, IpHtml, Iphttpbroker, TplProgressBarUnit, cyProgressionPanel,
  cyAdvProgressionPanel, IdSSLOpenSSL, Clipbrd, StdCtrls, HtmlView,
   urlmon, fpsUtils;

type

  { TfrmSendLog }

  TfrmSendLog = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    lbServer: TLabel;
    Panel1: TPanel;
    pbar: TProgressBar;
    spSend: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure spSendClick(Sender: TObject);

  private
    procedure LogSend(idw,nom,nam,
              isi,id,tg_tugas,nam_tugas,nam_petugas,tg_kirim ,status,rs: string);
  public

  end;

var
  frmSendLog: TfrmSendLog;

implementation

uses umain;

{$R *.lfm}

{ TfrmSendLog }

procedure TfrmSendLog.spSendClick(Sender: TObject);
var
_idw, _nom, _nam, _isi, _id, _tg_tugas,_nam_tugas,_nam_petugas,_tg_kirim,_status:string;
j : Integer;
versi_server:string;
filep:string;
rs : String;
begin


 rs:=RandomString(10);

 With FMain.DataSend2 do
  begin
  Application.ProcessMessages;

  close;
  open;
  First;
  j := RecordCount;
  pbar.Min:=0;
  pbar.Max:=100;

   versi_server :=  FMain.SERVER_HOST + '/delete_tugas_by_id.php?id='+
                    FieldByName('J_ID').AsString + '&rs=' + rs ;
   filep        :=  ExtractFilePath(Application.ExeName) + 'send.log';

  URLDownloadToFile(nil, PChar(versi_server), PChar(filep), 0, nil) ;

    While Not Eof do
      begin
      _idw := FieldByName('IDC').AsString;
      _nom := FieldByName('CContact').AsString;
      _nam := FieldByName('CName').AsString ;
      _isi := FieldByName('IWA').AsString  ;
      _id :=  FieldByName('J_ID').AsString;
      _tg_tugas := FieldByName('J_TGL').AsString;
      _nam_tugas := FieldByName('J_Tugas').AsString;
      _nam_petugas := FieldByName('J_Pembuat').AsString;
      _tg_kirim := DateToStr(now);
      _status := FieldByName('CPost').AsString;
      if _status='+' then
       _status:='Sukses Kirim'
      else if _status='-' then
       _status:='Gagal Kirim'
      else
       _status:='Belum Kirim';

       pbar.Position:=Round(RecNo/j*100);
       LogSend(_idw, _nom, _nam, _isi, _id, _tg_tugas,_nam_tugas,_nam_petugas,_tg_kirim,_status,rs);

       Next;
        Application.ProcessMessages;
   end;
      FMain.ShowPesan('Upload Data Selesai');
      spSend.Enabled:=false;
      First;
 end;


end;

procedure TfrmSendLog.FormShow(Sender: TObject);
begin
  spSend.Enabled:=true;
  lbServer.Caption:=FMain.SERVER_HOST;
end;

procedure TfrmSendLog.LogSend(idw,nom,nam,
  isi,id,tg_tugas,nam_tugas,nam_petugas,tg_kirim,status,rs : string);
var
   sq: string;
   versi_server:string;
   filep:string;
begin
   Application.ProcessMessages;
  versi_server := FMain.SERVER_HOST +  '/insert_data.php?idw='+idw+
                                        '&nom='+nom+
                                        '&nam='+nam+
                                        '&isi='+isi+
                                        '&id='+id+
                                        '&tg_tugas='+tg_tugas+
                                        '&nam_tugas='+nam_tugas+
                                        '&nam_petugas='+nam_petugas+
                                        '&tg_kirim='+tg_kirim+
                                        '&status='+status+
                                        '&rds=' + rs ;


  filep        := ExtractFilePath(Application.ExeName) + 'send.log';

  URLDownloadToFile(nil, PChar(versi_server), PChar(filep), 0, nil) ;

end;


end.

