// ignore_for_file: camel_case_types

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
      appBar: AppBar(
        title: Text("WallPaper Select",style: GoogleFonts.wallpoet(),),
        centerTitle: true,
      ),
      body: Consumer<ApiController>(builder: (context, provider, _) {
        List data = provider.data;
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              children: [
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
      }),
    );
  }
}
