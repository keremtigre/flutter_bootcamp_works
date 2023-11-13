import 'odev2.dart';

void main() {
  var o2 = Odev2();
  print("2.5 km = ${o2.soru1(km: 2.5)} Mil");
  o2.soru2(kisaKenar: 4.5, uzunKenar: 8);
  print("5 sayısının faktoriyel değeri: ${o2.soru3(sayi: 5)}");
  o2.soru4(kelime: "KerEm");
  print(
      "5 kenarı olan geometrik şeklin bir iç açısının değeri = ${o2.soru5(kenarSayisi: 5)}");
  print("20 gün çalışan bir çalışanın maaşı: ${o2.soru6(gunSayisi: 20)}");
  print("3 saatlik park ücreti: ${o2.soru7(saat: 3)}");
}
