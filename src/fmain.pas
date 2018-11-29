unit fmain;

{$mode objfpc}{$H+}
interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, Menus, ExtDlgs, LazFileUtils, FileUtil, IntfGraphics,
  types, LCLType, ShellCtrls, FPImage, fresize, fquality, feffects, fgoto, fthumbsize,
  LazUTF8, print{$IFDEF WINDOWS}, Registry, Windows, Windirs{$ENDIF},
  BGRABitmapTypes, BGRABitmap, BGRAThumbnail, BGRAAnimatedGif,
  DateUtils, Math, ImgSize, BGRAGifFormat, Printers, LCLintf, fexif, INIFiles, LCLTranslator,
  Imaging, ImagingClasses, ImagingComponents, ImagingTypes, ImagingCanvases, Variants, Clipbrd;

type

  { Tfrmain }

  Tfrmain = class(TForm)
    Image1: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    mnuToolBarInFull: TMenuItem;
    mnuAutoRotate: TMenuItem;
    mnuResize: TMenuItem;
    mnuWindowEffects: TMenuItem;
    mnuRedo: TMenuItem;
    mnuUndo: TMenuItem;
    mnuCrop: TMenuItem;
    mnuAlwaysOnTop: TMenuItem;
    mnuLanguage: TMenuItem;
    mnuFile: TMenuItem;
    mnuOpen: TMenuItem;
    mnuPrint: TMenuItem;
    mnuDeleteFile: TMenuItem;
    MenuItem71: TMenuItem;
    mnuEXIF: TMenuItem;
    mnufileopen: TMenuItem;
    MenuItem11: TMenuItem;
    mnuEdit: TMenuItem;
    mnuPaste: TMenuItem;
    mnuCopy: TMenuItem;
    mnuEffects: TMenuItem;
    mnuSaveAs: TMenuItem;
    mnuGrayscale: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    mnuTools: TMenuItem;
    mnuBGR: TMenuItem;
    mnuRBG: TMenuItem;
    mnuGRB: TMenuItem;
    mnuQuitRed: TMenuItem;
    mnuQuitGreen: TMenuItem;
    mnuQuitBlue: TMenuItem;
    MenuItem26: TMenuItem;
    mnuNoise: TMenuItem;
    mnuTv: TMenuItem;
    mnuView: TMenuItem;
    mnuExit: TMenuItem;
    mnuShowThumbs: TMenuItem;
    mnuBRG: TMenuItem;
    mnuGBR: TMenuItem;
    MenuItem38: TMenuItem;
    mnuHighlightRed: TMenuItem;
    mnuHelp: TMenuItem;
    mnuHighlightGreen: TMenuItem;
    mnuHighlightBlue: TMenuItem;
    MenuItem42: TMenuItem;
    mnuCompact: TMenuItem;
    mnuGoTo: TMenuItem;
    MenuItem45: TMenuItem;
    mnuAntialiasing: TMenuItem;
    MenuItem47: TMenuItem;
    mnuDesktopImage: TMenuItem;
    mnuDesktopExpand: TMenuItem;
    mnuAbout: TMenuItem;
    mnuDesktopCenter: TMenuItem;
    mnuDesktopMosaic: TMenuItem;
    mnuDesktopStrech: TMenuItem;
    mnuThumbCustom: TMenuItem;
    mnuStrech: TMenuItem;
    mnuNegative: TMenuItem;
    mnuSmooth: TMenuItem;
    mnuRealMode: TMenuItem;
    mnuTreeView: TMenuItem;
    mnuFlipH: TMenuItem;
    mnuSelect: TMenuItem;
    mnuToolBar: TMenuItem;
    mnuStatusBar: TMenuItem;
    mnuThumbSize: TMenuItem;
    mnuThumb32: TMenuItem;
    mnuThumb64: TMenuItem;
    mnuThumb128: TMenuItem;
    mnuMosaic: TMenuItem;
    mnuSwirl: TMenuItem;
    mnuMenus: TMenuItem;
    mnuFlipV: TMenuItem;
    mnuRotateL: TMenuItem;
    mnuRotateR: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    PopupMenu1: TPopupMenu;
    SavePictureDialog1: TSavePictureDialog;
    ScrollBox1: TScrollBox;
    sboxthumb: TScrollBox;
    Shape1: TShape;
    ShellTreeView1: TShellTreeView;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    Timer5: TTimer;
    ToolBar1: TToolBar;
    tbPrevImage: TToolButton;
    tbZoomOut: TToolButton;
    tbAdjust: TToolButton;
    tbPlayShow: TToolButton;
    tbRandom: TToolButton;
    tbZoom100: TToolButton;
    tbReload: TToolButton;
    tbShowTreeView: TToolButton;
    tbShowThumbs: TToolButton;
    tbLastImage: TToolButton;
    tbSelect: TToolButton;
    tbPrevFrame: TToolButton;
    tbNextImage: TToolButton;
    tbNextFrame: TToolButton;
    tbPauseAnim: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    tbStrech: TToolButton;
    ToolButton25: TToolButton;
    tbSlowAnim: TToolButton;
    tbFastAnim: TToolButton;
    tbFullScreen: TToolButton;
    tbFlipHorizontal: TToolButton;
    tbFlipVertical: TToolButton;
    tbPrint: TToolButton;
    tbFirstImage: TToolButton;
    tbInformation: TToolButton;
    tbRotateLeft: TToolButton;
    tbRotateRight: TToolButton;
    tbExit: TToolButton;
    tbZoomIn: TToolButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuAlwaysOnTopClick(Sender: TObject);
    procedure mnuAutoRotateClick(Sender: TObject);
    procedure mnuContrastLessClick(Sender: TObject);
    procedure mnuContrastPlusClick(Sender: TObject);
    procedure mnuCropClick(Sender: TObject);
    procedure mnuOpenClick(Sender: TObject);
    procedure mnuPasteClick(Sender: TObject);
    procedure mnuCopyClick(Sender: TObject);
    procedure mnuRedoClick(Sender: TObject);
    procedure mnuSaveAsClick(Sender: TObject);
    procedure mnuGrayscaleClick(Sender: TObject);
    procedure mnuBGRClick(Sender: TObject);
    procedure mnuRBGClick(Sender: TObject);
    procedure mnuGRBClick(Sender: TObject);
    procedure mnuQuitRedClick(Sender: TObject);
    procedure mnuQuitGreenClick(Sender: TObject);
    procedure mnuQuitBlueClick(Sender: TObject);
    procedure mnuNoiseClick(Sender: TObject);
    procedure mnuToolBarInFullClick(Sender: TObject);
    procedure mnuTvClick(Sender: TObject);
    procedure mnuToolsClick(Sender: TObject);
    procedure mnuDeleteFileClick(Sender: TObject);
    procedure mnuEXIFClick(Sender: TObject);
    procedure mnuShowThumbsClick(Sender: TObject);
    procedure mnuResizeClick(Sender: TObject);
    procedure mnuBRGClick(Sender: TObject);
    procedure mnuGBRClick(Sender: TObject);
    procedure mnuBrightPlusClick(Sender: TObject);
    procedure mnuBrightLessClick(Sender: TObject);
    procedure mnuHighlightRedClick(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuHighlightGreenClick(Sender: TObject);
    procedure mnuHighlightBlueClick(Sender: TObject);
    procedure mnuCompactClick(Sender: TObject);
    procedure mnuGoToClick(Sender: TObject);
    procedure mnuAntialiasingClick(Sender: TObject);
    procedure mnuDesktopExpandClick(Sender: TObject);
    procedure mnuDesktopCenterClick(Sender: TObject);
    procedure mnuDesktopMosaicClick(Sender: TObject);
    procedure mnuDesktopStrechClick(Sender: TObject);
    procedure mnuThumbCustomClick(Sender: TObject);
    procedure mnuStrechClick(Sender: TObject);
    procedure mnuUndoClick(Sender: TObject);
    procedure mnuWindowEffectsClick(Sender: TObject);
    procedure mnuNegativeClick(Sender: TObject);
    procedure mnuSmoothClick(Sender: TObject);
    procedure mnuRealModeClick(Sender: TObject);
    procedure mnuTreeViewClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure mnuToolBarClick(Sender: TObject);
    procedure mnuStatusBarClick(Sender: TObject);
    procedure mnuThumb32Click(Sender: TObject);
    procedure mnuThumb64Click(Sender: TObject);
    procedure mnuThumb128Click(Sender: TObject);
    procedure mnuMosaicClick(Sender: TObject);
    procedure mnuSwirlClick(Sender: TObject);
    procedure mnuMenusClick(Sender: TObject);
    procedure mnuFlipHClick(Sender: TObject);
    procedure mnuFlipVClick(Sender: TObject);
    procedure mnuRotateLClick(Sender: TObject);
    procedure mnuRotateRClick(Sender: TObject);
    procedure PairSplitterSide2Resize(Sender: TObject);
    procedure PairSplitterSide3Resize(Sender: TObject);
    procedure PopupMenu1Close(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure sboxthumbPaint(Sender: TObject);
    procedure ScrollBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ScrollBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBox1Paint(Sender: TObject);
    procedure sboxthumbMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sboxthumbMouseLeave(Sender: TObject);
    procedure sboxthumbMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sboxthumbMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseLeave(Sender: TObject);
    procedure Shape1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Shape1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure ShellTreeView1Click(Sender: TObject);
    procedure ShellTreeView1Enter(Sender: TObject);
    procedure ShellTreeView1Expanded(Sender: TObject; Node: TTreeNode);
    procedure ShellTreeView1SelectionChanged(Sender: TObject);
    procedure tbFirstImageClick(Sender: TObject);
    procedure tbInformationClick(Sender: TObject);
    procedure tbLastImageClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure ToolBar1MouseLeave(Sender: TObject);
    procedure ToolBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tbZoomOutClick(Sender: TObject);
    procedure tbAdjustClick(Sender: TObject);
    procedure tbPlayShowClick(Sender: TObject);
    procedure tbRandomClick(Sender: TObject);
    procedure tbZoom100Click(Sender: TObject);
    procedure tbReloadClick(Sender: TObject);
    procedure tbShowTreeViewClick(Sender: TObject);
    procedure tbSelectClick(Sender: TObject);
    procedure tbPrevFrameClick(Sender: TObject);
    procedure tbPrevImageClick(Sender: TObject);
    procedure tbNextFrameClick(Sender: TObject);
    procedure tbPauseAnimClick(Sender: TObject);
    procedure tbStrechClick(Sender: TObject);
    procedure tbSlowAnimClick(Sender: TObject);
    procedure tbFastAnimClick(Sender: TObject);
    procedure tbNextImageClick(Sender: TObject);
    procedure tbFullScreenClick(Sender: TObject);
    procedure tbFlipHorizontalClick(Sender: TObject);
    procedure tbFlipVerticalClick(Sender: TObject);
    procedure tbPrintClick(Sender: TObject);
    procedure tbRotateLeftClick(Sender: TObject);
    procedure tbRotateRightClick(Sender: TObject);
    procedure tbExitClick(Sender: TObject);
    procedure tbZoomInClick(Sender: TObject);
    procedure mnuLanguageClick(Sender:TObject);
  private
    { private declarations }
  public
    { public declarations }

  end;

type tthumbimage = class(Extctrls.TImage)
  procedure thumbclick(Sender:TObject);
  procedure thumbmousedown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  procedure thumbmousemove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  procedure thumbmouseup(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  procedure thumbmouseleave(Sender: TObject);
end;

type
  thumbsthread = class (TThread)
  private
   done:boolean;
   thumb:Graphics.TBitMap;
   thumbindex:integer;
   iname:string;
   thumbpath:string;
   ipublic:integer;
   procedure stop;
   procedure createallimages;
   procedure createsingleimage;
   procedure refreshthumbs;
   procedure showthumbs;
  protected
   procedure Execute; override;
  public
   Constructor Create(CreateSuspended:Boolean);
   //procedure stop;
end;

Const
  mosaicsize=10;

var
  frmain: Tfrmain;
  full,ifgif,ifapng,startdraw,startselect,compactmode:boolean;
  flist:TStringList;
  nfile,ifile,ndir,idir:LongInt;
  carpeta:string;
  fwidth,fheight,fxpos,fypos,imgx,imgy:longint;
  aleatorio:boolean=false;
  ththumbs:thumbsthread;
  showthumbs:boolean=false;
  thumbsize:integer=64;
  hidetoolbardelay:integer=5;
  modethumb:boolean;//when the image is too large and prefere this for performance
  folderchange:boolean=true;
  starting:boolean=true;
  BGRAgif:TBGRAAnimatedGif;
  APNGImage: ImagingClasses.TMultiImage;
  APNGDelays:Array of integer;
  scrollchange:boolean=true;
  mosaic:Graphics.TBitmap;
  mosaicmousedown:boolean=false;
  mosaicscrollposition:integer;
  mosaicmouseposition:integer;
  title:string;
  ifallthumbs:boolean;
  realimgwidth,realimgheight:LongInt;
  inprocessanim:boolean;
  puntos:array of int64;
  creados:array of boolean;
  refreshingthumb:boolean=false;
  scrollthumbpos:integer;
  xpercent,ypercent,rigthpercent,bottompercent,wpercent,hpercent:float;
  exactx,exacty,exactright,exactbottom,exactw,exacth:int64;
  //This is for Undo/Redo function
  historyeditbitmap:array of Graphics.TBitmap;
  historyeditbgragif:array of TBGRAAnimatedGif;
  historyeditapng:array of ImagingClasses.TMultiImage;
  historyindex:integer;
  shapemousedown:boolean=false;
  shaperect:TRect;
  validx,validy,validw,validh:integer;
  procedure rendermosaic;
  procedure fullsc;
  procedure compact;
  procedure showthumbnails;
  function UTF16LongName(const FileName: String): UnicodeString;
  procedure filterimagen(filter:integer;nivel:float=0);
  procedure efectimagen(efect:integer;nivel:integer=5000);
  procedure loadpicture(fimagen:string;restorezoom:boolean=true;scrollthumbs:boolean=true;realimage:boolean=false);
  procedure saveconfig;
  procedure extractrealtivearea;
implementation

uses
  dGlobal, dMetadata;
{$R *.lfm}

{ Tfrmain }
procedure sethistory;
var
   i:integer;
begin
  for i:=0 to 1 do
  begin
    if Assigned(historyeditbgragif) then
    begin
      if Length(historyeditbgragif)>=i+1 then
        FreeAndNil(historyeditbgragif[i]);
    end;
    if Assigned(historyeditapng) then
    begin
      if Length(historyeditapng)>=i+1 then
        FreeAndNil(historyeditapng[i]);
    end;
    if Assigned(historyeditbitmap) then
    begin
      if Length(historyeditbitmap)>=i+1 then
        FreeAndNil(historyeditbitmap[i]);
    end;
  end;
  if ifgif then
  begin
    SetLength(historyeditbgragif,1);
    historyeditbgragif[Length(historyeditbgragif)-1]:=TBGRAAnimatedGif.Create;
    historyeditbgragif[Length(historyeditbgragif)-1]:=BGRAGif;
    historyindex:=Length(historyeditbgragif);
  end;
  if ifapng then
  begin
    SetLength(historyeditapng,1);
    historyeditapng[Length(historyeditapng)-1]:=ImagingClasses.TMultiImage.Create;
    historyeditapng[Length(historyeditapng)-1].Assign(APNGImage);
    historyindex:=Length(historyeditapng);
  end;
  if (ifgif=false) and (ifapng=false) then
  begin
    SetLength(historyeditbitmap,1);
    historyeditbitmap[Length(historyeditbitmap)-1]:=Graphics.TBitmap.Create;
    historyeditbitmap[Length(historyeditbitmap)-1].Assign(frmain.Image1.Picture.Bitmap);
    historyindex:=Length(historyeditbitmap);
  end;
end;

procedure setafterhistory;
begin
  if ifgif then
  begin
    SetLength(historyeditbgragif,2);
    historyeditbgragif[Length(historyeditbgragif)-1]:=TBGRAAnimatedGif.Create;
    historyeditbgragif[Length(historyeditbgragif)-1]:=BGRAGif;
    frmain.mnuUndo.Enabled:=true;
  end;
  if ifapng then
  begin
    SetLength(historyeditapng,2);
    historyeditapng[Length(historyeditapng)-1]:=ImagingClasses.TMultiImage.Create;
    historyeditapng[Length(historyeditapng)-1].Assign(APNGImage);
    frmain.mnuUndo.Enabled:=true;
  end;
  if (ifgif=false) and (ifapng=false) then
  begin
    SetLength(historyeditbitmap,2);
    historyeditbitmap[Length(historyeditbitmap)-1]:=Graphics.TBitmap.Create;
    historyeditbitmap[Length(historyeditbitmap)-1].Assign(frmain.Image1.Picture.Bitmap);
    frmain.mnuUndo.Enabled:=true;
  end;
end;

procedure extractrealtivearea;
begin
  xpercent:=((frmain.Shape1.BaseBounds.Left-frmain.Image1.DestRect.Left)/frmain.Image1.DestRect.Width)*100;
  ypercent:=((frmain.Shape1.BaseBounds.Top-frmain.Image1.DestRect.Top)/frmain.Image1.DestRect.Height)*100;
  rigthpercent:=((frmain.Shape1.BaseBounds.Right-frmain.Image1.DestRect.Left)/frmain.Image1.DestRect.Width)*100;
  bottompercent:=((frmain.Shape1.BaseBounds.Bottom-frmain.Image1.DestRect.Top)/frmain.Image1.DestRect.Height)*100;
  wpercent:=(frmain.Shape1.Width/frmain.Image1.DestRect.Width)*100;
  hpercent:=(frmain.Shape1.Height/frmain.Image1.DestRect.Height)*100;

  exactx:=Round(xpercent*0.01*frmain.Image1.Picture.Bitmap.Width);
  exacty:=Round(ypercent*0.01*frmain.Image1.Picture.Bitmap.Height);
  exactright:=Round(rigthpercent*0.01*frmain.Image1.Picture.Bitmap.Width);
  exactbottom:=Round(bottompercent*0.01*frmain.Image1.Picture.Bitmap.Height);
  exactw:=Round(wpercent*0.01*frmain.Image1.Picture.Bitmap.Width);
  exacth:=Round(hpercent*0.01*frmain.Image1.Picture.Bitmap.Height);
end;

procedure showmainmenu(ifshow:boolean);
begin
  with frMain do
  begin
    if ifshow then
    begin
      Menu := MainMenu1;
      {$IFDEF MSWINDOWS}
      // Workaround: on Windows need to recreate window to properly recalculate children sizes.
      saveconfig;
      RecreateWnd(frMain);
      {$ENDIF}
      {$IFDEF LINUX}
      {$IFDEF LCLQT5}
      // Workaround: on Windows need to recreate window to properly recalculate children sizes.
      saveconfig;
      RecreateWnd(frMain);
      {$ENDIF}
      {$ENDIF}
    end
    else if Assigned(Menu) then
    begin
      Menu := nil;
    end;
  end;
end;

procedure saveconfig;
var
   iniconfigfile:TMEMINIFile;
   i:integer;
begin
  if FileExists(ExtractFilePath(Application.Params[0])+'lazview.ini') then
    iniconfigfile:=TMEMINIFile.Create(ExtractFilePath(Application.Params[0])+'lazview.ini')
  else
    iniconfigfile:=TMEMINIFile.Create(GetAppConfigDir(false)+'lazview.ini');
  case frmain.WindowState of
  wsMaximized:
    begin
      iniconfigfile.WriteString('Config','mainwindowstate','wsMaximized');
    end;
  wsNormal:
    begin
      iniconfigfile.WriteString('Config','mainwindowstate','wsNormal');
      iniconfigfile.WriteInteger('Config','mainwindowxpos',frmain.Left);
      iniconfigfile.WriteInteger('Config','mainwindowypos',frmain.Top);
      iniconfigfile.WriteInteger('Config','mainwindowwidth',frmain.Width);
      iniconfigfile.WriteInteger('Config','mainwindowheight',frmain.Height);
    end;
  end;
  iniconfigfile.WriteBool('Config','compactmode',compactmode);
  iniconfigfile.WriteBool('Config','showthumbs',showthumbs);
  for i:=0 to frmain.mnuLanguage.Count-1 do
  begin
    if frmain.mnuLanguage.Items[i].Checked then
      iniconfigfile.WriteString('Config','language',frmain.mnuLanguage.Items[i].Caption);
  end;
  iniconfigfile.WriteBool('Config','stayontop',frmain.mnuAlwaysOnTop.Checked);
  iniconfigfile.WriteBool('Config','backgroundmosaic',frmain.mnuMosaic.Checked);
  iniconfigfile.WriteInteger('Config','thumbpanelsize',thumbsize);
  iniconfigfile.UpdateFile;
  //iniconfigfile.Free;
  FreeAndNil(iniconfigfile);
end;

procedure loadconfig;
var
   iniconfigfile:TMEMINIFile;
   tmplang:string;
   tmpstayontop,tmpbackgroundmosaic:boolean;
   i:integer;
begin
  if FileExists(ExtractFilePath(Application.Params[0])+'lazview.ini') then
    iniconfigfile:=TMEMINIFile.Create(ExtractFilePath(Application.Params[0])+'lazview.ini')
  else
    iniconfigfile:=TMEMINIFile.Create(GetAppConfigDir(false)+'lazview.ini');
    if iniconfigfile.ReadBool('Config','compactmode',compactmode) then
    compact;
  case iniconfigfile.ReadString('Config','mainwindowstate','wsMaximized') of
  'wsMaximized':
    begin
      frmain.WindowState:=wsMaximized;
    end;
  'wsNormal':
    begin
      frmain.WindowState:=wsNormal;
      frmain.Left:=iniconfigfile.ReadInteger('Config','mainwindowxpos',frmain.Left);
      frmain.Top:=iniconfigfile.ReadInteger('Config','mainwindowypos',frmain.Top);
      frmain.Width:=iniconfigfile.ReadInteger('Config','mainwindowwidth',frmain.Width);
      frmain.Height:=iniconfigfile.ReadInteger('Config','mainwindowheight',frmain.Height);
    end;
  end;
  if iniconfigfile.ReadBool('Config','showthumbs',showthumbs) then
  begin
    frmain.mnuShowThumbs.Checked:=true;
    frmain.tbShowThumbs.Down:=true;
    showthumbs:=true;
    frmain.sboxthumb.Visible:=true;
    if frmain.StatusBar1.Visible then
      frmain.Splitter2.Top:=frmain.StatusBar1.Top-frmain.Splitter2.Height+frmain.StatusBar1.Height-iniconfigfile.ReadInteger('Config','thumbpanelsize',64)
    else
      frmain.Splitter2.Top:=frmain.Height-frmain.Splitter2.Height-iniconfigfile.ReadInteger('Config','thumbpanelsize',64);
    thumbsize:=frmain.sboxthumb.Height;
    frmain.PairSplitterSide2Resize(nil);
  end
  else
  begin
    if frmain.StatusBar1.Visible then
      frmain.Splitter2.Top:=frmain.StatusBar1.Top
    else
      frmain.Splitter2.Top:=frmain.Height;
  end;
  tmplang:=iniconfigfile.ReadString('Config','language','en');
  SetDefaultLang(tmplang);
  for i:=0 to frmain.mnuLanguage.Count-1 do
  begin
    if frmain.mnuLanguage.Items[i].Caption<>tmplang then
      frmain.mnuLanguage.Items[i].Checked:=false
    else
      frmain.mnuLanguage.Items[i].Checked:=true;
  end;
  tmpstayontop:=iniconfigfile.ReadBool('Config','stayontop',false);
  if tmpstayontop then
  begin
    frmain.FormStyle:=fsSystemStayOnTop;
    frmain.mnuAlwaysOnTop.Checked:=true;
  end;
  tmpbackgroundmosaic:=iniconfigfile.ReadBool('Config','backgroundmosaic',frmain.mnuMosaic.Checked);
  if tmpbackgroundmosaic then
  begin
    mosaic:=Graphics.TBitmap.Create;
    rendermosaic;
    frmain.sboxthumb.Repaint;
    frmain.Splitter2.Color:=clWhite;
    frmain.mnuMosaic.Checked:=true;
  end
  else
    frmain.mnuMosaic.Checked:=false;
  //iniconfigfile.Free;
  FreeAndNil(iniconfigfile);
end;

procedure showthumbnails;
begin
  frmain.mnuShowThumbs.Checked:=true;
  frmain.tbShowThumbs.Down:=true;
  showthumbs:=true;
  frmain.sboxthumb.Visible:=true;
  if frmain.StatusBar1.Visible then
    frmain.Splitter2.Top:=frmain.StatusBar1.Top-thumbsize-18
  else
    frmain.Splitter2.Top:=frmain.StatusBar1.Top-thumbsize-18-frmain.StatusBar1.Height;
end;

procedure compact;
begin
    fwidth:=frmain.Width;
    fheight:=frmain.Height;
    frmain.ToolBar1.Visible:=false;
    frmain.StatusBar1.Visible:=false;


    frmain.ScrollBox1.AnchorSideTop.Control:=frmain;
    frmain.ScrollBox1.AnchorSideTop.Side:=asrTop;


    frmain.sboxthumb.AnchorSideBottom.Control:=frmain;
    frmain.sboxthumb.AnchorSideBottom.Side:=asrBottom;

    frmain.MainMenu1.Items.Visible:=false;
    compactmode:=true;
end;

function UTF16LongName(const FileName: String): UnicodeString;
var
  Temp: PWideChar;
begin
  if Pos('\\', FileName) = 0 then
    Result := '\\?\' + UTF8Decode(FileName)
  else begin
    Result := '\\?\UNC\' + UTF8Decode(Copy(FileName, 3, MaxInt));
  end;
  Temp := Pointer(Result) + 4;
  while Temp^ <> #0 do
  begin
    if Temp^ = '/' then Temp^:= '\';
      Inc(Temp);
  end;
  if ((Temp - 1)^ = DriveSeparator) then Result:= Result + '\';
end;

procedure scrollanim;
var
  center,i:integer;
begin
  if Length(puntos)>ifile then
  begin
    inprocessanim:=true;
    i:=frmain.sboxthumb.HorzScrollBar.Position;
    center:=puntos[ifile]-Round(frmain.Splitter2.Width/2)+Round(thumbsize/2)+1;
    if i<center then
    begin
      //ShowMessage('Left');
      if (center-i)>200 then
        i:=center;
      while i<center do
      begin
        {$IFDEF WINDOWS}
        sleep(1);
        {$ELSE}
        sleep(10);
        {$ENDIF}
        if (center-i)>100 then
          i:=i+50
        else
        begin
          if (center-i)>20 then
            i:=i+10
          else
            i:=i+1;
        end;
        frmain.sboxthumb.HorzScrollBar.Position:=i;
        Application.ProcessMessages;
      end;
    end;

    if i>center then
    begin
      //ShowMessage('Right');
      if i>(center+200) then
        i:=center;
      while  i>center do
      begin
        {$IFDEF WINDOWS}
        sleep(1);
        {$ELSE}
        sleep(10);
        {$ENDIF}
        if i>(center+100) then
          i:=i-50
        else
        begin
          if i>(center+20) then
            i:=i-10
          else
            i:=i-1;
        end;
        frmain.sboxthumb.HorzScrollBar.Position:=i;
        Application.ProcessMessages;
      end;
    end;
    frmain.sboxthumb.HorzScrollBar.Position:=puntos[ifile]-Round(frmain.Splitter2.Width/2)+Round(thumbsize/2)+1;
    inprocessanim:=false;
  end;
end;

procedure rendermosaic;
var
   x,y,xm,ym:integer;
   xt,yt:boolean;
begin
  xt:=false;
  yt:=false;
  mosaic.Width:=Screen.Width;
  mosaic.Height:=Screen.Height;
  mosaic.Canvas.Brush.Color:=clGray;
  mosaic.Canvas.Pen.Color:=clWhite;
  xm:=Round(mosaic.Width/mosaicsize);
  ym:=Round(mosaic.Height/mosaicsize);
  for y:=0 to ym do
  begin
    //ShowMessage('Vertical draw');
    yt:=not yt;
    for x:=0 to xm do
    begin
      //ShowMessage('Horizontal draw');
      if x=0 then
        xt:=not yt;
      xt:=not xt;
      if xt then
      begin
        mosaic.Canvas.Brush.Color:=clWhite;
        mosaic.Canvas.Pen.Color:=clWhite;
      end
      else
      begin
        mosaic.Canvas.Brush.Color:=clGray;
        mosaic.Canvas.Pen.Color:=clGray;
      end;
      mosaic.Canvas.Rectangle(x*mosaicsize,y*mosaicsize,x*mosaicsize+mosaicsize,y*mosaicsize+mosaicsize);
    end;
  end;
  frmain.ScrollBox1.Canvas.Draw(0,0,mosaic);
  frmain.sboxthumb.Canvas.Draw(0,0,mosaic);
end;

procedure realmode;
begin
  if Assigned(flist) and frmain.Image1.Visible and modethumb then
  begin
    loadpicture(carpeta+flist[ifile],true,true,true);
  end;
end;

function zoomfactor(RealWidth:integer;RealHeight:integer;ActualWidth:integer;ActualHeight:integer):string;
var
  widthpercent,heightpercent,totalpercent:integer;
begin
  widthpercent:=Round((ActualWidth/RealWidth)*100);
  heightpercent:=Round((ActualHeight/RealHeight)*100);
  totalpercent:=Round((widthpercent+heightpercent) div 2);
  result:=inttostr(totalpercent);
end;

procedure calculateaspectwidth(actualwidth:integer;actualheight:integer;newheight:integer;var outwidth:integer);
begin
  outwidth:=newheight*actualwidth div actualheight;
end;

procedure calculateaspectheight(actualwidth:integer;actualheight:integer;newwidth:integer;var outheight:integer);
begin
  outheight:=newwidth*actualheight div actualwidth;
end;

function prettytime(ms:integer):string;
begin
  if ms>=60000 then
    result:=floattostr(RoundTo((ms / 1000) / 60,-2))+' min';
  if ms>=1000 then
    result:=floattostr(RoundTo(ms / 1000,-2))+' seg';
  if ms<1000 then
    result:=inttostr(ms)+' ms';
end;

procedure resizeto(w:integer;h:integer);
var
   tmpbitmap:BGRABitmap.TBGRABitmap;
   i:integer;
   tmpgif:TBGRAAnimatedGif;
begin
  realmode;
  if ifgif then
  begin
    tmpgif:=TBGRAAnimatedGif.Create;
    tmpgif.SetSize(w,h);
    for i:=0 to BGRAGif.Count-1 do
    begin
      tmpbitmap:=BGRABitmap.TBGRABitmap.Create(w,h);
      BGRAGif.CurrentImage:=i;
      tmpbitmap.Canvas.CopyRect(Types.Rect(0,0,w,h),BGRAGif.Bitmap.Canvas,Types.Rect(0,0,BGRAGif.Width,BGRAGif.Height));
      tmpgif.InsertFrame(i,tmpbitmap,0,0,BGRAGif.FrameDelayMs[i],BGRAGif.FrameDisposeMode[i],BGRAGif.FrameHasLocalPalette[i]);
      //tmpbitmap.Destroy;
      FreeAndNil(tmpbitmap);
    end;
    tmpgif.LoopCount:=BGRAGif.LoopCount;
    BGRAGif.SetSize(w,h);
    BGRAGif:=tmpgif;
  end;
  if ifapng then
  begin
    APNGImage.ResizeImages(w,h,rfLanczos);
  end;
  if ifgif=false and ifapng=false then
  begin
    tmpbitmap:=BGRABitmap.TBGRABitmap.Create(w,h);
    tmpbitmap.Canvas.CopyRect(Types.Rect(0,0,w,h),frmain.Image1.Picture.Bitmap.Canvas,Types.Rect(0,0,frmain.Image1.Picture.Bitmap.Width,frmain.Image1.Picture.Bitmap.Height));
    frmain.Image1.Picture.Bitmap.Assign(tmpbitmap);
    //tmpbitmap.Destroy;
    FreeAndNil(tmpbitmap);
  end;
  realimgwidth:=w;
  realimgheight:=h;
  frmain.StatusBar1.Panels.Items[1].Text:='Resolution:'+inttostr(w)+'x'+inttostr(h)+' '+zoomfactor(w,h,frmain.Image1.Width,frmain.Image1.Height)+'%';
end;

procedure setwallpaper(style:string;mosaic:string='0');
{$IFDEF WINDOWS}
 var
    registro:TRegistry;
    wallstr:string;
    aw,ah,nw,nh:integer;
    wallp:Graphics.TBitmap;
{$ENDIF}
begin
  realmode;
  {$IFDEF WINDOWS}
    wallstr:=LazFileUtils.GetAppConfigDirUTF8(false)+'Wallpaper.bmp';
    SysUtils.ForceDirectories(LazFileUtils.GetAppConfigDirUTF8(false));
    case style of
    '1':
      begin
        aw:=frmain.Image1.Picture.Bitmap.Width;
        ah:=frmain.Image1.Picture.Bitmap.Height;
        if (aw-Screen.Width)<=(ah-Screen.Height) then
        begin
          calculateaspectwidth(aw,ah,Screen.Height,nw);
          nh:=Screen.Height;
        end
        else
        begin
          nw:=Screen.Width;
          calculateaspectheight(aw,ah,Screen.Width,nh);
        end;

        wallp:=Graphics.TBitmap.Create;
        wallp.Width:=nw;
        wallp.Height:=nh;
        if frmain.Image1.Visible then
          wallp.Canvas.CopyRect(Types.Rect(0,0,nw,nh),frmain.Image1.Picture.Bitmap.Canvas,Types.Rect(0,0,frmain.Image1.Picture.Bitmap.Width,frmain.Image1.Picture.Bitmap.Height));
        wallp.SaveToFile(wallstr);
        //wallp.Destroy;
        FreeAndNil(wallp);
      end;
      else
      begin
        if frmain.Image1.Visible then
          frmain.Image1.Picture.Bitmap.SaveToFile(wallstr);
      end;
    end;
    wallstr:=GetAppConfigDir(false)+'Wallpaper.bmp';
    registro:=TRegistry.Create;
    registro.RootKey:=HKEY_CURRENT_USER;
    registro.OpenKey('Control Panel\Desktop',false);
    registro.WriteString('ConvertedWallpaper',wallstr);
    registro.WriteString('OriginalWallpaper',wallstr);
    registro.WriteString('Wallpaper',wallstr);
    if mosaic<>'1' then
      registro.WriteString('WallpaperStyle',style);
    registro.WriteString('TileWallpaper',mosaic);
    registro.CloseKey;
    //registro.Free;
    FreeAndNil(registro);
    //SystemParametersInfoA(SPI_SETDESKWALLPAPER,NULL,nil,SPIF_SENDCHANGE);
    ExecuteProcess('Rundll32.exe','user32.dll UpdatePerUserSystemParameters ,1, true');
    {$ENDIF}
end;

procedure refreshthumbs;
begin
  frmain.sboxthumb.Visible:=false;
  frmain.sboxthumb.DestroyComponents;
  frmain.sboxthumb.Visible:=true;
end;

procedure zoomnormal();
var
   x:integer;
begin
  for x:=0 to 2 do
  begin
    frmain.Image1.Width:=10;
    frmain.Image1.Height:=10;
    frmain.Image1.Top:=0;
    frmain.Image1.Left:=0;
    frmain.ScrollBox1.AutoScroll:=false;
    frmain.ScrollBox1.Enabled:=true;
    frmain.Image1.AutoSize:=true;
    frmain.Image1.AutoSize:=false;
    frmain.Image1.Stretch:=false;
    frmain.Image1.Align:=alClient;
    frmain.Image1.Anchors:=[akTop,akLeft,akRight,akBottom];
    frmain.Image1.Show;
    frmain.Image1.Cursor:=crDefault;
  end;
end;

procedure zoomstrech();
var
   x:integer;
begin
  for x:=0 to 2 do
  begin
    frmain.Image1.Width:=10;
    frmain.Image1.Height:=10;
    frmain.Image1.Top:=0;
    frmain.Image1.Left:=0;
    frmain.ScrollBox1.AutoScroll:=false;
    frmain.ScrollBox1.Enabled:=true;
    frmain.Image1.AutoSize:=true;
    frmain.Image1.AutoSize:=false;
    frmain.Image1.Stretch:=true;
    frmain.Image1.Align:=alClient;
    frmain.Image1.Anchors:=[akTop,akLeft,akRight,akBottom];
    frmain.Image1.Show;
    frmain.Image1.Cursor:=crDefault;
  end;
end;

procedure zoomoriginal();
begin
  realmode;
  frmain.Image1.Align:=alNone;
  frmain.ScrollBox1.Enabled:=true;
  frmain.Image1.Stretch:=true;
  frmain.Image1.AutoSize:=true;
  frmain.Image1.Width:=frmain.Image1.Picture.BitMap.Width;
  frmain.Image1.Height:=frmain.Image1.Picture.BitMap.Height;
  frmain.StatusBar1.Panels.Items[1].Text:='Resolution:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
end;

procedure zoomin(raton:boolean=false);
var
   lwidth,lheight:integer;
begin
  realmode;
  lwidth:=frmain.Image1.Width;
  lheight:=frmain.Image1.Height;
  if frmain.Image1.Align = alClient then
  begin
    frmain.ScrollBox1.Enabled:=true;
    frmain.Image1.Stretch:=true;
    frmain.tbStrech.Down:=false;
    frmain.Image1.AutoSize:=false;
    frmain.Image1.Align:=alNone;
    frmain.Image1.Width:=lwidth;
    frmain.Image1.Height:=lheight;
  end;
  frmain.Image1.Width:=frmain.Image1.Width+20;
  frmain.Image1.Height:=frmain.Image1.Height+20;
  frmain.StatusBar1.Panels.Items[1].Text:='Resolution:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
end;

procedure zoomout(raton:boolean=false);
var
   lwidth,lheight:integer;
begin
  realmode;
  lwidth:=frmain.Image1.Width;
  lheight:=frmain.Image1.Height;
  if frmain.Image1.Align = alClient then
  begin
    frmain.ScrollBox1.Enabled:=true;
    frmain.Image1.Stretch:=true;
    frmain.tbStrech.Down:=false;
    frmain.Image1.AutoSize:=false;
    frmain.Image1.Align:=alNone;
    frmain.Image1.Width:=lwidth;
    frmain.Image1.Height:=lheight;
  end;
  frmain.Image1.Width:=frmain.Image1.Width-20;
  frmain.Image1.Height:=frmain.Image1.Height-20;
  frmain.StatusBar1.Panels.Items[1].Text:='Resolution:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
end;

procedure loadpicture(fimagen:string;restorezoom:boolean=true;scrollthumbs:boolean=true;realimage:boolean=false);
var
   ebitmap,ebitmap2:Graphics.TBitmap;
   bmp:TBGRACustomBitMap;
   th,tw,i:integer;
   iw,ih:word;
   streamimage:TFileStream;
   starttime:TDateTime;
   bgcolor:TBGRAPixel;
   BGRAImage,tmpbitmap:BGRABitmap.TBGRABitmap;
   wimagen:UnicodeString;
   ImgData: TImgData;
   pngrect:TRect;
   Item: TMetadataItem;
   Orientation:string='Horizontal (normal)';
   vmp:ImagingClasses.TSingleImage;
   apngtmp:ImagingClasses.TMultiImage;
begin
  //frmain.Image1.Picture.Bitmap.Clear;
  {$IFDEF WINDOWS}
  wimagen:=UTF16LongName(fimagen);
  {$ELSE}
  wimagen:=fimagen;
  {$ENDIF}
  frmain.Timer3.Enabled:=false;
  frmain.Timer5.Enabled:=false;
  ifgif:=false;
  ifapng:=false;
  frmain.StatusBar1.Panels.Items[5].Text:='';
  starttime:=Now();
  if Assigned(APNGImage) then
    FreeAndNil(APNGImage);
    //APNGImage.ClearAll;
  try
    frmain.Caption:='LazView '+fimagen;
    frmain.Label1.Caption:=inttostr(ifile+1)+'/'+inttostr(nfile)+'  '+fimagen;
    frmain.Label2.Caption:=inttostr(ifile+1)+'/'+inttostr(nfile)+'  '+fimagen;
    frmain.StatusBar1.Panels.Items[0].Text:=inttostr(ifile+1)+'/'+inttostr(nfile);
    frmain.StatusBar1.Panels.Items[3].Text:=' Size:'+FloatTostr(Round(FileSize(wimagen)/1024))+'Kb';
    if restorezoom and (frmain.tbStrech.Down=false) then
      zoomnormal()
    else
      zoomstrech();
    if (UpperCase(ExtractFileExt(wimagen))<>'.GIF') and (UpperCase(ExtractFileExt(wimagen))<>'.PNG')  then
    begin
      frmain.tbSlowAnim.Enabled:=false;
      frmain.tbPrevFrame.Enabled:=false;
      frmain.tbPauseAnim.Enabled:=false;
      frmain.tbNextFrame.Enabled:=false;
      frmain.tbFastAnim.Enabled:=false;
      frmain.StatusBar1.Panels[2].Text:='';
    end;
    ////EXIF information
    ImgData:= TImgData.Create();
    if ImgData.ProcessFile(fimagen) then
    begin
      if ImgData.HasEXIF then
      begin
        Orientation:=ImgData.ExifObj.TagByName['Orientation'].Data;
        frmain.StatusBar1.Panels.Items[5].Text:=FormatDateTime(ISO_DATETIME_FORMAT, ImgData.ExifObj.GetImgDateTime)+' Orientation:'+Orientation;
      end;
    end;
    if frmain.mnuAutoRotate.Checked=false then
      Orientation:=Orientation+'*';
    //ImgData.Destroy;
    FreeAndNil(ImgData);
    case UpperCase(ExtractFileExt(fimagen)) of
      {'.GIF':
      begin
        ifgif:=true;
        frmain.Image1.Picture.Clear;
        frmain.tbSlowAnim.Enabled:=true;
        frmain.tbPrevFrame.Enabled:=true;
        frmain.tbPauseAnim.Enabled:=true;
        frmain.tbNextFrame.Enabled:=true;
        frmain.tbFastAnim.Enabled:=true;
        BGRAgif:=TBGRAAnimatedGif.Create(wimagen);
        frmain.Timer3Timer(nil);
        if BGRAGif.Count>1 then
          frmain.Timer3.Enabled:=true
        else
          frmain.Timer3.Enabled:=false;

        frmain.StatusBar1.Panels.Items[1].Text:='Resolution:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
        modethumb:=false;
        realimgwidth:=frmain.Image1.Picture.Width;
        realimgheight:=frmain.Image1.Picture.Height;
      end;}
      '.PNG','.APNG','.MNG','.GIF':
      begin
        ifgif:=false;
        SetLength(APNGDelays,0);
        GlobalMetadata.ClearMetaItems;
        APNGImage:=ImagingClasses.TMultiImage.Create;
        if Imaging.DetermineFileFormat(fimagen) <> '' then
        begin
          try
            APNGImage.LoadMultiFromFile(fimagen);
            GlobalMetadata.CopyLoadedMetaItemsForSaving;
            frmain.Image1.Picture.PNG.Create;
            frmain.Image1.Picture.PNG.Width:=APNGImage.Width;
            frmain.Image1.Picture.PNG.Height:=APNGImage.Height;
            ebitmap:=Graphics.TBitmap.Create;
            ImagingComponents.ConvertImageToBitmap(APNGImage,ebitmap);
            frmain.Image1.Picture.Bitmap.Assign(ebitmap);
          except on e:exception do
          begin
            //Attempt to fix blending animation
            tmpbitmap:=BGRABitmap.TBGRABitmap.Create;
            tmpbitmap.LoadFromFile(fimagen);
            ebitmap2:=Graphics.TBitmap.Create;
            ebitmap2.Assign(tmpbitmap);
            apngtmp:=ImagingClasses.TMultiImage.Create;
            apngtmp.Width:=ebitmap2.Width;
            apngtmp.Height:=ebitmap2.Height;
            frmain.Image1.Picture.Bitmap.Assign(ebitmap2);
            FreeAndNil(tmpbitmap);
            for i:=0 to APNGImage.ImageCount-1 do
            begin
              try
              APNGImage.ActiveImage:=i;
              vmp:=ImagingClasses.TSingleImage.Create;
              vmp.Assign(APNGImage);
              ebitmap:=Graphics.TBitmap.Create;
              ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
              //Need to now in what x,y position to draw the frames, for now use 0,0,
              //maybe in the imagedata
              ebitmap2.Canvas.Draw(0,0,ebitmap);
              ImagingComponents.ConvertBitmapToImage(ebitmap2,vmp);
              apngtmp.AddImage(vmp);
              FreeAndNil(ebitmap);
              FreeAndNil(vmp);
              except on e:exception do
              begin
                vmp:=ImagingClasses.TSingleImage.Create;
                ImagingComponents.ConvertBitmapToImage(ebitmap2,vmp);
                apngtmp.AddImage(vmp);
                FreeAndNil(vmp);
              end;
              end;
            end;
            APNGImage.Assign(apngtmp);
            FreeAndNil(ebitmap2);
            FreeAndNil(apngtmp);
          end;
          end;
        end;
        frmain.StatusBar1.Panels.Items[1].Text:='Resolution:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
        FreeAndNil(ebitmap);
        pngrect.Top:=0;
        pngrect.Left:=0;
        pngrect.Width:=frmain.Image1.Picture.Width;
        pngrect.Height:=frmain.Image1.Picture.Height;
        if GlobalMetadata.MetaItemCount > 0 then
        begin
          for I := 0 to GlobalMetadata.MetaItemCount - 1 do
          begin
            Item := GlobalMetadata.MetaItemsByIdx[I];
            if Item.Id='FrameDelay' then
            begin
              SetLength(APNGDelays,Length(APNGDelays)+1);
              if Item.Value<>0 then
                APNGDelays[Length(APNGDelays)-1]:=Item.Value
              else
                APNGDelays[Length(APNGDelays)-1]:=1;
            end;
          end;
        end
        else
          frmain.StatusBar1.Panels[5].Text:='No metadata information found!!!';
        realimgwidth:=pngrect.Width;
        realimgheight:=pngrect.Height;
        if APNGImage.ImageCount>1 then
        begin
          ifapng:=true;
          frmain.Timer5.Enabled:=true;
          frmain.tbSlowAnim.Enabled:=true;
          frmain.tbPrevFrame.Enabled:=true;
          frmain.tbPauseAnim.Enabled:=true;
          frmain.tbNextFrame.Enabled:=true;
          frmain.tbFastAnim.Enabled:=true;
          frmain.StatusBar1.Panels[2].Text:=inttostr(APNGImage.ActiveImage+1)+'/'+inttostr(APNGImage.ImageCount);
        end
        else
        begin
          ifapng:=false;
          frmain.tbSlowAnim.Enabled:=false;
          frmain.tbPrevFrame.Enabled:=false;
          frmain.tbPauseAnim.Enabled:=false;
          frmain.tbNextFrame.Enabled:=false;
          frmain.tbFastAnim.Enabled:=false;
          frmain.StatusBar1.Panels[2].Text:='';
        end;
      end;
      '.JPG','.JPEG','.JPE','.JFIF','.BMP','.XPM','.PBM','.PPM','.PCX','.ICNS','.TIF','.TIFF':
      begin
        ifgif:=false;
        ifapng:=false;
        streamimage:=TFileStream.Create(wimagen,fmOpenRead or fmShareDenyNone);
        bgcolor.alpha:=255;
        bgcolor.blue:=0;
        bgcolor.green:=0;
        bgcolor.red:=0;
        if frmain.mnuRealMode.Checked or realimage then
        begin
          //*******Implement orientation image********
          case Orientation of
          'Rotate 90 CW':
          begin
            BGRAImage:=BGRABitMap.TBGRABitmap.Create(streamimage);
            ebitmap:=Graphics.TBitmap.Create;
            ebitmap.Assign(BGRAImage);
            FreeAndNil(BGRAImage);
            vmp:=ImagingClasses.TSingleImage.Create;
            ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
            vmp.Rotate(270);
            ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
            FreeAndNil(vmp);
            frmain.Image1.Picture.Bitmap.Assign(ebitmap);
            FreeAndNil(ebitmap);
          end;
          'Rotate 270 CW':
          begin
            BGRAImage:=BGRABitMap.TBGRABitmap.Create(streamimage);
            ebitmap:=Graphics.TBitmap.Create;
            ebitmap.Assign(BGRAImage);
            FreeAndNil(BGRAImage);
            vmp:=ImagingClasses.TSingleImage.Create;
            ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
            vmp.Rotate(90);
            ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
            FreeAndNil(vmp);
            frmain.Image1.Picture.Bitmap.Assign(ebitmap);
            FreeAndNil(ebitmap);
          end;
          'Rotate 180 CW':
          begin
            bmp:=BGRABitMap.TBGRABitmap.Create(streamimage);
            bmp.HorizontalFlip;
            frmain.Image1.Picture.Bitmap.Assign(bmp);
            //bmp.Free;
            FreeAndNil(bmp);
          end;
            else
              frmain.Image1.Picture.LoadFromStream(streamimage);
          end;
          frmain.StatusBar1.Panels.Items[1].Text:='Resolution:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
          modethumb:=false;
          realimgwidth:=frmain.Image1.Picture.Width;
          realimgheight:=frmain.Image1.Picture.Height;
        end
        else
        begin
          case LowerCase(ExtractFileExt(fimagen)) of
          '.jpg','.jpe','.jpeg':ImgSize.GetJPGSize(streamimage,iw,ih);
          '.png','.pne':ImgSize.GetPNGSize(streamimage,iw,ih);
          '.bmp':ImgSize.GetBMPSize(streamimage,iw,ih);
          '.pcx'://Force thumb while found a pcx read way
          begin
            iw:=Screen.Width+1;
            ih:=Screen.Height+1;
          end;
          else
          begin
            iw:=0;
            ih:=0;
          end;
          end;
          streamimage.Position:=0;
          if ((iw>Screen.Width) or (ih>Screen.Height)) then
          begin
            if (iw-frmain.Splitter2.Width)<=(ih-frmain.ScrollBox1.Height) then
            begin
              th:=frmain.ScrollBox1.Height;
              calculateaspectwidth(iw,ih,frmain.Image1.Height,tw);
            end
            else
            begin
              tw:=frmain.Splitter2.Width;
              calculateaspectheight(iw,ih,frmain.Image1.Width,th);
            end;
            //*******Implement orientation image********
            case Orientation of
            'Rotate 90 CW':
            begin
              BGRAImage:=BGRABitMap.TBGRABitmap.Create;
              GetStreamThumbnail(streamimage,tw,th, bgcolor, false,'',BGRAImage);
              ebitmap:=Graphics.TBitmap.Create;
              ebitmap.Assign(BGRAImage);
              FreeAndNil(BGRAImage);
              vmp:=ImagingClasses.TSingleImage.Create;
              ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
              vmp.Rotate(270);
              ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
              FreeAndNil(vmp);
              frmain.Image1.Picture.Bitmap.Assign(ebitmap);
              FreeAndNil(ebitmap);
            end;
            'Rotate 270 CW':
            begin
              BGRAImage:=BGRABitMap.TBGRABitmap.Create;
              GetStreamThumbnail(streamimage,tw,th, bgcolor, false,'',BGRAImage);
              ebitmap:=Graphics.TBitmap.Create;
              ebitmap.Assign(BGRAImage);
              FreeAndNil(BGRAImage);
              vmp:=ImagingClasses.TSingleImage.Create;
              ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
              vmp.Rotate(90);
              ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
              FreeAndNil(vmp);
              frmain.Image1.Picture.Bitmap.Assign(ebitmap);
              FreeAndNil(ebitmap);
            end;
            'Rotate 180 CW':
            begin
              bmp:=BGRABitMap.TBGRABitmap.Create(GetStreamThumbnail(streamimage,tw,th, bgcolor, false));
              bmp.HorizontalFlip;
              frmain.Image1.Picture.Bitmap.Assign(bmp);
              //bmp.Free;
              FreeAndNil(bmp);
            end;
              else
              begin
                BGRAImage:=BGRABitMap.TBGRABitmap.Create;
                GetStreamThumbnail(streamimage,tw,th, bgcolor, false,'',BGRAImage);
                frmain.Image1.Picture.Bitmap.Assign(BGRAImage);
                FreeAndNil(BGRAImage);
              end;
            end;
            if LowerCase(ExtractFileExt(fimagen))='.pcx' then
              modethumb:=false
            else
              modethumb:=true;
            frmain.StatusBar1.Panels.Items[1].Text:='*Resolution:'+inttostr(iw)+'x'+inttostr(ih)+' '+zoomfactor(iw,ih,frmain.Image1.Width,frmain.Image1.Height)+'%';
            realimgwidth:=iw;
            realimgheight:=ih;
          end
          else
          begin
             //*******Implement orientation image********
            case Orientation of
            'Rotate 90 CW':
              begin
                bmp:=BGRABitMap.TBGRABitmap.Create(streamimage).RotateCW;
                frmain.Image1.Picture.Bitmap.Assign(bmp);
                FreeAndNil(bmp);
              end;
            'Rotate 270 CW':
            begin
              bmp:=BGRABitMap.TBGRABitmap.Create(streamimage).RotateCCW;
              frmain.Image1.Picture.Bitmap.Assign(bmp);
              FreeAndNil(bmp);
            end;
            'Rotate 180 CW':
            begin
              bmp:=BGRABitMap.TBGRABitmap.Create(streamimage);
              bmp.HorizontalFlip;
              frmain.Image1.Picture.Bitmap.Assign(bmp);
              //bmp.Free;
              FreeAndNil(bmp);
            end;
              else
                frmain.Image1.Picture.LoadFromStream(streamimage);
            end;
            //frmain.Image1.Picture.LoadFromStream(streamimage);
            frmain.StatusBar1.Panels.Items[1].Text:='Resolution:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
            modethumb:=false;
            realimgwidth:=frmain.Image1.Picture.Width;
            realimgheight:=frmain.Image1.Picture.Height;
          end;
        end;
        //streamimage.Destroy;
        FreeAndNil(streamimage);
      end;
      '.ICO':
      begin
        frmain.Image1.Picture.LoadFromFile(wimagen);
        frmain.StatusBar1.Panels.Items[1].Text:='Resolution:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
        modethumb:=false;
        realimgwidth:=frmain.Image1.Picture.Width;
        realimgheight:=frmain.Image1.Picture.Height;
      end;
      '.TGA','.PSD','.XWD','.CUR':
      begin
        BGRAImage:=BGRABitmap.TBGRABitmap.Create(wimagen);
        frmain.Image1.Picture.Assign(BGRAImage);
        frmain.StatusBar1.Panels.Items[1].Text:='Resolution:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
        modethumb:=false;
        realimgwidth:=frmain.Image1.Picture.Width;
        realimgheight:=frmain.Image1.Picture.Height;
        //BGRAImage.Destroy;
        FreeAndNil(BGRAImage);
      end;
      else/////Try to load as Image
      begin
        streamimage:=TFileStream.Create(wimagen,fmOpenRead or fmShareDenyNone);
        frmain.Image1.Picture.LoadFromStream(streamimage);
        frmain.StatusBar1.Panels.Items[1].Text:='Resolution:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
        modethumb:=false;
        realimgwidth:=frmain.Image1.Picture.Width;
        realimgheight:=frmain.Image1.Picture.Height;
        //streamimage.Destroy;
        FreeAndNil(streamimage);
      end;
    end;
    frmain.StatusBar1.Panels.Items[4].Text:='Time:'+prettytime(MilliSecondsBetween(Now,starttime));
    ////////****Update buttons and menus****////////////////
    frmain.tbFlipHorizontal.Enabled:=true;
    frmain.tbFlipVertical.Enabled:=true;
    frmain.tbRotateLeft.Enabled:=true;
    frmain.tbRotateRight.Enabled:=true;
    frmain.tbZoomIn.Enabled:=true;
    frmain.tbZoomOut.Enabled:=true;
    frmain.tbZoom100.Enabled:=true;
    frmain.tbReload.Enabled:=true;
    frmain.tbAdjust.Enabled:=true;
    frmain.tbStrech.Enabled:=true;
    frmain.mnuSaveAs.Enabled:=true;
    frmain.mnuCopy.Enabled:=true;
    frmain.mnuFlipH.Enabled:=true;
    frmain.mnuFlipV.Enabled:=true;
    frmain.mnuRotateL.Enabled:=true;
    frmain.mnuRotateR.Enabled:=true;
    frmain.mnuEffects.Enabled:=true;
    frmain.mnuStrech.Enabled:=true;
    frmain.mnuGoTo.Enabled:=true;
    frmain.mnuDeleteFile.Enabled:=true;
    frmain.mnuDesktopImage.Enabled:=true;
    /////
  except on e:Exception do
    begin
      frmain.Timer3.Enabled:=false;
      frmain.Image1.Visible:=true;
      ebitmap:=Graphics.TBitmap.Create;
      ebitmap.Width:=frmain.Image1.Width;
      ebitmap.Height:=frmain.Image1.Height;
      ebitmap.Canvas.Brush.Color:=clWhite;
      ebitmap.Canvas.Pen.Color:=clRed;
      ebitmap.Canvas.Font.Size:=12;
      ebitmap.Canvas.Font.Color:=clRed;
      th:=ebitmap.Canvas.TextHeight('Error al cargar la imagen:'+e.ToString);
      tw:=ebitmap.Canvas.TextWidth('Error al cargar la imagen:'+e.ToString);
      ebitmap.Canvas.TextOut(Round((frmain.Image1.Width-tw)/2),Round((frmain.Image1.Height-th)/2),'Error al cargar la imagen:'+e.ToString);
      frmain.Image1.Picture.Bitmap.Assign(ebitmap);
      //ebitmap.Destroy;
      FreeAndNil(ebitmap);
      /////////*****Update buttons and menus****///////////////////
     frmain.tbFlipHorizontal.Enabled:=false;
    frmain.tbFlipVertical.Enabled:=false;
    frmain.tbRotateLeft.Enabled:=false;
    frmain.tbRotateRight.Enabled:=false;
    frmain.tbZoomIn.Enabled:=false;
    frmain.tbZoomOut.Enabled:=false;
    frmain.tbZoom100.Enabled:=false;
    frmain.tbReload.Enabled:=false;
    frmain.tbAdjust.Enabled:=false;
    frmain.tbStrech.Enabled:=false;
    frmain.mnuSaveAs.Enabled:=false;
    frmain.mnuCopy.Enabled:=false;
    frmain.mnuFlipH.Enabled:=false;
    frmain.mnuFlipV.Enabled:=false;
    frmain.mnuRotateL.Enabled:=false;
    frmain.mnuRotateR.Enabled:=false;
    frmain.mnuEffects.Enabled:=false;
    frmain.mnuStrech.Enabled:=false;
    frmain.mnuGoTo.Enabled:=false;
    frmain.mnuDeleteFile.Enabled:=false;
    frmain.mnuDesktopImage.Enabled:=false;
      //////////////
    end;
  end;
  historyindex:=0;
  //Free history images;
  for i:=0 to 1 do
  begin
    if Assigned(historyeditbgragif) then
    begin
      if Length(historyeditbgragif)>=i+1 then
        FreeAndNil(historyeditbgragif[i]);
    end;
    if Assigned(historyeditapng) then
    begin
      if Length(historyeditapng)>=i+1 then
        FreeAndNil(historyeditapng[i]);
    end;
    if Assigned(historyeditbitmap) then
    begin
      if Length(historyeditbitmap)>=i+1 then
        FreeAndNil(historyeditbitmap[i]);
    end;
  end;
  frmain.mnuRedo.Enabled:=false;
  frmain.mnuUndo.Enabled:=false;
  if frmain.mnuShowThumbs.Checked then
  begin
    if scrollthumbs {and (frmain.sboxthumb.ComponentCount>ifile)} then
    begin
      if inprocessanim=false then
        scrollanim;
    end;
  end;
end;

procedure fullsc();
begin
  compactmode:=false;
  if full = false then
  begin
    fwidth:=frmain.Width;
    fheight:=frmain.Height;
    fxpos:=frmain.Top;
    fypos:=frmain.Left;
    frmain.BorderStyle:=bsNone;
    frmain.ToolBar1.Align:=alNone;

    frmain.ScrollBox1.AnchorSideTop.Control:=frmain;
    frmain.ScrollBox1.AnchorSideTop.Side:=asrTop;

    frmain.Splitter1.AnchorSideTop.Control:=frmain;
    frmain.Splitter1.AnchorSideTop.Side:=asrTop;

    frmain.sboxthumb.AnchorSideBottom.Control:=frmain;
    frmain.sboxthumb.AnchorSideBottom.Side:=asrBottom;

    frmain.Splitter1.AnchorSideBottom.Control:=frmain;
    frmain.Splitter1.AnchorSideBottom.Side:=asrBottom;

    frmain.StatusBar1.Visible:=false;
    frmain.Color:=clBlack;
    frmain.FormStyle:=fsStayOnTop;
    frmain.Label1.Visible:=true;
    frmain.Label2.Visible:=true;
    frmain.Splitter1.Left:=0-frmain.Splitter1.Width;
    frmain.WindowState:=wsFullScreen;
    frmain.MainMenu1.Items.Visible:=false;
    frmain.Timer2.Enabled:=true;
    full:=true;
    frmain.ToolBar1.Left:=Round((screen.Width-frmain.ToolBar1.Width)/2);
    frmain.ToolBar1.Visible:=false;
    frmain.MainMenu1.Items.Visible:=false;
  end
  else
  begin
    frmain.Timer2.Enabled:=false;
    frmain.Width:=fwidth;
    frmain.Height:=fheight;
    frmain.WindowState:=wsNormal;
    frmain.BorderStyle:=bsSizeable;
    frmain.ToolBar1.Align:=alTop;
    if frmain.mnuToolBar.Checked then
      frmain.ToolBar1.Visible:=true;
    frmain.Top:=fxpos;
    frmain.Left:=fypos;
    frmain.Width:=fwidth;
    frmain.Height:=fheight;
    frmain.Color:=clDefault;
    frmain.FormStyle:=fsNormal;
    frmain.Label1.Visible:=false;
    frmain.Label2.Visible:=false;
    if frmain.mnuTreeView.Checked then
      frmain.Splitter1.Left:=200;
    full:=false;

    if frmain.mnuStatusBar.Checked then
    begin
      frmain.StatusBar1.Visible:=true;
      frmain.sboxthumb.AnchorSideBottom.Control:=frmain.StatusBar1;
      frmain.sboxthumb.AnchorSideBottom.Side:=asrTop;
    end
    else
    begin
      frmain.sboxthumb.AnchorSideBottom.Control:=frmain;
      frmain.sboxthumb.AnchorSideBottom.Side:=asrBottom;
    end;

    if frmain.mnuToolBar.Checked=false then
    begin
      frmain.ToolBar1.Visible:=false;

      frmain.ScrollBox1.AnchorSideTop.Control:=frmain;
      frmain.ScrollBox1.AnchorSideTop.Side:=asrTop;

      frmain.Splitter1.AnchorSideTop.Control:=frmain;
      frmain.Splitter1.AnchorSideTop.Side:=asrTop;
    end
    else
    begin
      frmain.ToolBar1.Visible:=true;

      frmain.ScrollBox1.AnchorSideTop.Control:=frmain.ToolBar1;
      frmain.ScrollBox1.AnchorSideTop.Side:=asrBottom;

      frmain.Splitter1.AnchorSideTop.Control:=frmain.ToolBar1;
      frmain.Splitter1.AnchorSideTop.Side:=asrBottom;
    end;

    if frmain.mnuStatusBar.Checked then
    begin
      frmain.Splitter1.AnchorSideBottom.Control:=frmain.StatusBar1;
      frmain.Splitter1.AnchorSideBottom.Side:=asrTop;
    end
    else
    begin
      frmain.Splitter1.AnchorSideBottom.Control:=frmain;
      frmain.Splitter1.AnchorSideBottom.Side:=asrBottom;
    end;

    if frmain.mnuShowThumbs.Checked then
    begin
      if frmain.StatusBar1.Visible then
        frmain.Splitter2.Top:=frmain.StatusBar1.Top-thumbsize
      else
        frmain.Splitter2.Top:=frmain.StatusBar1.Top-thumbsize-frmain.StatusBar1.Height;
    end
    else
    begin
      if frmain.StatusBar1.Visible then
        frmain.Splitter2.Top:=frmain.StatusBar1.Top
      else
        frmain.Splitter2.Top:=frmain.StatusBar1.Top-frmain.StatusBar1.Height;
    end;

    frmain.MainMenu1.Items.Visible:=frmain.mnuMenus.Checked;
  end;
end;

procedure osd();
begin
  if frmain.Label1.Visible then
  begin
    frmain.Label1.Visible:=false;
    frmain.Label2.Visible:=false;
  end
  else
  begin
    frmain.Label1.Visible:=true;
    frmain.Label2.Visible:=true;
  end;
end;

procedure nextfile();
begin
  if nfile > 0 then
  begin
    if ifile+1 < nfile then
      Inc(ifile)
    else
      ifile:=0;
    try
      loadpicture(carpeta+flist[ifile]);
    except
      on E:Exception do frmain.StatusBar1.SimpleText:=inttostr(ifile+1)+'/'+inttostr(nfile)+' Formato no soportado!!!';
    end;
  end;
end;
procedure prevfile();
begin
  if nfile > 0 then
  begin
    if ifile > 0 then
      ifile:=ifile-1
    else
      ifile:=nfile-1;
    try
      loadpicture(carpeta+flist[ifile]);
    except
      on E:Exception do frmain.StatusBar1.SimpleText:=inttostr(ifile+1)+'/'+inttostr(nfile)+' Formato no soportado!!!';
    end;
  end;
end;

procedure filterimagen(filter:integer;nivel:float=0);
/////////Filter 1:Grayscale
/////////       2:Plane
/////////       3:Contour
/////////       4:Cylinder
/////////       5:Emboss
/////////       6:EmbossHighlight
/////////       7:Normalize
/////////       8:Sphere
/////////       9:Twirl
/////////      10:Pixelate
/////////      11:Median
/////////      12:Zoom3
/////////      13:Negative
/////////      14:Sharpen
/////////      15:Smooth
/////////      16:Fade
/////////      17:RotateCW
/////////      18:RotateCCW
/////////      19:HorizontalFlip
/////////      20:VerticalFlip
/////////      21:Bright
/////////      22:Contrast
/////////      23:Gamma
var
   bmp:TBGRACustomBitmap;
   title:string;
   tmpgif:TBGRAAnimatedGif;
   tmpbitmap:BGRABitmap.TBGRABitmap;
   i:integer;
   imgrect:TRect;
   imgpoint:TPoint;
   FImageCanvas: TImagingCanvas;
   FImage:TMultiImage;
   baseimg:ImagingClasses.TSingleImage;
   ebitmap:Graphics.TBitmap;
   vmp:ImagingClasses.TSingleImage;
   apngtmp:ImagingClasses.TMultiImage;
begin
  realmode;
  title:=frmain.Caption;
  frmain.Caption:='Aplicando efecto espere...';
  imgrect.Left:=0;
  imgrect.Top:=0;
  sethistory;
  if ifgif and (BGRAGif.Count>0) then
  begin
    //historyedit[Length(historyedit)-1].Assign(BGRAGif);
    //BGRAGif.SaveToStream(historyedit[Length(historyedit)-1]);

    tmpgif:=TBGRAAnimatedGif.Create;
    tmpgif.SetSize(BGRAGif.Width,BGRAGif.Height);
    imgrect.Bottom:=BGRAGif.Height;
    imgrect.Right:=BGRAGif.Width;
    imgpoint:=TPoint.Create(Round(BGRAGif.Width/2),Round(BGRAGif.Height/2));
    for i:=0 to BGRAGif.Count-1 do
    begin
      tmpbitmap:=BGRABitmap.TBGRABitmap.Create(BGRAGif.Width,BGRAGif.Height);
      BGRAGif.CurrentImage:=i;
      tmpbitmap.Canvas.CopyRect(Types.Rect(0,0,BGRAGif.Width,BGRAGif.Height),BGRAGif.Bitmap.Canvas,Types.Rect(0,0,BGRAGif.Width,BGRAGif.Height));
      case filter of
      1:tmpbitmap.Assign(tmpbitmap.FilterGrayscale);
      2:tmpbitmap.Assign(tmpbitmap.FilterPlane);
      3:tmpbitmap.Assign(tmpbitmap.FilterContour);
      4:tmpbitmap.Assign(tmpbitmap.FilterCylinder);
      5:tmpbitmap.Assign(tmpbitmap.FilterEmboss(5));
      6:tmpbitmap.Assign(tmpbitmap.FilterEmbossHighLight(true));
      7:tmpbitmap.Assign(tmpbitmap.FilterNormalize);
      8:tmpbitmap.Assign(tmpbitmap.FilterSphere);
      9:tmpbitmap.Assign(tmpbitmap.FilterTwirl(imgrect,imgpoint,Round(frmain.Image1.Picture.Bitmap.Width/4)));
      10:tmpbitmap.Assign(tmpbitmap.FilterPixelate(5,false));
      11:tmpbitmap.Assign(tmpbitmap.FilterMedian(moMediumSmooth));
      12:begin
           tmpgif.SetSize(BGRAGif.Width*3,BGRAGif.Height*3);
           tmpbitmap.Assign(tmpbitmap.FilterSmartZoom3(moMediumSmooth));
         end;
      13:tmpbitmap.Negative;
      14:tmpbitmap.Assign(tmpbitmap.FilterSharpen);
      15:tmpbitmap.Assign(tmpbitmap.FilterSmooth);
      16:tmpbitmap.Assign(tmpbitmap.FilterBlurMotion(50,0,false));
      17:begin
           tmpgif.SetSize(BGRAGif.Height,BGRAGif.Width);
           tmpbitmap.Assign(tmpbitmap.RotateCW);
        end;
      18:begin
           tmpgif.SetSize(BGRAGif.Height,BGRAGif.Width);
           tmpbitmap.Assign(tmpbitmap.RotateCCW);
        end;
      19:tmpbitmap.HorizontalFlip;
      20:tmpbitmap.VerticalFlip;
      end;
      tmpgif.InsertFrame(i,tmpbitmap,0,0,BGRAGif.FrameDelayMs[i],BGRAGif.FrameDisposeMode[i],BGRAGif.FrameHasLocalPalette[i]);
      tmpgif.LoopCount:=BGRAGif.LoopCount;
    end;
    tmpgif.LoopCount:=BGRAGif.LoopCount;
    FreeAndNil(tmpbitmap);
    BGRAGif.SetSize(BGRAGif.Width,BGRAGif.Height);
    BGRAGif:=tmpgif;
  end;
  if ifapng then
  begin
    //historyedit[Length(historyedit)-1].Assign(APNGImage);
    imgrect.Bottom:=APNGImage.Height;
    imgrect.Right:=APNGImage.Width;
    imgpoint:=TPoint.Create(Round(APNGImage.Width/2),Round(APNGImage.Height/2));
    case filter of
    2,3,4,5,6,7,8,9,10,11,13,14,15,16:
      begin
        apngtmp:=ImagingClasses.TMultiImage.Create;
        apngtmp.Width:=APNGImage.Width;
        apngtmp.Height:=APNGImage.Height;
      end;
    12:
      begin
        apngtmp:=ImagingClasses.TMultiImage.Create;
        apngtmp.Width:=APNGImage.Width*3;
        apngtmp.Height:=APNGImage.Height*3;
      end;
    end;
    for i:=0 to APNGImage.ImageCount-1 do
    begin
      case filter of
      1:begin
           APNGImage.ActiveImage:=i;
           APNGImage.Format:=ifA16Gray16;
         end;
      2:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterPlane);
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      3:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterContour);
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      4:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterCylinder);
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      5:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterEmboss(5));
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      6:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterEmbossHighLight(true));
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      7:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterNormalize);
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      8:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterSphere);
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      9:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterTwirl(imgrect,imgpoint,Round(APNGImage.Width/4)));
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      10:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterPixelate(5,false));
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      11:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterMedian(moMediumSmooth));
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      12:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterSmartZoom3(moMediumSmooth));
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      13:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Negative;
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      14:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterSharpen);
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      15:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterSmooth);
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      16:begin
          APNGImage.ActiveImage:=i;
          vmp:=ImagingClasses.TSingleImage.Create;
          vmp.Assign(APNGImage);
          ebitmap:=Graphics.TBitmap.Create;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          tmpbitmap:=BGRABitmap.TBGRABitmap.Create(APNGImage.Width,APNGImage.Height);
          tmpbitmap.Assign(ebitmap);
          tmpbitmap.Assign(tmpbitmap.FilterBlurMotion(50,0,false));
          ebitmap.Assign(tmpbitmap);
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          apngtmp.AddImage(vmp);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
          FreeAndNil(tmpbitmap);
        end;
      17:begin
           APNGImage.ActiveImage:=i;
           APNGImage.Rotate(270);
         end;
      18:begin
           APNGImage.ActiveImage:=i;
           APNGImage.Rotate(90);
         end;
      19:begin
           APNGImage.ActiveImage:=i;
           APNGImage.Mirror;
         end;
      20:begin
           APNGImage.ActiveImage:=i;
           APNGImage.Flip;
         end;
      21,22,23,24:
        begin
          APNGImage.ActiveImage:=i;
          FImageCanvas := TImagingCanvas.Create;
          FImageCanvas.CreateForImage(APNGImage);
          if filter=21 then
            FImageCanvas.ModifyContrastBrightness(0, nivel);
          if filter=22 then
            FImageCanvas.ModifyContrastBrightness(nivel, 0);
          if filter=23 then
            FImageCanvas.GammaCorection(nivel, nivel, nivel);
          FreeAndNil(FImageCanvas);
        end;
        else
        begin
          ShowMessage('Not implemented!!');
          break;
        end;
      end;
    end;
    case filter of
    2,3,4,5,6,7,8,9,10,11,13,14,15,16:
      begin
        APNGImage.Assign(apngtmp);
        FreeAndNil(apngtmp);
      end;
    12:
      begin
        APNGImage.ResizeImages(APNGImage.Width*3,APNGImage.Height*3,rfLanczos);
        APNGImage.Assign(apngtmp);
        FreeAndNil(apngtmp);
      end;
    end;
  end;
  if (ifgif=false) and (ifapng=false) then
  begin
    if frmain.Image1.Visible then
    begin
     imgrect.Bottom:=frmain.Image1.Picture.Bitmap.Height;
     imgrect.Right:=frmain.Image1.Picture.Bitmap.Width;
     imgpoint:=TPoint.Create(Round(frmain.Image1.Picture.Bitmap.Width/2),Round(frmain.Image1.Picture.Bitmap.Height/2));
     case filter of
     1:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterGrayscale;
     2:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterPlane;
     3:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterContour;
     4:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterCylinder;
     5:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterEmboss(5);
     6:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterEmbossHighLight(true);
     7:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterNormalize;
     8:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterSphere;
     9:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterTwirl(imgrect,imgpoint,Round(frmain.Image1.Picture.Bitmap.Width/4));
     10:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterPixelate(5,false);
     11:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterMedian(moMediumSmooth);
     12:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterSmartZoom3(moMediumSmooth);
     13:begin
          bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap);
          bmp.Negative;
        end;
     14:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterSharpen;
     15:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterSmooth;
     16:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterBlurMotion(50,0,false);
     17:begin
          bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap);
          ebitmap:=Graphics.TBitmap.Create;
          ebitmap.Assign(bmp);
          vmp:=ImagingClasses.TSingleImage.Create;
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          vmp.Rotate(270);
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          bmp.Assign(ebitmap);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
        end;
     18:begin
          bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap);
          ebitmap:=Graphics.TBitmap.Create;
          ebitmap.Assign(bmp);
          vmp:=ImagingClasses.TSingleImage.Create;
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          vmp.Rotate(90);
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          bmp.Assign(ebitmap);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
        end;
     19:begin
          bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap);
          ebitmap:=Graphics.TBitmap.Create;
          ebitmap.Assign(bmp);
          vmp:=ImagingClasses.TSingleImage.Create;
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          vmp.Mirror;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          bmp.Assign(ebitmap);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
        end;
     20:begin
          bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap);
          ebitmap:=Graphics.TBitmap.Create;
          ebitmap.Assign(bmp);
          vmp:=ImagingClasses.TSingleImage.Create;
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          vmp.Flip;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          bmp.Assign(ebitmap);
          FreeAndNil(ebitmap);
          FreeAndNil(vmp);
        end;
     21,22,23,24:
        begin
          FImage:=TMultiImage.Create;
          FImageCanvas := TImagingCanvas.Create;
          FImage.Width:=frmain.Image1.Picture.Bitmap.Width;
          FImage.Height:=frmain.Image1.Picture.Bitmap.Height;
          FImage.AddImage(frmain.Image1.Picture.Bitmap.Width,frmain.Image1.Picture.Bitmap.Height);
          baseimg:=ImagingClasses.TSingleImage.Create;
          ImagingComponents.ConvertBitmapToImage(frmain.Image1.Picture.Bitmap,baseimg);
          FImage.InsertImage(0,baseimg);
          FImage.ActiveImage:=0;
          FImageCanvas.CreateForImage(FImage);
          if filter=21 then
            FImageCanvas.ModifyContrastBrightness(0, nivel);
          if filter=22 then
            FImageCanvas.ModifyContrastBrightness(nivel, 0);
          if filter=23 then
            FImageCanvas.GammaCorection(nivel, nivel, nivel);
          ImagingComponents.ConvertDataToBitmap(FImage.Images[0],frmain.Image1.Picture.Bitmap);
          FreeAndNil(FImage);
          FreeAndNil(FImageCanvas);
          FreeAndNil(baseimg);
        end;
     end;
    end;
    case filter of
    21,22,23:
    begin
    end;
    else
    begin
      frmain.Image1.Picture.Bitmap.Assign(bmp);
      FreeAndNil(bmp);
    end;
    end;
  end;
  setafterhistory;
  frmain.Caption:=title;
