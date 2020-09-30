-- TriggerEvent('tac_poliisikoira:openMenu') Avataksesi valikon

Config = {
    Job = 'police',
    Command = 'poliisik', -- Laita tähän haluamasi komento
    Model = 351016938,
    TpDistance = 50.0,
    Sit = {
        dict = 'creatures@rottweiler@amb@world_dog_sitting@base',
        anim = 'base'
    },
    Drugs = {'weed', 'cocaine', 'meth'}, -- Laita tähän kaikki huumeet joita haluat koiran tutkivan/löytävän
}

Strings = {
    ['not_police'] = 'Sinä ~r~et ~s~ole työntekijä!',
    ['menu_title'] = 'Poliisi koira',
    ['take_out_remove'] = 'Ota pois käytöstä poliisi koira',
    ['deleted_dog'] = 'Poliisi koira poistettu käytöstä',
    ['spawned_dog'] = 'Sinä loit poliisi koiran',
    ['sit_stand'] = 'Käske koiran istua / nousta',
    ['no_dog'] = "Sinulla ei ole yhtään poliisi koiraa",
    ['dog_dead'] = 'Sinun koirasi kuoli :/',
    ['search_drugs'] = 'Etsi huumeita lähellä olevilta pelaajilta!',
    ['no_drugs'] = 'Huumeita ei löytynyt!', 
    ['drugs_found'] = 'Etsi huumeita!',
    ['dog_too_far'] = 'Koira on liian kaukana!',
    ['attack_closest'] = 'Hyökkää läheisimpään pelaajaan!',
    ['get_in_out'] = 'Laita / Ota ulos autosta'
}