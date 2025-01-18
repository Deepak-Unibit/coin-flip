import 'package:flip_coin/modules/viewer/controller/viewer.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:logger/logger.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ViewerView extends StatelessWidget {
  ViewerView({super.key});

  final ViewerController viewerController = ViewerController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Text("Hello World!", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),),
            SizedBox(
              height: 400,
              child: ModelViewer(
                src: 'assets/lotties/model.glb',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