end;

procedure efectimagen(efect:integer;nivel:integer=5000);
////////Efect 1:Flip Horizontal
////////      2:Flip Vertical
////////      3:Flip Left
////////      4:Flip Right
////////      5:BGR Color
////////      6:RBG Color
////////      7:GRB Color
////////      8:BRG Color
////////      9:GBR Color
////////      10:Bright+
////////      11:Bright-
////////      12:GrayAndRed
////////      13:GrayAndGreen
////////      14:GrayAndBlue
////////      15:QuitRed
////////      16:QuitGreen
////////      17:QuitBlue
////////      18:Noise
////////      19:Tv
var
   imagen:TLazIntfImage=nil;
   imagen2:TLazIntfImage=nil;
   xpix,ypix,ancho,alto,i,ramnum:integer;
   tmpgif:TBGRAAnimatedGif;
   tmpbitmap:BGRABitmap.TBGRABitmap;
   redbrig,greenbrig,bluebrig:word;
   inzone:boolean;
   //FImageCanvas: TImagingCanvas;
begin
  realmode;
  sethistory;
  title:=frmain.Caption;
  frmain.Caption:='Aplicando efecto porfavor espere...';
  if ifgif and (BGRAGif.Count>0) then
  begin
    tmpgif:=TBGRAAnimatedGif.Create;
    case efect of
    1,2,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19:tmpgif.SetSize(BGRAGif.Width,BGRAGif.Height);
    3,4:tmpgif.SetSize(BGRAGif.Height,BGRAGif.Width);
    end;
    ancho:=BGRAGif.Width-1;
    alto:=BGRAGif.Height-1;
    for i:=0 to BGRAGif.Count-1 do
    begin
      case efect of
      1,2,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19:tmpbitmap:=BGRABitmap.TBGRABitmap.Create(BGRAGif.Width,BGRAGif.Height);
      3,4:tmpbitmap:=BGRABitmap.TBGRABitmap.Create(BGRAGif.Height,BGRAGif.Width);
      end;
      BGRAGif.CurrentImage:=i;
      for ypix:=0 to alto  do
      begin
        for xpix:=0 to ancho do
        begin
          case efect of
          1:tmpbitmap.Colors[ancho-xpix,ypix]:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix];
          2:tmpbitmap.Colors[xpix,alto-ypix]:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix];
          3:tmpbitmap.Colors[ypix,ancho-xpix]:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix];
          4:tmpbitmap.Colors[alto-ypix,xpix]:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix];
          5:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
          6:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
          7:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
          8:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
          9:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
          10:begin
             if frmain.Shape1.Visible then
             begin
              if (xpix>frmain.Shape1.BaseBounds.Left) and (xpix<frmain.Shape1.BaseBounds.Right) and (ypix>frmain.Shape1.BaseBounds.Top) and (ypix<frmain.Shape1.BaseBounds.Bottom) then
                inzone:=true
              else
                inzone:=false;
             end
             else
               inzone:=true;


             if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red<60900) and inzone then
               redbrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red*138 shr 7
             else
               redbrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red;

             if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green<60900) and inzone then
               greenbrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green*138 shr 7
             else
               greenbrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green;

             if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue<60900) and inzone then
               bluebrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue*138 shr 7
             else
               bluebrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue;

             tmpbitmap.Colors[xpix,ypix]:=FPColor(redbrig,greenbrig,bluebrig,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);

           end;
          11:begin
               redbrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red*118 shr 7;
               greenbrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green*118 shr 7;
               bluebrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue*118 shr 7;
               tmpbitmap.Colors[xpix,ypix]:=FPColor(redbrig,greenbrig,bluebrig,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
             end;
          12:begin
               if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red-BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>nivel) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red-BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>nivel) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>nivel) then
               begin
                 tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
               end
               else
               begin
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
               end;
             end;
          13:begin
               if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green-BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>nivel) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green-BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>nivel) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>nivel) then
               begin
                 tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
               end
               else
               begin
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
               end;
             end;
          14:begin
               if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue-BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>nivel) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue-BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>nivel) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>nivel) then
               begin
                 tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
               end
               else
               begin
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
               end;
             end;
        15:begin
             tmpbitmap.Colors[xpix,ypix]:=FPColor(0,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
           end;
        16:begin
             tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,0,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
           end;
        17:begin
             tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,0,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
           end;
        18:begin
             ramnum:=Round(Random(3));
             case ramnum of
             0:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
             1:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
             2:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
             end;
           end;
        19:begin
             if odd(ypix) then
               tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
           end;
          end;
        end;
      end;
      tmpgif.InsertFrame(i,tmpbitmap,0,0,BGRAGif.FrameDelayMs[i],BGRAGif.FrameDisposeMode[i],BGRAGif.FrameHasLocalPalette[i]);
    end;
    //tmpbitmap.Destroy;
    FreeAndNil(tmpbitmap);
    BGRAGif.SetSize(BGRAGif.Width,BGRAGif.Height);
    BGRAGif:=tmpgif;
  end;
  if ifapng then
  begin
    for i:=0 to APNGImage.ImageCount-1 do
    begin
      case efect of
        1:begin
            APNGImage.ActiveImage:=i;
            APNGImage.Flip;
          end;
        2:begin
            APNGImage.ActiveImage:=i;
            APNGImage.Mirror;
          end;
        3:begin
           APNGImage.ActiveImage:=i;
           APNGImage.Rotate(270);
         end;
        4:begin
           APNGImage.ActiveImage:=i;
           APNGImage.Rotate(90);
         end;
        5:begin
            APNGImage.ActiveImage:=i;
            APNGImage.SwapChannels(1,3);
          end;
        6:begin
            APNGImage.ActiveImage:=i;
            APNGImage.SwapChannels(2,3);
          end;
        7:begin
            APNGImage.ActiveImage:=i;
            APNGImage.SwapChannels(1,2);
          end;
        8:begin
            APNGImage.ActiveImage:=i;
            APNGImage.SwapChannels(1,3);
            APNGImage.SwapChannels(2,3);
          end;
        9:begin
            APNGImage.ActiveImage:=i;
            APNGImage.SwapChannels(2,3);
            APNGImage.SwapChannels(1,3);
          end;
        {12:begin
             APNGImage.ActiveImage:=i;
             FImageCanvas := TImagingCanvas.Create;
             FImageCanvas.CreateForImage(APNGImage);
             FImageCanvas.Threshold(nivel/600000,0.5,0.5);
             FreeAndNil(FImageCanvas)
           end;
        13:begin
             APNGImage.ActiveImage:=i;
             FImageCanvas := TImagingCanvas.Create;
             FImageCanvas.CreateForImage(APNGImage);
             FImageCanvas.Threshold(0.5,nivel/600000,0.5);
             FreeAndNil(FImageCanvas)
           end;
        14:begin
             APNGImage.ActiveImage:=i;
             FImageCanvas := TImagingCanvas.Create;
             FImageCanvas.CreateForImage(APNGImage);
             FImageCanvas.Threshold(0.5,0.5,nivel/600000);
             FreeAndNil(FImageCanvas)
           end;}
        else
        begin
          ShowMessage('Not implemented!!');
          break;
        end;
      end;
    end;
  end;
  if (ifgif=false) and (ifapng=false) then
  begin
    imagen:=TLazIntfImage.Create(0,0);
    imagen2:=frmain.Image1.Picture.Bitmap.CreateIntfImage;
    imagen.DataDescription:=imagen2.DataDescription;
    ancho:=frmain.Image1.Picture.Bitmap.Width-1;
    alto:=frmain.Image1.Picture.Bitmap.Height-1;
    case efect of
    1,2,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19:imagen.SetSize(ancho+1,alto+1);
    3,4:imagen.SetSize(alto+1,ancho+1);
    end;
    for ypix:=0 to alto  do
    begin
      for xpix:=0 to ancho do
      begin
        case efect of
        1:imagen.Colors[ancho-xpix,ypix]:=imagen2.Colors[xpix,ypix];
        2:imagen.Colors[xpix,alto-ypix]:=imagen2.Colors[xpix,ypix];
        3:imagen.Colors[ypix,ancho-xpix]:=imagen2.Colors[xpix,ypix];
        4:imagen.Colors[alto-ypix,xpix]:=imagen2.Colors[xpix,ypix];
        5:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
        6:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].alpha);
        7:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
        8:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].alpha);
        9:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
        10:begin
             if frmain.Shape1.Visible then
             begin
              ////////////Area selection relative
              extractrealtivearea;

              if (xpix>exactx) and (xpix<exactright) and (ypix>exacty) and (ypix<exactbottom) then
                inzone:=true
              else
                inzone:=false;
             end
             else
               inzone:=true;
             if (imagen2.Colors[xpix,ypix].red<60900) and inzone then
               redbrig:=imagen2.Colors[xpix,ypix].red*138 shr 7
             else
               redbrig:=imagen2.Colors[xpix,ypix].red;

             if (imagen2.Colors[xpix,ypix].green<60900) and inzone then
               greenbrig:=imagen2.Colors[xpix,ypix].green*138 shr 7
             else
               greenbrig:=imagen2.Colors[xpix,ypix].green;

             if (imagen2.Colors[xpix,ypix].blue<60900) and inzone then
               bluebrig:=imagen2.Colors[xpix,ypix].blue*138 shr 7
             else
               bluebrig:=imagen2.Colors[xpix,ypix].blue;

             imagen.Colors[xpix,ypix]:=FPColor(redbrig,greenbrig,bluebrig,imagen2.Colors[xpix,ypix].alpha);
           end;
        11:begin
             if frmain.Shape1.Visible then
             begin
              ////////////Area selection relative
              extractrealtivearea;

              if (xpix>exactx) and (xpix<exactright) and (ypix>exacty) and (ypix<exactbottom) then
                inzone:=true
              else
                inzone:=false;
             end
             else
               inzone:=true;
             if inzone then
             begin
               redbrig:=imagen2.Colors[xpix,ypix].red*118 shr 7;
               greenbrig:=imagen2.Colors[xpix,ypix].green*118 shr 7;
               bluebrig:=imagen2.Colors[xpix,ypix].blue*118 shr 7;
               imagen.Colors[xpix,ypix]:=FPColor(redbrig,greenbrig,bluebrig,imagen2.Colors[xpix,ypix].alpha);
             end;
           end;
        12:begin
             if (imagen2.Colors[xpix,ypix].red-imagen2.Colors[xpix,ypix].green>nivel) and (imagen2.Colors[xpix,ypix].red-imagen2.Colors[xpix,ypix].blue>nivel) and (imagen2.Colors[xpix,ypix].red>nivel) then
             begin
               imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
             end
             else
             begin
               if (imagen2.Colors[xpix,ypix].red>=imagen2.Colors[xpix,ypix].blue) and (imagen2.Colors[xpix,ypix].red>=imagen2.Colors[xpix,ypix].green) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
               end;
               if (imagen2.Colors[xpix,ypix].green>=imagen2.Colors[xpix,ypix].blue) and (imagen2.Colors[xpix,ypix].green>=imagen2.Colors[xpix,ypix].red) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].alpha);
               end;
               if (imagen2.Colors[xpix,ypix].blue>=imagen2.Colors[xpix,ypix].red) and (imagen2.Colors[xpix,ypix].blue>=imagen2.Colors[xpix,ypix].green) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
               end;
             end;
           end;
        13:begin
             if (imagen2.Colors[xpix,ypix].green-imagen2.Colors[xpix,ypix].red>nivel) and (imagen2.Colors[xpix,ypix].green-imagen2.Colors[xpix,ypix].blue>nivel) and (imagen2.Colors[xpix,ypix].green>nivel) then
             begin
               imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
             end
             else
             begin
               if (imagen2.Colors[xpix,ypix].red>=imagen2.Colors[xpix,ypix].blue) and (imagen2.Colors[xpix,ypix].red>=imagen2.Colors[xpix,ypix].green) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
               end;
               if (imagen2.Colors[xpix,ypix].green>=imagen2.Colors[xpix,ypix].blue) and (imagen2.Colors[xpix,ypix].green>=imagen2.Colors[xpix,ypix].red) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].alpha);
               end;
               if (imagen2.Colors[xpix,ypix].blue>=imagen2.Colors[xpix,ypix].red) and (imagen2.Colors[xpix,ypix].blue>=imagen2.Colors[xpix,ypix].green) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
               end;
             end;
           end;
        14:begin
             if (imagen2.Colors[xpix,ypix].blue-imagen2.Colors[xpix,ypix].red>nivel) and (imagen2.Colors[xpix,ypix].blue-imagen2.Colors[xpix,ypix].green>nivel) and (imagen2.Colors[xpix,ypix].blue>nivel) then
             begin
               imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
             end
             else
             begin
               if (imagen2.Colors[xpix,ypix].red>=imagen2.Colors[xpix,ypix].blue) and (imagen2.Colors[xpix,ypix].red>=imagen2.Colors[xpix,ypix].green) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
               end;
               if (imagen2.Colors[xpix,ypix].green>=imagen2.Colors[xpix,ypix].blue) and (imagen2.Colors[xpix,ypix].green>=imagen2.Colors[xpix,ypix].red) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].alpha);
               end;
               if (imagen2.Colors[xpix,ypix].blue>=imagen2.Colors[xpix,ypix].red) and (imagen2.Colors[xpix,ypix].blue>=imagen2.Colors[xpix,ypix].green) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
               end;
             end;
           end;
        15:begin
             imagen.Colors[xpix,ypix]:=FPColor(0,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
           end;
        16:begin
             imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,0,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
           end;
        17:begin
             imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,0,imagen2.Colors[xpix,ypix].alpha);
           end;
        18:begin
             ramnum:=Round(Random(3));
             case ramnum of
             0:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
             1:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
             2:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
             end;
           end;
        19:begin
             if odd(ypix) then
               imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
           end;
        end;
      end;
    end;
    frmain.Image1.Picture.Bitmap.LoadFromIntfImage(imagen);
    frmain.Image1.AntialiasingMode:=amOn;
    //imagen.Destroy;
    //imagen2.Destroy;
    FreeAndNil(imagen);
    FreeAndNil(imagen2);
  end;
  setafterhistory;
  frmain.Caption:=title;
