class BakerText {
  static const List<String> texts = [
    'Als im Februar 1928 Josephine Baker im Wiener Theater Ronacher ...',
    'Strohkoffer, heute der Keller unter der American Loos Bar ...',
    'Description for text3...',
    'Description for text4...',
    'Description for text5...',
  ];

  static const List<String> titles = [
    '',
    '',
    '',
    '',
    '',
  ];

  static const List<String> addresses = [
    'Parlament',
    'Kärntnerdurchgang',
    'Seilerstätte 9',
    'Kärntner Ring 1',
    'Favoritenstraße 8',
  ];

  static String getText(int index) => texts[index - 1];
  static String getTitle(int index) => titles[index - 1];
  static String getAddress(int index) => addresses[index - 1];
  // -1 ist das index bei 1 startet nicht bei 0
}
