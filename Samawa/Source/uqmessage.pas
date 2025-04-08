unit uqmessage;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, StrUtils;

type

  { TFQMessage }

  TFQMessage = class(TForm)
    mNoTelp: TEdit;
    Label2: TLabel;
    mIsi: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    btSend: TSpeedButton;
    btReset: TSpeedButton;
    procedure btResetClick(Sender: TObject);
    procedure btSendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mIsiChange(Sender: TObject);
    procedure mNoTelpChange(Sender: TObject);
  private

  public

  end;

var
  FQMessage: TFQMessage;

implementation

{$R *.lfm}

uses uMain;
{ TFQMessage }

procedure TFQMessage.btSendClick(Sender: TObject);
begin
  if mIsi.text<>'' then
     if mNoTelp.Text<>'' then
        begin
        FMain.SendONeMessage(mNoTelp.text,mIsi.text);
        close;
        end
  else
  ShowMessage('Isi dulu nomor telepon dan Isi Teks Pesan');

  if  AnsiLeftStr(Trim(mNoTelp.Text),3)<>'628' then
    ShowMessage('Format Nomor Telepon Salah, Seharusnya diawali dengan 628 ....');
end;

procedure TFQMessage.FormShow(Sender: TObject);
begin
  btSend.Enabled:=false;
end;

procedure TFQMessage.mIsiChange(Sender: TObject);
begin
   if (LeftStr(mNoTelp.text,3)='628')  and
     (mIsi.Text<>'') then
       btSend.Enabled:=true;
end;

procedure TFQMessage.mNoTelpChange(Sender: TObject);
begin
  if (LeftStr(mNoTelp.text,3)='628')  and
     (mIsi.Text<>'') then
       btSend.Enabled:=true;
  if LeftStr(mNoTelp.Text,2)='08' then
     mNoTelp.Text:=Trim('628' + MidStr(mNoTelp.text,3,20));
end;

procedure TFQMessage.btResetClick(Sender: TObject);
begin
  mNoTelp.Clear;
  mIsi.Clear;
  btSend.Enabled:=false;
end;

end.

