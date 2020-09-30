Config                   = {}

--GENERAL
Config.Lang              = 'en'    --Set lang (fr-en)
Config.Permission        = "admin" --Permission need to use FiveM-BanSql commands (mod-admin-superadmin)
Config.ForceSteam        = true    --Set to false if you not use steam auth
Config.MultiServerSync   = false   --This will check if a ban is add in the sql all 30 second, use it only if you have more then 1 server (true-false)


--WEBHOOK
Config.EnableDiscordLink = true --Turn this true if you want link the log to a discord (true-false)
Config.webhookban        = "https://discordapp.com/api/webhooks/746655866325041162/yrTcfnm-4pnD34ZLbjWjSK0H2YLTrOEz9yVwLcn0a3N36CsQsfjy20jCQvOiEi60m38f"
Config.webhookunban      = "https://discordapp.com/api/webhooks/746655866325041162/yrTcfnm-4pnD34ZLbjWjSK0H2YLTrOEz9yVwLcn0a3N36CsQsfjy20jCQvOiEi60m38f"


--LANGUAGE
Config.TextFr = {
	start         = "La BanList et l'historique a ete charger avec succes",
	starterror    = "ERREUR : La BanList ou l'historique n'a pas ete charger nouvelle tentative.",
	banlistloaded = "La BanList a ete charger avec succes.",
	historyloaded = "La BanListHistory a ete charger avec succes.",
	loaderror     = "ERREUR : La BanList n a pas été charger.",
	cmdban        = "/sqlban (ID) (Durée en jours) (Raison)",
	cmdbanoff     = "/sqlbanoffline (Permid) (Durée en jours) (Raison)",
	cmdhistory    = "/sqlbanhistory (Steam name) ou /sqlbanhistory 1,2,2,4......",
	noreason      = "Raison Inconnue",
	during        = " pendant : ",
	noresult      = "Il n'y a pas autant de résultats !",
	isban         = " a été ban",
	isunban       = " a été déban",
	invalidsteam  =  "Vous devriez ouvrir steam",
	invalidid     = "ID du joueur incorrect",
	invalidname   = "Le nom n'est pas valide",
	invalidtime   = "Duree du ban incorrecte",
	alreadyban    = " étais déja bannie pour : ",
	yourban       = "Vous avez ete ban pour : ",
	yourpermban   = "Vous avez ete ban permanent pour : ",
	youban        = "Vous avez banni : ",
	forr          = " jours. Pour : ",
	permban       = " de facon permanente pour : ",
	timeleft      = ". Il reste : ",
	toomanyresult = "Trop de résultats, veillez être plus précis.",
	day           = " Jours ",
	hour          = " Heures ",
	minute        = " Minutes ",
	by            = "par",
	ban           = "Bannir un joueurs qui est en ligne",
	banoff        = "Bannir un joueurs qui est hors ligne",
	bansearch     = "Trouver l'id permanent d'un joueur qui est hors ligne",
	dayhelp       = "Nombre de jours",
	reason        = "Raison du ban",
	permid        = "Trouver l'id permanent avec la commande (sqlsearch)",
	history       = "Affiche tout les bans d'un joueur",
	reload        = "Recharge la BanList et la BanListHistory",
	unban         = "Retirez un ban de la liste",
	steamname     = "(Nom Steam)",
}


Config.TextEn = {
	start         = "Porttikielto lista on ladattu onnistuneesti.",
	starterror    = "VIRHE: Ladattaessa porttikielto listaa, yritä uudelleen.",
	banlistloaded = "Porttikielto lista ladattu.",
	historyloaded = "Porttikiellon historia on ladattu.",
	loaderror     = "VIRHE: Ladattaessa porttikielto listaa.",
	cmdban        = "/sqlban (ID) (Pituus päivissä) (Porttikiellon syy)",
	cmdbanoff     = "/sqlbanoffline (Permid) (Pituus päivissä) (Steam nimi)",
	cmdhistory    = "/sqlbanhistory (Steam nimi) or /sqlbanhistory 1,2,2,4......",
	forcontinu    = " päivää. Jatkaaksesi, execute /sqlreason [reason]",
	noreason      = "Ei syytä annettu.",
	during        = " aikaa jäljellä: ",
	noresult      = "Ei tuloksia löytynyt.",
	isban         = " sai porttikiellon palvelimelle",
	isunban       = " porttikielto otettiin pois",
	invalidsteam  = "Steam on pakollinen, että voit liittyä palvelimelle.",
	invalidid     = "Pelaajan ID ei löydy",
	invalidname   = "Syötettyä nimeä ei löydy",
	invalidtime   = "Virheellinen porttikiellon pituus",
	alreadyban    = " on jo porttikielto : ",
	yourban       = "Sinulla on porttikielto syystä: ",
	yourpermban   = "Sinulla on ikuinen porttikielto palvelimelle syystä: ",
	youban        = "Sinulla on porttikielto palvelimelle syystä: ",
	forr          = " days. For: ",
	permban       = " permanently for: ",
	timeleft      = ". Time remaining: ",
	toomanyresult = "Too many results, be more specific to shorten the results.",
	day           = " päivää ",
	hour          = " tuntia ",
	minute        = " minuuttia ",
	by            = "by",
	ban           = "Anna porttikielto pelaajalle",
	banoff        = "Anna porttikielto poissa olevalle pelaajalle",
	dayhelp       = "Porttikiellon kesto (päivissä)",
	reason        = "Porttikiellon syy",
	history       = "Näyttää kaikki edelliset porttikiellot henkilöltä",
	reload        = "Päivittää porttikielto listan.",
	unban         = "Poistaa porttikiellon pelaajalta.",
	steamname     = "Steam nimi"
}
