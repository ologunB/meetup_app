import 'package:meetup/views/auth/onboard_view.dart';
import 'package:meetup/views/constants/theming.dart';

import 'core/models/navigator.dart';
import 'core/services/local_storage.dart';
import 'localizations.dart';
import 'locator.dart';
import 'views/widgets/meetup_text.dart';

bool ready = true;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setupLocator();
  await AppCache.init(); //Initialize Hive

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, builder) => MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: appTheme,
          navigatorKey: AppNavigator.navKey,
          home: const OnboardScreen(),
        ),
      ),
    );
  }
}
