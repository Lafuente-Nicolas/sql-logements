# Plateforme de location de logements – Exercice SQL & MCD

## 🎯 Objectif

Ce projet a pour objectif de **modéliser** puis **implémenter** en SQL une base de données simplifiée pour une **plateforme de location de logements entre particuliers**.

**Livrables attendus :**
- ✅ Un **MCD** (Modèle Conceptuel de Données)
- ✅ Un **script SQL fonctionnel** (`location_logements.sql`)

---

## Modèle Conceptuel de Données (MCD)

**Contenu :**
- Les **entités** et leurs **attributs**
- Les **relations** entre les entités
- Les **cardinalités** (1, N, etc.)

 **Entités minimales :**
- Utilisateur
- Logement
- Réservation

**Maximum :** 7 entités pour garder le modèle lisible.

**Format :** fichier image (`.png`, `.jpg`) ou PDF. Réalisation possible à la main (photo) ou avec un outil comme [Looping-MCD](https://www.looping-mcd.fr/) ou dbdiagram.io.

---

##  Script SQL – `location_logements.sql`

**Contenu obligatoire :**

1. **Création de la base de données**, avec suppression préalable si elle existe.
2. **Création des tables**, avec contraintes (clé primaire, clé étrangère).
3. **Insertion de données cohérentes** pour tester la base.
4. **Requêtes SQL** de vérification.

---

##  Requêtes SQL minimales

- 🔍 Lister les logements avec le nom du propriétaire.
- 🔢 Compter le nombre de réservations par ville.
- 📅 Afficher les réservations d’un utilisateur donné.
- ➕ Toute requête pertinente pour prouver le bon fonctionnement du modèle.

---

##  Conseils pratiques

- Supprimez les bases/tables existantes avant de recréer pour éviter les conflits.
- Vérifiez que le script s’exécute sans erreurs.
- Testez les requêtes **avant de livrer**.

**Exemple d’exécution :**
```bash
psql -U postgres -d nom_de_votre_base -f location_logements.sql
```

---

## ✅ Résultat attendu

- ✅ Un **MCD clair et complet**
- ✅ Un script **SQL fonctionnel et testé**, prêt à être exécuté sans erreurs

---

##  Auteur(s)

- __Julien, Donovan et Nicolas__
