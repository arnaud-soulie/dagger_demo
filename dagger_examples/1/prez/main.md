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
- ***CI platform agnostic***
- Du vrai développement de CI
- Gestion du cache et des artefacts intermédiaires
- Enfin du debug de pipeline en local... :heart_eyes:

---

# DAGGER

![bg right:40% w:400 ](ressources/images/github.png)
## **Comment ?**
- *Any Docker Compatible Runtime*
- Cuelang

## **Pour qui ?**
- Tu as honte de tes 50 runs rouges sur Jenkins parce que tu ne sais pas écrire 3 lignes de Groovy ?
 - Tu n'en peux plus d'attendre après la CI qui ne fait que planter pour tester ton change ?
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

Des packages *Cue* qui permettent de **s'abstraire** des outils.


---

# UN PLAN

![bg 90% ](ressources/images/plan.png)

___

<!-- _class: part -->

CUELANG

---

# Configure, Unify, Execute

- Créé par Marcel van Lohuizen chez Google en 2018
- JSON sous stéroides
- Définir, valider et utiliser de la data
- Notions:
  - Packages
  - Les types sont des valeurs
  - Contraintes, définitions, schémas...
  - Valeurs par défaut

![bg right:30% width:50%](ressources/images/cuelogo.png)

---

# CUE RECETTE
![bg 80% ](ressources/images/cue1.png)

___

# CUE VALIDATION

![bg h:550 75% ](ressources/images/cue2.png)

___

# CUE GENERATION

![bg 60% ](ressources/images/cue3.png)

---

# POUR DEMARRER

![bg right:65% w:70% ](ressources/images/cuesummary.webp)

- ## [Cuetorials.com](https://cuetorials.com/introduction/)
- ## [Cuelang.org](https://cuelang.org/)
- ## [Playground](https://cuelang.org/play/#cue@export@cue)
___

<!-- _class: part -->

EXEMPLES
___

# BUILD & PUSH

![bg right:40% 30%](ressources/images/dag_buildpush.png)

- Builder et pusher un simple conteneur sur un registry
- Exécuter ce pipeline aussi bien en local qu'en remote
- Utiliser des packages tout prêts
___

# BUILD & PUSH

![bg right:50% 80% ](ressources/images/demo1.png)

![w:550](ressources/images/flask.png)
</br>

- Plan portable: en local, ou sur [Github Actions](https://github.com/arnaud-soulie/dagger_demo/actions/workflows/ci_demo2.yml)
- [Effet démo](http://localhost:12345)
- [Docker Hub](https://hub.docker.com/r/fgtech/demo2)

___

# DEPLOIEMENT KUBE

![bg right:50% 70% ](ressources/images/dag_fullapp.png)

___

# UN PEU PLUS LOIN

- Provisionner de l'infrastructure et l'utiliser à la volée
- Gestion des **monorepos**
- Librairies sur la v0.2.x réduites : voter pour les prochaines implémentations [ici](https://github.com/dagger/dagger/discussions/1922)

![bg right:60% 80% ](ressources/images/dag_demoEKS.png)

___

# ET ENSUITE ?

- [Dagger.io](https://dagger.io/)
- [Discord](https://discord.com/channels/707636530424053791/796905486145683506/955856707773407292)
- [Documentation](https://docs.dagger.io/)
- [Github](https://github.com/dagger/dagger)
- Release courante : v0.2.4
- [Exemples](https://github.com/dagger/dagger/tree/main/pkg/universe.dagger.io/examples)
- Discussions:
  - [Which CI environment integration should we cover next?](https://github.com/dagger/dagger/discussions/1677)
  - [What should we add next to the Dagger Universe?](https://github.com/dagger/dagger/discussions/1922)
- Sujets à venir:
  - Gérer des backends de cache
  - Génération d'un visuel de DAG
  - 