end;

procedure loadfiles(place:string;fname:string);
var
   nombre:String;
   finfo:TSearchRec;
   contador:LongInt;
   flisttmp:TStringList;
   nfiletmp:integer;
   wplace:UnicodeString;
begin
  {$IFDEF WINDOWS}
  wplace:=UTF16LongName(place);
  {$ELSE}
  wplace:=place;
  {$ENDIF}
  full:=false;
  fwidth:=frmain.Width;
  fheight:=frmain.Height;
  fxpos:=frmain.Top;
  fypos:=frmain.Left;
  nombre:=fname;
  contador:=0;
  nfiletmp:=0;
  flisttmp:=TStringList.Create;
  if FindFirst(wplace+'*',faAnyFile,finfo)=0 then
  begin
    repeat
      Inc(contador);
      with finfo do
      begin
        if (Attr and faDirectory)<>faDirectory then
        begin
          case UpperCase(ExtractFileExt(Name)) of
            '.JPG','.JPEG','.JPE','.JFIF','.BMP','.GIF','.PNG','.APNG','.MNG','.ICO','.XPM','.PBM','.PPM','.ICNS','.CUR','.TIF','.TIFF','.PCX','.TGA','.PSD','.XWD':
            begin
              flisttmp.Add(Name);
              Inc(nfiletmp);
            end;
            else
            begin
              ///Add the file name and the same files width this extencion to try to view
              if ((Name=fname) or (UpperCase(ExtractFileExt(Name))=UpperCase(ExtractFileExt(fname)))) and (fname<>'') then
              begin
                flisttmp.Add(Name);
                Inc(nfiletmp);
              end;
            end;
          end;
        end;
      end;
    until FindNextUTF8(finfo)<>0 ;
  end;
  SysUtils.FindClose(finfo);
  if nfiletmp>0 then
  begin
    nfile:=nfiletmp;
    if Assigned(flist) then
      flist.Clear
    else
      flist:=TStringList.Create;
    flist.Assign(flisttmp);

    carpeta:=place;

    if nombre <> '' then
    begin
      ifile:=flist.IndexOf(nombre);
      if starting=false then
        loadpicture(place+nombre);
    end
    else
    begin
      ifile:=0;
      if (ifile<flist.Count) {and (starting=false)} then
        loadpicture(place+flist[ifile]);
    end;

    starting:=false;
    if (frmain.mnuShowThumbs.Checked) then
    begin
      refreshthumbs;
      ththumbs:=thumbsthread.Create(true);
      ththumbs.thumbpath:=place;
      ththumbs.Start;
    end;
  end;
  //flisttmp.Destroy;
  FreeAndNil(flisttmp);
