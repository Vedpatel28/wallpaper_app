// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:wallpaper_app/controllers/helpers/api_helper_class.dart';
import 'package:wallpaper_app/modal/api_modal_class.dart';

class home_page extends StatelessWidget {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: FutureBuilder(
            future: ApiHelpers.apiHelpers.getMultipleResponse(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ApiModal> allPosts = snapshot.data!;

                return ListView.builder(
                  itemCount: allPosts.length,
                  itemBuilder: (context, index) =>
                      Card(
                        child: ListTile(
                          title: Text("Title : ${allPosts[index].title}"),
                        ),
                      ),
                );
              } else if (snapshot.hasError) {
              return Text ("${ snapshot.error }");
            } else {
              return const CircularProgressIndicator();
              }
            },
          ),
          // child: Consumer<ApiController>(
          //   builder: (context, provider, _) => provider.post != null
          //       ? ListTile(
          //         leading: Text("${provider.post!.id}"),
          //         title: Text(provider.post!.title),
          //         subtitle: Text(provider.post!.body),
          //       )
          //       : const Center(
          //           child: CircularProgressIndicator(),
          //         ),
          // ),
        ),
      ),
    );
  }
}
