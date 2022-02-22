voornaam <- 'Peter'
achternaam <- 'Anema'

volledige_naam <- tolower(paste(voornaam, achternaam, sep = '-'))

# Dit is commentaar. Print iets
print(volledige_naam)



leeftijd = 17

is_kind = leeftijd < 12
is_tiener = leeftijd >= 12 & leeftijd < 15
is_puber = leeftijd >= 15 & leeftijd < 19

if (is_kind | is_tiener) {
  print('Yoooo!')
}



