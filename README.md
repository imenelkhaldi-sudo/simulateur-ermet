# Simulateur ERMET — dépose de couvercle d'écrin

**Démo en ligne : https://imenelkhaldi-sudo.github.io/simulateur-ermet/**

Partie opérative virtuelle du poste ERMET (vérins pneumatiques, ventouse, capteurs), avec
GRAFCET animé, à connecter à PLCSIM Advanced ou à utiliser en démo guidée sans automate.

## Objectif pédagogique

- Traduire un GRAFCET en Ladder et vérifier le programme sur une partie opérative virtuelle.
- Suivre l'évolution du GRAFCET en direct : étape active, transition validée, réceptivité vraie,
  temporisations, alerte si plusieurs étapes sont actives.
- Comprendre la pneumatique : distributeurs monostable / bistable, chambres sous pression, vide.
- S'entraîner au **diagnostic** : pannes injectables (capteur hors service, fuite de vide,
  vérin bloqué) à retrouver à partir du symptôme.

## Public visé

- Étudiants de BTS CRSA (2e année), et toute formation en automatisme industriel.
- Formateurs qui veulent faire tester un programme sans mobiliser le poste réel.

## Technologies

- Simulateur : un seul fichier `index.html` (HTML, CSS, JavaScript et SVG, sans dépendance).
- Pont PLCSIM Advanced ⇄ navigateur : `bridge/PlcBridge.exe`, application C# / .NET 8 en
  WebSocket (sources dans le dépôt [simulateur-convoyeur](https://github.com/imenelkhaldi-sudo/simulateur-convoyeur)),
  avec [S7netplus](https://github.com/S7NetPlus/s7netplus) (licence MIT).
- Développé par Imen MKAOUAR-ELKHALDI avec l'assistance de **Claude** (Anthropic, via Claude Code).

## Utilisation

- **Démo guidée** : ouvrir la démo en ligne (ou `index.html`).
- **Avec automate** : installer le .NET Runtime 8.0 x64, démarrer une instance PLCSIM Advanced en
  RUN avec le programme chargé, puis lancer `Simulateur_ERMET.bat` (page sur http://localhost:8080).
  Le mode automate ne fonctionne pas depuis la démo en ligne.

Détails (adresses E/S, physique simulée) : `LISEZMOI.md`.

## Avertissement

Projet pédagogique indépendant, non affilié à Siemens AG. SIMATIC, TIA Portal et PLCSIM sont des
marques de Siemens AG. La DLL Siemens n'est pas fournie : le pont utilise celle installée sur le poste.
