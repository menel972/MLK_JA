import 'package:mlk_ja/common/enums.dart';
import 'package:mlk_ja/home/presentation/models/ui_after_preview.dart';

List<UiAfterPreview> uiAftersPreviewMocked = [
  // January
  UiAfterPreview(
    uid: '1',
    type: AfterType.worship,
    date: DateTime.utc(2023, 1, 7, 19, 45),
  ),
  UiAfterPreview(
    uid: '2',
    type: AfterType.talk,
    date: DateTime.utc(2023, 1, 14, 19, 45),
  ),
  UiAfterPreview(
    uid: '3',
    type: AfterType.mlk,
    date: DateTime.utc(2023, 1, 21, 20, 30),
    url: 'https://www.billetweb.fr/fete-de-lunite-des-chretiens',
    image: 'assets/images/IMG_6057.JPG',
    name: 'Fête de l\'unité des chrétiens',
  ),
  UiAfterPreview(
    uid: '4',
    type: AfterType.open,
    date: DateTime.utc(2023, 1, 28, 19, 45),
    name: 'Comedy Club',
    image: 'assets/images/COMEDY_CLUB.jpg',
    url:
        'https://www.eventbrite.fr/e/billets-after-jeunes-adultes-samedi-a-20h00-28-janvier-2023-521984428477?aff=ebdsoporgprofile',
  ),
  // February
  UiAfterPreview(
    uid: '5',
    type: AfterType.worship,
    date: DateTime.utc(2023, 2, 4, 19, 45),
    name: 'Free Worship',
    image: 'assets/images/visuel-freeworship-1250x625.jpg',
  ),
  UiAfterPreview(
    uid: '6',
    type: AfterType.talk,
    date: DateTime.utc(2023, 2, 11, 19, 45),
    name: 'Couple / Célibat',
  ),
  UiAfterPreview(
    uid: '7',
    type: AfterType.chill,
    date: DateTime.utc(2023, 2, 18, 19, 45),
    name: 'Ce soir on se rencontre !',
    image: 'assets/images/vendredi_tout_est_permis_avec_arthur.jpg',
  ),
  UiAfterPreview(
    uid: '8',
    type: AfterType.open,
    date: DateTime.utc(2023, 2, 25, 19, 45),
  ),
  // March
  UiAfterPreview(
    uid: '9',
    type: AfterType.talk,
    date: DateTime.utc(2023, 3, 4, 19, 45),
    name: 'La Sexualité',
  ),
  UiAfterPreview(
    uid: '10',
    type: AfterType.worship,
    date: DateTime.utc(2023, 3, 11, 19, 45),
  ),
  UiAfterPreview(
    uid: '11',
    type: AfterType.chill,
    date: DateTime.utc(2023, 3, 18, 19, 45),
    name: 'Famille en Or part.2',
    image: 'assets/images/Visuel After.png',
  ),
  UiAfterPreview(
    uid: '12',
    type: AfterType.open,
    date: DateTime.utc(2023, 3, 25, 19, 45),
  ),
];
