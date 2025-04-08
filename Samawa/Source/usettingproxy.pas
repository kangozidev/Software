unit usettingproxy;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls, ComCtrls, Buttons, IpHtml, Iphttpbroker, FramView,uscript;

type

  { TFsettingproxy }

  TFsettingproxy = class(TForm)
    btActivation: TSpeedButton;
    btSimpanServerLog: TSpeedButton;
    btSimpanServer: TSpeedButton;
    btResetUser: TSpeedButton;
    btSimpanUser: TSpeedButton;
    ckUseProxy: TCheckBox;
    E_APP_PROV: TComboBox;
    E_APP_USER: TEdit;
    E_APP_KOTA: TEdit;
    E_APP_EMAIL: TEdit;
    E_APP_SERIAL: TEdit;
    E_APP_KODE: TEdit;
    EIP: TEdit;
    EPass: TEdit;
    Eport: TEdit;
    EUname: TEdit;
    E_HOST: TEdit;
    IpHtmlPanel1: TIpHtmlPanel;
    htpro: TIpHttpDataProvider;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lballert: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    pnReg: TPanel;
    pgSetting: TPageControl;
    Panel1: TPanel;
    pnScript: TPanel;
    btNet: TSpeedButton;
    btTag: TSpeedButton;
    btLog: TSpeedButton;
    btSimpan: TSpeedButton;
    sptest: TSpeedButton;
    tabActivation: TTabSheet;
    tabSProxy: TTabSheet;
    tabSWa: TTabSheet;
    tabSLog: TTabSheet;
    procedure btActivationClick(Sender: TObject);
    procedure btLogClick(Sender: TObject);
    procedure btNetClick(Sender: TObject);
    procedure btResetUserClick(Sender: TObject);
    procedure btSimpanClick(Sender: TObject);
    procedure btSimpanServerLogClick(Sender: TObject);
    procedure btSimpanUserClick(Sender: TObject);
    procedure btTagClick(Sender: TObject);
    procedure ckUseProxyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sptestClick(Sender: TObject);

  private
    FScriptWA:TfrmScriptWA;
    procedure SimpanAktivasi(i:integer);

  public

  end;

var
  Fsettingproxy: TFsettingproxy;

implementation

{$R *.lfm}

{ TFsettingproxy }
uses
  umain;

procedure TFsettingproxy.btSimpanClick(Sender: TObject);
begin

    with FMain do
    begin
     DConfiguration.edit;
     DConfiguration.FieldByName('PROXY_USE').AsBoolean       := ckUseProxy.Checked;
     DConfiguration.FieldByName('PROXY_SERVER').AsString     := EIP.Text;
     DConfiguration.FieldByName('PROXY_PORT').AsInteger     := StrToInt(Eport.Text);
     DConfiguration.FieldByName('PROXY_USERNAME').AsString  := EUname.text;
     DConfiguration.FieldByName('PROXY_PASSWORD').AsString  := EPass.text;
     DConfiguration.post;
    end;

    FMain.showpesan('Konfigurasi Tersimpan');
    FMain.SetConfigAppSamawa;

end;


procedure TFsettingproxy.btSimpanServerLogClick(Sender: TObject);
begin
    with FMain do
    begin
     DConfiguration.edit;
     DConfiguration.FieldByName('LOG_HOST').AsString           := E_HOST.Text;
     DConfiguration.post;
    end;

    FMain.showpesan('Konfigurasi Tersimpan');
    FMain.SetConfigAppSamawa;
end;

procedure TFsettingproxy.btSimpanUserClick(Sender: TObject);
begin

  SimpanAktivasi(0);

end;

procedure TFsettingproxy.btTagClick(Sender: TObject);
begin
  pgSetting.ActivePage:= tabSWa;
end;

procedure TFsettingproxy.btNetClick(Sender: TObject);
begin
  pgSetting.ActivePage:= tabSProxy ;
end;

