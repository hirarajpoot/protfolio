import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/auth-Controller/image_controller.dart';

final imageControllerProvider = ChangeNotifierProvider((ref) => ImageController());
