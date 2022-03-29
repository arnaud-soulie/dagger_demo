---
marp: true

paginate: true
---
<style>
  
  section{
    background-image: url("ressources/images/background.png");
    background-size: cover;
    }
    
    h1 {
    color: #21509c;
    position: absolute;
    top: 20px; 
    left: 28px;
    font-weight: bold;
  }

  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }

  section li {
    line-height: 38px;
    font-size:26px
  }
  section.sommaire {
    background-image: url("ressources/images/rose_gauche.png");
  }

  section.sommaire ul li {
    line-height: 50px;
    font-size: 40px;
    position: relative;
    left: 250px;
  }

  section.sommaire>h1 {
    color: #21509c;
    position: absolute;
    top: 50px; 
    left: 350px;
    font-weight: bold;
  }

  section.part {
    background-image: url("ressources/images/background_part.png");
    background-size: cover;
    color: white;
    font-size: 150px;
    text-align: center;
  }

  section.part>p {
    color: white;
    position: absolute;
    top: 50%;
    left: 50%;
    font-weight: bold;
    transform: translate(-50%, -50%);
    background: #233a7b;
    width: max-content;

  }

  </style>



![bg](ressources/images/titre.png)

---
<!-- _class: part -->

ORIGINE

---
# UN BESOIN

Solomon Hykes, Andrea Luzzardi et Sam Alba, les créateurs de **Docker**, font un constat :

- **Chaque société développe son propre framework interne pour intégrer les différents outils liés au DevOps ensemble.**

- **Avoir à commit et push pour tester un change sur un pipeline, c'est lent...** :sleeping:

___
# UNE REPONSE


![bg right:40% w:300](ressources/images/dagger_logo.png)

"Un ***DevKit portable de CI/CD***
La ***superglue*** DevOps"

## **Intérêt ?**
- S'abstraire de tous les outils habituels du DevOps
- Unifier le dev et la CI
- Gestion du cache et des artefacts intermédiaires
- Enfin du debug de pipeline en local... :heart_eyes:

---

<!-- _class: part -->

PRINCIPE

---

# LE DAG

___

# UN PLAN

![bg right:40% w:300](ressources/images/accroc.jpeg)

Le plan décrit les différentes étapes, les entrées...
___


<!-- _class: sommaire -->
# Sommaire
- Origine
- Principe
- Cue
- Quelques effets démo

___

# Introduction

### **Génèse**
- Dévoilé en juin 2014 et présenté en version stable 1.0 un an plus tard.
- Kubernetes est la reécriture en Go du système Borg que Google utilise en interne depuis 15 ans (2 milliards de conteneurs par semaine)
- Il a été open-sourcé et sa gouvernance a été transmise à la [CNCF](https://www.cncf.io/about/members/) (1er projet [mais pas le dernier]((https://www.cncf.io/projects/)))
