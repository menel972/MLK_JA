import 'package:map_launcher/map_launcher.dart';
import 'package:mlk_ja/after/presentation/models/ui_after.dart';
import 'package:mlk_ja/common/enums.dart';

List<UiAfter> uiAfterMocked = [
  // January
  UiAfter(
    uid: '1',
    type: AfterType.worship,
    guests: const [
      UiGuest('MLK JA', url: 'https://www.instagram.com/mlkjeunesadultes/'),
    ],
    date: DateTime.utc(2023, 1, 7, 19, 45),
    coords: Coords(48.76827, 2.45820),
    description:
        '''Un temps de louange et d'adoration où tous les jeunes adultes seront pleinement connectés à Dieu. L'objectif est de créer une atmosphère pour accueillir le saint Esprit. 
          
          Des adorateurs seront soit des membres de l'équipe de louange de MLK ou des artistes chrétiens. Ils seront en charge de guider le temps de louange et rythmé les moments de prière.''',
  ),
  UiAfter(
    uid: '2',
    type: AfterType.talk,
    guests: const [
      UiGuest('MLK JA', url: 'https://www.instagram.com/mlkjeunesadultes/'),
      UiGuest('Charlène Abienso',
          url: 'https://charleneabienso.com/inscription469665801617890475848')
    ],
    date: DateTime.utc(2023, 1, 14, 19, 45),
    coords: Coords(48.76827, 2.45820),
    description:
        '''Eu aute anim veniam enim. Occaecat id incididunt eu enim fugiat laborum sit excepteur do magna nostrud consequat incididunt. Exercitation cillum exercitation irure dolor. Cillum nisi eu ex anim in exercitation officia sit anim.''',
    name: 'Gestion financière',
  ),
  UiAfter(
    uid: '3',
    type: AfterType.mlk,
    guests: const [
      UiGuest('Glorious Louange',
          url: 'https://instagram.com/glorious_louange?igshid=YmMyMTA2M2Y=')
    ],
    date: DateTime.utc(2023, 1, 21, 20, 30),
    coords: Coords(48.76827, 2.45820),
    description:
        '''Eu aute anim veniam enim. Occaecat id incididunt eu enim fugiat laborum sit excepteur do magna nostrud consequat incididunt. Exercitation cillum exercitation irure dolor. Cillum nisi eu ex anim in exercitation officia sit anim.''',
    name: 'Fête de l\'unité des chrétiens',
    duration: const Duration(hours: 3, minutes: 30),
    url: 'https://www.billetweb.fr/fete-de-lunite-des-chretiens',
    image: 'assets/images/afters/IMG_6057.JPG',
  ),
  UiAfter(
    uid: '4',
    type: AfterType.open,
    guests: const [
      UiGuest('MLK JA', url: 'https://www.instagram.com/mlkjeunesadultes/'),
      UiGuest('R\'amen Comedy Club',
          url: 'https://www.instagram.com/ramencomedyclub/'),
    ],
    date: DateTime.utc(2023, 1, 28, 19, 45),
    coords: Coords(48.76827, 2.45820),
    name: 'Comedy Club',
    image: 'assets/images/afters/COMEDY_CLUB.jpg',
    url:
        'https://www.eventbrite.fr/e/billets-after-jeunes-adultes-samedi-a-20h00-28-janvier-2023-521984428477?aff=ebdsoporgprofile',
  ),
  // February
  UiAfter(
    uid: '5',
    type: AfterType.worship,
    guests: const [
      UiGuest('MLK JA', url: 'https://www.instagram.com/mlkjeunesadultes/'),
      UiGuest('Free Worship Unité', url: 'https://freeworshipfr.wordpress.com'),
    ],
    date: DateTime.utc(2023, 2, 4, 19, 45),
    coords: Coords(48.76827, 2.45820),
    name: 'Free Worship',
    image: 'assets/images/afters/visuel-freeworship-1250x625.jpg',
  ),
  UiAfter(
    uid: '6',
    type: AfterType.talk,
    guests: const [
      UiGuest('MLK JA', url: 'https://www.instagram.com/mlkjeunesadultes/'),
    ],
    date: DateTime.utc(2023, 2, 11, 19, 45),
    coords: Coords(48.76827, 2.45820),
    name: 'Couple / Célibat',
  ),
  UiAfter(
    uid: '7',
    type: AfterType.chill,
    guests: const [
      UiGuest('MLK JA', url: 'https://www.instagram.com/mlkjeunesadultes/'),
    ],
    date: DateTime.utc(2023, 2, 18, 19, 45),
    coords: Coords(48.76827, 2.45820),
    name: 'Ce soir on se rencontre !',
    image: 'assets/images/afters/vendredi_tout_est_permis_avec_arthur.jpg',
  ),
  UiAfter(
    uid: '8',
    type: AfterType.open,
    guests: const [
      UiGuest('MLK JA', url: 'https://www.instagram.com/mlkjeunesadultes/'),
    ],
    date: DateTime.utc(2023, 2, 25, 19, 45),
    coords: Coords(48.76827, 2.45820),
  ),
  // March
  UiAfter(
    uid: '9',
    type: AfterType.talk,
    guests: const [
      UiGuest('MLK JA', url: 'https://www.instagram.com/mlkjeunesadultes/'),
      UiGuest('Eric & Rachel Dufour', url: 'https://www.ericracheldufour.com')
    ],
    date: DateTime.utc(2023, 3, 4, 19, 45),
    coords: Coords(48.76827, 2.45820),
    name: 'La Sexualité',
  ),
  UiAfter(
    uid: '10',
    type: AfterType.worship,
    guests: const [
      UiGuest('MLK JA', url: 'https://www.instagram.com/mlkjeunesadultes/'),
    ],
    date: DateTime.utc(2023, 3, 11, 19, 45),
    coords: Coords(48.76827, 2.45820),
  ),
  UiAfter(
    uid: '11',
    type: AfterType.chill,
    guests: const [
      UiGuest('MLK JA', url: 'https://www.instagram.com/mlkjeunesadultes/'),
    ],
    date: DateTime.utc(2023, 3, 18, 19, 45),
    coords: Coords(48.76827, 2.45820),
    name: 'Famille en Or part.2',
    image: 'assets/images/afters/Visuel After.png',
  ),
  UiAfter(
    uid: '12',
    type: AfterType.open,
    guests: const [
      UiGuest('MLK JA', url: 'https://www.instagram.com/mlkjeunesadultes/'),
    ],
    date: DateTime.utc(2023, 3, 25, 19, 45),
    coords: Coords(48.76827, 2.45820),
  ),
];
