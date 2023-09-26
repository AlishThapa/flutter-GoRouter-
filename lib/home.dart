// home.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouterlearns/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: GestureDetector(
            onTap: () {
              setState(() {
                isLoggedIn = true;
              });
              context.push("/Contact");

              ///INSTEAD OF goNamed OR go WE CAN USE push OR pushNamed
              ///REASON IS  go use garda page stack ma basdaina
              ///meaning moving from 1st page to 2nd and to 3rd using go ane 3rd page ma gayera
              ///back garda it'll redirect to the first page directly without going to 2nd page
              ///so that is handled by using :
              ///         context.push("/Contact");
              ///         context.pushNamed(RouteNames.contactPage);

              // GoRouter.of(context).go("/Contact");
              // or
              // String name= 'Alish';

              //name Route lai
              // context.goNamed(RouteNames.contactPage, pathParameters: {"name": "Alish"});

              ///query params use garda

              // context.goNamed(RouteNames.contactPage, queryParameters: {"name": "Alish"});
            },
            child: const Text('Click to go to the contact page')),
      ),
    );
  }
}

class ContactUs extends StatefulWidget {
  const ContactUs({super.key, this.name});

  final String? name;

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${widget.name}'),
      ),
      body: Center(
        child: GestureDetector(
            onTap: () {
              setState(() {
                isLoggedIn = false;
              });
              // GoRouter.of(context).go("/");
              context.push('/');
            },
            child: const Text('Click to go Back to the Home Page')),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const Center(
        child: Text('Welcome to the About Us Page'),
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Error Page Page'),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Home Page'),
      ),
    );
  }
}
