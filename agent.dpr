program agent;

uses
  Forms,
  main in 'main.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Web Tools';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
