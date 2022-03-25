//cue export 1_creposucre.cue --out yaml
package creposucre

#pate: {
  oeuf: 2
  farine: >=50 & <200 & int
  lait: "1 verre"
  supplement_coquin?: string //option, mais meilleur avec
}

#crepe: #pate & {
  farine: 125
  supplement_coquin: "rhum"
}

crepeosucre: {
  crepe: #crepe
  condiment: "sucre"
}

