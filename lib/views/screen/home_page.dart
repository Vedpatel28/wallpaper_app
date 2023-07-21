// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controllers/api_controller.dart';
import 'package:wallpaper_app/utilse/routes_utilse.dart';

class home_page extends StatelessWidget {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "WallPaper Select",
          style: GoogleFonts.wallpoet(),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://img.freepik.com/free-vector/blur-pink-blue-abstract-gradient-background-vector_53876-174836.jpg?w=2000",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
          ),
          child: Consumer<ApiController>(
            builder: (context, provider, _) {
              List data = provider.data;
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: s.height*0.08),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: const Icon(Icons.search),
                        ),
                        onSubmitted: (value) {
                          provider.search(val: value);
                        },
                      ),
                      SizedBox(height: s.height * 0.02),
                      Container(
                        height: s.height * 0.08,
                        width: s.width * 0.92,
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: s.width * 0.9,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: provider.tags.length,
                                itemBuilder: (context, index) => Container(
                                  height: s.height * 0.05,
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      provider.search(
                                        val: provider.tags[index],
                                      );
                                    },
                                    child: Text(
                                      "${provider.tags[index]}",
                                      style: GoogleFonts.wallpoet(
                                          textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: s.height * 0.03,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          itemCount: data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AllRoutes.wallPaperInfoPage,
                                arguments: index,
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                data[index]['largeImageURL'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
