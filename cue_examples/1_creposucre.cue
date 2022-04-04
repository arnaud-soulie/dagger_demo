//cue export 1_creposucre.cue --out yaml
package creposucre

#pate: {                      // <-- Définition
  oeuf: int | *2              // <-- Default
  farine: >=50 & <200 & int
  lait: "1 verre"
  supplement_coquin?: string // <-- option, mais meilleur avec
}

#crepe: #pate & {            // <-- Conjonction
  farine: 125
  supplement_coquin: "rhum"
}

crepeosucre: {
  crepe: #crepe
  condiment: "sucre"
}

