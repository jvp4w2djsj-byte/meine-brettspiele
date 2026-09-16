# Cloud-Synchronisierung

Die App nutzt Supabase Auth + PostgreSQL. Die persönliche Sammlung wird pro Benutzer in `app_data.data` gespeichert.

## 1. Supabase-Projekt
Erstelle ein Supabase-Projekt und führe `supabase_setup.sql` im SQL Editor aus. Die App verwendet die Tabelle `app_data`.

## 2. Auth
In Supabase unter Authentication → Providers E-Mail/Passwort aktivieren.

## 3. App konfigurieren
In der App unter ⚙️ Einstellungen eintragen:
- Supabase Projekt-URL
- Publishable Key (niemals Service-Role/Secret-Key)

Danach Konto erstellen bzw. anmelden.

## 4. Erster Upload
Auf dem Gerät mit den aktuellen Daten anmelden und `Jetzt synchronisieren` wählen.
Wenn noch keine Cloud-Daten existieren, wird die lokale Sammlung hochgeladen.

Auf einem zweiten Gerät dieselben Zugangsdaten verwenden und anmelden. Wenn Cloud-Daten vorhanden sind, kann man beim ersten Sync die Cloud-Daten laden.

Danach werden Änderungen nach dem Speichern automatisch in die Cloud übertragen.
