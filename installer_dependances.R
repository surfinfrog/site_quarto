# À exécuter une seule fois dans RStudio.
paquets <- c("knitr", "rmarkdown")
manquants <- setdiff(paquets, rownames(installed.packages()))
if (length(manquants)) install.packages(manquants, repos = "https://cloud.r-project.org")
message("Dépendances R prêtes. Vérifiez aussi l'installation de Quarto : quarto --version")
