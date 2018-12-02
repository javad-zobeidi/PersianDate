
const String yyyy = 'yyyy';

const String yy = 'yy';

const String mm = 'mm';

const String m = 'm';

const String MM = 'MM';

const String M = 'M';

const String dd = 'dd';

const String d = 'd';


const String w = 'w';

const String WW = 'WW';


const String W = 'W';


const String DD = 'DD';


const String D = 'D';


const String hh = 'hh';


const String h = 'h';


const String HH = 'HH';


const String H = 'H';


const String nn = 'nn';


const String n = 'n';


const String ss = 'ss';


const String s = 's';


const String SSS = 'SSS';


const String S = 'S';


const String uuu = 'uuu';


const String u = 'u';


const String am = 'am';
const String AM = 'AM';




class PersianDate {

  int _year;
  int _month;
  int _day;
  int _weekday;
  int _hour;
  int _minute;
  int _second;
  int _millisecond;
  int _microsecond;

  static const List<String> _DefualtVal = [yyyy,'-',mm,'-',dd,'  ',HH,':',nn,':',s,' ',am];

  PersianDate.pDate(){
      var now = new DateTime.now();
     List list = gregorian_to_jalali(now.year,now.month,now.day);
     weekday=now.weekday;
     this.year = list[0];
     this.month = list[1];
     this.day = list[2];
     this.hour=now.hour;
     this.minute=now.minute;
     this.second=now.second;
     this.microsecond = now.microsecond;
     this.millisecond = now.millisecond;
  }


  String now([List<String> formats=_DefualtVal]) {
    final sb = new StringBuffer();
    for (String format in formats) {
      if (format == yyyy) {
        sb.write(_digits(this.year, 4));
      } else if (format == yy) {
        sb.write(_digits(this.year % 100, 2));
      } else if (format == mm) {
        sb.write(_digits(this.month, 2));
      } else if (format == m) {
        sb.write(this.month);
      } else if (format == MM) {
        sb.write(monthLong[this.month - 1]);
      } else if (format == M) {
        sb.write(monthShort[this.month - 1]);
      } else if (format == dd) {
        sb.write(_digits(this.day, 2));
      } else if (format == d) {
        sb.write(this.day);
      } else if (format == w) {
        sb.write((this.day + 7) ~/ 7);
      } else if (format == DD) {
        sb.write(dayLong[this.weekday - 1]);
      } else if (format == D) {
        sb.write(dayShort[this.weekday - 1]);
      } else if (format == HH) {
        sb.write(_digits(this.hour, 2));
      } else if (format == H) {
        sb.write(this.hour);
      } else if (format == hh) {
        sb.write(_digits(this.hour % 12, 2));
      } else if (format == h) {
        sb.write(this.hour % 12);
      } else if (format == AM) {
        sb.write(this.hour < 12 ? 'قبل از ظهر' : 'بعد از ظهر');
      }else if (format == am) {
        sb.write(this.hour < 12 ? 'ق.ظ' : 'ب.ظ');
      } else if (format == nn) {
        sb.write(_digits(this.minute, 2));
      } else if (format == n) {
        sb.write(this.minute);
      } else if (format == ss) {
        sb.write(_digits(this.second, 2));
      } else if (format == s) {
        sb.write(this.second);
      } else if (format == SSS) {
        sb.write(_digits(this.millisecond, 3));
      } else if (format == S) {
        sb.write(this.second);
      } else if (format == uuu) {
        sb.write(_digits(this.microsecond, 2));
      } else if (format == u) {
        sb.write(this.microsecond);
      }  else {
        sb.write(format);
      }
    }
    return sb.toString();
  }
  String _digits(int value, int length) {
    String ret = '$value';
    if (ret.length < length) {
      ret = '0' * (length - ret.length) + ret;
    }
    return ret;
  }
  List<String> monthShort = const <String>[
    'فرو',
    'ارد',
    'خرد',
    'تیر',
    'مرد',
    'شهر',
    'مهر',
    'آبا',
    'آذر',
    'دی',
    'بهم',
    'اسفن'
  ];

  List<String> monthLong = const <String>[
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند'
  ];