end;
procedure Tfrmain.FormCreate(Sender: TObject);
var
   i:integer;
   ruta:string;
   curleft,curright:TCursorImage;
   itemfile:TSearchRec;
   mitem:TMenuItem;
begin
  if FindFirst(ExtractFilePath(UTF8ToSys(Application.Params[0]))+pathdelim+'languages'+pathdelim+'lazview.*.po',faAnyFile,itemfile)=0 then
  begin
    Repeat
      try
        mitem:=TMenuItem.Create(frmain.MainMenu1);
        mitem.Caption:=Copy(itemfile.name,Pos('lazview.',itemfile.name)+8,Pos('.po',itemfile.name)-9);
        mitem.OnClick:=@mnuLanguageClick;
        frmain.mnuLanguage.Add(mitem);
      except
      on E:Exception do ShowMessage('The file '+itemfile.Name+' of language is not valid');
      end;
    Until FindNext(itemfile)<>0;
  end;
  frmain.Image1.Width:=frmain.ScrollBox1.Width;
  frmain.Image1.Height:=frmain.ScrollBox1.Height;
  ruta:=ExtractFilePath(Application.Params[1]);
  if Application.Params[1] <> '' then
  begin
    loadfiles(ruta,ExtractFileName(Application.Params[1]));
    if DirectoryExists(ruta) then
      frmain.ShellTreeView1.Path:=ruta;
  end;
  frmain.ShellTreeView1.Items.AddFirst(nil,'Documents').StateIndex:=29;
  frmain.ShellTreeView1.Items.AddFirst(nil,'Pictures').StateIndex:=27;
  frmain.ShellTreeView1.Items.AddFirst(nil,'Desktop').StateIndex:=28;
  for i:=3 to frmain.ShellTreeView1.Items.Count-1 do
  begin
    frmain.ShellTreeView1.Items[i].StateIndex:=16;
  end;
  frmain.ShellTreeView1.OnSelectionChanged:=@ShellTreeView1SelectionChanged;
  if frmain.mnuTreeView.Checked then
    frmain.Splitter1.Left:=200
  else
    frmain.Splitter1.Left:=0-frmain.Splitter1.Width;
  starting:=false;
  curleft:=TCursorImage.Create;
  curright:=TCursorImage.Create;
  curleft.LoadFromResourceName(HInstance,'curleft');
  curright.LoadFromResourceName(HInstance,'curright');
  Screen.Cursors[1]:=curleft.ReleaseHandle;
  Screen.Cursors[2]:=curright.ReleaseHandle;
