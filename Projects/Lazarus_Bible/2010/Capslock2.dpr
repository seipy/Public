program Capslock2; 
uses 
  Forms, 
  Frm_Capslock2MAIN in '..\Source\CAPSLOCK\Frm_Capslock2MAIN.PAS' {MainForm}; 
{$R *.RES} 
{$E EXE} 
begin 
  Application.Initialize; 
  Application.Title := 'Demo: Capslock2'; 
  Application.CreateForm(TMainForm, MainForm); 
  Application.Run; 
end. 
