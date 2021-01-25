# sdtd-zookeeper

### Description 

- `Dockerfile` permet de créer des images Docker contenant l'environnement nécessaire au bon fonctionnement du service Apache Zookeeper.

- `zoo.cfg` est un fichier de configuration de Zookeeper (notamment le path, le port client).

- `startup_script.sh` permet de lancer le service Zookeeper pour qu'ensuite, les instances Spark puissent se connecter dessus. Ainsi le principe d'élection du Leader pourra se faire, et la haute disponibilité pourra être réalisée.
