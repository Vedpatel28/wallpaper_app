// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controllers/api_controller.dart';
import 'package:wallpaper_app/controllers/helpers/api_helper_class.dart';

class home_page extends StatelessWidget {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Consumer<ApiController>(
            builder: (context, provider, _) => provider.post != null
                ? ListTile(
                  leading: Text("${provider.post!.id}"),
                  title: Text(provider.post!.title),
                  subtitle: Text(provider.post!.body),
                )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ApiController>(context, listen: false).getData();
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
