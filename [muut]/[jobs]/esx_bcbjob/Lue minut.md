# esx_bcbjob

## Vaatimukset

* Pelaajan hallinta (laskutus ja pomo valikko)
  * [esx_society](https://github.com/ESX-Org/esx_society)
  * [esx_billing](https://github.com/ESX-Org/esx_billing)

### Manuaali asennus
- Laita tämä sinun `[esx]` hakemistoon
- Laita `esx_bcbjob.sql` sinun tietokantaan
- Jos haluat pelaajan hallitsemisen käyttöön niin laita `Config.EnablePlayerManagement`  `true` sinun `config.lua`
- Lisää tämä sinun `server.cfg`:

```
start esx_bcbjob
```