procedure TFsettingproxy.btResetUserClick(Sender: TObject);
begin


   if Dialogs.MessageDlg('Apakah Anda Akan Mereset Data ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
        E_APP_USER.Text:= 'KangOzi';
        E_APP_EMAIL.text:='kangozicorner@gmail.com';
        E_APP_KOTA.Text:='Solok';
        E_APP_PROV.Text:= 'Sumatera Barat';
        E_APP_KODE.Text:='999999';
        E_APP_SERIAL.text := '000000' ;
        SimpanAktivasi(1);
    end;


end;


procedure TFsettingproxy.btLogClick(Sender: TObject);
begin
  pgSetting.ActivePage:= tabSLog;
end;

procedure TFsettingproxy.btActivationClick(Sender: TObject);
begin
  pgSetting.ActivePage:= tabActivation;

 if (E_APP_USER.text='KangOzi') or
    (E_APP_EMAIL.text='kangozicorner@gmail.com') then
    begin
     tabActivation.Show;
     lballert.Visible:=true;
    end

end;

procedure TFsettingproxy.ckUseProxyClick(Sender: TObject);
begin
  Panel1.Enabled := ckUseProxy.Checked;
end;

procedure TFsettingproxy.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  if (E_APP_USER.Text='KangOzi') or
     (E_APP_EMAIL.Text='kangozicorner@gmail.com') then
        Application.Terminate;

end;

procedure TFsettingproxy.FormShow(Sender: TObject);
var
    f: TStringlist;
begin

    f:= TStringList.create;
    f.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'support/regact.cfd');

    pgSetting.ShowTabs:=false;
    FMain.DConfiguration.open;;
    ckUseProxy.Checked   := FMain.PROXY_USE;
    EIP.Text             := FMain.PROXY_SERVER;
    Eport.text           := IntToStr(FMain.PROXY_PORT);
    EUname.text          := FMain.PROXY_USERNAME;
    EPass.text           := FMain.PROXY_PASSWORD;


    E_HOST.Text := FMain.SERVER_HOST;


    E_APP_USER.text := FMain.G_USER_APP;
    E_APP_EMAIL.Text:= FMain.G_EMAIL;
    E_APP_KOTA.text := FMain.G_KOTA ;
    E_APP_SERIAL.text := f.Strings[3];
    E_APP_KODE.text :=  f.Strings[4];
    E_APP_PROV.Text:=   FMain.G_PROV;

    if Assigned(FScriptWA) then FScriptWA.free;
    FScriptWA := TfrmScriptWA.create(self);

    With FScriptWA do
    begin
      Parent:=pnScript;
      Align:=alClient;
      BorderStyle:=bsNone;
      Show;
    end;



end;

procedure TFsettingproxy.sptestClick(Sender: TObject);
begin

  IpHtmlPanel1.OpenURL(E_HOST.Text);

end;

procedure TFsettingproxy.SimpanAktivasi(i:integer);
var
    f: TStringlist;
begin

  if i =0 then
   begin
   if E_APP_PROV.Text='' then
   begin
       FMain.ShowPesan('Masukan Nama Propinsi');
       exit;
   end;

   if E_APP_KOTA.Text='' then
   begin
       FMain.ShowPesan('Masukan Nama Kota');
       exit;
   end;


   if E_APP_USER.Text='' then
   begin
       FMain.ShowPesan('Masukan Nama Pengguna Aplikasi');
       exit;
   end;

  end;

   with FMain do
    begin
     DConfiguration.edit;
     DConfiguration.FieldByName('APP_USER').AsString       := E_APP_USER.text;
     DConfiguration.FieldByName('APP_SERIAL').AsString     := E_APP_SERIAL.Text;
     DConfiguration.FieldByName('APP_AKTIVASI').AsString   := E_APP_KODE.text;
     DConfiguration.FieldByName('APP_EMAIL').AsString      := E_APP_EMAIL.Text;
     DConfiguration.FieldByName('APP_KOTA').AsString       := E_APP_KOTA.text;
     DConfiguration.FieldByName('APP_PROV').AsString       := E_APP_PROV.text;
     DConfiguration.post;
    end;


    f:= TStringList.create;
    f.Add( E_APP_USER.text );
    f.Add( E_APP_EMAIL.Text);
    f.Add( E_APP_KOTA.text);
    f.Add( E_APP_SERIAL.Text);
    f.Add( E_APP_KODE.text);
    f.SaveToFile(ExtractFilePath(Application.ExeName)+ 'support/regact.cfd');


    if i =0 then
       FMain.showpesan('Konfigurasi Tersimpan , Silahkan Jalankan Ulang SamaWA')
    else
       FMain.showpesan('Konfigurasi Reset');

    FMain.SetConfigAppSamawa;
    Application.Terminate;

end;

end.

