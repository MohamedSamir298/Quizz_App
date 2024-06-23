import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/routing/app_router.dart';
import 'package:quiz_app/routing/routes.dart';
import 'package:quiz_app/services/quiz_services.dart';
import 'package:quiz_app/theme/custom_color.dart';
import 'package:quiz_app/viewmodels/auth_viewmodel.dart';
import 'package:quiz_app/viewmodels/categories_viewmodel.dart';
import 'package:quiz_app/viewmodels/quiz_viewmodel.dart';

class QuizApp extends StatelessWidget {
  final AppRouter appRouter;
  const QuizApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(360, 690),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CategoriesViewModel()),
          ChangeNotifierProvider(create: (_) => AuthenticationViewModel()),
          ChangeNotifierProxyProvider<CategoriesViewModel, QuizViewModel>(
            create: (_) => QuizViewModel(
              quizService: QuizServices(),
              categoriesViewModel: CategoriesViewModel(),
            ),
            update: (_, categoriesViewModel, quizViewModel) => QuizViewModel(
              quizService: QuizServices(),
              categoriesViewModel: categoriesViewModel,
            ),
          ),
        ],
        child: MaterialApp(
          title: 'QuizApp',
          theme: ThemeData(
            primaryColor: CustomColors.primaryButtonColor,
            appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
            scaffoldBackgroundColor: CustomColors.primaryBackgroundColor,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
