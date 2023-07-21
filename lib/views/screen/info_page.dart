// ignore_for_file: camel_case_types

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controllers/api_controller.dart';

class wallpaper_Info_Page extends StatelessWidget {
  const wallpaper_Info_Page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int fromIndex = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Consumer<ApiController>(
          builder: (context, provider, _) {
            List data = provider.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: s.height * 0.02),
                Image.network(
                  data[fromIndex]['largeImageURL'],
                  fit: BoxFit.cover,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: s.height * 0.1,
                          width: s.width,
                          margin: const EdgeInsets.all(40),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: s.width,
                                child: Image.network(
                                  data[fromIndex]['largeImageURL'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height: s.height * 0.095,
                                width: s.width,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            AsyncWallpaper.setWallpaper(
                                              url: data[fromIndex]
                                                  ['largeImageURL'],
                                              goToHome: true,
                                              wallpaperLocation:
                                                  AsyncWallpaper.HOME_SCREEN,
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.add_to_home_screen,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Home",
                                          style: GoogleFonts.wallpoet(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            AsyncWallpaper.setWallpaper(
                                              url: data[fromIndex]
                                                  ['largeImageURL'],
                                              goToHome: true,
                                              wallpaperLocation:
                                                  AsyncWallpaper.LOCK_SCREEN,
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.screen_lock_portrait_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Lock",
                                          style: GoogleFonts.wallpoet(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            AsyncWallpaper.setWallpaper(
                                              url: data[fromIndex]
                                                  ['largeImageURL'],
                                              goToHome: true,
                                              wallpaperLocation:
                                                  AsyncWallpaper.BOTH_SCREENS,
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.wallpaper_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Both",
                                          style: GoogleFonts.wallpoet(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: s.height * 0.02,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: s.height * 0.07,
                    width: s.width,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.2, 1),
                          blurRadius: 7,
                          spreadRadius: 7,
                          blurStyle: BlurStyle.outer,
                        )
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Set To Wallpaper",
                      style: GoogleFonts.wallpoet(
                        fontSize: s.height * 0.02,
                      ),
                    ),
                  ),
                ),
                Text(
                  "related WallPaper ",
                  style: GoogleFonts.wallpoet(
                    fontSize: s.height * 0.02,
                  ),
                ),
                SizedBox(height: s.height * 0.02),
              ],
            );
          },
        ),
      ),
    );
  }
}
