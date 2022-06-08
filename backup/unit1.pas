unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TListy }

  // typ elementu listy jednokierunkowej

  PslistEl = ^slistEl;
  slistEl =  record
    next  : PslistEl;
    data  : integer;
  end;

  TListy = class(TForm)
    Koniec: TButton;
    Info: TButton;
    Sortuj: TButton;
    Button4: TButton;
    ListBox1: TListBox;
    ListBox2: TListBox;
    procedure KoniecClick(Sender: TObject);
    procedure LosujClick(Sender: TObject);
    procedure SortujClick(Sender: TObject);
  private

  public

  end;

var
  Listy: TListy;
  wsk    : PslistEl;                 // wskaźnik początku listy
  wskL1, wskL2 : PslistEl;           // wskaźniki elementów listy
  war    : integer;                 // wartość elementu
  i    : integer;                   // licznik
  t    : array [1..22] of integer;  //tablica do zapietania listbox1

implementation

{$R *.lfm}

{ TListy }

procedure TListy.KoniecClick(Sender: TObject);
begin

end;

procedure TListy.LosujClick(Sender: TObject);
begin

end;

procedure TListy.SortujClick(Sender: TObject);
begin

end;

end.

