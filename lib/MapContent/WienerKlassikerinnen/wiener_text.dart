// TODO: ferteig aber 12 texte 11 audios?
class WienerText {
  static const List<String> texts = [
    'Nanette Streicher, 1769 in Augsburg geboren, starb am 16. Januar 1833 in Wien und wurde auf dem Sankt Marxer Friedhof beigesetzt. Heute ruht sie neben ihrem Mann Johann Andreas Streicher in einem Ehrengrab auf dem Wiener Zentralfriedhof.',
    'Hier stand bis 1920 das Palais des Arztes und Magnetiseurs Franz Anton Mesmer. Der Versuch Mesmers, durch seine Methode des „thierischen Magnetismus“ die Blindheit der Maria Theresia Paradis zu heilen, scheiterte. 1768 dürfte im Palais das Singspiel "Bastien und Bastienne" uraufgeführt worden sein (von Mesmer in Auftrag gegeben). Wahrscheinlich hier hat der junge Mozart Paradis kennengelernt und ihr darauf hin sein Klavierkonzert KV 556 gewidmet.',
    'Nanette Stein, verehelichte Streicher, erhielt früh Klavierunterricht und wurde im Klavierbau unterwiesen. So war sie in der Lage, die Werkstatt ihres Vaters in Augsburg nach seinem Tode zu übernehmen. Im Jahre 1794 heiratete sie den Musiker und Friedrich-Schiller-Freund Johann Andreas Streicher und übersiedelte im selben Jahr mit ihm nach Wien. Es gelang es ihr, ihren Betrieb zu einem der bedeutendsten Klavierbauunternehmen der Residenzstadt auszubauen.',
    'Die bekannte Wiener Pianistin Josepha Barbara Auernhammer wuchs hier, in den so genannten Passauer-Höfen, auf und veranstaltete da auch Akademien, wo sie mit Wiener Prominenz auftrat, wie Mozart und van Swieten. Sie lektorierte für Mozart Sonaten vor der Drucklegung und ist die Widmungsträgerin einiger seiner Klavier- und Violinsonaten. Ihr Klavierwerk, Klaviervariationen und Deutsche Lieder, zeugt von ihrer großen Virtuosität.',

    'Schon als 17-Jährige trat Marianna von Martines erstmals als Komponistin auf. Eine ihrer Messen wurde in der Wiener Hofkirche St. Michael aufgeführt. Der einflussreiche Komponist und Musiktheoretiker Padre Giovanni Battista Martini schätzte ihre Werke, was bewirkte, dass zwei Klaviersonaten 1760 in einer Anthologie veröffentlicht wurden und sie 1773 in die Accademia Filarmonica di Bologna aufgenommen wurde.',
    'Die blinde Komponistin, Sängerin, Pianistin und Pädagogin ist eine der von Kaiserin Maria Theresia geförderten Komponistinnen. Ihre Kompositionen – Lieder, Kammermusik, Klavierkonzerte und Musiktheater – wurden seit den 1780er Jahren gedruckt. Sie regte zu den ersten Blindenmusikschulen in Europa an, behalf sich selbst mit einem Notensetzbrett und gründete 1808 am Rabensteig 8 eine Musikschule für blinde Mädchen.',
        'Die Komponistin und Harfenistin war die Lehrerin der Erzherzoginnen am Wiener Hof, das Kaiserhaus finanzierte ihr eine Konzertreise durch Europa. Geboren als Tochter eines Schuhmachers, durfte sie dank der Liebe ihres Vaters zur Musik das Harfenspiel erlernen.',


    'Hier wurde Josepha Auernhammer geboren, im sogenannten Baadischen Haus, da es hier im 17. Jahrhundert ein Bad gab. Später war hier das Restaurant des Ignaz Jahn, wo Mozart sein letztes Konzert am 4. März 1791 gab.',
        'Die Komponistin, Cembalistin, Sängerin und Konzertorganisatorin genoss als Tochter des päpstlichen Nuntius in Wien die Förderung Maria Theresias und des Hofdichters und Librettisten Pietro Metastasio. Die Familie lebte im Haus Metastasios, wo Marianna ihre wöchentlichen Soireen veranstaltete. Martines bekam unter anderem Unterricht von Joseph Haydn, der eine Zeit lang in der Dachstube des Michaelerhauses wohnte.',

    'In der Augustinerkirche hatte die Paradis 1775 mit 16 Jahren ihren Auftritt als Sängerin in Giovanni Pergolesis liturgischer Komposition „Stabat Mater“. Blind seit ihrem 4. Lebensjahr, wurde sie auf dem Fortepiano und auf der Orgel unterrichtet. Sie begeisterte ihre Mitmenschen mit ihrem Talent und ihrer Bildung und unternahm eine ausgedehnte Europatournee.',
    'Nanette und ihr Mann Andreas Streicher waren nicht nur Klavierbauer. Einen wichtigen Beitrag zum Wiener Musikleben bildeten auch die Konzerte, die sie zunächst in ihrer Wohnung, ab 1812 dann in ihrem etwa 300 Gäste umfassenden Klaviersalon veranstalteten und damit jungen Künstlerinnen und Künstlern willkommene Auftrittsmöglichkeiten boten.',
    'Die in Guntramsdorf geborene Leopoldine Blahetka war ein pianistisches Wunderkind, die Klavier und Komposition bei Ignaz Moscheles, Katharina Cibbini und Simon Sechter studierte. Beethoven schätzte und förderte sie, Robert Schumann war von ihrer Spielweise wie von ihren Kompositionen beeindruckt.',
  ];

  static const List<String> titles = [
    'Nanette Streicher',
    'Franz Anton Mesmer',
    'Nanette Streicher',
    'Josepha Auernhammer',
      'Josepha Müllner Gollenhofer', //helferstorferstraße
    'Marianna von Martines',
  
        'Marianna von Martines',
        'Josepha Auernhammer',
    'Maria Theresia Paradis',

    'Maria Theresia Paradis',


    'Nanette Streicher',
    'Leopoldine Blahetka',
  ];

  static const List<String> addresses = [
    'St. Marxer Friedhof',
    'Rasumovskygasse 29',
    'Ungargasse 46',
    'Bäckerstraße 13, Postgasse 5-7',
    'St. Michael Kirche',
    'Rabensteig 8',
    'Helferstorferstrasse, kleines Basteihaus 129, Feuermauer des Schottenstifts',
    'Himmelpfortgasse 6',
    'Kohlmarkt Michaelerhaus',
    'Augustiner Kirche',
    'Karlsplatz, Gesellschaft der Musikfreunde',
    'Ecke Florianigasse/ Kochgasse',
  ];

  static String getTitle(int index) {
    try {
      if (index >= 0 && index < titles.length) {
        return titles[index];
      } else {
        return 'Index not found';
      }
    } catch (e) {
      return 'Error occurred';
    }
  }

  static String getAddress(int index) {
    try {
      if (index >= 0 && index < addresses.length) {
        return addresses[index];
      } else {
        return 'Index not found';
      }
    } catch (e) {
      return 'Error occurred';
    }
  }

  static String getText(int index) {
    try {
      if (index >= 0 && index < texts.length) {
        return texts[index];
      } else {
        return 'Index not found';
      }
    } catch (e) {
      return 'Error occurred';
    }
  }
}
