تاریخ شمسی برای دارت و فلاتر


## نصب کتابخانه
```
dependencies:
  persian_date: ^0.0.2
  ```
  ```
  flutter packages get
  ```
  ```
  import 'package:persian_date/persian_date.dart';
``` 
  
  
## استفاده از کتاب خانه 

چند مثال ساده

```dart
import 'package:PersianDate/PersianDate.dart

main() {
  PersianDate date = PersianDate.pDate();
  
  print("${date.now([yyyy,'/',mm,'/',d,'  ',HH,':',nn,':',s,' ',am])}"); // برای برگرداندن تاریخ جاری به صورت شمسی
  
  print("${date.now()}"); // استفاده از فرمت پیش فرض
  
    // بر گرداندن تاریخ تعیین شده از میلادی به شمسی اگر جدا کننده قرار داده نشود مقدار برگشتی از نوع لیست می باشد
  print("${date.parse("1989-12-02",separator:'/')}"); 
  
  
    var Gdate = new DateTime(1989,08,21);
    print("${date.parse(Gdate.toString(),separator:'/')}");
  
  
  // مواردی که میتوانید با فراخوانی دریافت کنید.
  print(date.weekdayname); // نام روز
    print(date.year); // سال 
    print(date.month); // ماه
    print(date.day); // روز
    print(date.hour);// ساعت
    print(date.minute);// دقیقه
    print(date.second);// ثانیه
    print(date.millisecond); // میلی ثانیه
    print(date.microsecond);// میکرو ثانیه
    
  
  }
```

کلید فرمت های که میتوانید استفاده کنید

yyyy -
yy -
mm -
m -
MM -
M -
dd -
d -
w -
WW -
W -
DD -
D -
hh -
h -
HH -
H -
nn -
n -
ss -
s -
SSS -
S -
uuu -
u -
am -
AM -


## گزارش اشکال

در صورت وجود هر گونه مشکل از طریق ایمیل زیر با ما در میان بگذارید[j.zobeidi89@gmail.com][tracker].

[tracker]: mailto:j.zobeidi89@gmail.com
