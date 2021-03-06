import 'package:flutter/material.dart';


const Color blue = Color(0xff0666EB);
const Color lightBlue = Color(0xffE5EFFD);
const Color lightGrey = Color(0xffE1E1E1);


String? otp;
String? lang;
String? defaultLang;


void printError(String? funName,String? error){
  debugPrint("error in $funName ====> $error");
}

Map<String,String> cal={
  '01':'Jan', '02':'Feb',
  '03':'Mar', '04':'Apr',
  '05':'May','06':'Jun',
  '07':'Jul','08':'Aug',
  '09':'Sep','10':'Oct',
  '11':'Nov','12':'Dec',
};

Map<String,String> calAr={
  '01':'يناير', '02':'فبراير',
  '03':'مارس', '04':'ابريل',
  '05':'مايو','06':'يونيو',
  '07':'يونيه','08':'اغسطس',
  '09':'سبتمبر','10':'اكتوبر',
  '11':'نوفمبر','12':'ديسمبر',
};

Map<String,String> period={
  '00':'12', '01':'1', '02':'2', '03':'3',
  '04':'4','05':'5', '06':'6','07':'7',
  '08':'8','09':'9', '10':'10','11':'11',
  '12':'12', '13':'1', '14':'2', '15':'3',
  '16':'4','17':'5', '18':'6','19':'7',
  '20':'8','21':'9', '22':'10','23':'11',
};

//2022-02-12T12:30:00Z
String timeFormat(String time){
  String h = time.substring(11,13);
  String m = time.substring(13,16);
  int hour = int.parse(h)+2;
  String partOfDay = hour>=12?"PM":"AM";
  hour -= 12;
  return "$hour"+m+" $partOfDay";
}

dynamic languageFun({
  @required ar,
  @required en,
}){
  return lang!=null?
  lang=='ar'?ar:en
      :(defaultLang=='ar'?ar:en);
}

