{
 /**************************************************************************\
                             bgraqtbitmap.pas
                             -----------------
                 This unit should NOT be added to the 'uses' clause.
                 It contains patches for Qt5.

 ****************************************************************************
 *                                                                          *
 *  This file is part of BGRABitmap library which is distributed under the  *
 *  modified LGPL.                                                          *
 *                                                                          *
 *  See the file COPYING.modifiedLGPL.txt, included in this distribution,   *
 *  for details about the copyright.                                        *
 *                                                                          *
 *  This program is distributed in the hope that it will be useful,         *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                    *
 *                                                                          *
 ****************************************************************************
}

//=== ct9999 a modifications for CodeTyphon Studio =============

unit BGRAQt5Bitmap;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BGRALCLBitmap, Graphics,
  GraphType, BGRABitmapTypes;

type
  { TBGRAQtBitmap }

  TBGRAQtBitmap = class(TBGRALCLBitmap)
  private
    procedure SlowDrawTransparent(ABitmap: TBGRACustomBitmap;
      ACanvas: TCanvas; ARect: TRect);
  public
    procedure DataDrawTransparent(ACanvas: TCanvas; Rect: TRect;
      AData: Pointer; ALineOrder: TRawImageLineOrder; AWidth, AHeight: integer);
      override;
    procedure Draw(ACanvas: TCanvas; x, y: integer; Opaque: boolean = True); override;
    procedure Draw(ACanvas: TCanvas; Rect: TRect; Opaque: boolean = True); override;
    procedure DataDrawOpaque(ACanvas: TCanvas; Rect: TRect; AData: Pointer;
      ALineOrder: TRawImageLineOrder; AWidth, AHeight: integer);
      override;
    procedure GetImageFromCanvas(CanvasSource: TCanvas; x, y: integer); override;
  end;

implementation

uses LCLType,
  LCLIntf, IntfGraphics,
  qt5objects, qt5,
  FPImage;

procedure TBGRAQtBitmap.SlowDrawTransparent(ABitmap: TBGRACustomBitmap;
  ACanvas: TCanvas; ARect: TRect);
begin
  ACanvas.StretchDraw(ARect, ABitmap.Bitmap);
end;

procedure TBGRAQtBitmap.DataDrawTransparent(ACanvas: TCanvas; Rect: TRect;
  AData: Pointer; ALineOrder: TRawImageLineOrder; AWidth, AHeight: integer);
var
  Temp: TBGRALCLPtrBitmap;
begin
  Temp := TBGRALCLPtrBitmap.Create(AWidth, AHeight, AData);
  Temp.LineOrder := ALineOrder;
  SlowDrawTransparent(Temp, ACanvas, Rect);
  Temp.Free;
end;

procedure TBGRAQtBitmap.Draw(ACanvas: TCanvas; x, y: integer; Opaque: boolean);
begin
  if self = nil then
    exit;
  if Opaque then
    DataDrawOpaque(ACanvas, Rect(X, Y, X + Width, Y + Height), Data, FLineOrder,
      FWidth, FHeight)
  else
    SlowDrawTransparent(Self, ACanvas, Rect(X, Y, X + Width, Y + Height));
end;

procedure TBGRAQtBitmap.Draw(ACanvas: TCanvas; Rect: TRect; Opaque: boolean);
begin
  if self = nil then
    exit;
  if Opaque then
    DataDrawOpaque(ACanvas, Rect, Data, FLineOrder, FWidth, FHeight)
  else
    SlowDrawTransparent(Self, ACanvas, Rect);
end;

procedure TBGRAQtBitmap.DataDrawOpaque(ACanvas: TCanvas; Rect: TRect;
  AData: Pointer; ALineOrder: TRawImageLineOrder; AWidth, AHeight: integer);
var
  Temp:     TBitmap;
  RawImage: TRawImage;
  BitmapHandle, MaskHandle: HBitmap;
  CreateSuccess: boolean;
begin
  if (AHeight = 0) or (AWidth = 0) then
    exit;

  RawImage.Init;
  if TBGRAPixel_RGBAOrder then
    RawImage.Description.Init_BPP32_R8G8B8A8_BIO_TTB(AWidth, AHeight)  //== ct9999 ====
  else
    RawImage.Description.Init_BPP32_B8G8R8_BIO_TTB(AWidth, AHeight);
  RawImage.Description.LineOrder := ALineOrder;
  RawImage.Description.LineEnd := rileDWordBoundary;
  RawImage.Data     := PByte(AData);
  RawImage.DataSize := AWidth * AHeight * Sizeof(TBGRAPixel);
  CreateSuccess     := RawImage_CreateBitmaps(RawImage, BitmapHandle, MaskHandle, False);

  if not CreateSuccess then
    raise FPImageException.Create('Failed to create bitmap handle');
  Temp := TBitmap.Create;
  Temp.Handle := BitmapHandle;
  Temp.MaskHandle := MaskHandle;
  ACanvas.StretchDraw(Rect, Temp);
  Temp.Free;
end;

procedure TBGRAQtBitmap.GetImageFromCanvas(CanvasSource: TCanvas; x, y: integer);
var
  bmp: TBitmap;
  Ofs: TPoint;
  SrcX, SrcY: integer;
  dcSource, dcDest: TQtDeviceContext;
  B: Boolean;
begin
  DiscardBitmapChange;
  bmp    := TBitmap.Create;
  bmp.PixelFormat := pf24bit;
  bmp.Width := Width;
  bmp.Height := Height;
  dcDest := TQtDeviceContext(bmp.Canvas.handle);

  dcSource := TQtDeviceContext(CanvasSource.Handle);
  LCLIntf.GetWindowOrgEx(CanvasSource.Handle, @Ofs);

  SrcX     := x + Ofs.X;
  SrcY     := y + Ofs.Y;

  if (dcSource.vImage <> nil) and (dcSource.vImage.Handle <> nil) then
  begin
    // we must stop painting on device
    B := QPainter_isActive(dcDest.Widget);
    if B then
      QPainter_end(dcDest.Widget);
    TQtImage(bmp.Handle).CopyFrom(dcSource.vImage.Handle,
      SrcX, SrcY, Width, Height);
    if B then
      QPainter_begin(dcDest.Widget, TQtImage(bmp.Handle).Handle);
  end;

  LoadFromRawImage(bmp.RawImage, 255, True);
  bmp.Free;
  InvalidateBitmap;
end;

end.

