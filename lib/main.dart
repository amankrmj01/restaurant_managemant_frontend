import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_managemant_frontend/screens/bloc/page_bloc.dart';
import 'package:restaurant_managemant_frontend/screens/sign_in/sign_in_screen.dart';
import 'package:restaurant_managemant_frontend/utils/responsive.dart';
import 'package:restaurant_managemant_frontend/widgets/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/constants.dart';
import 'di/get_it.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
        ),
        // home: MainScreen(),
        home: FutureBuilder<Widget>(
          initialData: SignInScreen(),
          future: checkWhetherUserHaveJwtToken(),
          builder: (context, snapshot) {
            return snapshot.data!;
          },
        ),
      ),
    );
  }

  Future<Widget> checkWhetherUserHaveJwtToken() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      return SignInScreen();
    } else {
      return MainScreen();
    }
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PageBloc>().add(ChangePageEvent(index: 0));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          ResponsiveWidget(
            mobile: mobileWidget(),
            tablet: tabletWidget(),
            desktop: SizedBox(
              height: 753.59,
              child: Row(
                children: [
                  Expanded(flex: (width < 1200) ? 2 : 1, child: SideMenu()),
                  Expanded(
                    flex: (width < 1200) ? 7 : 5,
                    child: BlocBuilder<PageBloc, PageState>(
                      builder: (context, state) {
                        if (state is PageLoaded) {
                          return state.page;
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileWidget() {
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        if (state is PageLoaded) {
          return state.page;
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget tabletWidget() {
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        if (state is PageLoaded) {
          return state.page;
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const ActionButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(text, style: normalText.copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
