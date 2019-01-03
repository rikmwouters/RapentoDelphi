unit Rapento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.DB,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, Data.DBXMSSQL, Data.SqlExpr,
  Data.FMTBcd, Data.Win.ADODB, FMX.Calendar, FMX.DateTimeCtrls;

type
  TForm1 = class(TForm)
    GenusLabel: TLabel;
    SpeciesLabel: TLabel;
    GenusInput: TEdit;
    SpeciesInput: TEdit;
    SubmitButton: TButton;
    ColNameLabel: TLabel;
    ColNameInput: TEdit;
    ADO_Connection: TADOConnection;
    StoredProc_AddIndividual: TADOStoredProc;
    ColDateLabel: TLabel;
    Calendar1: TCalendar;
    ColTimeLabel: TLabel;
    TimeEdit1: TTimeEdit;
    procedure SubmitButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.SubmitButtonClick(Sender: TObject);
begin
  with TAdoStoredProc.Create( nil ) do
    begin
    try
      Connection := ADO_Connection;
      ProcedureName := 'AddIndividual';
      StoredProc_AddIndividual.Parameters.CreateParameter('GivenGenusName',ftString,pdInput,255,GenusInput.Text);
      StoredProc_AddIndividual.Parameters.CreateParameter('GivenSpeciesName',ftString,pdInput,255,SpeciesInput.Text);
      StoredProc_AddIndividual.Parameters.CreateParameter('GivenCollectionName',ftString,pdInput,255,ColNameInput.Text);
      StoredProc_AddIndividual.ExecProc;
      StoredProc_AddIndividual.Parameters.Clear;
    finally
      Free;
      GenusInput.Text := '';
      SpeciesInput.Text := '';
      ColNameInput.Text := '';
    end
  end;
end;

end.
