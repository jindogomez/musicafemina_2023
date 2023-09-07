class BakerText {
  static const List<String> texts = [
    'Als im Februar 1928 Josephine Baker im Wiener Theater Ronacher auftreten sollte, kam es im Parlament zu einer mehrstündigen Debatte. Der christlich-soziale Abgeordnete Anton Jerzabek hielt eine von theatralischen Zwischenrufen und von Gelächter unterbrochene Brandrede gegen Josephine Baker, erregte sich über ihre Kunst, über ihr Federn- und Perlenkostüm und verglich sie mit "einer Wilden aus dem Kongo".', //Palarment
    'Strohkoffer, heute der Keller unter der American Loos Bar: Alfred Schmeller, der Kunsthistoriker, fand für den Artclub ein neues Lokal im Kärntnerdurchgang, den Keller unter der American Bar, die Alfred Loos im Jahre 1908 entworfen hatte. Dieser KünstlerInnen-Treffpunkt, der seinen Namen nach den mit Strohmatten ausgelegten Wänden hatte, bestand von 1951 bis 1953.Als 1952 das „Porgy and Bess-Ensemble“ in Wien gastierte – bekanntlich hatte George Gershwin seine Oper black singers reserviert – war der Strohkoffer das einzige Lokal in Wien, wo die Gäste willkommen waren – darunter Leontyne Price und Cab Calloway.', //Kärntnerdurchgang
    'Als die Zeitungen vom „N...skandal“ sprachen, die katholische Kirche Sondergottesdienste zur Buße gegen Bakers „schwere Verstöße gegen die Moral“ organisierte und die National- sozialistische Deutsche Arbeiterpartei (NSDAP) Wiens gegen die „obszönen“ Auftritte protestierte, entzogen die Behörden dem Ronacher-Theater 1928 die Bewilligung für die Show. Erst 1932 durfte Baker im Ronacher ein gefeiertes Gastspiel geben, danach erst wieder 1958.', //Seilerstätte 9
    'Im Ringstraßen Hotel Bristol und im nahe gelegenen Anna Grand Hotel wohnte Josephine Baker mehrmals bei ihren Wien-Besuchen seit den 1920er Jahren. Von diesen Aufenthalten sind die Meldezettel überliefert mit ihrer eigenhändigen Unterschrift. Die Bristol Hotels in ganz Europa nennen mittlerweile eine ihrer Suiten nach Josephine Baker.', //Kärntner Ring 1
    'Josephine Baker trat 1928 in der Revue „Schwarz auf Weiß" im Johann Strauß-Theater auf. Nach 1945 hieß das Etablissement Scala-Theater. 1959 wurde das Theater, das über 1.000 Personen fasste, abgerissen.', //Favoritenstraße 8
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

  static List<String> getTextList(int index) {
    switch (index) {
      case 1:
        return [titles[index - 1], addresses[index - 1], texts[index - 1]];
      case 2:
        return [titles[index - 1], addresses[index - 1], texts[index - 1]];
      case 3:
        return [titles[index - 1], addresses[index - 1], texts[index - 1]];
      case 4:
        return [titles[index - 1], addresses[index - 1], texts[index - 1]];
      case 5:
        return [titles[index - 1], addresses[index - 1], texts[index - 1]];
      default:
        throw ArgumentError('Invalid index: $index');
    }
  }
}
