import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/auth-Controller/about_me_controller.dart';

final aboutMeProvider = ChangeNotifierProvider((ref) => AboutMeController());
