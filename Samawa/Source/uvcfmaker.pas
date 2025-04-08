unit uvcfmaker;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls, ColorSpeedButton, ZDataset,StrUtils;

type

  { TFvcfmaker }

  TFvcfmaker = class(TForm)
    ckPrefiks: TCheckBox;
    DBGrid1: TDBGrid;
    EPrefiks: TEdit;
    mnExportVCF: TColorSpeedButton;
    Image1: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    odVCF: TSaveDialog;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure ckPrefiksChange(Sender: TObject);
    procedure mnExportVCFClick(Sender: TObject);
  private

  public

  end;

var
  Fvcfmaker: TFvcfmaker;

implementation

{$R *.lfm}

uses umain;

{ TFvcfmaker }

procedure TFvcfmaker.mnExportVCFClick(Sender: TObject);
var
  t : TStringList;
  notelp :String;
begin

  if odVCF.Execute then
  begin
  FMain.DVCF.First;

  try
    t := TStringList.Create;
    While not FMain.DVCF.EOF do begin
      if Length(FMain.DVCF.Fields[1].AsString)>10 then
      notelp:= '08' + AnsiMidStr(Trim(FMain.DVCF.Fields[1].AsString),4,16)
      else
      notelp:= FMain.DVCF.Fields[1].AsString;

      t.Add('BEGIN:VCARD');
      t.Add('VERSION:3.0');

      if ( ckPrefiks.Checked ) and ( EPrefiks.Text<>'') then
      t.Add('FN:' + EPrefiks.Text + '_' + FMain.DVCF.Fields[0].AsString)

      else
       t.Add('FN:' +  FMain.DVCF.Fields[0].AsString) ;

      t.Add('TEL;TYPE=VOICE,HOME;VALUE=text:'+ notelp);
      t.Add('END:VCARD');
      FMain.DVCF.Next;

    end;
    t.SaveToFile(odVCF.FileName);
  finally
  t.Free;
  end;

  end;

end;

procedure TFvcfmaker.ckPrefiksChange(Sender: TObject);
begin
  EPrefiks.Enabled:=ckPrefiks.Checked;
end;

end.

