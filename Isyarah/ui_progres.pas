unit ui_progres;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ExtCtrls,
  FXProgressBar,
  RxDBGrid,
  ZDataset;

type

  { TfrmProgress }

  TfrmProgress = class(TForm)
    RxDBGrid1: TRxDBGrid;
  private

  public

  end;

var
  frmProgress: TfrmProgress;

implementation

uses ui_main;

{$R *.lfm}

end.

