bool isNumeric(String s){
 if (s.isEmpty) {
   return false;
 }else{
   final n = num.parse(s);
   return (n == null) ? false: true;
 }
}