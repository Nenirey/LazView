program LazView;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads, cmem,
  {$ENDIF}
  Forms, PasLibVlcPlayer, Interfaces, fmain, fresize, fquality, feffects,
  fgoto, fthumbsize, print, fexif, fpass, abbrevia;

{$R *.res}

begin
  Application.Scaled:=True;
  Application.Title:='LazView';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(Tfrmain, frmain);
  Application.CreateForm(Tfrresize, frresize);
  Application.CreateForm(TFrquality, frquality);
  Application.CreateForm(Tfreffect, freffect);
  Application.CreateForm(Tfrgoto, frgoto);
  Application.CreateForm(Tfrthumbsize, frthumbsize);
  Application.CreateForm(Tfrprint, frprint);
  Application.CreateForm(Tfrexif, frexif);
  Application.CreateForm(Tfrpass, frpass);
  Application.Run;
end.

