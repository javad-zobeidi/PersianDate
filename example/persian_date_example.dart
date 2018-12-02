import 'package:persian_date/persian_date.dart';

main() {

  PersianDate date = PersianDate.pDate();
  print("${date.now()}");
  print("${date.now([yyyy,'-',M,'-',d,'  ',HH,':',nn,':',s,' ',AM])}");


  var Gdate = new DateTime(1989,08,21);
  print("${date.parse(Gdate.toString(),separator:'/')}");
}