  List<String> dayShort = const [
    'یکشنبه',
    'دوشنبه',
    'سه شنبه',
    'چهارشنبه',
    'پنج شنبه',
    'جمعه',
    'شنبه'
  ];

  List<String> dayLong = const [
    'یکشنبه',
    'دوشنبه',
    'سه شنبه',
    'چهارشنبه',
    'پنج شنبه',
    'جمعه',
    'شنبه'
  ];


 gregorian_to_jalali(int y,int m,int d,{String separator}){
    var sumMonthDay = [0,31,59,90,120,151,181,212,243,273,304,334];
    var jY=0;
    if(y > 1600){
      jY=979;
      y -=1600;
    }else{
      jY=0;
      y -=621;
    }
    var gy = (m > 2)?y+1:y;
    var day = (365*y)+((gy+3)/4) - ((gy+99)/100) + ((gy+399)/400)-80+d+sumMonthDay[m-1];
    jY += 33*(day.round()/12053).floor();
    day %=12053;
    jY += 4*(day.round()/1461).floor();
    day %=1461;
    jY +=((day.round()-1)/365).floor();
    if(day > 365)
      day =  ((day-1).round()%365).toDouble();
    int jm;
    var jd;
    int days = day.toInt();
    if(days < 186){
      jm=1+(days/31).toInt();
      jd=1+(days%31);
    }else{
      jm=7+((days-186)/30).toInt();
      jd=1+((days-186)%30).toInt();
    }
    var persionDate ;
    if(separator==null)  persionDate = [jY,jm,jd]; else persionDate = "$jY$separator$jm$separator$jd";
    return persionDate;
  }


  jalali_to_gregorian(int y,int m,int d,{String separator}){
    int gY;
    if(y > 979){
      gY=1600;
      y -=979;
    }else{
      gY = 621;
    }
    var days = (365*y)+((y/33).floor() * 8)+(((y%33)+3)/4)+78+d+(((m<7)?(m-1)*31:(((m-7)*30)+186)));
    gY +=400*(days/146097).toInt();
    days %=146097;
    if(days.floor() > 36524){
      gY +=100*(--days/36524).toInt();
      days %= 36524;
      if(days >= 365) days++;
    }
    gY += 4*(days/1461).toInt();
    days %=1461;
    gY +=((days-1).toInt()/365).toInt();
    if(days > 365)days=(days-1)%365;
    var gD = (days+1).floor();
    var montdays = [0,31,(((gY%4==0) && (gY%100!=0)) || (gY%400==0))?29:28,31,30,31,30,31,31,30,31,30,31];
    int i=0;
    for(;i<=12;i++){
      if(gD <= montdays[i]) break;
      gD -= montdays[i];
    }
    var gregorianDate;
    if(separator==null)  gregorianDate =[gY,i,gD]; else  gregorianDate ="$gY$separator$i$separator$gD";
    return gregorianDate;
  }




  parse(String formattedString,{String separator}) {
     var parse = DateTime.parse(formattedString);
     if(separator==null) {
       List parseList = gregorian_to_jalali(parse.year, parse.month, parse.day);
       parseList.add(parse.hour);
       parseList.add(parse.minute);
       parseList.add(parse.second);
       return parseList;
     }else{
       return "${gregorian_to_jalali(parse.year, parse.month, parse.day,separator: separator)} ${parse.hour}:${parse.minute}:${parse.second}";
     }
    }


  String get weekdayname => dayLong[weekday - 1];

  int get year => _year;
  set year(int value) {
    _year = value;
  }

  int get month => _month;

  set month(int value) {
    _month = value;
  }

  int get day => _day;

  set day(int value) {
    _day = value;
  }

  int get weekday => _weekday;

  set weekday(int value) {
    _weekday = value;
  }

  int get hour => _hour;

  set hour(int value) {
    _hour = value;
  }

  int get minute => _minute;

  set minute(int value) {
    _minute = value;
  }

  int get second => _second;

  set second(int value) {
    _second = value;
  }

  int get microsecond => _microsecond;

  set microsecond(int value) {
    _microsecond = value;
  }

  int get millisecond => _millisecond;

  set millisecond(int value) {
    _millisecond = value;
  }


}
