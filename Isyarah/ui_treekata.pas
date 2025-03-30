unit ui_treekata;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ZDataset,Clipbrd,StrUtils;

type

  { TfrmTreeKata }

  TfrmTreeKata = class(TForm)
    treeData: TTreeView;
    DTGetItem: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure treeDataDblClick(Sender: TObject);
  private
    function GetItem(sq:string):String;
  public
   BASIC_WORD : string ;
   CURT_WORD : string;
  end;

var
  frmTreeKata: TfrmTreeKata;

implementation

uses ui_main;

{$R *.lfm}

{ TfrmTreeKata }

procedure TfrmTreeKata.FormShow(Sender: TObject);
var
  ts1,ts2,ts3 : TStringList;
  i,x,y : integer;
  t : TStringList;
  a : String;
begin


    // Item Utama
  try
  t := TStringList.create;
    try
    ts1 := TStringList.create;
    ts1.text := GetItem('select distinct concat(utsmani,''  =  '',indonesia) as w from terjemah_kata where basic=' +
                QuotedStr(BASIC_WORD));

    for i :=  0 to ts1.Count-1 do
     begin
          Application.ProcessMessages;
          t.Add( ts1.Strings[i] );

          try
            ts2 := TStringList.Create;
            ts2.text := GetItem('Select distinct id_ayat from terjemah_kata where concat(utsmani,''  =  '',indonesia)= '
                                + QuotedStr(ts1.Strings[i]));
            for x := 0 to ts2.Count -1 do
              begin
                     Application.ProcessMessages;
                  a := GetItem('select substring(teks_ayat,1,100) as a from quran_id where id_ayat=' +
                       QuotedStr(ts2.Strings[x]));
                  t.Add(#9 + ts2.Strings[x] + ' ...... ' + a  );

              end;

        finally

        ts2.Free;
        end;

     end;

    finally
    ts1.Free;
    end;
  t.SaveToFile(ExtractFilePath(Application.ExeName) + 'tree.csv');
  treeData.LoadFromFile(ExtractFilePath(Application.ExeName) + 'tree.csv');
  finally
  t.free


  end;

end;

procedure TfrmTreeKata.treeDataDblClick(Sender: TObject);
var
  a : string;
  i : integer;
  y : string;
  k : string;
  w : string;
begin

  a := treeData.Selected.Text;

  if AnsiContainsStr(a,'..') then
  begin
    w := treeData.Selected.Parent.Text;
    i := AnsiPos('=',w);
    w := trim(AnsiMidStr(w,1,i-1));
    k := GetItem('select distinct arab_harokat from terjemah_kata where utsmani=' + QuotedStr(w) + ' limit 1');

    frm_Main.KEY_WORD_ARB:= trim(k);

    i := AnsiPos('..',a);
    y := AnsiMidStr(a,1,i-1);
    frm_Main.OpenAyatByID(y);

  end;


end;

function TfrmTreeKata.GetItem(sq:string):String;
var
  r:string;
begin

    With DTGetItem do
    begin
      close;
      sql.Clear;
      sql.Add(sq);
      open;

      While not EOF do
      begin
        r := r + Fields[0].AsString + #13;
        next;
      end;

    end;

  Result := Trim(r) ;

End;

end.