end;

procedure Tfrmain.FormDestroy(Sender: TObject);
begin
  if Assigned(flist) then
    FreeAndNil(flist);
    //flist.Destroy;
  refreshthumbs;
  if frmain.Image1.Picture.Bitmap.Empty=false then
    frmain.Image1.Picture.Clear;
end;

procedure Tfrmain.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin

end;

procedure Tfrmain.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:=true;
end;

procedure Tfrmain.FormDropFiles(Sender: TObject;
  const FileNames: array of String);
begin
  if DirectoryExistsUTF8(FileNames[0]) then
    loadfiles(FileNames[0]+pathdelim,'')
  else
    loadfiles(ExtractFilePath(FileNames[0]),ExtractFileName(FileNames[0]));
end;

procedure Tfrmain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if Assigned(ththumbs) then
    ththumbs.stop;
  saveconfig;
  CanClose:=true;
end;

procedure Tfrmain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  //ShowMessage(inttostr(key));
 case Key of
  35://Fin
  begin
    frmain.tbLastImageClick(nil);
  end;
  36://Inicio
  begin
    frmain.tbFirstImageClick(nil);
  end;
  38://Flecha arriba
   begin
     if Shift=[ssAlt] then
       frmain.Image1.Top:=frmain.Image1.Top+20
     else
       prevfile();
   end;
  39,32://Flecha derecha, espacio
   begin
     if Shift=[ssAlt] then
       frmain.Image1.Left:=frmain.Image1.Left-20
     else
       nextfile();
   end;
  40://Flecha abajo
   begin
     if Shift=[ssAlt] then
       frmain.Image1.Top:=frmain.Image1.Top-20
     else
       nextfile();
   end;
  37,8://Flacha izquierda, BackSpace
    begin
      if Shift=[ssAlt] then
        frmain.Image1.Left:=frmain.Image1.Left+20
      else
        prevfile();
    end;
  13,70,122:
    begin//Enter, F, F11
      fullsc();
    end;
  27,81://Escape, Q
    begin
      saveconfig;
      Application.Terminate;
    end;
  67://Letra C
    begin
      if Shift=[ssCtrl] then
        frmain.mnuCopyClick(nil)
      else
        frmain.mnuCompactClick(nil);
    end;
  72://Letra H
    begin
    //if not ifgif then
    //fliphimage();
    end;
  73://Letra i
    begin
      filterimagen(13);
    end;
  86://Letra V
    begin
    //if not ifgif then
    //flipvimage();
    end;
  82://Letra R
    begin
    //if not ifgif then
    //fliprimage();
    end;
  76://Letra L
    begin
    //if not ifgif then
    //fliplimage();
    end;
  107://Tecla +
    begin
      zoomin();
    end;
  109://Tecla -
    begin
      zoomout();
    end;
  111://Tecla /
    begin
      zoomoriginal();
    end;
  79://Tecla O
    begin
      osd();
    end;
  106://Tecla *
    begin
      zoomnormal();
    end;
  34://Page Down
    begin
      dec(idir);
    //loadfiles(carpeta+dlist[idir],'');
    end;
  116://F5
    begin
      if Assigned(flist) then
        loadpicture(carpeta+flist[ifile]);
    end;
  188://Tecla <,
    begin
      filterimagen(21,-10);
      //efectimagen(11);
    end;
  190://Tecla >.
    begin
      filterimagen(21,10);
      //efectimagen(10);
    end;
  219://Tecla [
    begin
      filterimagen(22,-10);
      //efectimagen(11);
    end;
  221://Tecla ]
    begin
      filterimagen(22,10);
      //efectimagen(10);
    end;
 end;
end;

procedure Tfrmain.FormKeyPress(Sender: TObject; var Key: char);
begin
  //ShowMessage(Key);
end;

procedure Tfrmain.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (frmain.tbSelect.Down=false) and (frmain.Image1.Align=alnone) then
  begin
    startdraw:=true;
    imgx:=X+frmain.Image1.ClientOrigin.x-frmain.Image1.Left;
    imgy:=Y+frmain.Image1.ClientOrigin.Y-frmain.Image1.Top;
  end;
  if frmain.tbSelect.Down then
  begin
    startselect:=true;
    imgx:=X;
    imgy:=Y;
  end;
end;

procedure Tfrmain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  {if frmain.Image1.Stretch and (frmain.tbStrech.Down=false) then
    frmain.Image1.Cursor:=crSizeAll
  else
    frmain.Image1.Cursor:=crDefault;}

  if frmain.mnuToolBarInFull.Checked then
  begin
    hidetoolbardelay:=5;
    if frmain.mnuShowThumbs.Checked then
      frmain.ToolBar1.Top:=frmain.Splitter2.Top-frmain.ToolBar1.Height
    else
      frmain.ToolBar1.Top:=screen.Height-frmain.ToolBar1.Height;

    frmain.ToolBar1.Left:=Round((screen.Width-frmain.ToolBar1.Width)/2);

    if full and (frmain.ToolBar1.Visible=false) then
      frmain.ToolBar1.Visible:=true;
  end;

  if startdraw and (not startselect) then
  begin
    frmain.Image1.Anchors:=[];
    frmain.Image1.Left:=mouse.CursorPos.x-imgx;
    frmain.Image1.Top:=mouse.CursorPos.y-imgy;
  end;
  if startselect then
  begin
    if (imgx>=frmain.Image1.DestRect.Left) then
      validx:=imgx
    else
    begin
      if (x>=frmain.Image1.DestRect.Left) then
      imgx:=x;
    end;
    if (imgy>=frmain.Image1.DestRect.Top) then
      validy:=imgy
    else
    begin
      if (y>=frmain.Image1.DestRect.Top) then
      imgy:=y;
    end;

    if X<=frmain.Image1.DestRect.Right then
      validw:=X-imgx
    else
    begin
      //validw:=frmain.Image1.DestRect.width;
      //frmain.Caption:='width limit';
    end;
    if Y<=frmain.Image1.DestRect.Bottom then
      validh:=Y-imgy
    else
    begin
      //validh:=frmain.Image1.DestRect.Height;
      //frmain.Caption:='height limit';
    end;
    if (x>=frmain.Image1.DestRect.Left) and (y>=frmain.Image1.DestRect.Top) {and (validw<=frmain.Image1.DestRect.Width) and (validh<=frmain.Image1.DestRect.Height)} then
    begin
      frmain.Shape1.SetBounds(validx,validy,validw,validh);
      frmain.StatusBar1.Panels[6].Text:='Selection: '+inttostr(X)+'/'+inttostr(Y);
      frmain.Shape1.Visible:=true;
      frmain.mnuCrop.Enabled:=true;
    end;
  end;
  if (compactmode or full) and (frmain.Image1.Align=alClient) and (frmain.tbSelect.Down=false) then
  begin
    if x>(frmain.Width/3)*2 then
    begin
      Screen.Cursor:=2;
    end;
    if x<(frmain.Width/3) then
    begin
      Screen.Cursor:=1;
    end;
    if (x<(frmain.Width/3)*2) and (x>(frmain.Width/3)) then
    begin
      Screen.Cursor:=crDefault;
    end;
  end
  else
  begin
    if (frmain.Image1.Align=alNone)  then
    begin
      Screen.Cursor:=crSizeAll;
    end
    else
    begin
      if frmain.tbSelect.Down then
      begin
        Screen.Cursor:=crCross;
      end
      else
      begin
        Screen.Cursor:=crDefault;
      end;
    end;
  end;
end;

procedure Tfrmain.FormResize(Sender: TObject);
begin
  if showthumbs then
  begin
    if frmain.StatusBar1.Visible then
      frmain.Splitter2.Top:=frmain.StatusBar1.Top+frmain.StatusBar1.Height-frmain.Splitter2.Height-thumbsize
    else
      frmain.Splitter2.Top:=frmain.Height-frmain.Splitter2.Height-thumbsize;
  end
  else
  begin
    if frmain.StatusBar1.Visible then
      frmain.Splitter2.Top:=frmain.StatusBar1.Top-frmain.Splitter2.Height
    else
      frmain.Splitter2.Top:=frmain.Height-frmain.Splitter2.Height+3;
  end;
end;

procedure Tfrmain.FormShow(Sender: TObject);
begin
  loadconfig;
  if Assigned(flist) then
  begin
    if (ifile<flist.Count) then
      loadpicture(carpeta+flist[ifile]);
  end;
end;

procedure Tfrmain.FormWindowStateChange(Sender: TObject);
begin
  if Assigned(flist) and modethumb and frmain.Image1.Visible and (ifgif=false) then
  begin
    if (frmain.mnuCompact.Checked=false) and ((frmain.WindowState=wsMaximized) or (frmain.WindowState=wsNormal) or (frmain.WindowState=wsFullScreen)) then
      loadpicture(carpeta+flist[ifile],false);
  end;
  frmain.FormResize(nil);
end;

procedure Tfrmain.Image1Click(Sender: TObject);
begin
  if startselect=false then
    frmain.Shape1.Visible:=false;
  if (compactmode or full) and (frmain.Image1.Align=alClient) and (startselect=false) then
  begin
    if Screen.Cursor=2 then
    begin
      nextfile();
    end;
    if Screen.Cursor=1 then
    begin
      prevfile();
    end;
  end;
end;

procedure Tfrmain.Image1DblClick(Sender: TObject);
begin
 if Screen.Cursor=crDefault then
  fullsc();
end;


procedure Tfrmain.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  startdraw:=false;
  startselect:=false;
  //frmain.Image1.Anchors:=[akTop,akLeft,akRight,akBottom];
end;

procedure Tfrmain.mnuAlwaysOnTopClick(Sender: TObject);
begin
  frmain.mnuAlwaysOnTop.Checked:=not frmain.mnuAlwaysOnTop.Checked;
  if frmain.mnuAlwaysOnTop.Checked then
    frmain.FormStyle:=fsSystemStayOnTop
  else
    frmain.FormStyle:=fsNormal;
end;

procedure Tfrmain.mnuAutoRotateClick(Sender: TObject);
begin
  frmain.mnuAutoRotate.Checked:=not frmain.mnuAutoRotate.Checked;
end;

procedure Tfrmain.mnuContrastLessClick(Sender: TObject);
begin
  filterimagen(24);
end;

procedure Tfrmain.mnuContrastPlusClick(Sender: TObject);
begin
  filterimagen(23);
end;

procedure Tfrmain.mnuCropClick(Sender: TObject);
var
   tmpbitmap:BGRABitmap.TBGRABitmap;
   i:integer;
   tmpgif:TBGRAAnimatedGif;
   tmpapng:TMultiImage;
begin
  realmode;
  extractrealtivearea;
  sethistory;
  if ifgif then
  begin
    tmpgif:=TBGRAAnimatedGif.Create;
    tmpgif.SetSize(exactw,exacth);
    for i:=0 to BGRAGif.Count-1 do
    begin
      tmpbitmap:=BGRABitmap.TBGRABitmap.Create(exactw,exacth);
      BGRAGif.CurrentImage:=i;
      tmpbitmap.Canvas.CopyRect(Types.Rect(0,0,exactw,exacth),BGRAGif.Bitmap.Canvas,Types.Rect(exactx,exacty,exactright,exactbottom));
      tmpgif.InsertFrame(i,tmpbitmap,0,0,BGRAGif.FrameDelayMs[i],BGRAGif.FrameDisposeMode[i],BGRAGif.FrameHasLocalPalette[i]);
      //tmpbitmap.Destroy;
      FreeAndNil(tmpbitmap);
    end;
    tmpgif.LoopCount:=BGRAGif.LoopCount;
    BGRAGif.SetSize(exactw,exacth);
    BGRAGif:=tmpgif;
    //Cant destroy this because not work fine
    //tmpgif.Destroy;
  end;

  if ifapng then
  begin
    tmpapng:=TMultiImage.Create;
    tmpapng.AddImages(APNGImage);
    tmpapng.ResizeImages(exactw,exacth,rfLanczos);
    for i:=0 to APNGImage.ImageCount-1 do
    begin
      APNGImage.ActiveImage:=i;
      tmpapng.ActiveImage:=i;
      APNGImage.CopyTo(exactx,exacty,exactw,exacth,tmpapng,0,0);
    end;
    APNGImage.Assign(tmpapng);
    //tmpapng.Destroy;
    FreeAndNil(tmpapng);
  end;

  if (ifgif=false) and (ifapng=false) then
  begin
    tmpbitmap:=BGRABitmap.TBGRABitmap.Create(exactw,exacth);
    tmpbitmap.Canvas.CopyRect(Types.Rect(0,0,exactw,exacth),frmain.Image1.Picture.Bitmap.Canvas,Types.Rect(exactx,exacty,exactright,exactbottom));
    frmain.Image1.Picture.Bitmap.Assign(tmpbitmap);
    //tmpbitmap.Destroy;
    FreeAndNil(tmpbitmap);
  end;
  frmain.Shape1.Visible:=false;
  frmain.mnuCrop.Enabled:=false;
  setafterhistory;
end;


procedure Tfrmain.mnuOpenClick(Sender: TObject);
begin
  OpenPictureDialog1.InitialDir:=carpeta;
  OpenPictureDialog1.Execute;
  if FileExists(UTF8ToSys(OpenPictureDialog1.FileName)) then
  begin
    loadfiles(ExtractFilePath(ExpandFileNameUTF8(OpenPictureDialog1.FileName)),ExtractFileName(OpenPictureDialog1.FileName));
    frmain.ShellTreeView1.OnSelectionChanged:=nil;
    if DirectoryExists(ExtractFilePath(ExpandFileNameUTF8(OpenPictureDialog1.FileName))) then
      frmain.ShellTreeView1.Path:=ExtractFilePath(ExpandFileNameUTF8(OpenPictureDialog1.FileName));
    frmain.ShellTreeView1.OnSelectionChanged:=@ShellTreeView1SelectionChanged;
  end;
end;

procedure Tfrmain.mnuPasteClick(Sender: TObject);
begin
  sethistory;
  modethumb:=false;
  frmain.Timer3.Enabled:=false;
  frmain.Timer5.Enabled:=false;
  frmain.Image1.Picture.Clear;
  frmain.Image1.Picture.Assign(Clipboard);
  zoomnormal();
  frmain.tbFlipHorizontal.Enabled:=true;
  frmain.tbFlipVertical.Enabled:=true;
  frmain.tbFlipHorizontal.Enabled:=true;
  frmain.tbFlipVertical.Enabled:=true;
  frmain.tbRotateLeft.Enabled:=true;
  frmain.tbRotateRight.Enabled:=true;
  frmain.tbZoomIn.Enabled:=true;
  frmain.tbZoomOut.Enabled:=true;
  frmain.tbReload.Enabled:=true;
  frmain.tbAdjust.Enabled:=true;
  frmain.tbStrech.Enabled:=true;
  frmain.mnuSaveAs.Enabled:=true;
  frmain.mnuCopy.Enabled:=true;
  frmain.mnuFlipH.Enabled:=true;
  frmain.mnuFlipV.Enabled:=true;
  frmain.mnuRotateL.Enabled:=true;
  frmain.mnuRotateR.Enabled:=true;
  frmain.mnuEffects.Enabled:=true;
  frmain.mnuStrech.Enabled:=true;
  frmain.mnuGoTo.Enabled:=true;
  frmain.mnuDesktopImage.Enabled:=true;
  frmain.Shape1.Visible:=false;
  ifgif:=false;
  ifapng:=false;
  frmain.StatusBar1.Panels.Items[1].Text:='Resolution:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height);
  frmain.Caption:='LazView [Clipboard]';
  setafterhistory;
end;

procedure Tfrmain.mnuCopyClick(Sender: TObject);
var
   clipbitmap:Graphics.TBitmap;
   cuadro:TRect;
begin
  if frmain.Shape1.Visible then
  begin
    clipbitmap:=Graphics.TBitmap.Create;
    clipbitmap.Width:=frmain.Shape1.Width-frmain.Shape1.Pen.Width*2;
    clipbitmap.Height:=frmain.Shape1.Height-frmain.Shape1.Pen.Width*2;
    cuadro.Top:=frmain.Shape1.Pen.Width;
    cuadro.Left:=frmain.Shape1.Pen.Width;
    cuadro.Right:=frmain.Shape1.Width-frmain.Shape1.Pen.Width;
    cuadro.Bottom:=frmain.Shape1.Height-frmain.Shape1.Pen.Width;
    clipbitmap.Canvas.CopyRect(Types.Rect(0,0,clipbitmap.Width,clipbitmap.Height),frmain.Shape1.Canvas,cuadro);
    Clipboard.Assign(clipbitmap);
  end
  else
    Clipboard.Assign(frmain.Image1.Picture.Bitmap);
end;

procedure Tfrmain.mnuRedoClick(Sender: TObject);
begin
  inc(historyindex);
  if ifgif then
     BGRAGif:=historyeditbgragif[historyindex];
  if ifapng then
     APNGImage.Assign(historyeditapng[historyindex]);
  if (ifgif=false) and (ifapng=false) then
    frmain.Image1.Picture.Graphic.Assign(historyeditbitmap[historyindex]);
  if historyindex=Length(historyeditbitmap)-1 then
  begin
    frmain.mnuRedo.Enabled:=false;
    frmain.mnuUndo.Enabled:=true;
  end;
end;

procedure Tfrmain.mnuSaveAsClick(Sender: TObject);
var
   confirmar:boolean=true;
   filtroext:string;
   calidadjpg:integer;
   i,n:integer;
   bgrtmp:TBGRABitmap;
   baseimg:ImagingClasses.TSingleImage;
   function correctfilename:string;
   var
      ext:string;
      name:string;
      path:string;
      namewithoutext:string;
   begin
     name:=ExtractFileName(frmain.SavePictureDialog1.FileName);
     ext:=ExtractFileExt(frmain.SavePictureDialog1.FileName);
     path:=ExtractFilePath(frmain.SavePictureDialog1.FileName);
     if ext<>'' then
       namewithoutext:=Copy(name,0,LastDelimiter(ext,name)-length(ext)+1)
     else
       namewithoutext:=name;
     result:=path+pathdelim+namewithoutext+frmain.SavePictureDialog1.GetFilterExt;
     //ExtractFilePath(frmain.SavePictureDialog1.FileName)+pathdelim+ExtractFileName(frmain.SavePictureDialog1.FileName)+'.'+frmain.SavePictureDialog1.GetFilterExt;
   end;

