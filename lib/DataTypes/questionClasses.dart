

// ignore_for_file: file_names

class Soru{
   Soru(this.soru, this.type);
   String soru ;
   String type ;

}


class AcikUcluSoru extends Soru {

 String cevap;

  AcikUcluSoru(String soru, String type, this.cevap) : super(soru, type);

    




}

class CoktanSecmeliSoru extends Soru {

  List siklar = [ ];

  CoktanSecmeliSoru(String soru, String type, this.siklar) : super(soru, type);
}

// mixin CoktanCokSecmeli implements CoktanCokSecmeli {

//   @Override
//   List<Set> siklar;


  
// }