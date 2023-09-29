
void main(List<String> args) {
  
  try {
    int umur =  int.parse("77");
    print(umur);
  } on FormatException{
    print("data yang diinputkan harus angka");
  } catch (e) {
    print("data yang diinput salah");
  }



}

