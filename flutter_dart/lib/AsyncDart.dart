
void main(List<String> args) {
  print("1");

  //then data asyncron dimana nilai berupa hasil dari return
  //catchError data asycron dimana nilai bukan hasil dari return tapi throw
  cetak2().then((data) => print("Sukses")).catchError((err)=> print("Error"));
  print("2");
  cetak();
}

//function Future merupakan fungsi dengan async dimana menunggu untuk diproses
void cetak (){
  // fungsi delayed disini memberikan delay untuk menjalakan fungsi didalam future fuction
 Future.delayed(Duration(seconds: 1), () {
   print("3");
 },);

  //fungsi print disini akan dijalankan langsung karena tidak berada didalam Future funtion secara normalnya method void
 print("berhasil cetak");
}

//async fungsi dimana ditambakan ke dalam method untuk menjalankan fungsi await dimana dapat digunakan untuk menjalankan secara menyeluruh method dan fungsi didalamnya
Future<String> cetak2 () async{
  await Future.delayed(Duration(seconds: 1));

  print("4");
  
  //then
  return "berhasil cetak";
  //catchError
  throw "berhasil cetak";
}


