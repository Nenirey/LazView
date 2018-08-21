program LazView;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads, cmem,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, printer4lazarus, fmain, Unit2, Unit3, Unit4, Unit5, ImgSize, Unit6,
  BGRABitmapTypes, print, fexif;

{$R *.res}

begin
  Application.Title:='LazView';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(Tfrmain, frmain);
  Application.CreateForm(Tfrresize, frresize);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(Tfrprint, frprint);
  Application.CreateForm(Tfrexif, frexif);
  Application.Run;
end.

