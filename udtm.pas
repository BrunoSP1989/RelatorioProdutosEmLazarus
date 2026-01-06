unit udtm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    ZConnection1: TZConnection;
  private

  public

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

end.

