# Site pédagogique Quarto — RStudio et GitHub Pages

Projet complet à personnaliser. Les pages, textes, formules, menus et exemples sont modifiables. Aucune donnée personnelle réelle n'est intégrée.

## 1. Installer et ouvrir

1. Installer R : https://cran.r-project.org/
2. Installer RStudio Desktop : https://posit.co/download/rstudio-desktop/
3. Installer Quarto si nécessaire : https://quarto.org/docs/get-started/
4. Extraire entièrement le ZIP, puis ouvrir `site-quarto.Rproj`.
5. Ouvrir `installer_dependances.R` et cliquer sur **Source**. Une connexion Internet est nécessaire pour l'installation.
6. Dans l'onglet **Terminal** de RStudio, vérifier `quarto --version`. Le workflow utilise Quarto 1.8.24 ; utilisez idéalement cette version ou une version compatible en local.

## 2. Prévisualiser

Dans le Terminal de RStudio, à la racine du projet :

```bash
quarto preview
```

Le navigateur affiche le site et s'actualise après vos modifications. Arrêter avec Ctrl+C. Vous pouvez aussi ouvrir une page `.qmd` et utiliser son bouton Render. Pour prévisualiser tout le site, privilégiez `quarto preview` dans le Terminal. Le projet utilise `BuildType: None` pour éviter une erreur d’ouverture dans certaines versions de RStudio.

Pour générer tous les fichiers HTML :

```bash
quarto render
```

Le résultat se trouve dans `_site/`. Les sources restent dans les fichiers `.qmd`. Ne modifiez pas directement les HTML générés : ils sont remplacés au rendu suivant.

## 3. Personnaliser

| Fichier | Fonction |
|---|---|
| `_quarto.yml` | Titre du site, menus, barre latérale, formats |
| `index.qmd` | Accueil |
| `cours/bts/puissances.qmd` | Exemple avec formules et graphique R |
| `exercices/puissances.qmd` | Exercices et corrigés dépliables |
| `ressources.qmd` | Téléchargements |
| `a-propos.qmd` | Présentation et droits de réutilisation |
| `theme.scss` | Couleur principale et typographie |
| `styles.css` | Mise en forme complémentaire |
| `assets/logo.svg` | Logo à remplacer si souhaité |
| `modeles/chapitre.qmd` | Modèle à copier pour créer un chapitre |
| `.github/workflows/publish.yml` | Génération R/Quarto et publication automatiques |

Pour ajouter un chapitre, copier le modèle dans `cours/seconde/mon-chapitre.qmd`, modifier son contenu et ajouter son lien dans `cours/index.qmd` et dans les contenus de la barre latérale de `_quarto.yml`. Le dossier `modeles/` n'est pas rendu. Les liens entre pages doivent viser les `.qmd` : Quarto les convertit en liens HTML. Utiliser des chemins relatifs, sans `/` initial, pour conserver la compatibilité avec les sites de projet GitHub Pages.

Les formules en ligne s'écrivent `$P=UI$`, les formules centrées entre deux lignes `$$`. Un graphique R est calculé à la génération : aucun serveur R n'est nécessaire pour consulter le site.

## 4. Déployer sur GitHub Pages

1. Créer un dépôt GitHub, par exemple `sciences-physiques`, avec une branche **main**. Un dépôt public convient à GitHub Free.
2. Envoyer **le contenu du dossier `site-quarto` à la racine du dépôt**, et non le ZIP ni le dossier contenant tous les fichiers. `_quarto.yml` et `index.qmd` doivent se trouver à la racine. Envoyer aussi `.github/workflows/publish.yml` et `.gitignore` ; GitHub Desktop ou Git permet de les inclure facilement.
3. Dans le dépôt, ouvrir **Settings → Pages → Build and deployment → Source**, puis choisir **GitHub Actions**.
4. Dans **Actions**, ouvrir **Construire et publier le site Quarto**. Si la première exécution a échoué avant la configuration de Pages, cliquer sur **Re-run all jobs**. Il est aussi possible de lancer **Run workflow** sur `main`.
5. Attendre la réussite des étapes `build` et `deploy`. L'URL apparaît dans **Settings → Pages** et dans le déploiement.

URL habituelle d'un dépôt de projet : `https://VOTRE-IDENTIFIANT.github.io/sciences-physiques/`.

Après chaque modification, enregistrer, faire un commit puis un push vers `main` : GitHub reconstruit et publie le site. Aucun jeton personnel à créer : le workflow utilise les autorisations intégrées à GitHub Actions. Les restrictions éventuelles de l'organisation peuvent nécessiter une intervention de son administrateur.

### Avec GitHub Desktop

Créer ou cloner le dépôt sur l'ordinateur, copier les fichiers du projet dedans, ouvrir le `.Rproj` depuis ce dossier, puis utiliser **Commit to main** et **Push origin** après les modifications. Ne pas déposer de données d'élèves ou de corrigés confidentiels dans ce site public.

## 5. Ajouter des paquets R

L'exemple utilise uniquement R de base, knitr et rmarkdown. Si vous ajoutez ggplot2 ou un autre paquet, l'installer localement et l'ajouter aussi à la commande `install.packages(...)` du workflow. Le fichier CSV utilise le séparateur point-virgule et se lit avec `read.csv2("ressources/mesures.csv")`.

## 6. Dépannage

- **quarto non reconnu** : installer Quarto puis redémarrer RStudio.
- **Paquet R absent** : exécuter `installer_dependances.R` ; pour GitHub, compléter le workflow.
- **Pas de site publié** : vérifier Pages → Source = GitHub Actions, branche `main`, puis lire le journal Actions.
- **Liens cassés** : vérifier la casse des noms (GitHub distingue majuscules et minuscules) et les chemins relatifs.
- **Affichage inchangé** : attendre la fin du déploiement, puis actualiser le navigateur.
- **Formules absentes hors connexion** : le rendu MathJax peut nécessiter Internet.

## 7. Vérification avant diffusion

Exécuter `quarto render`, parcourir l'accueil, le cours, les exercices, la recherche et le téléchargement CSV dans la prévisualisation. Remplacer les textes d'exemple et compléter la page À propos. Les corrigés dépliables restent lisibles dans le code HTML.

Le ZIP contient les sources, pas un site HTML déjà compilé. Le rendu local n'a pas pu être exécuté dans l'environnement de préparation (R et Quarto absents). Le workflow effectuera ce rendu sur GitHub ; le déploiement nécessite votre dépôt et son activation Pages.

## Documentation officielle

- https://quarto.org/docs/websites/
- https://quarto.org/docs/publishing/github-pages.html
- https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages
