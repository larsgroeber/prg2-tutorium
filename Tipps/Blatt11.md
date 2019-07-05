# Tipps für Blatt 11

## Aufgabe 1

Gebt bei der a) die Ergebnisse in Form einer Tabelle an oder beschreibt wie viele Ergebnisse und mit welchen Tabellenüberschriften.

## Aufgabe 2

Fügt Daten so ein, dass ihr für jede View in b) und c) mindestens einen weiteren Eintrag erhaltet.

## Aufgabe 3

Hier geht es darum, die möglichst kurzen Schlüssel der Relationen zu finden. Ist also z.B. AB bereits ein Schlüssel, dann ist ABC kein Schlüssel, da er ja AB enthält. Ist aber ABC ein Schlüssel, kann auch BCD einer sein, auch wenn beide BC enthalten.

Geht hier systematisch vor, überlegt euch "kann ich mit X alle weiteren Entitäten erreichen" also z.B. in `{E -> A, AC -> BD}` würde man mit EC alle erreichen: `E -> A, AC -> BD`, also mit E bekommt man A und dann zusammen mit C noch BD. E und C müssen hier auch Teil des Schlüssel sein, da beide nicht rechts stehen.
