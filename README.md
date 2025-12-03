# Rapport de TP 3 : app_function

## Introduction
Ce rapport décrit l'implémentation d'une application Flutter simple qui démontre l'utilisation de widgets personnalisés pour afficher des informations de voiture, ainsi qu'une mise en page UI de base. L'application présente deux cartes de voiture (`voiture_card`) avec des images et des titres distincts, en se concentrant sur la gestion des assets et la décoration des widgets.

## Structure du Projet et Fichiers Clés
Le répertoire `lib` contient la logique d'application principale et les composants UI. Les fichiers clés examinés sont `lib/main.dart` et `lib/components/voiture.dart`.

## Composants et Fonctionnalités Implémentées

### 1. Structure Générale de l'Application
- L'application utilise un `MaterialApp` et un `Scaffold` pour une structure de base.
- Une `AppBar` est présente en haut de l'écran, intitulée "ICON&Card" avec un arrière-plan rose (`backgroundColor: Colors.pink`).
- Voici un aperçu de la structure principale dans `main.dart`:

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ICON&Card"), backgroundColor: Colors.pink,),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  voiture_card("MundiaCart", "assets/images/bmw.jpg",double.infinity,150),
                  SizedBox(height: 5),
                  voiture_card("AUTRE_TEXT", "assets/images/q3.jpg",double.infinity,150)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
```

### 2. Gestion de la Disposition (Layout)
- Le corps de l'application est un `ListView` permettant le défilement vertical du contenu.
- Le contenu principal est organisé dans un `Container` qui contient une `Column`.
- La `Column` affiche deux instances du widget `voiture_card`, séparées par un `SizedBox` de hauteur 5, pour ajouter un espace vertical.
- Les cartes de voiture (`voiture_card`) sont définies avec une largeur `double.infinity` pour prendre toute la largeur disponible et une hauteur fixe de 150.

### 3. Utilisation des Assets (Images et Polices)
- **Images :** L'application intègre des images stockées localement dans le dossier `assets/images/`.
    - `assets/images/bmw.jpg` est utilisée pour la première carte de voiture.
    - `assets/images/q3.jpg` est utilisée pour la deuxième carte de voiture.
    - Les images sont chargées via `AssetImage(url)` et affichées en utilisant `DecorationImage` avec `fit: BoxFit.cover` pour s'assurer qu'elles remplissent l'espace alloué tout en conservant leur rapport d'aspect.
- **Polices Personnalisées :** L'application utilise des polices personnalisées. Bien que le `pubspec.yaml` liste "Charm" et "Vintage", le code actuel (`voiture.dart`) utilise la famille de police "mundia1" pour le titre de la carte.
    - `Charm` : `assets/fonts/charm.otf`
    - `Vintage` : `assets/fonts/vintage.ttf`
    - "mundia1" est appliquée via la propriété `fontFamily` du `TextStyle` dans le widget `voiture_card`.
- Configuration des assets et polices dans `pubspec.yaml`:

```yaml
  assets:
    - assets/images/

  fonts:
    - family: Charm
      fonts:
        - asset: assets/fonts/charm.otf
    - family: Vintage
      fonts:
        - asset: assets/fonts/vintage.ttf
```

### 4. Décoration des Widgets
- Le widget `voiture_card` retourne un `Card` avec une `elevation` de 10 pour un effet d'ombre.
- Un `Container` interne agit comme la zone de contenu de la carte, avec un `padding` spécifique (`EdgeInsets.only(left: 10, top: 7)`).
- La propriété `BoxDecoration` est utilisée pour appliquer divers styles au `Container` :
    - `borderRadius: BorderRadius.circular(30)` est appliquée pour donner des coins arrondis à la carte.
    - `image: DecorationImage(...)` est utilisée pour définir l'image de fond du conteneur.
- Voici la fonction `voiture_card`:

```dart
Card voiture_card(String title, String url, double width, double height){
  return Card(
    elevation: 10,
    child: Container(
      padding: EdgeInsets.only(left: 10, top: 7),
      width:width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(image: AssetImage(url),
        fit:BoxFit.cover),
      ),
      child: Text(title, style: TextStyle(
        fontSize: 20, fontFamily: "mundia1",color:Colors.white70
      ))
    ),
  );
}
```
## Conclusion
Ce TP démontre la création d'une interface utilisateur Flutter simple avec des widgets réutilisables personnalisés (`voiture_card`), la gestion des assets pour les images et les polices, et des techniques de mise en page de base en utilisant `ListView`, `Column`, `Container` et `SizedBox`. Les concepts de `BoxDecoration` et `TextStyle` ont été utilisés pour la décoration visuelle.