begin
  ///Cant use the UserChoise in GTK2, so check for filename
  {$IFDEF LCLGTK2}
  frmain.SavePictureDialog1.FileName:='';
  {$ELSE}
  if Assigned(flist) then
    frmain.SavePictureDialog1.FileName:=flist[ifile]
  else
    frmain.SavePictureDialog1.FileName:='IMAGEN.BMP';
  {$ENDIF}
  for i:=1 to 5 do
  begin
    frmain.SavePictureDialog1.FilterIndex:=i;
    if UpperCase('.'+frmain.SavePictureDialog1.GetFilterExt)=UpperCase(ExtractFileExt(frmain.SavePictureDialog1.FileName)) then
      break;
  end;
  frmain.SavePictureDialog1.Execute;
  filtroext:=StringReplace(frmain.SavePictureDialog1.GetFilterExt,'*','',[rfReplaceAll]);
  if filtroext='.' then
    filtroext:=ExtractFileExt(frmain.SavePictureDialog1.FileName);
  if {$IFDEF LCLQT}frmain.SavePictureDialog1.UserChoice=1{$else}{$IFDEF LCLQT5}frmain.SavePictureDialog1.UserChoice=1{$ELSE}frmain.SavePictureDialog1.FileName<>''{$endif}{$ENDIF}then
  begin
    if FileExists(correctfilename) then
      confirmar:=(Application.MessageBox(PChar('Do you want to replace the image file '+ExtractFileName(correctfilename)+'?'),'Confirm',MB_ICONQUESTION + MB_YESNO)=IDYES)
    else
    begin
      confirmar:=true;
    end;
    if confirmar then
    begin
      case frmain.SavePictureDialog1.FilterIndex of
        1:
        begin
          frquality.ShowModal;
          calidadjpg:=frquality.TrackBar1.Position;
          frmain.Image1.Picture.Jpeg.CompressionQuality:=calidadjpg;
          frmain.Image1.Refresh;
          frmain.Image1.Picture.Jpeg.SaveToFile(correctfilename);
        end;
        2:
        begin
          if ifapng then
          begin
            n:=0;
            if GlobalMetadata.MetaItemCount > 0 then
            begin
              for I := 0 to GlobalMetadata.MetaItemCount - 1 do
              begin
                if GlobalMetadata.MetaItemsByIdx[I].Id='FrameDelay' then
                begin
                  GlobalMetadata.MetaItemsByIdx[I].Value:=APNGDelays[n];
                  inc(n);
                end;
              end;
            end;
            GlobalMetadata.CopyLoadedMetaItemsForSaving;
            APNGImage.SaveMultiToFile(correctfilename);
          end;
          //Convert BGRAGif to APNG
          if ifgif then
          begin
            APNGImage:=ImagingClasses.TMultiImage.Create;
            APNGImage.Width:=BGRAGif.Width;
            APNGImage.Height:=BGRAGif.Height;
            for i:=0 to BGRAGif.Count-1 do
            begin
              APNGImage.AddImage(BGRAGif.FrameImage[i].Width,BGRAGif.FrameImage[i].Height);
              baseimg:=ImagingClasses.TSingleImage.Create;
              ImagingComponents.ConvertBitmapToImage(BGRAGif.FrameImage[i].Bitmap,baseimg);
              APNGImage.InsertImage(i,baseimg);
              GlobalMetadata.SetMetaItem('FrameDelay',BGRAGif.FrameDelayMs[i],i);
            end;
            APNGImage.SaveMultiToFile(correctfilename);
          end;
          if (ifgif=false) and (ifapng=false) then
            frmain.Image1.Picture.PNG.SaveToFile(correctfilename);
        end;
        3:frmain.Image1.Picture.Bitmap.SaveToFile(correctfilename);
        4:frmain.Image1.Picture.Icon.SaveToFile(correctfilename);
        5:
         begin
           if ifgif then
           begin
             BGRAGif.SaveToFile(correctfilename);
           end;
           //Convert APNG to BGRAGif
           if ifapng then
           begin
             n:=0;
             if GlobalMetadata.MetaItemCount > 0 then
             begin
               for I := 0 to GlobalMetadata.MetaItemCount - 1 do
               begin
                 if GlobalMetadata.MetaItemsByIdx[I].Id='FrameDelay' then
                 begin
                   GlobalMetadata.MetaItemsByIdx[I].Value:=APNGDelays[n];
                   inc(n);
                 end;
               end;
             end;
             GlobalMetadata.CopyLoadedMetaItemsForSaving;
             APNGImage.SaveMultiToFile(correctfilename);
           end;
           //Convert others to BGRAGif
           if (ifgif=false) and (ifapng=false) then
           begin
             BGRAgif:=TBGRAAnimatedGif.Create;
             bgrtmp:=TBGRABitmap.Create(frmain.Image1.Picture.Bitmap);
             BGRAgif.SetSize(bgrtmp.Width,bgrtmp.Height);
             BGRAgif.InsertFrame(0,bgrtmp,0,0,0,dmKeep,true);
             frmain.Image1.Picture.Assign(bgrtmp);
             BGRAGif.SaveToFile(correctfilename);
             //bgrtmp.Destroy;
             //BGRAGif.Destroy;
             FreeAndNil(bgrtmp);
             FreeAndNil(BGRAGif);
           end;
         end
      end;
      ShowMessage('Done!!');
    end;
  end;
end;

procedure Tfrmain.mnuGrayscaleClick(Sender: TObject);
begin
  filterimagen(1);
end;

procedure Tfrmain.mnuBGRClick(Sender: TObject);
begin
  efectimagen(5);
end;

procedure Tfrmain.mnuRBGClick(Sender: TObject);
begin
  efectimagen(6);
end;

procedure Tfrmain.mnuGRBClick(Sender: TObject);
begin
  efectimagen(7);;
end;

procedure Tfrmain.mnuQuitRedClick(Sender: TObject);
begin
  efectimagen(15);
end;

procedure Tfrmain.mnuQuitGreenClick(Sender: TObject);
begin
  efectimagen(16);
end;

procedure Tfrmain.mnuQuitBlueClick(Sender: TObject);
begin
  efectimagen(17);
end;

procedure Tfrmain.mnuNoiseClick(Sender: TObject);
begin
  efectimagen(18);
end;

procedure Tfrmain.mnuToolBarInFullClick(Sender: TObject);
begin
  frmain.mnuToolBarInFull.Checked:=not frmain.mnuToolBarInFull.Checked;
end;

procedure Tfrmain.mnuTvClick(Sender: TObject);
begin
  efectimagen(19);
end;

procedure Tfrmain.mnuToolsClick(Sender: TObject);
begin

end;

procedure Tfrmain.mnuDeleteFileClick(Sender: TObject);
begin
  if MessageDlg(Application.Title,'Do you want to delete '+flist[ifile]+'?.',mtConfirmation,[mbOK,mbCancel],0)=1 then
  begin
    SysUtils.DeleteFile(flist[ifile]);
    flist.Delete(ifile);
    if ifile>1 then
    begin
      ifile:=ifile-1;
      loadpicture(carpeta+flist[ifile]);
    end;
    if showthumbs then
    begin
      refreshthumbs;
      ththumbs:=thumbsthread.Create(true);
      ththumbs.thumbpath:=carpeta;
      ththumbs.Start;
    end;
  end;
end;

procedure Tfrmain.mnuEXIFClick(Sender: TObject);
var
   imgdata:TImgData;
   i:integer;
begin
 if Assigned(flist) then
 begin
   frexif.ValueListEditor1.Clean;
   ImgData:= TImgData.Create();
   if ImgData.ProcessFile(carpeta+flist[ifile]) then
   begin
     if ImgData.HasEXIF then
     begin
       for i:=0 to ImgData.ExifObj.TagCount-1 do
       begin
         frexif.ValueListEditor1.InsertRow(ImgData.ExifObj.TagByIndex[i].Name,ImgData.ExifObj.TagByIndex[i].Data,true);
       end;
       if ImgData.ExifObj.FlashUsed=1 then
         frexif.ValueListEditor1.InsertRow('Use flash','Yes',true)
       else
         frexif.ValueListEditor1.InsertRow('Use flash','No',true);
       if ImgData.ExifObj.HasThumbnail then
         frexif.ValueListEditor1.InsertRow('Thumbnail','Yes',true)
       else
         frexif.ValueListEditor1.InsertRow('Thumbnail','No',true);
       for i:=0 to ImgData.ExifObj.ThumbTagCount-1 do
       begin
         frexif.ValueListEditor1.InsertRow(ImgData.ExifObj.ThumbTagByIndex[i].Name,ImgData.ExifObj.ThumbTagByIndex[i].Data,true);
       end;
     end;
     //ImgData.Free;
     FreeAndNil(ImgData);
   end;
    frexif.ShowModal;
 end;
end;

procedure Tfrmain.mnuShowThumbsClick(Sender: TObject);
begin
  frmain.mnuShowThumbs.Checked:=not frmain.mnuShowThumbs.Checked;
  frmain.tbShowThumbs.Down:=frmain.mnuShowThumbs.Checked;
  showthumbs:=frmain.mnuShowThumbs.Checked;
  if showthumbs=false then
  begin
    refreshthumbs;
    if frmain.StatusBar1.Visible then
      frmain.Splitter2.Top:=frmain.StatusBar1.Top
    else
      frmain.Splitter2.Top:=frmain.Height;
    frmain.sboxthumb.Visible:=false;
  end
  else
  begin
    frmain.sboxthumb.Visible:=true;
    if frmain.StatusBar1.Visible then
      frmain.Splitter2.Top:=frmain.StatusBar1.Top-thumbsize
    else
      frmain.Splitter2.Top:=frmain.StatusBar1.Top-thumbsize-frmain.StatusBar1.Height;
    PairSplitterSide2Resize(nil);
  end;
end;

procedure Tfrmain.mnuResizeClick(Sender: TObject);
begin
  frresize.SpinEdit1.Value:=realimgwidth;
  frresize.SpinEdit2.Value:=realimgheight;
  frresize.ShowModal;
  if okresize then
    resizeto(frresize.SpinEdit1.Value,frresize.SpinEdit2.Value);
end;

procedure Tfrmain.mnuBRGClick(Sender: TObject);
begin
  efectimagen(8);
end;

procedure Tfrmain.mnuGBRClick(Sender: TObject);
begin
 efectimagen(9);
end;

procedure Tfrmain.mnuBrightPlusClick(Sender: TObject);
begin
  //efectimagen(10);
 filterimagen(21);
end;

procedure Tfrmain.mnuBrightLessClick(Sender: TObject);
begin
  filterimagen(22);
  //efectimagen(11);
end;

procedure Tfrmain.mnuHighlightRedClick(Sender: TObject);
begin
  efectimagen(12);
end;

procedure Tfrmain.mnuExitClick(Sender: TObject);
begin
  saveconfig;
  Application.Terminate;
end;

procedure Tfrmain.mnuHighlightGreenClick(Sender: TObject);
begin
  efectimagen(13);
end;

procedure Tfrmain.mnuHighlightBlueClick(Sender: TObject);
begin
  efectimagen(14);
end;

procedure Tfrmain.mnuCompactClick(Sender: TObject);
begin
  if (full=false) and (compactmode=false) then
  begin
    showmainmenu(false);
    fwidth:=frmain.Width;
    fheight:=frmain.Height;
    frmain.ToolBar1.Visible:=false;
    frmain.StatusBar1.Visible:=false;

    //Adjust the ScrollBox1 to the top window
    frmain.ScrollBox1.AnchorSideTop.Control:=frmain;
    frmain.ScrollBox1.AnchorSideTop.Side:=asrTop;

    frmain.Splitter1.AnchorSideTop.Control:=frmain;
    frmain.Splitter1.AnchorSideTop.Side:=asrTop;

    frmain.sboxthumb.AnchorSideBottom.Control:=frmain;
    frmain.sboxthumb.AnchorSideBottom.Side:=asrBottom;

    frmain.Splitter1.AnchorSideBottom.Control:=frmain;
    frmain.Splitter1.AnchorSideBottom.Side:=asrBottom;

    frmain.Splitter2.Top:=frmain.Splitter2.Top+frmain.StatusBar1.Height;
    compactmode:=true;
    full:=false;
  end
  else
  begin
    if compactmode then
    begin
      full:=false;
      compactmode:=false;
      frmain.ToolBar1.Align:=alTop;
      if frmain.mnuToolBar.Checked then
        frmain.ToolBar1.Visible:=true;
      frmain.Color:=clDefault;
      frmain.Label1.Visible:=false;
      frmain.Label2.Visible:=false;
      if frmain.mnuTreeView.Checked then
        frmain.Splitter1.Left:=200;
      if frmain.mnuStatusBar.Checked then
      begin
        frmain.StatusBar1.Visible:=true;
        frmain.sboxthumb.AnchorSideBottom.Control:=frmain.StatusBar1;
        frmain.sboxthumb.AnchorSideBottom.Side:=asrTop;
      end
      else
      begin
        frmain.sboxthumb.AnchorSideBottom.Control:=frmain;
        frmain.sboxthumb.AnchorSideBottom.Side:=asrBottom;
      end;
      if frmain.mnuToolBar.Checked=false then
      begin
        frmain.ToolBar1.Visible:=false;

        frmain.ScrollBox1.AnchorSideTop.Control:=frmain;
        frmain.ScrollBox1.AnchorSideTop.Side:=asrTop;

        frmain.Splitter1.AnchorSideTop.Control:=frmain;
        frmain.Splitter1.AnchorSideTop.Side:=asrTop;
      end
      else
      begin
        frmain.ToolBar1.Visible:=true;

        frmain.ScrollBox1.AnchorSideTop.Control:=frmain.ToolBar1;
        frmain.ScrollBox1.AnchorSideTop.Side:=asrBottom;

        frmain.Splitter1.AnchorSideTop.Control:=frmain.ToolBar1;
        frmain.Splitter1.AnchorSideTop.Side:=asrBottom;
      end;

      if frmain.mnuStatusBar.Checked then
      begin
        frmain.Splitter1.AnchorSideBottom.Control:=frmain.StatusBar1;
        frmain.Splitter1.AnchorSideBottom.Side:=asrTop;
      end
      else
      begin
        frmain.Splitter1.AnchorSideBottom.Control:=frmain;
        frmain.Splitter1.AnchorSideBottom.Side:=asrBottom;
      end;

      if frmain.mnuShowThumbs.Checked then
      begin
        if frmain.StatusBar1.Visible then
          frmain.Splitter2.Top:=frmain.StatusBar1.Top-thumbsize
        else
          frmain.Splitter2.Top:=frmain.StatusBar1.Top-thumbsize-frmain.StatusBar1.Height;
      end
      else
      begin
        if frmain.StatusBar1.Visible then
          frmain.Splitter2.Top:=frmain.StatusBar1.Top
        else
          frmain.Splitter2.Top:=frmain.StatusBar1.Top-frmain.StatusBar1.Height;
      end;

      //frmain.MainMenu1.Items.Visible:=frmain.mnuMenus.Checked;
      showmainmenu(true);
    end;
  end;
end;

procedure Tfrmain.mnuGoToClick(Sender: TObject);
begin
   frgoto.Edit1.Text:=inttostr(ifile+1);
   frgoto.ShowModal;
   if frgoto.Edit1.Text<>'' then
   begin
    if (isgo=true) and (strtoint(frgoto.Edit1.Text)<=flist.Count) and (strtoint(frgoto.Edit1.Text)>0) then
    begin
    ifile:=strtoint(frgoto.Edit1.Text)-1;
    loadpicture(carpeta+flist[ifile]);
    end;
   end;
end;

procedure Tfrmain.mnuAntialiasingClick(Sender: TObject);
begin
  if frmain.Image1.AntialiasingMode=amOn then
  begin
    frmain.Image1.AntialiasingMode:=amOff;
    frmain.mnuAntiAliasing.Checked:=false;
  end
  else
  begin
    frmain.Image1.AntialiasingMode:=amOn;
    frmain.mnuAntiAliasing.Checked:=true;
  end;
end;

procedure Tfrmain.mnuDesktopExpandClick(Sender: TObject);
begin
  setwallpaper('2');
end;

procedure Tfrmain.mnuDesktopCenterClick(Sender: TObject);
begin
  setwallpaper('0');
end;

procedure Tfrmain.mnuDesktopMosaicClick(Sender: TObject);
begin
  setwallpaper('','1');
end;

procedure Tfrmain.mnuDesktopStrechClick(Sender: TObject);
begin
  setwallpaper('1');
end;

procedure Tfrmain.mnuThumbCustomClick(Sender: TObject);
begin
  frmain.mnuThumb32.Checked:=false;
  frmain.mnuThumb64.Checked:=false;
  frmain.mnuThumb128.Checked:=false;
  frmain.mnuThumbCustom.Checked:=true;
  frthumbsize.ShowModal;
  //frmain.psVertical.Position:=frmain.psVertical.Height-frthumbsize.SpinEdit1.Value-18;
  if frmain.StatusBar1.Visible then
    frmain.Splitter2.Top:=frmain.StatusBar1.Top-frthumbsize.SpinEdit1.Value-18
  else
    frmain.Splitter2.Top:=frmain.StatusBar1.Top-frthumbsize.SpinEdit1.Value-18-frmain.StatusBar1.Height;
  PairSplitterSide2Resize(nil);
end;

procedure Tfrmain.mnuStrechClick(Sender: TObject);
begin
  if frmain.tbStrech.Down then
  begin
    frmain.tbStrech.Down:=false;
    frmain.mnuStrech.Checked:=false;
    zoomnormal();
  end
  else
  begin
    frmain.tbStrech.Down:=true;
    frmain.mnuStrech.Checked:=true;
    zoomstrech();
  end;
end;

procedure Tfrmain.mnuUndoClick(Sender: TObject);
begin
   Dec(historyindex);
   if ifgif then
     BGRAGif:=historyeditbgragif[historyindex];
   if ifapng then
     APNGImage.Assign(historyeditapng[historyindex]);
   if (ifgif=false) and (ifapng=false) then
     frmain.Image1.Picture.Graphic.Assign(historyeditbitmap[historyindex]);

  if historyindex=0 then
  begin
    frmain.mnuUndo.Enabled:=false;
    frmain.mnuRedo.Enabled:=true;
  end;
end;

procedure Tfrmain.mnuWindowEffectsClick(Sender: TObject);
begin
  freffect.Show;
end;

procedure Tfrmain.mnuNegativeClick(Sender: TObject);
begin
  filterimagen(13);
end;

procedure Tfrmain.mnuSmoothClick(Sender: TObject);
begin
  filterimagen(15);
end;

procedure Tfrmain.mnuRealModeClick(Sender: TObject);
begin
  frmain.mnuRealMode.Checked:=not frmain.mnuRealMode.Checked;
  if Assigned(flist) and frmain.Image1.Visible then
  begin
    loadpicture(carpeta+flist[ifile],frmain.mnuRealMode.Checked);
  end;
end;

procedure Tfrmain.mnuTreeViewClick(Sender: TObject);
begin
  frmain.mnuTreeView.Checked:=not frmain.mnuTreeView.Checked;
  frmain.tbShowTreeView.Down:=frmain.mnuTreeView.Checked;
  if frmain.mnuTreeView.Checked then
    frmain.Splitter1.Left:=200
  else
    frmain.Splitter1.Left:=0-frmain.Splitter1.Width;
  frmain.ShellTreeView1.Visible:=frmain.mnuTreeView.Checked;
  if (frmain.mnuToolBar.Checked=false) or compactmode or full then
  begin
    frmain.ToolBar1.Visible:=false;
    frmain.Splitter1.AnchorSideTop.Control:=frmain;
    frmain.Splitter1.AnchorSideTop.Side:=asrTop;
  end
  else
  begin
    frmain.ToolBar1.Visible:=true;
    frmain.Splitter1.AnchorSideTop.Control:=frmain.ToolBar1;
    frmain.Splitter1.AnchorSideTop.Side:=asrBottom;
  end;
  if frmain.mnuStatusBar.Checked or compactmode or full then
  begin
    frmain.Splitter1.AnchorSideBottom.Control:=frmain.StatusBar1;
    frmain.Splitter1.AnchorSideBottom.Side:=asrTop;
  end
  else
  begin
    frmain.Splitter1.AnchorSideBottom.Control:=frmain;
    frmain.Splitter1.AnchorSideBottom.Side:=asrBottom;
  end;
end;

