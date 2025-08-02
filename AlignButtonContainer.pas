unit AlignButtonContainer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Controls, Buttons, Graphics, TypInfo, Math, StdCtrls,
  LResources;

type
  THorizontalAlignment = (haLeft, haCenter, haRight);
  TVerticalAlignment = (vaTop, vaCenter, vaBottom);
  TButtonType = (btSpeedButton, btButton, btBitBtn);

  TAlignButtonContainer = class(TCustomControl)
  private
    FButtonWidth: Integer;
    FButtonHeight: Integer;
    FSpacing: Integer;
    FHorizontalAlignment: THorizontalAlignment;
    FVerticalAlignment: TVerticalAlignment;
    procedure SetButtonWidth(AValue: Integer);
    procedure SetButtonHeight(AValue: Integer);
    procedure SetSpacing(AValue: Integer);
    procedure SetHorizontalAlignment(AValue: THorizontalAlignment);
    procedure SetVerticalAlignment(AValue: TVerticalAlignment);
    procedure RearrangeButtons;
  protected
    procedure Paint; override;
    procedure Loaded; override;
    procedure Resize; override;
  public
    constructor Create(AOwner: TComponent); override;
    function AddButton(ButtonType: TButtonType = btSpeedButton): TControl;
    procedure DeleteButton(Index: Integer);
    procedure ClearButtons;
    function GetButton(Index: Integer): TControl;
  published
    property ButtonWidth: Integer read FButtonWidth write SetButtonWidth default 75;
    property ButtonHeight: Integer read FButtonHeight write SetButtonHeight default 25;
    property Spacing: Integer read FSpacing write SetSpacing default 5;
    property HorizontalAlignment: THorizontalAlignment read FHorizontalAlignment
      write SetHorizontalAlignment default haLeft;
    property VerticalAlignment: TVerticalAlignment read FVerticalAlignment
      write SetVerticalAlignment default vaTop;

    property Align;
    property Anchors;
    property BorderSpacing;
    property Color;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Morgunov', [TAlignButtonContainer]);
end;

constructor TAlignButtonContainer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csAcceptsControls];
  FButtonWidth := 75;
  FButtonHeight := 25;
  FSpacing := 5;
  FHorizontalAlignment := haLeft;
  FVerticalAlignment := vaTop;
  Width := 300;
  Height := 200;
  Color := clBtnFace;
end;

procedure TAlignButtonContainer.SetButtonWidth(AValue: Integer);
begin
  if FButtonWidth = AValue then Exit;
  FButtonWidth := AValue;
  RearrangeButtons;
end;

procedure TAlignButtonContainer.SetButtonHeight(AValue: Integer);
begin
  if FButtonHeight = AValue then Exit;
  FButtonHeight := AValue;
  RearrangeButtons;
end;

procedure TAlignButtonContainer.SetSpacing(AValue: Integer);
begin
  if FSpacing = AValue then Exit;
  FSpacing := AValue;
  RearrangeButtons;
end;

procedure TAlignButtonContainer.SetHorizontalAlignment(AValue: THorizontalAlignment);
begin
  if FHorizontalAlignment = AValue then Exit;
  FHorizontalAlignment := AValue;
  RearrangeButtons;
end;

procedure TAlignButtonContainer.SetVerticalAlignment(AValue: TVerticalAlignment);
begin
  if FVerticalAlignment = AValue then Exit;
  FVerticalAlignment := AValue;
  RearrangeButtons;
end;

procedure TAlignButtonContainer.RearrangeButtons;
var
  i, ButtonsPerRow, Row, Col, TotalRows: Integer;
  Button: TControl;
  StartX, StartY, TotalWidth, TotalHeight: Integer;
  RowWidths: array of Integer = nil;
