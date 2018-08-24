unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    GroupBox1: TGroupBox;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form4: TForm4;

implementation

uses fmain;

{$R *.lfm}

{ TForm4 }

procedure TForm4.Button1Click(Sender: TObject);
begin
  filterimagen(1);
end;

procedure TForm4.Button20Click(Sender: TObject);
begin
  filterimagen(8);
end;

procedure TForm4.Button21Click(Sender: TObject);
begin
  filterimagen(11);
end;

procedure TForm4.Button22Click(Sender: TObject);
begin
  filterimagen(12);
end;

procedure TForm4.Button23Click(Sender: TObject);
begin
  filterimagen(9);
end;

procedure TForm4.Button24Click(Sender: TObject);
begin
  filterimagen(10);
end;

procedure TForm4.Button25Click(Sender: TObject);
begin
  filterimagen(16);
end;

procedure TForm4.Button10Click(Sender: TObject);
begin
  efectimagen(8);
end;

procedure TForm4.Button11Click(Sender: TObject);
begin
  filterimagen(15);
end;

procedure TForm4.Button12Click(Sender: TObject);
begin
  filterimagen(14);
end;

procedure TForm4.Button13Click(Sender: TObject);
begin
  filterimagen(13);
end;

procedure TForm4.Button14Click(Sender: TObject);
begin
  filterimagen(2);
end;

procedure TForm4.Button15Click(Sender: TObject);
begin
  filterimagen(3);
end;

procedure TForm4.Button16Click(Sender: TObject);
begin
  filterimagen(4);
end;

procedure TForm4.Button17Click(Sender: TObject);
begin
  filterimagen(5);
end;

procedure TForm4.Button18Click(Sender: TObject);
begin
  filterimagen(6);
end;

procedure TForm4.Button19Click(Sender: TObject);
begin
  filterimagen(7);
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  efectimagen(12,Form4.TrackBar1.Position);
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  efectimagen(13,Form4.TrackBar2.Position);
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  efectimagen(14,Form4.TrackBar3.Position);
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  loadpicture(carpeta+flist[ifile]);
end;

procedure TForm4.Button6Click(Sender: TObject);
begin
  efectimagen(5);
end;

procedure TForm4.Button7Click(Sender: TObject);
begin
  efectimagen(6);
end;

procedure TForm4.Button8Click(Sender: TObject);
begin
  efectimagen(7);
end;

procedure TForm4.Button9Click(Sender: TObject);
begin
  efectimagen(9);
end;

end.

