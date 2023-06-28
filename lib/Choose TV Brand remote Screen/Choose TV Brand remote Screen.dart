import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_mirroring_app/Controller.dart';
import 'package:screen_mirroring_app/Controllers/AD%20Controller.dart';
import 'package:screen_mirroring_app/Controllers/Button%20Ad%20Controller.dart';
import 'package:screen_mirroring_app/Local%20Data/Local%20Data.dart';
import 'package:screen_mirroring_app/Test%20Remote%20Screen/Test%20remote%20scren.dart';
import 'package:screen_mirroring_app/main.dart';

import '../Mediaquery/Media Query.dart';
import '../Model.dart';

class ChooseTVBrandRemoteScreen extends StatefulWidget {
  const ChooseTVBrandRemoteScreen({Key? key}) : super(key: key);

  @override
  State<ChooseTVBrandRemoteScreen> createState() =>
      _ChooseTVBrandRemoteScreenState();
}

class _ChooseTVBrandRemoteScreenState extends State<ChooseTVBrandRemoteScreen> {
  TextEditingController controller = TextEditingController();

  List<SearchModel> search = remoteController.ACname;

  Icon customIcon = const Icon(Icons.search);

  Widget customSearchBar = const Text('My Personal Journal');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backButtonController.showAB(context, "/ChooseTVBrandRemoteScreen"),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                height: double.maxFinite,
                decoration: mainboxdecoration,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: ScreenSize.fSize_60(),
                        width: double.infinity,
                        // color: Colors.red,
                        child: Center(
                          child: Row(
                            children: [
                              // Text(
                              //   "Choose your TV Brand",
                              //   style: GoogleFonts.georama(
                              //       fontSize: ScreenSize.fSize_20(),
                              //       color: Colors.white,
                              //       fontWeight: FontWeight.w500),
                              // ),
                              Row(
                                children: [
                                  AnimationSearchBar(
                                    ///! Required
                                    onChanged: (value) => searchlist(value),
                                    // onChanged: (text) => debugPrint(text),
                                    searchTextEditingController: controller,

                                    ///! Optional. For more customization
                                    //? Back Button
                                    backIcon: Icons.arrow_back_ios_new,
                                    backIconColor: Colors.white,
                                    isBackButtonVisible: true,
                                    previousScreen: null,
                                    // It will push and replace this screen when pressing the back button
                                    //? Close Button
                                    closeIconColor: Colors.white,
                                    //? Center Title
                                    centerTitle: 'Choose your TV Brand ',
                                    hintText: 'Search here...',
                                    centerTitleStyle: GoogleFonts.georama(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 20),
                                    //? Search hint text
                                    hintStyle: GoogleFonts.georama(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                    //? Search Text
                                    textStyle: GoogleFonts.georama(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                    //? Cursor color
                                    cursorColor: Colors.transparent,
                                    //? Duration
                                    duration: const Duration(milliseconds: 500),
                                    //? Height, Width & Padding
                                    searchFieldHeight: 35,
                                    // Total height of the search field
                                    searchBarHeight: 50,
                                    // Total height of this Widget
                                    searchBarWidth:
                                        MediaQuery.of(context).size.width - 20,
                                    // Total width of this Widget
                                    horizontalPadding: 5,
                                    verticalPadding: 0,
                                    //? Search icon color
                                    searchIconColor:
                                        Colors.white.withOpacity(.7),
                                    //? Search field background decoration
                                    searchFieldDecoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(
                                            color: Colors.transparent,
                                            width: .5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ],
                              )
                              // GestureDetector(
                              //   onTap: () {
                              //
                              //     // OpenSettings.openCastSetting();
                              //   },
                              //   child: Image(
                              //     image: AssetImage("assets/icons/search.png"),
                              //     height: ScreenSize.fSize_30(),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_40()),
                      Container(
                        height: ScreenSize.horizontalBlockSize! * 170,
                        decoration: boxdecoration,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFfaf6f3),
                              borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(ScreenSize.fSize_20()),
                                  topLeft:
                                      Radius.circular(ScreenSize.fSize_20()))),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: search.isNotEmpty
                                  ? ListView.builder(
                                      itemCount: search.length,
                                      itemBuilder: (context, index) {
                                        final name = search[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              adButtonController.showAB(
                                                  context,
                                                  "/TestRemoteScreen",
                                                  "/ChooseTVBrandRemoteScreen",
                                                  name.name);
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                // mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height:
                                                          ScreenSize.fSize_4()),
                                                  Text(
                                                    name.name!,
                                                    style: GoogleFonts.georama(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.black26,
                                                    thickness: ScreenSize
                                                            .horizontalBlockSize! *
                                                        0.3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : Center(
                                      child: Text(
                                        "result not found",
                                        style: GoogleFonts.georama(
                                            fontSize: ScreenSize.fSize_15(),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_30()),
                    ],
                  ),
                ),
              ),
              banner.getBN("/ChooseTVBrandRemoteScreen")
            ],
          ),
        ),
      ),
    );
  }

  void searchlist(String query) {
    final suggetion = remoteController.ACname.where((name) {
      final searchtitle = name.name!.toLowerCase();
      final input = query.toLowerCase();

      return searchtitle.contains(input);
    }).toList();
    setState(() => search = suggetion);
  }
}
