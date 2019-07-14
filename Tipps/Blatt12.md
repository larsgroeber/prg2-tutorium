# Tipps für Blatt 12

## Aufgabe 1

Hier berechnet ihr zunächst alle Schlüssel wie auf Blatt 11, die Nicht-Primen Attribute sind dann natürlich ganz einfach aufzustellen.
Für die 2.NF erklärt dieser Abschnitt ziemlich gut, was zu zeigen ist [Quelle](https://www.sql-und-xml.de/sql-tutorial/zweite-normalform-funktionale-abhaengigkeit.html):

__Eine Tabelle ist noch nicht in zweiter Normalform, wenn sie einen zusammengesetzten Primärschlüssel hat und ein Nichtschlüssel-Attribut nicht vom ganzen Primärschlüssel, sondern nur von einem Teilschlüssel abhängt__

Das heißt, ist zum Beispiel AB ein Schlüssel, aber F enthält `A->C`, dann ist R nicht in der 2.NF. Ihr müsst den oberen Abschnitt für alle Elemente aller Schlüssel überprüfen.

<hr>

Die anderen Aufgaben sind sehr ähnlich zu den Blättern davor, lest euch dazu ein weinig in Nutzer/Berechtigungen bei MySQL ein.

Aufgaben 1 und 4 sind sehr wichtig für die Klausur, die anderen beiden nicht.
