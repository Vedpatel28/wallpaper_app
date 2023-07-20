// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controllers/api_controller.dart';
import 'package:wallpaper_app/utilse/routes_utilse.dart';

class wallpaper_Info_Page extends StatelessWidget {
  const wallpaper_Info_Page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int fromIndex = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Wallpaper Detail",
          style: GoogleFonts.wallpoet(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Consumer<ApiController>(
          builder: (context, provider, _) {
            List data = provider.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: s.height * 0.3,
                  width: s.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        data[fromIndex]['largeImageURL'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: s.height * 0.02),
                Text("related WallPaper ", style: GoogleFonts.wallpoet(
                  fontSize: s.height*0.02,
                ),),
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
            );
          },
        ),
      ),
    );
  }
}
