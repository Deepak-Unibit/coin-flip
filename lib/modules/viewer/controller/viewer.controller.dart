import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ViewerController extends GetxController {
  Flutter3DController controller = Flutter3DController();

  ViewerController() {}

  Future<void> load() async {
//Listen to model loading state via controller
    controller.onModelLoaded.addListener(() {
      Logger().i('model is loaded : ${controller.onModelLoaded.value}');
    });

//It will play 3D model animation, you can use it to play or switch between animations.
    controller.playAnimation();

//If you pass specific animation name it will play that specific animation.
//If you pass null and your model has at least 1 animation it will play first animation.
//     controller.playAnimation(animationName: chosenAnimation);

//It will pause the animation at current frame.
    controller.pauseAnimation();

//It will reset and play animation from first frame (from beginning).
    controller.resetAnimation();

//It will stop the animation.
    controller.stopAnimation();

//It will return available animation list of 3D model.
    await controller.getAvailableAnimations();

//It will load desired texture of 3D model, you need to pass texture name.
//     controller.setTexture(textureName: chosenTexture);

//It will return available textures list of 3D model.
    await controller.getAvailableTextures();

//It will set your desired camera target.
    controller.setCameraTarget(0.3, 0.2, 0.4);

//It will reset the camera target to default.
    controller.resetCameraTarget();

//It will set your desired camera orbit.
    controller.setCameraOrbit(20, 20, 5);

//It will reset the camera orbit to default.
    controller.resetCameraOrbit();
  }
}
