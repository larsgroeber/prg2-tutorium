# Kleine Haskell Einführung / Cheat Sheet

Hier findest du eine kleine Einleitung in Haskell, die du auch als Cheat Sheet für die Übungen nutzen kannst.

Ich werde sie nach und nach erweitern, sie entspricht aber nicht unbedingt der Reihenfolge im Skript!

Die Beispiele sind stark an [learnyouahaskell](http://learnyouahaskell.com/introduction) angelehnt.

## Inhalt

1. [Was du brauchst](#wasdubrauchst)
2. [GHCI](#ghci)
3. [Funktionen](#funktionen)
   - [Infix Funktionen](#infix)
4. [Typdefinitionen](#Typdefinitionen)

## Was du brauchst <a name="wasdubrauchst"></a>

Um Haskell nutzen zu können, brauchst du den Haskell compiler. Lade dir dazu am besten die `Haskell Platform` [hier](https://www.haskell.org/platform/) herunter.

Teste deine Installation indem du ein Konsolen/Commandline Fenster öffnest und `ghci --version` eingibst. Dann sollte so etwas wie hier ausgegeben werden:

```
The Glorious Glasgow Haskell Compilation System, version 8.2.2
```

Nun bist du eigentlich bereit, deinen Code solltest du aber natürlich mit einem Code-Editor schreiben. Ich empfehle [Visual Studio Code](https://code.visualstudio.com/) mit der [Haskelly](https://marketplace.visualstudio.com/items?itemName=UCL.haskelly) Extension. Du kannst aber auch jeden anderen Editor nutzen.

Haskell Dateien enden auf `.hs`. Zum Testen erstelle zum Beispiel eine Datei `hello_world.hs`.

## GHCI <a name="ghci"></a>

Auf der Konsole kannst du über `ghci` den interaktiven Haskell Prompt nutzen (Zeilen die mit `$` starten sind Eingaben auf der Konsole):

```haskell
$ ghci
GHCi, version 8.2.2: http://www.haskell.org/ghc/  :? for help
Prelude> 4 + 4
8
Prelude> 5 / 2
2.5
Prelude> True && False
False
Prelude>
```

Du beendest GHCI mit `CTRL-D` (`STRG-D`).

In den nächsten Sektionen bedeutet `Prelude>` immer, dass die Zeile in `ghci` ausgeführt wurde.

Du kannst Dateien in GHCI laden, indem du `:l DATEI_NAME` ausführst.

In der Datei `hello_world.hs` steht hier `doubleMe x = x + x`:

```haskell
Prelude> :l hello_world.hs
[1 of 1] Compiling Main             ( hello_world.hs, interpreted )
Ok, one module loaded.
*Main> doubleMe 2
4
*Main>
```

## Funktionen <a name="funktionen"></a>

Da Haskell eine funktionale Programmiersprache ist, schreibst du so gut wie nur Funktionen, die wieder andere Funktionen ausführen. Jedes Programm in Haskell braucht daher mindestens eine Funktion.

Nehmen wir zum Beispiel das Beispiel von eben:

```haskell
doubleMe x = x + x
```

Hier ist `doubleMe` der **Funktionsname**, das `x` direkt nach `doubleMe` der **Parameter** der Funktione und alles, was nach dem Gleichheitszeichen kommt, also `x + x`, der **Body** der Funktion. Der letzte Wert, der vom Body berechnet wurde, ist der **Rückgabewert** der Funktion.

Die Funktion `doubleMe` gibt also das Doppelte des Parameters `x` zurück.

```haskell
Prelude> doubleMe x = x + x
Prelude> doubleMe 2
4
```

### Infix Funktionen <a name="infix"></a>

Das `+` in Haskell ist ebenfalls eine Funktion, die zwei Paramerter entgegennimmt, in diesem Fall jedoch als sogenannte **Infix** Funktion, da sie **zwischen** den Paramtern steht.

Wir können dies reproduzieren, indem wir eine Funktione `add` definieren:

```haskell
add x y = x + y
```

Diese Funktion nimmt jetzt zwei Paraemter `x` und `y` entgegen.

Wir können sie _infix_ verwenden, indem wir sie mit \` (back-tick) umgeben:

```haskell
Prelude> add x y = x + y
Prelude> add 1 2
3
Prelude> 1 `add` 2
3
```

## Typdefinitionen <a name="Typdefinitionen"></a>

Haskell ist stark detypt, das bedeutet, dass der Compiler überprüft, ob die Typen der Parameter und Funktionen korrekt verwendet werden. Es wird ein Fehler geworfen, wenn dies nicht der Fall ist. Außerdem können Parameter und Funktionen ihren Typ nicht dynamisch ändern.

Es gibt die folgenden (grundlegenden) Typen:

- `Int` (ganze Zahlen, z.B. `1`, `100`)
- `Integer` (beliebig große ganze Zahlen)
- `Float` (Gleitkommazahlen, z.B. `1.1`, `25.12345`)
- `Double` (Gleitkommazahlen mit doppelter Präzision)
- `Bool` (`True` oder `False`)
- `Char` (ein Buchstabe)

Jede Funktion in Haskell hat ebenfalls einen Typ. Dieser wird z.B. so angegeben:

```haskell
add :: Integer -> Integer -> Integer
```

`add` ist der **Funktionsname**, der letzte Typ definiert den **Typ des Rückgabewertes** und die anderen Typen beschreiben die **Parametertypen**.

`add` ist hier also eine Funktion, die zwei Paramter vom Typ `Integer` engegennimmt und einen Wert vom Typ `Integer` zurückgibt.

Auf GHCI kann man sich die Typen von Funktionen ganz leicht anzeigen lassen:

```haskell
Prelude> addThree x y z = x + y + z
Prelude> :t addThree
addThree :: Num a => a -> a -> a -> a
Prelude> :t 'b'
'b' :: Char
```

Hier beschreibt `Num a` den Typparameter `a` als Zahl (Int, Integer, Float oder Double) und die Funktion `addThree` nimmt drei Parameter vom Typ `a` und gibt einen Wert vom Typ `a` zurück. Beachte, dass die Typen aller drei Parameter gleich sind.

## Conditonals <a name="Conditonals"></a>

Es gibt verschiedene Wege, unterschiedliche Fälle in einer Funktion abzufangen:

### Guards <a name="Guards"></a>

### Patternmatching <a name="Patternmatching"></a>

Nehmen wir den [FizzBuzz Test](http://wiki.c2.com/?FizzBuzzTest), dann können wir diesen auf drei Arten lösen (wir betrachten hier nur den Fall für eine Zahl):

### If/then <a name="IfCase"></a>

```haskell
-- If/then
fizzBuzz :: Int -> String
fizzBuzz a = if a `mod` 3 == 0 && a `mod` 7 == 0
    then "fizzbuzz"
    else
      (if a `mod` 3 == 0
        then "fizz"
        else
          (if a `mod` 7 == 0
            then "buzz"
            else show a))

fizzBuzz a

```

## Listen <a name="Listen"></a>

## List comprehensions <a name="Listcomprehensions"></a>

## Data <a name="Listcomprehensions"></a>
