import 'package:downloader/src/home_screen.dart/browser_card.dart';
import 'package:downloader/src/menu/Paste-link-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Color.fromARGB(255, 129, 129, 129),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromARGB(238, 48, 44, 44),
            blurRadius: 0.0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(127, 184, 177, 1),
            elevation: 0.0,

            // icon: Icon(Lottie.asset('assets/lottieJSON/logo.json'),
            title: Lottie.asset('assets/lottieJSON/logo.json',
                height: 60, width: 60),
            centerTitle: true,
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
          ),
          body: const BrowserCardS()),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 150.0,
                height: 150.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Lottie.asset('assets/lottieJSON/logo.json'),
              ),
              Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    color: const Color(0xFFEBEBEB),
                    height: 1.0,
                  )),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/pastelinkpage');
                },
                leading: const Icon(Icons.download),
                title: const Text('Download Here'),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/downloading');
                },
                leading: const Icon(Icons.downloading),
                title: const Text('Downloading'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.folder),
                title: const Text('All Medias'),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/favorite');
                },
                leading: const Icon(Icons.favorite),
                title: const Text('Favourites'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 255, 250, 250),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
