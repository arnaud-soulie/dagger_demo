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

![bg w:1000 ](ressources/images/dag_init.png)
___

# LE DAG

![bg w:1000 ](ressources/images/dag_nutella.png)
___

# LE DAG

![bg w:1000 ](ressources/images/dag_final.png)

---

# DES INGREDIENTS

![bg right:40% contain ](ressources/images/pkgs_dagger.png)

Des packages *Cue* qui permettent de **s'abstraire** des outils spécifiques.


---

# UN PLAN

![bg contain ](ressources/images/plan.png)

___



<!-- _class: part -->

CUELANG

---

# CUELANG

- JSON sous stéroides
- Packages
- Les types sont des valeurs
- Contraintes, définitions, schémas...
- Valeurs par défaut

![bg right:30% width:70%](ressources/images/cuelinks.png)

---

# CUE RECETTE

![bg 80% ](ressources/images/cue1.png)

___

# CUE VALIDATION

![bg h:550 75% ](ressources/images/cue2.png)

___

# CUE GENERATION

![bg 60% ](ressources/images/cue3.png)


___
