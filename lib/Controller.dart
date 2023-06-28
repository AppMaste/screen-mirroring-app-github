import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_mirroring_app/Model.dart';
import 'package:video_player/video_player.dart';

RemoteController remoteController = Get.put(RemoteController());

class RemoteController extends GetxController {
  TextEditingController searchcontroller = TextEditingController();

  Rx<List<SearchModel>> acname = Rx<List<SearchModel>>([]);

  late SearchModel searchModel;
  var itemcount = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  adremote(String count, String name) {
    searchModel = SearchModel(name, count);
    acname.value.add(searchModel);
    itemcount.value = acname.value.length;
  }

/*  remoteremote(int index) {
    acname.value.removeAt(index);
    itemcount.value = acname.value.length;
  }*/

  RxList<SearchModel> ACname = RxList(
    [
      SearchModel("1", "Acer"),
      SearchModel("2", "Admiral"),
      SearchModel("3", "Aiwa"),
      SearchModel("4", "Akai"),
      SearchModel("5", "Apex"),
      SearchModel("6", "Audiovox"),
      SearchModel("7", "Bose"),
      SearchModel("8", "Bush"),
      SearchModel("9", "Changhong"),
      SearchModel("10", "Condor"),
      SearchModel("11", "Zenith"),
      SearchModel("12", "Dura Brand"),
      SearchModel("13", "Dynex"),
      SearchModel("14", "Element"),
      SearchModel("15", "Emerson"),
      SearchModel("16", "Funai"),
      SearchModel("17", "Haier"),
      SearchModel("18", "Hisense"),
      SearchModel("19", "Hitachi"),
      SearchModel("20", "Hyundai"),
      SearchModel("21", "Insignia"),
      SearchModel("22", "Jensen"),
      SearchModel("23", "Kenwood"),
      SearchModel("24", "LG"),
      SearchModel("25", "Logik"),
      SearchModel("26", "Magnavox"),
      SearchModel("27", "Mascom"),
      SearchModel("28", "Medion"),
      SearchModel("29", "Micromax"),
      SearchModel("30", "Mitsubishi"),
      SearchModel("31", "Mystery"),
      SearchModel("32", "NEC"),
      SearchModel("33", "Nexus"),
      SearchModel("34", "Nikai"),
      SearchModel("35", "Noblex"),
      SearchModel("36", "Olevia"),
      SearchModel("37", "Onida"),
      SearchModel("38", "Orion"),
      SearchModel("39", "Palsonic"),
      SearchModel("40", "Panasonic"),
      SearchModel("50", "Philco"),
      SearchModel("51", "Philips"),
      SearchModel("52", "Pioneer"),
      SearchModel("53", "Polaroid"),
      SearchModel("54", "Polytron"),
      SearchModel("55", "Prima"),
      SearchModel("56", "Promac"),
      SearchModel("57", "Proscan"),
      SearchModel("58", "Proton"),
      SearchModel("59", "Rubin"),
      SearchModel("60", "Samsung"),
      SearchModel("61", "Samsung Smart"),
      SearchModel("62", "Sansui"),
      SearchModel("63", "Sanyo"),
      SearchModel("64", "Scott"),
      SearchModel("65", "Seiki"),
      SearchModel("66", "Sharp"),
      SearchModel("67", "Singer"),
      SearchModel("68", "Sinotec"),
      SearchModel("69", "Skyworth"),
      SearchModel("70", "Sony"),
      SearchModel("71", "Swisstec"),
      SearchModel("72", "Sylvania"),
      SearchModel("73", "Symphonic"),
      SearchModel("74", "TCL"),
      SearchModel("75", "Technical"),
      SearchModel("76", "Thomson"),
      SearchModel("77", "Tokai"),
      SearchModel("78", "Toshiba"),
      SearchModel("79", "TurboX"),
      SearchModel("80", "Upstar"),
      SearchModel("81", "Venturer"),
      SearchModel("82", "Veon"),
      SearchModel("83", "Videocon"),
      SearchModel("84", "Viore"),
      SearchModel("85", "Westinghouse"),
      SearchModel("86", "Multi TV"),
      SearchModel("87", "SFR"),
      SearchModel("88", "Start Times"),
      SearchModel("89", "otal Play"),
      SearchModel("90", "Trend"),
    ],
  );
}
