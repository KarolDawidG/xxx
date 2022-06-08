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
    Losuj: TButton;
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

procedure tworzenieListyBox1;

begin
  new ( wsk );                   // tworzymy pierwszego strażnika
new ( wsk^.next );             // tworzymy drugiego strażnika
wsk^.next^.next := nil;        // drugi strażnik jest ostatni na liście
wsk^.next^.data := MAXINT;     // wartość drugiego strażnika

for i := 1 to 20 do
begin

war := Random(10);

wskL2 := wsk;                    // wskL2 ustawiamy na pierwszego strażnika

new ( wskL1 );                 // tworzymy nowy element

wskL1^.data := war;              // inicjujemy element
wskL1^.next := wskL2^.next;

wskL2^.next := wskL1;              // element wstawiamy do listy

end;

wskL2 := wsk^.next;                // listę przesyłamy na wyjście
end;

procedure wyswietlanieListyBox1;

begin
     Listy.listBox1.Clear;   // wyczyszczamy listbox
     i := 1;
     while wskL2^.next <> nil do
      begin
         Listy.listBox1.Items.Add(IntToStr(i) + '  :  ' + IntToStr(wskL2^.data) ); // przesylamy do listbox
         t[i] := wskL2^.data;  // wstawiamy do tablicy
         wskL2 := wskL2^.next;
         inc(i);
      end;
end;

procedure wyswietlanieListBox2;
begin
  Listy.listBox2.Clear;  // wyczyszczamy listbox
  i := 1;
    while wskL2^.next <> nil do
      begin
         Listy.listBox2.Items.Add(IntToStr(i) + '  :  ' + IntToStr(wskL2^.data) ); // przesylamy do listbox
         wskL2 := wskL2^.next;
         inc(i);
      end;
end;
procedure usuwanie;
begin
    while wsk <> nil do            // usuwamy listę z pamięci
  begin
    wskL1 := wsk;
    wsk := wsk^.next;
    dispose ( wskL1 );
  end;

end;
procedure sortowanie;

begin

  new ( wsk );                   // tworzymy pierwszego strażnika
  new ( wsk^.next );             // tworzymy drugiego strażnika
  wsk^.next^.next := nil;        // drugi strażnik jest ostatni na liście
  wsk^.next^.data := MAXINT;     // wartość drugiego strażnika

  for i := 1 to 20 do

  begin
    war := t[i];
    wskL2 := wsk;                    // wskl2 ustawiamy na pierwszego strażnika

    while war > wskL2^.next^.data do // szukamy miejsca wstawienia
      wskL2 := wskL2^.next;

    new ( wskL1 );                 // tworzymy nowy element

    wskL1^.data := war;              // inicjujemy element
    wskL1^.next := wskL2^.next;

    wskL2^.next := wskL1;              // element wstawiamy do listy

  end;

  wskL2 := wsk^.next;                // listę przesyłamy na wyjście

end;

procedure TListy.LosujClick(Sender: TObject);

  begin
  tworzenieListyBox1;
  wyswietlanieListyBox1;
  usuwanie;
  end;




procedure TListy.SortujClick(Sender: TObject);

begin
sortowanie;
wyswietlanieListBox2;
usuwanie;
end;

procedure TListy.KoniecClick(Sender: TObject);

begin
  Application.Terminate;
end;

end.
