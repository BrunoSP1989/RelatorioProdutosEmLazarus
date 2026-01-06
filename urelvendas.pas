unit uRelVendas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ZDataset,
  ZAbstractRODataset, RLReport, RLPDFFilter;

type

  { TForm2 }

  TForm2 = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLReport1: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    ZQuery1: TZQuery;
    ZQuery1cean: TZRawStringField;
    ZQuery1codigo: TZRawStringField;
    ZQuery1descricao: TZRawStringField;
    ZQuery1preco_venda: TZDoubleField;
    ZQuery1qtde_estoque: TZDoubleField;
    ZQuery2: TZQuery;
    ZQuery2emi_cnpj: TZRawStringField;
    ZQuery2emi_fantasia: TZRawStringField;
    ZQuery2emi_razaosocial: TZRawStringField;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);

  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }





procedure TForm2.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  // Verifica se o número da linha é par ou ímpar
  if (ZQuery1.RecNo mod 2 = 0) then
    RLBand2.Color := clBtnFace  // Cinza bem clarinho (personalizado)
  else
    RLBand2.Color := clWhite;   // Branco
end;



end.

