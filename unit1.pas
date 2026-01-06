unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls,
  DBDateTimePicker, DateTimePicker, RTTICtrls;
  { Removi 'udtm' daqui para colocar na implementation (boa prática) }

type

  { TForm1 }

  TForm1 = class(TForm)
    btnGerar: TButton;
    btnSalvarEmPdf: TButton;
    Label1: TLabel;
    procedure btnGerarClick(Sender: TObject);
    procedure btnSalvarEmPdfClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses
  udtm,uRelVendas; { A unit udtm deve vir aqui }

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    { CORREÇÃO 1: Adicionado verificação de nil para evitar erro se o DataModule não existir }
    if Assigned(udtm.DataModule1) and Assigned(udtm.DataModule1.ZConnection1) then
    begin
        { CORREÇÃO 2: Adicionado o 'then' que faltava }
        if not udtm.DataModule1.ZConnection1.Connected then
        begin
          udtm.DataModule1.ZConnection1.Connect;
        end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Ocorreu um erro inesperado na conexão: ' + E.Message);
    end;
  end;
end;

procedure TForm1.btnGerarClick(Sender: TObject);
begin
  Form2.ZQuery1.Close;
  Form2.ZQuery1.Open;
  if Form2.ZQuery1.IsEmpty then
  begin
    ShowMessage('Não há dados para imprimir.');
    Exit;
  end;
  Form2.RLReport1.PreviewModal;
end;

procedure TForm1.btnSalvarEmPdfClick(Sender: TObject);
  var
  CaminhoArquivo: String;
begin
   Form2.ZQuery1.Close;
  Form2.ZQuery1.Open;
  if Form2.ZQuery1.IsEmpty then
  begin
    ShowMessage('Não há dados para salvar em PDF.');
    Exit;
  end;
  // Define onde vai salvar (Ex: pasta do executável + nome do arquivo)
  CaminhoArquivo := ExtractFilePath(Application.ExeName) + 'RelatorioProdutos.pdf';

  // Configura o filtro no Form2
  Form2.RLPDFFilter1.FileName := CaminhoArquivo;

  // Prepara e gera
  Form2.RLReport1.Prepare;
  Form2.RLPDFFilter1.FilterPages(Form2.RLReport1.Pages);

  ShowMessage('PDF salvo com sucesso em: ' + CaminhoArquivo);
end;

end.
