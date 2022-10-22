import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFDEDDBC3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF009688),
        elevation: 0.5,
        title: const Text(
          'HomePage',
          textAlign: TextAlign.center,
        ),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Material(
      color: const Color(0xFF009688),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: const [
              CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    'https://i.etsystatic.com/36532523/r/il/97ae46/4078306713/il_794xN.4078306713_n74s.jpg'),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'User Name ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                'User Email ',
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
              ),
            ],
          ),
        ),
      ));

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(runSpacing: 16.0, children: [
          ListTile(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            leading: const Icon(Icons.home_outlined),
            title: const Text('HOME'),
            onTap: () => Navigator.of(context).pushReplacement(
                CupertinoPageRoute(builder: (context) => const Home())),
          ),
          ListTile(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            leading: const Icon(Icons.favorite_border),
            title: const Text('FAVORITES'),
            onTap: () {},
          ),
          ListTile(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {},
          ),
         
          const Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          ListTile(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            leading: const Icon(Icons.share),
            title: const Text('SHARE'),
            onTap: () {},
          ),
          ListTile(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            leading: const Icon(Icons.notifications),
            title: const Text('NOTIFICATIONS'),
            onTap: () {},
          ),
          ListTile(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            leading: const Icon(Icons.person_pin),
            title: const Text('PROFILE'),
            onTap: () {},
          ),
        ]),
      );
}
