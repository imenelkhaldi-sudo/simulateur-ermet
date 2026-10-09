# Simulateur ERMET — dépose de couvercle d'écrin

Partie opérative virtuelle du poste ERMET, à connecter à **PLCSIM Advanced**
pour tester le programme Ladder du document `TraductionG7_Ladder_ERMET.docx`.

## Fichiers

| Fichier | Rôle |
|---|---|
| `index.html` | Le simulateur (HTML autonome, sans dépendance). S'ouvre aussi seul dans un navigateur pour le mode Démo guidée. |
| `Simulateur_ERMET.bat` | Lance le pont et ouvre le simulateur sur http://localhost:8080 |
| `bridge/PlcBridge.exe` | Pont PLCSIM Advanced ⇄ navigateur (le même que SITRAINSim, copié tel quel). |

## Prérequis sur le poste

- .NET Runtime 8.0 x64.
- PLCSIM Advanced V3 à V8 (installé avec TIA Portal).
- Un projet TIA Portal avec la case **« Prendre en charge la simulation lors de
  la compilation des blocs »** cochée (propriétés du projet > Protection).

## Utilisation

1. Ouvrir PLCSIM Advanced, créer/démarrer une instance (PLCSIM Virtual Eth. Adapter
   ou Softbus), attendre l'état **RUN**.
2. Dans TIA Portal, charger le programme dans cette instance.
3. Lancer `Simulateur_ERMET.bat` et accepter l'élévation administrateur
   (nécessaire quand PLCSIM Advanced tourne lui-même en administrateur). Le
   navigateur s'ouvre ; le point d'état doit être vert « PLCSIM Advanced
   connecté — <instance> · Run ». Le pont ne se connecte qu'à son lancement :
   si l'instance est démarrée ou recréée après coup, relancer le `.bat`.
4. Mode **Automate** : le simulateur écrit les capteurs et DCY dans les %I et lit
   les %Q. Le GRAFCET animé (colonne de droite, d'après `images/G7.jpeg`) suit les bits
   d'étape %M10.0 à %M10.7 : étape active, transition validée, réceptivité vraie,
   temporisations ; alerte si plusieurs étapes sont actives à la fois.
5. Menu **Adresses** : par défaut, le tableau des E/S codifiées du dossier ERMET
   (DCY %I1.4, 10B1 %I1.2, 10B2 %I1.3, 30B1 %I1.0, 30B2 %I1.1 ; 10AV14 %Q2.2,
   11AV12 %Q2.1, 11AV14 %Q2.0, 30AV12 %Q2.3, 30AV14 %Q2.4), identique au
   document « Traduction G7 → Ladder ». Le programme TIA doit utiliser ces
   adresses ; sinon les faire coïncider ici (mémorisées dans le navigateur).

Mode sans automate : **Démo guidée** (GRAFCET interne, d'après `images/G7.jpeg`
**corrigé** : « 10AV14:=0 » aux étapes 3 et 7, et non 2 et 6, sinon la ventouse
remonte avant que le vide soit établi). Le programme TIA doit suivre cette version.

Sous le dessin : **Figer** / **Reprendre** (la partie opérative s'arrête, l'automate
continue de tourner) et **+ 0,1 s** (pas à pas, pour montrer une transition au ralenti).
Les événements (couvercle saisi, déposé, tombé) s'affichent en bas du dessin pendant
5 s et restent dans la console du navigateur (F12). Le bandeau donne le nombre de
cycles et la durée du dernier cycle (de l'étape 1 au retour en 0).

**Pannes injectables** (menu en bas, pour le diagnostic en autonomie) : capteur 10B2
hors service, fuite sur le circuit de vide (le couvercle est lâché 1,5 s après la
prise), vérin 30A bloqué. Rien ne signale la panne sur le dessin : les étudiants
partent du symptôme (étape bloquée, couvercle tombé).

## Physique simulée

- Les chambres des vérins sont colorées selon le code de la charte : gris = hors
  pression, orange = sous pression. Le piston se déplace avec la tige.
- 10A : distributeur **monostable** — descend tant que 10AV14 = 1, remonte sinon
  (chambre avant sous pression au repos, retour par ressort du distributeur).
- 30A : distributeur **bistable** — 30AV14 = droite, 30AV12 = gauche, mémoire.
- 11A : venturi **bistable** — 11AV12 = aspiration, 11AV14 = relâchement.
- Le couvercle (doré) est pris sur l'**écrin marron** (à gauche) et déposé sur
  l'**écrin violet** (à droite, sur le convoyeur). Il n'est saisi que ventouse en bas,
  chariot à gauche, vide établi. Relâché ailleurs qu'au-dessus de l'écrin violet, il
  tombe, puis est remis sur l'écrin marron après 3 s. Une fois l'écrin violet fermé et
  la ventouse remontée, il est évacué par le convoyeur, un écrin vide le remplace et un
  nouveau couvercle est prêt sur l'écrin marron.
