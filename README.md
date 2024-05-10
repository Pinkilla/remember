# Reminder

Comment mémoriser proprement un mot de passe pendant un certain temps ? 

Cas d'usage : je dois faire une connexion `lftp` et renseigner mon mot de passe. Il est probable que je relance la commande plusieurs fois pendant ma session de travail. 

Extrait d'un _Makefile_

put: 
	@lftp -e "put -O something ; bye"\
	 -u somelogin,$(shell ./remember.sh somelogin) sftp://ftp.example.org


_Voir exemple de `Makefile`

## Changelog

- _v -1_ Tentative de sauvegarde des mots de passe dans une variable d'environnement. 
    Mauvaise idée. Les _envars_ sont accessibles par tous les processus. 

- _v 0.1_ Utilisation du _POC_ de Ante qui utilise le _keyring_ linux via la commande `keyctl`. 
    Cfr. <poc-remember-ante.sh>… ça marche. 

## Auteurs 

Pierre Bettens (pit) <pb@namok.be>  
Ante 