procedure Tfrmain.mnuAboutClick(Sender: TObject);
begin
  ShowMessage('Imagen viewer: LazView'+#13#10+'Version: 0.1'+#13#10+'Created by: nenirey@gmail.com'+#13#10+'CopyLeft: 2018'+lineending+lineending+'Thanks to the creators of the next libraries used by the project:'+lineending+lineending+'BGRABitmap by circular at operamail.com'+lineending+lineending+'Vampyre Imaging Library by Marek Mauder (marekmauder@gmail.com)'+lineending+lineending+'dEXIF by Gerry McGuire (mcguirez@hotmail.com)');
end;

procedure Tfrmain.mnuToolBarClick(Sender: TObject);
begin
  if frmain.ToolBar1.Visible then
  begin
    frmain.ToolBar1.Visible:=false;
    //frmain.psVertical.AnchorSideTop.Control:=frmain;
    frmain.ScrollBox1.AnchorSideTop.Control:=frmain;
    //frmain.psVertical.AnchorSideTop.Side:=asrTop;
    frmain.ScrollBox1.AnchorSideTop.Side:=asrTop;
    frmain.Splitter1.AnchorSideTop.Control:=frmain;
    frmain.Splitter1.AnchorSideTop.Side:=asrTop;
  end
  else
  begin
    frmain.ToolBar1.Visible:=true;
    //frmain.psVertical.AnchorSideTop.Control:=frmain.ToolBar1;
    frmain.ScrollBox1.AnchorSideTop.Control:=frmain.ToolBar1;
    //frmain.psVertical.AnchorSideTop.Side:=asrBottom;
    frmain.ScrollBox1.AnchorSideTop.Side:=asrBottom;
    frmain.Splitter1.AnchorSideTop.Control:=frmain.ToolBar1;
    frmain.Splitter1.AnchorSideTop.Side:=asrBottom;
  end;
  frmain.mnuToolBar.Checked:=frmain.ToolBar1.Visible;
end;

procedure Tfrmain.mnuStatusBarClick(Sender: TObject);
begin
  frmain.StatusBar1.Visible:=not frmain.StatusBar1.Visible;
  frmain.mnuStatusBar.Checked:=frmain.StatusBar1.Visible;
  if frmain.StatusBar1.Visible then
  begin
    //frmain.psVertical.AnchorSideBottom.Control:=frmain.StatusBar1;
   frmain.sboxthumb.AnchorSideBottom.Control:=frmain.StatusBar1;
    //frmain.psVertical.AnchorSideBottom.Side:=asrTop;
    frmain.sboxthumb.AnchorSideBottom.Side:=asrTop;
    frmain.Splitter2.Top:=frmain.Splitter2.Top-frmain.StatusBar1.Height;
  end
  else
  begin
    //frmain.psVertical.AnchorSideBottom.Control:=frmain;
    frmain.sboxthumb.AnchorSideBottom.Control:=frmain;
    //frmain.psVertical.AnchorSideBottom.Side:=asrBottom;
    frmain.sboxthumb.AnchorSideBottom.Side:=asrBottom;
    frmain.Splitter2.Top:=frmain.Splitter2.Top+frmain.StatusBar1.Height;
  end;
  if frmain.mnuStatusBar.Checked then
  begin
    frmain.Splitter1.AnchorSideBottom.Control:=frmain.StatusBar1;
    frmain.Splitter1.AnchorSideBottom.Side:=asrTop;
  end
  else
  begin
    frmain.Splitter1.AnchorSideBottom.Control:=frmain;
    frmain.Splitter1.AnchorSideBottom.Side:=asrBottom;
  end;
end;

procedure Tfrmain.mnuThumb32Click(Sender: TObject);
begin
  frmain.mnuThumb32.Checked:=true;
  frmain.mnuThumb64.Checked:=false;
  frmain.mnuThumb128.Checked:=false;
  frmain.mnuThumbCustom.Checked:=false;

  //frmain.psVertical.Position:=frmain.psVertical.Height-32-18;
  if frmain.StatusBar1.Visible then
    frmain.Splitter2.Top:=frmain.StatusBar1.Top-32-18
  else
    frmain.Splitter2.Top:=frmain.StatusBar1.Top-32-18-frmain.StatusBar1.Height;
  PairSplitterSide2Resize(nil);
end;

procedure Tfrmain.mnuThumb64Click(Sender: TObject);
begin
  frmain.mnuThumb32.Checked:=false;
  frmain.mnuThumb64.Checked:=true;
  frmain.mnuThumb128.Checked:=false;
  frmain.mnuThumbCustom.Checked:=false;
  //frmain.psVertical.Position:=frmain.psVertical.Height-64-18;
  if frmain.StatusBar1.Visible then
    frmain.Splitter2.Top:=frmain.StatusBar1.Top-64-18
  else
    frmain.Splitter2.Top:=frmain.StatusBar1.Top-64-18-frmain.StatusBar1.Height;
  PairSplitterSide2Resize(nil);
end;

procedure Tfrmain.mnuThumb128Click(Sender: TObject);
begin
  frmain.mnuThumb32.Checked:=false;
  frmain.mnuThumb64.Checked:=false;
  frmain.mnuThumb128.Checked:=true;
  frmain.mnuThumbCustom.Checked:=false;
  //frmain.psVertical.Position:=frmain.psVertical.Height-128-18;
  if frmain.StatusBar1.Visible then
    frmain.Splitter2.Top:=frmain.StatusBar1.Top-128-18
  else
    frmain.Splitter2.Top:=frmain.StatusBar1.Top-128-18-frmain.StatusBar1.Height;
  PairSplitterSide2Resize(nil);
end;

procedure Tfrmain.mnuMosaicClick(Sender: TObject);
begin
  if frmain.mnuMosaic.Checked then
  begin
    mosaic.Clear;
    frmain.ScrollBox1.Repaint;
    frmain.sboxthumb.Repaint;
    frmain.Splitter2.Color:=clNone;
  end
  else
  begin
    mosaic:=Graphics.TBitmap.Create;
    rendermosaic;
    frmain.sboxthumb.Repaint;
    frmain.Splitter2.Color:=clWhite;
  end;
  frmain.mnuMosaic.Checked:=not frmain.mnuMosaic.Checked;
  frmain.Image1.Repaint;
end;

procedure Tfrmain.mnuSwirlClick(Sender: TObject);
begin
  filterimagen(9);
end;

procedure Tfrmain.mnuMenusClick(Sender: TObject);
begin
  frmain.mnuMenus.Checked:=not frmain.mnuMenus.Checked;
  showmainmenu(frmain.mnuMenus.Checked);
end;

procedure Tfrmain.mnuFlipHClick(Sender: TObject);
begin
  if (realimgwidth>256) or ifgif then
    filterimagen(19)
  else
    efectimagen(1);
end;

procedure Tfrmain.mnuFlipVClick(Sender: TObject);
begin
  if (realimgwidth>256) or ifgif then
    filterimagen(20)
  else
    efectimagen(2);
end;

procedure Tfrmain.mnuRotateLClick(Sender: TObject);
begin
  if (realimgwidth>256) or ifgif then
    filterimagen(18)
  else
    efectimagen(3);
end;

procedure Tfrmain.mnuRotateRClick(Sender: TObject);
begin
  if (realimgwidth>256) or ifgif then
    filterimagen(17)
  else
    efectimagen(4);
end;

procedure Tfrmain.PairSplitterSide2Resize(Sender: TObject);
begin
  if frmain.StatusBar1.Visible then
    thumbsize:=frmain.sboxthumb.Height+frmain.StatusBar1.Height
  else
    thumbsize:=frmain.sboxthumb.Height;
  showthumbs:=true;
  frmain.mnuShowThumbs.Checked:=true;
  frmain.tbShowThumbs.Down:=true;
  frmain.Timer4.Enabled:=true;
end;

procedure Tfrmain.PairSplitterSide3Resize(Sender: TObject);
begin
  if frmain.Splitter1.Left<>0 then
  begin
    frmain.ShellTreeView1.Visible:=true;
    frmain.mnuTreeView.Checked:=true;
    frmain.tbShowTreeView.Down:=true;
  end;
end;

procedure Tfrmain.PopupMenu1Close(Sender: TObject);
begin
  frmain.PopupMenu1.Tag:=0;
end;

procedure Tfrmain.PopupMenu1Popup(Sender: TObject);
var
   i,s,c:integer;
   mi:TMenuItem;
   sm:TMenuItem;
   cm:TMenuItem;
begin
 frmain.PopupMenu1.Tag:=1;
 if frmain.PopupMenu1.Items.Count<2 then
 begin
   for i:=0 to frmain.MainMenu1.Items.Count-1 do
   begin
     mi:=TMenuItem.Create(frmain.PopupMenu1);
     mi.Caption:=frmain.MainMenu1.Items[i].Caption;
     frmain.PopupMenu1.Items.Add(mi);
     for s:=0 to frmain.MainMenu1.Items[i].Count-1 do
     begin
       sm:=TMenuItem.Create(frmain.PopupMenu1);
       sm.Caption:=frmain.MainMenu1.Items[i].Items[s].Caption;
       sm.OnClick:=frmain.MainMenu1.Items[i].Items[s].OnClick;
       sm.Checked:=frmain.MainMenu1.Items[i].Items[s].Checked;
       sm.Enabled:=frmain.MainMenu1.Items[i].Items[s].Enabled;
       sm.ShortCut:=frmain.MainMenu1.Items[i].Items[s].ShortCut;
       frmain.PopupMenu1.Items[i].Add(sm);
       for c:=0 to frmain.MainMenu1.Items[i].Items[s].Count-1 do
       begin
         cm:=TMenuItem.Create(frmain.PopupMenu1);
         cm.Caption:=frmain.MainMenu1.Items[i].Items[s].Items[c].Caption;
         cm.OnClick:=frmain.MainMenu1.Items[i].Items[s].Items[c].OnClick;
         cm.Checked:=frmain.MainMenu1.Items[i].Items[s].Items[c].Checked;
         cm.Enabled:=frmain.MainMenu1.Items[i].Items[s].Items[c].Enabled;
         cm.ShortCut:=frmain.MainMenu1.Items[i].Items[s].Items[c].ShortCut;
         frmain.PopupMenu1.Items[i].Items[s].Add(cm);
       end;
     end;
   end;
 end;
  for i:=0 to frmain.MainMenu1.Items.Count-1 do
  begin
    for s:=0 to frmain.MainMenu1.Items[i].Count-1 do
    begin
      frmain.PopupMenu1.Items[i].Items[s].Caption:=frmain.MainMenu1.Items[i].Items[s].Caption;
      frmain.PopupMenu1.Items[i].Items[s].Checked:=frmain.MainMenu1.Items[i].Items[s].Checked;
      frmain.PopupMenu1.Items[i].Items[s].Enabled:=frmain.MainMenu1.Items[i].Items[s].Enabled;
    end;
  end;
end;

procedure Tfrmain.sboxthumbPaint(Sender: TObject);
begin
  if frmain.mnuMosaic.Checked then
    frmain.sboxthumb.Canvas.Draw(frmain.sboxthumb.HorzScrollBar.Position,0,mosaic);
end;

procedure Tfrmain.ScrollBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure Tfrmain.ScrollBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

end;

procedure Tfrmain.ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
   lwidth,lheight:integer;
begin
   realmode;
   lwidth:=frmain.Image1.Width;
   lheight:=frmain.Image1.Height;
   if frmain.Image1.Align = alClient then
   begin
     frmain.ScrollBox1.Enabled:=true;
     frmain.Image1.Stretch:=true;
     frmain.tbStrech.Down:=false;
     frmain.Image1.AutoSize:=false;
     frmain.Image1.Align:=alNone;
     frmain.Image1.Width:=lwidth;
     frmain.Image1.Height:=lheight;
   end;
  if WheelDelta>0 then
  begin
    frmain.Image1.Width:=frmain.Image1.Width+20;
    frmain.Image1.Height:=frmain.Image1.Height+20;

    if MousePos.y>frmain.ScrollBox1.Height/2 then
      frmain.Image1.Top:=frmain.Image1.Top-18
    else
      frmain.Image1.Top:=frmain.Image1.Top-7;

    if MousePos.x>frmain.ScrollBox1.Width/2 then
      frmain.Image1.Left:=frmain.Image1.Left-18
    else
      frmain.Image1.Left:=frmain.Image1.Left-7;
  end
  else
  begin
    frmain.Image1.Width:=frmain.Image1.Width-20;
    frmain.Image1.Height:=frmain.Image1.Height-20;

    if MousePos.y>frmain.ScrollBox1.Height/2 then
      frmain.Image1.Top:=frmain.Image1.Top+18
    else
      frmain.Image1.Top:=frmain.Image1.Top+7;

    if MousePos.x>frmain.ScrollBox1.Width/2 then
      frmain.Image1.Left:=frmain.Image1.Left+18
    else
      frmain.Image1.Left:=frmain.Image1.Left+7;
  end;
end;

procedure Tfrmain.ScrollBox1Paint(Sender: TObject);
begin
  if frmain.mnuMosaic.Checked then
    frmain.ScrollBox1.Canvas.Draw(0,0,mosaic);
end;

procedure Tfrmain.sboxthumbMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mosaicmousedown:=true;
  mosaicscrollposition:=frmain.sboxthumb.HorzScrollBar.Position;
  mosaicmouseposition:=X;
end;

procedure Tfrmain.sboxthumbMouseLeave(Sender: TObject);
begin
  mosaicmousedown:=false;
end;

procedure Tfrmain.sboxthumbMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if mosaicmousedown then
  begin
    frmain.sboxthumb.HorzScrollBar.Position:=mosaicscrollposition-(X-mosaicmouseposition);
  end;
end;

procedure Tfrmain.sboxthumbMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mosaicmousedown:=false;
end;

procedure Tfrmain.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  shaperect.Left:=X;
  shaperect.Top:=Y;
  shaperect.Bottom:=frmain.Shape1.BaseBounds.Bottom;
  shaperect.Right:=frmain.Shape1.BaseBounds.Right;
  shapemousedown:=true;
end;

procedure Tfrmain.Shape1MouseLeave(Sender: TObject);
begin
  //shapemousedown:=false;
end;

procedure Tfrmain.Shape1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  //Right Top Corner
  if (Y>0) and (Y<10) and (X>0) and (X<10) then
  begin
    frmain.Shape1.Cursor:=crSizeNW;
    if shapemousedown then
    begin
      frmain.Shape1.Top:=Mouse.CursorPos.Y-shaperect.Top-frmain.Image1.ClientOrigin.Y;
      frmain.Shape1.Left:=Mouse.CursorPos.X-shaperect.Left-frmain.Image1.ClientOrigin.X;
      while frmain.Shape1.BoundsRect.Bottom<shaperect.Bottom do
        frmain.Shape1.Height:=frmain.Shape1.Height+1;
      while frmain.Shape1.BoundsRect.Right<shaperect.Right do
        frmain.Shape1.Width:=frmain.Shape1.Width+1;
      while frmain.Shape1.BoundsRect.Bottom>shaperect.Bottom do
        frmain.Shape1.Height:=frmain.Shape1.Height-1;
      while frmain.Shape1.BoundsRect.Right>shaperect.Right do
        frmain.Shape1.Width:=frmain.Shape1.Width-1;
    end;
  end;
  //Top
  if (Y<10) and (X>10) and (X<frmain.Shape1.Width-10) then
  begin
    frmain.Shape1.Cursor:=crSizeS;
    if shapemousedown then
    begin
      frmain.Shape1.Top:=Mouse.CursorPos.Y-shaperect.Top-frmain.Image1.ClientOrigin.Y;
      while frmain.Shape1.BoundsRect.Bottom<shaperect.Bottom do
        frmain.Shape1.Height:=frmain.Shape1.Height+1;
      while frmain.Shape1.BoundsRect.Bottom>shaperect.Bottom do
        frmain.Shape1.Height:=frmain.Shape1.Height-1;
    end;
  end;
  //Left
  if (Y>10) and (X<10) and (Y<frmain.Shape1.Height-10) then
  begin
    frmain.Shape1.Cursor:=crSizeW;
    if shapemousedown then
    begin
      frmain.Shape1.Left:=Mouse.CursorPos.X-shaperect.Left-frmain.Image1.ClientOrigin.X;
      while frmain.Shape1.BoundsRect.Right<shaperect.Right do
        frmain.Shape1.Width:=frmain.Shape1.Width+1;
      while frmain.Shape1.BoundsRect.Right>shaperect.Right do
        frmain.Shape1.Width:=frmain.Shape1.Width-1;
    end;
  end;
  //Left Top Corner
  if (Y<10) and (X>frmain.Shape1.Width-10) then
  begin
    frmain.Shape1.Cursor:=crSizeNE;
    if shapemousedown then
    begin
      frmain.Shape1.Top:=Mouse.CursorPos.Y-shaperect.Top-frmain.Image1.ClientOrigin.Y;
      frmain.Shape1.Width:=X+5;
      while frmain.Shape1.BoundsRect.Bottom<shaperect.Bottom do
        frmain.Shape1.Height:=frmain.Shape1.Height+1;
      while frmain.Shape1.BoundsRect.Bottom>shaperect.Bottom do
        frmain.Shape1.Height:=frmain.Shape1.Height-1;
    end;
  end;
  //Right
  if (Y>10) and (Y<frmain.Shape1.Height-10) and (X>frmain.Shape1.Width-10) then
  begin
    frmain.Shape1.Cursor:=crSizeW;
    if shapemousedown then
      frmain.Shape1.Width:=X+5;
  end;
  //Bottom
  if (Y>frmain.Shape1.Height-10) and (X>10) and (X<frmain.Shape1.Width-10) then
  begin
    frmain.Shape1.Cursor:=crSizeS;
    if shapemousedown then
      frmain.Shape1.Height:=Y+5;
  end;
  //Left Bottom Corner
  if (Y>frmain.Shape1.Height-10) and (X<10) then
  begin
    frmain.Shape1.Cursor:=crSizeNE;
    if shapemousedown then
    begin
      frmain.Shape1.Height:=Y+5;
      frmain.Shape1.Left:=Mouse.CursorPos.X-shaperect.Left-frmain.Image1.ClientOrigin.X;
      while frmain.Shape1.BoundsRect.Right<shaperect.Right do
        frmain.Shape1.Width:=frmain.Shape1.Width+1;
      while frmain.Shape1.BoundsRect.Right>shaperect.Right do
        frmain.Shape1.Width:=frmain.Shape1.Width-1;
    end;
  end;
  //Right Bottom Corner
  if (Y>frmain.Shape1.Height-10) and (X>frmain.Shape1.Width-10) then
  begin
    frmain.Shape1.Cursor:=crSizeNW;
    if shapemousedown then
    begin
      frmain.Shape1.Width:=X+5;
      frmain.Shape1.Height:=Y+5;
    end;
  end;
  if (Y>10) and (X>10) and (Y<frmain.Shape1.Height-10) and (X<frmain.Shape1.Width-10) then
  begin
    frmain.Shape1.Cursor:=crSizeALL;
    if shapemousedown then
    begin
      frmain.Shape1.Top:=Mouse.CursorPos.Y-shaperect.Top-frmain.Image1.ClientOrigin.Y;
      frmain.Shape1.Left:=Mouse.CursorPos.X-shaperect.Left-frmain.Image1.ClientOrigin.X;
    end;
  end;
end;

procedure Tfrmain.Shape1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  shapemousedown:=false;
end;

procedure Tfrmain.ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if Node.Parent=nil then
  begin
    case Node.Index of
      0:
       begin
         {$IFDEF WINDOWS}
         frmain.ShellTreeView1.Path:=GetWindowsSpecialDir(CSIDL_DESKTOPDIRECTORY);
         {$ENDIF}
       end;
      1:
       begin
         {$IFDEF WINDOWS}
         frmain.ShellTreeView1.Path:=GetWindowsSpecialDir(CSIDL_MYPICTURES);
         {$ENDIF}
       end;
       2:
       begin
         {$IFDEF WINDOWS}
         frmain.ShellTreeView1.Path:=GetWindowsSpecialDir(CSIDL_PERSONAL);
         {$ENDIF}
       end;
    end;
  end;
end;

procedure Tfrmain.ShellTreeView1Click(Sender: TObject);
begin

end;

procedure Tfrmain.ShellTreeView1Enter(Sender: TObject);
begin
  frmain.ScrollBox1.SetFocus;
end;

procedure Tfrmain.ShellTreeView1Expanded(Sender: TObject; Node: TTreeNode);
var
   i:integer;
begin
  for i:=0 to Node.SubTreeCount-2 do
    Node.Items[i].StateIndex:=16;
end;

procedure Tfrmain.ShellTreeView1SelectionChanged(Sender: TObject);
begin
  if DirectoryExists(frmain.ShellTreeView1.Path) then
  begin
    loadfiles(frmain.ShellTreeView1.Path,'');
  end;
end;

procedure Tfrmain.tbFirstImageClick(Sender: TObject);
begin
  if Assigned(flist) then
  begin
    ifile:=0;
    loadpicture(carpeta+flist[0]);
  end;
end;

procedure Tfrmain.tbInformationClick(Sender: TObject);
begin
  frmain.mnuEXIFClick(nil);
end;

procedure Tfrmain.tbLastImageClick(Sender: TObject);
begin
  if Assigned(flist) then
  begin
    ifile:=flist.Count-1;
    loadpicture(carpeta+flist[flist.Count-1]);
  end;
end;

procedure Tfrmain.Timer1Timer(Sender: TObject);
begin
  if nfile>0 then
  begin
    if aleatorio then
    begin
      ifile:=Round(Random(nfile-1));
    end
    else
    begin
      if nfile > 0 then
      begin
        if ifile+1 < nfile then
          Inc(ifile)
        else
          ifile:=0;
      end;
    end;
    try
      loadpicture(carpeta+flist[ifile]);
    except
      on E:Exception do frmain.StatusBar1.SimpleText:=inttostr(ifile+1)+'/'+inttostr(nfile)+' Formato no soportado!!!';
    end;
  end;
end;

procedure Tfrmain.Timer2Timer(Sender: TObject);
begin
  if hidetoolbardelay>0 then
    Dec(hidetoolbardelay);
  if full and (hidetoolbardelay=0) and (Screen.Cursor=crDefault) and (frmain.PopupMenu1.Tag<>1) then
  begin
    frmain.ToolBar1.Visible:=false;
    Screen.Cursor:=crNone;
  end;
end;

procedure Tfrmain.Timer3Timer(Sender: TObject);
begin
  if Assigned(BGRAGif) then
  begin
    frmain.Image1.Picture.Bitmap.Assign(BGRAgif.Bitmap);
    frmain.Timer3.Interval:=BGRAgif.FrameDelayMs[BGRAGif.CurrentImage];
    frmain.StatusBar1.Panels[2].Text:='Frame '+inttostr(BGRAGif.CurrentImage+1)+'/'+inttostr(BGRAGif.Count);
  end;
end;

procedure Tfrmain.Timer4Timer(Sender: TObject);
begin
  if Assigned(flist) then
  begin
    refreshthumbs;
    ththumbs:=thumbsthread.Create(true);
    ththumbs.thumbpath:=carpeta;
    ththumbs.Start;
  end;
  frmain.Timer4.Enabled:=false;
end;

procedure Tfrmain.Timer5Timer(Sender: TObject);
var
   pngrect:TRect;
   tmpbitmap:Graphics.TBitmap;
begin
  try
    if Assigned(APNGImage) then
    begin
      if Sender<>nil then
      begin
        if APNGImage.ActiveImage<APNGImage.ImageCount-1 then
          APNGImage.ActiveImage:=APNGImage.ActiveImage+1
        else
          APNGImage.ActiveImage:=0;
      end;
      pngrect.Top:=0;
      pngrect.Left:=0;
      pngrect.Width:=APNGImage.Width;
      pngrect.Height:=APNGImage.Height;
      tmpbitmap:=Graphics.TBitmap.Create;
      ImagingComponents.ConvertImageToBitmap(APNGImage,tmpbitmap);
      frmain.Image1.Picture.Bitmap.Assign(tmpbitmap);
      frmain.Timer5.Interval:=APNGDelays[APNGImage.ActiveImage];
      frmain.Image1.Refresh;
      frmain.StatusBar1.Panels[2].Text:=inttostr(APNGImage.ActiveImage+1)+'/'+inttostr(APNGImage.ImageCount);
      FreeAndNil(tmpbitmap);
    end;
  except on e:exception do
  end;
end;

procedure Tfrmain.ToolBar1MouseLeave(Sender: TObject);
begin
  if full then
    frmain.Timer2.Enabled:=true;
end;

procedure Tfrmain.ToolBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  frmain.Timer2.Enabled:=false;
end;

procedure Tfrmain.tbZoomOutClick(Sender: TObject);
begin
  zoomout();
end;

procedure Tfrmain.tbAdjustClick(Sender: TObject);
begin
  zoomnormal();
end;

procedure Tfrmain.tbPlayShowClick(Sender: TObject);
begin
  frmain.Timer1.Enabled:=not frmain.Timer1.Enabled;
  if frmain.Timer1.Enabled then
  begin
    showthumbs:=false;
    if full=false then
      fullsc;
    frmain.tbPlayShow.ImageIndex:=12;
    frmain.Label1.Visible:=false;
    frmain.Label2.Visible:=false;
    frmain.Splitter2.Top:=frmain.Height;
    frmain.sboxthumb.Visible:=false;
  end
  else
    frmain.tbPlayShow.ImageIndex:=13;
end;

procedure Tfrmain.tbRandomClick(Sender: TObject);
begin
  aleatorio:=not aleatorio;
  frmain.tbRandom.Down:=aleatorio;
end;

procedure Tfrmain.tbZoom100Click(Sender: TObject);
begin
  zoomoriginal();
end;

procedure Tfrmain.tbReloadClick(Sender: TObject);
begin
  loadpicture(carpeta+flist[ifile]);
end;

procedure Tfrmain.tbShowTreeViewClick(Sender: TObject);
begin
  frmain.mnuTreeView.Checked:=not frmain.mnuTreeView.Checked;
  frmain.tbShowTreeView.Down:=frmain.mnuTreeView.Checked;
  if frmain.mnuTreeView.Checked then
    frmain.Splitter1.Left:=200
  else
    frmain.Splitter1.Left:=0-frmain.Splitter1.Width;
  frmain.ShellTreeView1.Visible:=frmain.mnuTreeView.Checked;
end;

procedure Tfrmain.tbSelectClick(Sender: TObject);
begin
  frmain.mnuSelect.Checked:=not frmain.mnuSelect.Checked;
  frmain.tbSelect.Down:=frmain.mnuSelect.Checked;
  if frmain.mnuSelect.Checked then
    frmain.Image1.Cursor:=crCross
  else
  begin
    frmain.Shape1.Hide;
    frmain.mnuCrop.Enabled:=false;
  end;
end;

procedure Tfrmain.tbPrevFrameClick(Sender: TObject);
begin
  if ifgif then
  begin
    BGRAGif.Pause;
    frmain.Timer3.Enabled:=false;
    if BGRAGif.CurrentImage>0 then
      BGRAGif.CurrentImage:=BGRAGif.CurrentImage-1
    else
      BGRAGif.CurrentImage:=BGRAGif.Count-1;
    frmain.tbPauseAnim.ImageIndex:=21;
    frmain.Timer3Timer(nil);
  end;
  if ifapng then
  begin
    frmain.Timer5.Enabled:=false;
    if APNGImage.ActiveImage>0 then
      APNGImage.ActiveImage:=APNGImage.ActiveImage-1
    else
      APNGImage.ActiveImage:=APNGImage.ImageCount-1;
    frmain.tbPauseAnim.ImageIndex:=21;
    frmain.Timer5Timer(nil);
  end;
end;

procedure Tfrmain.tbPrevImageClick(Sender: TObject);
begin
   prevfile();
end;

procedure Tfrmain.tbNextFrameClick(Sender: TObject);
begin
  if ifgif then
  begin
    BGRAGif.Pause;
    frmain.Timer3.Enabled:=false;
    if BGRAGif.CurrentImage<BGRAGif.Count-1 then
      BGRAGif.CurrentImage:=BGRAGif.CurrentImage+1
    else
      BGRAGif.CurrentImage:=0;
    frmain.tbPauseAnim.ImageIndex:=21;
    frmain.Timer3Timer(nil);
  end;
  if ifapng then
  begin
    frmain.Timer5.Enabled:=false;
    frmain.tbPauseAnim.ImageIndex:=21;
    frmain.Timer5Timer(self);
  end;
end;

procedure Tfrmain.tbPauseAnimClick(Sender: TObject);
begin
  if ifgif then
    begin
    if BGRAGif.Paused then
    begin
      frmain.tbPauseAnim.ImageIndex:=21;
      BGRAGif.Resume;
    end
    else
    begin
      frmain.tbPauseAnim.ImageIndex:=22;
      BGRAGif.Pause;
    end;
    frmain.Timer3.Enabled:=not BGRAGif.Paused;
  end;
  if ifapng then
  begin
    if frmain.Timer5.Enabled=false then
    begin
      frmain.tbPauseAnim.ImageIndex:=21;
      frmain.Timer5.Enabled:=true;
    end
    else
    begin
      frmain.tbPauseAnim.ImageIndex:=22;
      frmain.Timer5.Enabled:=false;
    end;
  end;
end;

procedure Tfrmain.tbStrechClick(Sender: TObject);
begin
  frmain.mnuStrech.Checked:=not frmain.mnuStrech.Checked;
  frmain.tbStrech.Down:=frmain.mnuStrech.Checked;
  if frmain.tbStrech.Down then
    zoomstrech()
  else
    zoomnormal();
end;

procedure Tfrmain.tbSlowAnimClick(Sender: TObject);
var
   i:integer;
begin
  if ifgif then
  begin
    for i:=0 to BGRAGif.Count-1 do
      BGRAGif.FrameDelayMs[i]:=BGRAGif.FrameDelayMs[i]+10;
  end;
  if ifapng then
  begin
    for i:=0 to Length(APNGDelays)-1 do
      APNGDelays[i]:= APNGDelays[i]+10;
  end;
end;

procedure Tfrmain.tbFastAnimClick(Sender: TObject);
  var
   i:integer;
begin
  if ifgif then
  begin
    for i:=0 to BGRAGif.Count-1 do
    begin
      if BGRAGif.FrameDelayMs[i]>10 then
        BGRAGif.FrameDelayMs[i]:=BGRAGif.FrameDelayMs[i]-9;
      if BGRAGif.FrameDelayMs[i]>1 then
        BGRAGif.FrameDelayMs[i]:=BGRAGif.FrameDelayMs[i]-1;
    end;
  end;
  if ifapng then
  begin
    for i:=0 to Length(APNGDelays)-1 do
    begin
      if APNGDelays[i]>10 then
        APNGDelays[i]:=APNGDelays[i]-9;
      if APNGDelays[i]>1 then
        APNGDelays[i]:=APNGDelays[i]-1;
    end;
  end;
end;

procedure Tfrmain.tbNextImageClick(Sender: TObject);
begin
   nextfile;
end;

procedure Tfrmain.tbFullScreenClick(Sender: TObject);
begin
  fullsc;
end;

procedure Tfrmain.tbFlipHorizontalClick(Sender: TObject);
begin
 if ((realimgwidth>256) or ifgif or ifapng) and ((LCLintf.GetKeyState( VK_SHIFT ) <> -128) and (LCLintf.GetKeyState( VK_SHIFT ) <> -127)) then
   filterimagen(19)
 else
   efectimagen(1);
end;

procedure Tfrmain.tbFlipVerticalClick(Sender: TObject);
begin
  if ((realimgwidth>256) or ifgif or ifapng) and ((LCLintf.GetKeyState( VK_SHIFT ) <> -128) and (LCLintf.GetKeyState( VK_SHIFT ) <> -127)) then
    filterimagen(20)
  else
    efectimagen(2);
end;

procedure Tfrmain.tbPrintClick(Sender: TObject);
var
   MyPrinter : TPrinter;
   myBitMap : Graphics.TBitmap;
   tmpbgra:TBGRABitMap;
   bgcolor:TBGRAPixel;
   i:integer;
begin
 try
  for i:=0 to printer.Printers.Count-1 do
    frprint.cbPrinter.AddItem(printer.Printers[i],nil);
  frprint.cbPrinter.ItemIndex:=printer.PrinterIndex;
  for i:=0 to printer.PaperSize.SupportedPapers.Count-1 do
    frprint.cbSheel.AddItem(printer.PaperSize.SupportedPapers[i],nil);
  frprint.cbSheel.ItemIndex:=frprint.cbSheel.Items.IndexOf(printer.PaperSize.DefaultPaperName);
  if printer.Orientation=poLandscape then
    frprint.rbVertical.Checked:=false
  else
    frprint.rbHorizontal.Checked:=true;
  frprint.speCopys.Value:=1;
  frprint.ShowModal;
  if frprint.accept then
  begin
    if frprint.rbHorizontal.Checked then
      printer.Orientation:=poLandscape
    else
      printer.Orientation:=poPortrait;
    printer.Copies:=frprint.speCopys.Value;
    printer.PrinterIndex:=frprint.cbPrinter.ItemIndex;
    printer.PaperSize.PaperName:=frprint.cbSheel.Items[frprint.cbSheel.ItemIndex];
    bgcolor.alpha:=0;
    bgcolor.red:=255;
    bgcolor.green:=255;
    bgcolor.blue:=255;
    tmpbgra:=TBGRABitMap.Create(printer.PageWidth,printer.PageHeight);
    tmpbgra.Assign(frmain.Image1.Picture.Bitmap);
    myBitMap := Graphics.TBitMap.Create;
    myBitMap.Width := printer.PageWidth;
    myBitMap.Height := printer.PageHeight;
    myBitMap.Assign(GetBitMapThumbnail(tmpbgra,printer.PageWidth,printer.PageHeight, bgcolor, false));
    MyPrinter := Printer;
    MyPrinter.BeginDoc;
    myPrinter.Canvas.CopyRect(Classes.Rect(0, 0, myPrinter.PaperSize.Width, myPrinter.PaperSize.Height),
    myBitMap.Canvas, Classes.Rect(0, 0, myBitMap.Width, myBitMap.Height));
    MyPrinter.EndDoc;
    //myBitMap.Free;
    //tmpbgra.Free;
    FreeAndNil(myBitMap);
    FreeAndNil(tmpbgra);
  end;
 except on e:exception do
   ShowMessage(e.Message);
 end;
end;




procedure Tfrmain.tbRotateLeftClick(Sender: TObject);
begin
  if ((realimgwidth>256) or ifgif or ifapng) and ((LCLintf.GetKeyState( VK_SHIFT ) <> -128) and (LCLintf.GetKeyState( VK_SHIFT ) <> -127)) then
    filterimagen(18)
  else
    efectimagen(3);
end;

procedure Tfrmain.tbRotateRightClick(Sender: TObject);
begin
  if ((realimgwidth>256) or ifgif or ifapng) and ((LCLintf.GetKeyState( VK_SHIFT ) <> -128) and (LCLintf.GetKeyState( VK_SHIFT ) <> -127)) then
    filterimagen(17)
  else
    efectimagen(4);
end;

procedure Tfrmain.tbExitClick(Sender: TObject);
begin
  if Assigned(ththumbs) then
    ththumbs.stop;
  saveconfig;
  Application.Terminate;
end;

procedure Tfrmain.tbZoomInClick(Sender: TObject);
begin
  zoomin();
end;

procedure Tfrmain.mnuLanguageClick(Sender:TObject);
var
   i:integer;
begin
  for i:=0 to frmain.mnuLanguage.Count-1 do
    frmain.mnuLanguage.Items[i].Checked:=false;
  (Sender as TMenuItem).Checked:=true;
  SetDefaultLang((Sender as TMenuItem).Caption);
end;

Constructor thumbsthread.Create(CreateSuspended:Boolean);
begin
 if Assigned(flist) then
 begin
  FreeOnTerminate:=True;
  inherited Create(CreateSuspended);
  done:=false;
 end;
end;

procedure thumbsthread.refreshthumbs;
var
   i:integer;
begin
  while frmain.sboxthumb.ControlCount>flist.Count do
  begin
    frmain.sboxthumb.DestroyComponents;
  end;
  for i:=0 to frmain.sboxthumb.ControlCount-1 do
  begin
    (frmain.sboxthumb.Controls[i] as TImage).Picture.Clear;
    (frmain.sboxthumb.Controls[i] as TImage).Hint:=flist[i];
    (frmain.sboxthumb.Controls[i] as TImage).Tag:=i;
  end;
end;

procedure thumbsthread.stop;
begin
  done:=true;
end;

procedure thumbsthread.showthumbs;
var
   thumbtmp:TPicture;
   streamimage:TFileStream;
   bgcolor:TBGRAPixel;
   th,tw:integer;
   wthumb:UnicodeString;
   ImgData: TImgData;
   Orientation:string='Horizontal (normal)';
   BGRAImage:BGRABitMap.TBGRABitmap;
   vmp:ImagingClasses.TSingleImage;
   ebitmap:Graphics.TBitmap;
begin
  wthumb:=UTF16LongName(carpeta+iname);
  {$IFDEF WINDOWS}
  wthumb:=UTF16LongName(carpeta+iname);
  {$ELSE}
  wthumb:=carpeta+iname;
  {$ENDIF}
  bgcolor.alpha:=255;
  bgcolor.blue:=0;
  bgcolor.green:=0;
  bgcolor.red:=0;
  try
    ////EXIF information
    ImgData:= TImgData.Create();
    if ImgData.ProcessFile(wthumb) then
    begin
      if ImgData.HasEXIF then
      begin
        Orientation:=ImgData.ExifObj.TagByName['Orientation'].Data;
      end
      else
        Orientation:='Horizontal (normal)';
    end;
    //ImgData.Destroy;
    FreeAndNil(ImgData);
    thumb:=Graphics.TBitMap.Create;
    thumb.Width:=thumbsize;
    thumb.Height:=thumbsize;
    thumbtmp:=TPicture.Create();
    streamimage:=TFileStream.Create(wthumb, fmOpenRead or fmShareDenyNone);
        //*******Implement orientation image********
    case Orientation of
    'Rotate 90 CW':
    begin
      BGRAImage:=BGRABitMap.TBGRABitmap.Create;
      GetStreamThumbnail(streamimage,thumbsize,thumbsize, bgcolor, false,'',BGRAImage);
      ebitmap:=Graphics.TBitmap.Create;
      ebitmap.Assign(BGRAImage);
      FreeAndNil(BGRAImage);
      vmp:=ImagingClasses.TSingleImage.Create;
      ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
      vmp.Rotate(270);
      ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
      FreeAndNil(vmp);
      thumbtmp.Bitmap.Assign(ebitmap);
      FreeAndNil(ebitmap);
    end;
    'Rotate 270 CW':
    begin
      BGRAImage:=BGRABitMap.TBGRABitmap.Create;
      GetStreamThumbnail(streamimage,thumbsize,thumbsize, bgcolor, false,'',BGRAImage);
      ebitmap:=Graphics.TBitmap.Create;
      ebitmap.Assign(BGRAImage);
      FreeAndNil(BGRAImage);
      vmp:=ImagingClasses.TSingleImage.Create;
      ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
      vmp.Rotate(90);
      ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
      FreeAndNil(vmp);
      thumbtmp.Bitmap.Assign(ebitmap);
      FreeAndNil(ebitmap);
    end;
    'Rotate 180 CW':
    begin
      BGRAImage:=BGRABitMap.TBGRABitmap.Create(GetStreamThumbnail(streamimage,thumbsize,thumbsize, bgcolor, false));
      BGRAImage.HorizontalFlip;
      thumbtmp.Bitmap.Assign(BGRAImage);
      //BGRAImage.Destroy;
      FreeAndNil(BGRAImage);
    end;
      else
      begin
        case UpperCase(ExtractFileExt(wthumb)) of
        '.TIF','.TIFF':
        begin
          thumbtmp.LoadFromStream(streamimage);
          ebitmap:=Graphics.TBitmap.Create;
          ebitmap.Assign(thumbtmp.Bitmap);
          vmp:=ImagingClasses.TSingleImage.Create;
          ImagingComponents.ConvertBitmapToImage(ebitmap,vmp);
          vmp.Resize(thumbsize,thumbsize,rfLanczos);
          ebitmap.Width:=thumbsize;
          ebitmap.Height:=thumbsize;
          ImagingComponents.ConvertImageToBitmap(vmp,ebitmap);
          FreeAndNil(vmp);
          thumbtmp.Bitmap.Assign(ebitmap);
          FreeAndNil(ebitmap);
        end;
        else
          thumbtmp.Bitmap.Assign(GetStreamThumbnail(streamimage,thumbsize,thumbsize, bgcolor, false));
        end;
      end;
    end;
    //streamimage.Destroy;
    FreeAndNil(streamimage);
    thumb.Canvas.Rectangle(0,0,thumbsize,thumbsize);
    thumb.Canvas.CopyRect(Types.Rect(2,2,thumbsize-2,thumbsize-2),thumbtmp.Bitmap.Canvas,Types.Rect(0,0,thumbtmp.Bitmap.Width,thumbtmp.Bitmap.Height));
    //thumbtmp.Destroy;
    FreeAndNil(thumbtmp);
    {ShowMessage('Imagen #: '+inttostr(thumbindex)+#13+
    'Left: '+inttostr((frmain.sboxthumb.Controls[thumbindex] as TImage).Left)+#13+
    'Scroll: '+inttostr(frmain.sboxthumb.HorzScrollBar.Position)+#13+
    'Scroll+Form width: '+inttostr(frmnain.sboxthumb.HorzScrollBar.Position+frmain.Width));}
    //ShowMessage(inttostr(thumbindex)+'   '+inttostr(ifile));
    //frmain.StatusBar1.Panels[5].Text:=inttostr(frmain.sboxthumb.ControlCount);
    (frmain.sboxthumb.Controls[thumbindex] as TImage).Picture.Bitmap.Assign(thumb);
    //thumb.Destroy;
    FreeAndNil(thumb);
    //This is wrong but is workin for linux and windows
    {$IFDEF LINUX}
    Application.ProcessMessages;
    {$ENDIF}
    except on e:exception do
    begin
      thumb:=Graphics.TBitMap.Create;
      thumb.Width:=thumbsize;
      thumb.Height:=thumbsize;
      thumb.Canvas.Brush.Color:=clWhite;
      thumb.Canvas.Pen.Color:=clRed;
      thumb.Canvas.Font.Size:=12;
      thumb.Canvas.Font.Color:=clRed;
      th:=thumb.Canvas.TextHeight('Error:'+e.ToString);
      tw:=thumb.Canvas.TextWidth('Error:'+e.ToString);
      thumb.Canvas.TextOut(Round((thumbsize-tw)/2),Round((thumbsize-th)/2),'Error:'+e.ToString);
      (frmain.sboxthumb.Controls[thumbindex] as TImage).Picture.Bitmap.Assign(thumb);
      FreeAndNil(thumb);
    end;
    end;
  //end;
end;

procedure thumbsthread.createallimages;
var
   i:longint;
   thumbimages:tthumbimage;
   mayor:longint;
   //starttime:TDateTime;
begin
  if ifallthumbs=false then
  begin
    if flist.Count>=frmain.sboxthumb.ControlCount  then
      mayor:=flist.Count
    else
      mayor:=frmain.sboxthumb.ControlCount;
    SetLength(puntos,0);
    SetLength(creados,0);
    SetLength(puntos,mayor);
    SetLength(creados,mayor);
    for i:=0 to mayor-1 do
    begin
      puntos[i]:=(frmain.sboxthumb.Height+1)*i;
      //Insert only the first and last to create the space
      if (i>frmain.sboxthumb.ControlCount-1) and ((i=0) or (i=mayor-1)) then
      begin
        thumbimages:=tthumbimage.Create(frmain.sboxthumb);
        thumbimages.Width:=frmain.sboxthumb.Height-18;
        thumbimages.Height:=frmain.sboxthumb.Height-18;
        thumbimages.Left:=(frmain.sboxthumb.Height+1)*i;
        thumbimages.Stretch:=true;
        thumbimages.Center:=true;
        thumbimages.AutoSize:=false;
        thumbimages.Hint:=flist[i];
        thumbimages.ShowHint:=true;
        thumbimages.Tag:=i;
        thumbimages.Top:=2;
        thumbimages.OnClick:=@thumbimages.thumbclick;
        thumbimages.OnMouseDown:=@thumbimages.thumbmousedown;
        thumbimages.OnMouseLeave:=@thumbimages.thumbmouseleave;
        thumbimages.OnMouseMove:=@thumbimages.thumbmousemove;
        thumbimages.OnMouseUp:=@thumbimages.thumbmouseup;
        thumbimages.Show;
        frmain.sboxthumb.InsertControl(thumbimages);
      end;
    end;
    frmain.sboxthumb.Visible:=false;
    frmain.sboxthumb.Visible:=true;
    frmain.sboxthumb.AutoSize:=true;
    if (inprocessanim=false) and (refreshingthumb=false) then
      scrollanim
    else
      frmain.sboxthumb.HorzScrollBar.Position:=scrollthumbpos;
    refreshingthumb:=false;
  end;
  ifallthumbs:=true;
end;

procedure thumbsthread.createsingleimage;
var
   thumbimages:tthumbimage;
///try this first and more latter
const
  maxthumbs=500;
begin
  thumbimages:=tthumbimage.Create(frmain.sboxthumb);
  thumbimages.Width:=frmain.sboxthumb.Height-18;
  thumbimages.Height:=frmain.sboxthumb.Height-18;
  thumbimages.Left:=(frmain.sboxthumb.Height+1)*ipublic;
  thumbimages.Stretch:=true;
  thumbimages.Center:=true;
  thumbimages.AutoSize:=false;
  thumbimages.Hint:=flist[ipublic];
  thumbimages.ShowHint:=true;
  thumbimages.Tag:=ipublic;
  thumbimages.Top:=2;
  thumbimages.OnClick:=@thumbimages.thumbclick;
  thumbimages.OnMouseDown:=@thumbimages.thumbmousedown;
  thumbimages.OnMouseLeave:=@thumbimages.thumbmouseleave;
  thumbimages.OnMouseMove:=@thumbimages.thumbmousemove;
  thumbimages.OnMouseUp:=@thumbimages.thumbmouseup;
  thumbimages.Show;
  frmain.sboxthumb.InsertControl(thumbimages);
  if frmain.sboxthumb.ControlCount>maxthumbs then
  begin
    done:=true;
    refreshingthumb:=true;
    scrollthumbpos:=frmain.sboxthumb.HorzScrollBar.Position;
    frmain.PairSplitterSide2Resize(nil);
  end;
  //frmain.StatusBar1.Panels[5].Text:=inttostr(frmain.sboxthumb.ControlCount);
end;

procedure thumbsthread.Execute;
var
   n,minv,maxv,icenter:longint;
   exactcenter:float;
begin
  if starting then///gift time to load the current image
    sleep(1000);
  ifallthumbs:=false;
  Synchronize(@createallimages);
  folderchange:=false;
  while (frmain.sboxthumb.ControlCount<=flist.Count) and (done=false) do
  begin
    if carpeta=thumbpath then
    begin
      exactcenter:=(frmain.sboxthumb.HorzScrollBar.Position/frmain.sboxthumb.HorzScrollBar.Range)*100;
      icenter:=Round(exactcenter*0.01*Length(puntos));

      if icenter>=frmain.Splitter2.Width/thumbsize then
        minv:=icenter-Round(frmain.Splitter2.Width/thumbsize)
      else
        minv:=0;

      if (icenter+(frmain.Splitter2.Width/thumbsize)+5)<=flist.Count-1 then
        maxv:=icenter+Round(frmain.Splitter2.Width/thumbsize)+5
      else
        maxv:=flist.Count-1;

      // si solo faltan 30 o menos completar todos
      if flist.Count-1-maxv<30 then
        maxv:=flist.Count-1;
      if minv<30 then
        minv:=0;

      ////////Update the visible thumbs
      for n:=minv to maxv do
      begin
        if creados[n]=false then
        begin
          ipublic:=n;
          Synchronize(@createsingleimage);
          iname:=flist[n];
          thumbindex:=frmain.sboxthumb.ControlCount-1;
          creados[n]:=true;
          {$IFDEF LINUX}
          Synchronize(@showthumbs);
          {$ELSE}
          showthumbs;
          {$ENDIF}
        end;
      end;
      Sleep(10);
    end
    else
      break;
  end;
end;

procedure tthumbimage.thumbclick(Sender:TObject);
begin
  ifile:=self.Tag;
  loadpicture(carpeta+flist[self.Tag],true,false);
end;

procedure tthumbimage.thumbmousedown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mosaicmousedown:=true;
  mosaicscrollposition:=frmain.sboxthumb.HorzScrollBar.Position;
  mosaicmouseposition:=Mouse.CursorPos.x;
end;

procedure tthumbimage.thumbmouseleave(Sender: TObject);
begin
  mosaicmousedown:=false;
end;

procedure tthumbimage.thumbmousemove(Sender: TObject; Shift: TShiftState; X,  Y: Integer);
begin
  if mosaicmousedown then
  begin
    frmain.sboxthumb.HorzScrollBar.Position:=mosaicscrollposition-(X-mosaicmouseposition);
  end;
end;

procedure tthumbimage.thumbmouseup(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mosaicmousedown:=false;
end;

{procedure thumbsthread.stop;
begin
 if Assigned(thumb) then
   thumb.Destroy;
 self.Destroy;
end;}

end.