begin
  if ControlCount = 0 then Exit;

  ButtonsPerRow := Math.Max(1, (Width - FSpacing) div (FButtonWidth + FSpacing));
  TotalRows := (ControlCount - 1) div ButtonsPerRow + 1;

  SetLength(RowWidths, TotalRows);

  for i := 0 to TotalRows - 1 do
  begin
    if i = TotalRows - 1 then
      RowWidths[i] := (ControlCount - i * ButtonsPerRow) * (FButtonWidth + FSpacing) - FSpacing
    else
      RowWidths[i] := ButtonsPerRow * (FButtonWidth + FSpacing) - FSpacing;
  end;

  TotalHeight := TotalRows * (FButtonHeight + FSpacing) - FSpacing;

  for i := 0 to ControlCount - 1 do
  begin
    if (Controls[i] is TSpeedButton) or (Controls[i] is TButton) or (Controls[i] is TBitBtn) then
    begin
      Button := Controls[i];
      Button.Width := FButtonWidth;
      Button.Height := FButtonHeight;

      Row := i div ButtonsPerRow;
      Col := i mod ButtonsPerRow;

      case FHorizontalAlignment of
        haLeft: StartX := FSpacing;
        haCenter: StartX := (Width - RowWidths[Row]) div 2;
        haRight: StartX := Width - RowWidths[Row] - FSpacing;
      end;

      case FVerticalAlignment of
        vaTop: StartY := FSpacing;
        vaCenter: StartY := (Height - TotalHeight) div 2;
        vaBottom: StartY := Height - TotalHeight - FSpacing;
      end;

      Button.Left := StartX + Col * (FButtonWidth + FSpacing);
      Button.Top := StartY + Row * (FButtonHeight + FSpacing);
    end;
  end;
end;

procedure TAlignButtonContainer.Paint;
var
//  Text: string;
  TextWidth, TextHeight: Integer;
begin
  inherited Paint;

  if csDesigning in ComponentState then
  begin
    // Рисуем пунктирную рамку
    Canvas.Pen.Style := psDash;
    Canvas.Pen.Color := clGray;
    Canvas.Brush.Style := bsClear;
    Canvas.Rectangle(0, 0, Width, Height);

    // Рисуем крест-накрест
    Canvas.MoveTo(0, 0);
    Canvas.LineTo(Width, Height);
    Canvas.MoveTo(Width, 0);
    Canvas.LineTo(0, Height);

    // Выводим имя компонента по центру
    Text := Name;
    Canvas.Font := Self.Font;
    Canvas.Brush.Style := bsClear;
    TextWidth := Canvas.TextWidth(Text);
    TextHeight := Canvas.TextHeight(Text);
    Canvas.TextOut((Width - TextWidth) div 2, (Height - TextHeight) div 2, Text);
  end;
end;

procedure TAlignButtonContainer.Loaded;
begin
  inherited Loaded;
  RearrangeButtons;
end;

procedure TAlignButtonContainer.Resize;
begin
  inherited Resize;
  RearrangeButtons;
end;

function TAlignButtonContainer.AddButton(ButtonType: TButtonType = btSpeedButton): TControl;
begin
  case ButtonType of
    btSpeedButton:
      begin
        Result := TSpeedButton.Create(Self);
        TSpeedButton(Result).Flat := False;
      end;
    btButton: Result := TButton.Create(Self);
    btBitBtn:
      begin
        Result := TBitBtn.Create(Self);
        TBitBtn(Result).Kind := bkCustom;
      end;
    else
      Result := TSpeedButton.Create(Self);
  end;

  try
    Result.Parent := Self;
    Result.Width := FButtonWidth;
    Result.Height := FButtonHeight;
    RearrangeButtons;
  except
    Result.Free;
    raise;
  end;
end;

procedure TAlignButtonContainer.DeleteButton(Index: Integer);
var
  i: Integer;
  Button: TControl;
begin
  if (Index < 0) or (Index >= ControlCount) then Exit;

  for i := 0 to ControlCount - 1 do
  begin
    if (Controls[i] is TSpeedButton) or (Controls[i] is TButton) or (Controls[i] is TBitBtn) then
    begin
      if Index = 0 then
      begin
        Button := Controls[i];
        Button.Free;
        RearrangeButtons;
        Exit;
      end;
      Dec(Index);
    end;
  end;
end;

function TAlignButtonContainer.GetButton(Index: Integer): TControl;
var
  i: Integer;
begin
  Result := nil;
  if (Index < 0) then Exit;

  for i := 0 to ControlCount - 1 do
  begin
    if (Controls[i] is TSpeedButton) or (Controls[i] is TButton) or (Controls[i] is TBitBtn) then
    begin
      if Index = 0 then
      begin
        Result := Controls[i];
        Exit;
      end;
      Dec(Index);
    end;
  end;
end;

procedure TAlignButtonContainer.ClearButtons;
var
  i: Integer;
begin
  for i := ControlCount - 1 downto 0 do
    if (Controls[i] is TSpeedButton) or (Controls[i] is TButton) or (Controls[i] is TBitBtn) then
      Controls[i].Free;
end;

initialization
  {$I AlignButtonContainer.lrs}

end.
