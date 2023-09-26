import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouterlearns/home.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  usePathUrlStrategy();
  runApp(MyApp());
}

///declaring global variablefor checking if logged in or not
var isLoggedIn = true;

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _route,
    );
  }

  ///jaile ne parameter kina pass?
  ///todo: ask

  final GoRouter _route = GoRouter(
      // edi kunai path deko xaina vane it'll redirect to the error page automatically
      errorBuilder: (context, state) => const ErrorPage(),
      redirect: (context, state) {
        if (isLoggedIn) {
          return '/Contact';
        } else {
          return '/';
        }
      },
      routes: [
        GoRoute(
          name: RouteNames.homePage,
          path: "/",
          pageBuilder: (context, state) => CustomTransitionPage(
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                    begin: Offset(1, 0),
                    end: Offset(0, 0)
                ).animate(animation),
                // opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            },
            child: Home(),
          ),
        ),
        GoRoute(
          name: RouteNames.contactPage,
          path: "/Contact",
          pageBuilder: (context, state) => CustomTransitionPage(
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset(0, 0)
                ).animate(animation),
                // opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            },
            child: ContactUs(),
          ),
        ),

        /// or
        // GoRoute(name: RouteNames.contactPage,
        //     path: "/Contact/:name",
        //     builder: (context, state) => ContactUs(
        //           name: state.pathParameters["name"]!,
        //         )),
        GoRoute(path: "/Error", builder: (context, state) => const ErrorPage()),
        GoRoute(path: "/About", builder: (context, state) => const About()),
      ]);

  ///or esari garda ne hunxa

// final GoRouter _route = GoRouter(routes: [
//   GoRoute(path: "/", builder: (context, state) => const Home(), routes: [
//     GoRoute(path: "Contact", builder: (context, state) => const ContactUs()),
//     GoRoute(path: "Error", builder: (context, state) => const ErrorPage()),
//     GoRoute(path: "About", builder: (context, state) => const About()),
//   ]),
// ]);
}

class RouteNames {
  static const homePage = 'homepage';
  static const contactPage = 'contact';
}
