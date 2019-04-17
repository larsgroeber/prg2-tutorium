# Allgemeine Hinweise

## TL;DR

- Das Tutorium findet freitags von 14 bis 16 Uhr in Raum TODO statt.
- Schicke mir deine Abgabe vor der Vorlesung als Zipdatei per Mail mit Betreff `PRG2 - Übung # - DEIN NAME`.
- Gib sie vor der Vorlesung oder beim nächsten Übungstermin auf Papier ab.
- Jede Funktion braucht eine Typdefinition und einen Kommentar und jede Aufgabe Testfälle.
- Dein Code muss kompilieren.

## Kontakt

Lars Gröber

groeber.prg2@ki.cs.uni-frankfurt.de

## Tutorium

Das Tutorium findet jeden Freitag von 14 bis 16 Uhr in Raum TODO statt.

Das erste Tutorium ist am 26.04. und das letzte am 19.07.

## Abgabe

Schicke bitte deine Abgabe als `.zip` Verzeichnis an die oben genannte E-Mail Adresse und gib sie vor der Vorlesung auf Papier ab.

Nutze bitte als Betreff `PRG2 - Übung # - DEIN NAME` (z.B. `PRG2 - Übung 3 - Lars Gröber`).

Falls du deine Abgabe nicht rechtzeitig auf Papier abgeben kannst, bringe sie mir spätestens zum **nächsten** Übungstermin mit (schicke sie aber trotzdem per Mail!). Korrigieren tue ich sie jedoch erst, wenn sie mir auf Papier vorliegt.

Du kannst deine Abgabe in englisch oder deutsch verfassen, je nachdem was einfacher für dich ist.

### Coding Style

Ich werde großen Wert auf deinen Coding Style legen und bis zu 50% der Punkte bei Verstößen abziehen.

#### Typdefinition

**Jede** Funktion braucht eine Typdefinition.

Falls du die Typangabe nicht korrekt angeben kannst, schreibe sie als Kommentar über die Funktion. Beispiel:

```haskell
add::Int->Int->Int
add a b = a + b

-- oder

-- add::Int->Int (Kompiliert nicht)
add a b = a + b
```

#### Kommentare

**Jede** Funktion, bei der nicht eindeutig ist, was sie macht, muss kommentiert werden.

Beispiel:

```haskell
{-
  Eine Funktion, die n! ausrechnet.
  Nimmt als Argument den Wert von n und gibt n! zurück.
-}
factorial::Int->Int
factorial n = if n < 2 then 1 else n * factorial (n-1)
```

#### Testfälle

Für **jede** Haskell-Aufgabe müssen Testfälle angegeben werden (Hilfsfunktionen brauchen keine Testfälle).

Am einfachsten geht das als Kommentar:

```haskell
{-
  Eine Funktion, die n! ausrechnet.
-}
factorial::Int->Int
factorial n = if n < 2 then 1 else n * factorial (n-1)

{-
  # Testfälle:
  factorial -1 => 1
  factorial 1 => 1
  factorial 4 => 24
  factorial 5 => 120
-}
```

Du kannst auch Unittests schreiben und diese zu deiner Abgabe hinzufügen (als separate Datei). Nutze bitte [hspec](http://hackage.haskell.org/package/hspec). Hier bitte auch gut kommentieren!

#### Weiteres

- Dein Programm **muss** kompilieren! Programme, die nicht kompiliert werden können, verlieren direkt 50% der Punkte. (Kommentiere Bereiche, die Fehler werfen, aus und schreibe dazu, warum sie nicht funktionieren).
- Wenn du eine Aufgabe nicht lösen kannst, schreibe auf, was du dir überlegt hast. Darauf gibt es auch Punkte!
- Nutze (außer anders in der Aufgabenstellung angeben) **englische** Funktion- und Variablennamen. Kommentare können englisch oder deutsch sein.
- Unleserliche Abgaben oder eindeutige Plagiate werden von mir nicht bewertet (erhalten also 0 Punkte).
