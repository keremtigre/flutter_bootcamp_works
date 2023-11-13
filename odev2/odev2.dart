class Odev2 {
  //kilometreyi mile çeviren ve sonucu geri döndüren metod
  double soru1({required double km}) {
    if (km >= 0) {
      double mile = km * 0.621;
      return mile;
    } else {
      //geçersiz parametre
      return 0;
    }
  }

  //kenarları paramtere ile girilen ve dikdörtgenin alanını hesaplayan metod
  void soru2({required double kisaKenar, required double uzunKenar}) {
    if (uzunKenar > 0 && kisaKenar > 0) {
      double alan = kisaKenar * uzunKenar;
      print(
          "kısa kenarı $kisaKenar birim, uzun kenarı $uzunKenar birim olan dikdörtgenin alanı: $alan");
    } else {
      print("geçersiz parametre girişi");
    }
  }

  //parametre olarak girilen sayının faktoriyel değerini geri döndüren metod
  int soru3({required int sayi}) {
    if (sayi > 0) {
      int faktoriyel = 1;
      for (sayi; sayi > 1; sayi--) {
        faktoriyel *= sayi;
      }
      return faktoriyel;
    } else {
      //geçersiz parametre girişi
      return 0;
    }
  }

  //parametre olarak girilen kelime içinde kaç adet e harfi olduğunu gösteren metod
  void soru4({required String kelime}) {
    int eSayisi = 0;
    var harfler = kelime.toLowerCase().split("");
    harfler.forEach((element) {
      if (element == "e") {
        eSayisi++;
      }
    });
    print("$kelime kelimesinde bulunan e harfi sayısı: $eSayisi");
  }

  //parametre olarak girilen kenar sayısına göre her bir iç açıyı hesaplayan ve sonucu geri döndüren metod
  double soru5({required int kenarSayisi}) {
    if (kenarSayisi >= 3) {
      double icAciDegeri = ((kenarSayisi - 2) * 180) / kenarSayisi;
      return icAciDegeri;
    } else {
      //geçersiz parametre
      return 0;
    }
  }

  //parametre olarak girilen gün sayısına göre maaş hesabı yapan ve elde edilen değeri döndüren metod
  double soru6({required double gunSayisi}) {
    double maas = 0;
    double mesaiSaati = 0;
    double calismaSaati = gunSayisi * 8;
    if (gunSayisi > 0) {
      if (calismaSaati <= 150) {
        maas = calismaSaati * 40;
        return maas;
      } else {
        mesaiSaati = calismaSaati - 150;
        maas = (150 * 40) + (mesaiSaati * 80);
        return maas;
      }
    } else {
      //geçersiz parametre
      return 0;
    }
  }

  //parametre olarak girilen otopark süresine göre otoparak ücreti hesaplayarak geri döndüren metod
  int soru7({required int saat}) {
    int ucret = 50;
    if (saat > 0) {
      if (saat == 1) {
        return ucret;
      } else {
        ucret += ((saat - 1) * 10);
        return ucret;
      }
    } else {
      //geçersiz parametre
      return 0;
    }
  }
}