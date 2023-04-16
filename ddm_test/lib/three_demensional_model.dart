import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ThreeDemensionalModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModelViewer(
      backgroundColor: const Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
      src: 'assets/psyduck.glb', // a bundled asset file
      alt: "A 3D model of an astronaut",
      ar: true,
      arModes: ['scene-viewer', 'webxr', 'quick-look'],
      autoRotate: true,
      cameraControls: true,
      //iosSrc: 'https://modelviewer.dev/shared-assets/models/assets/psyduck.glb',
      disableZoom: true,
    );
  }
}
