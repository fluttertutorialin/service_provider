import 'package:ahmedabad_police/imports.dart';
import 'package:ahmedabad_police/ui/views/officer_dashboard/officer_dashboard_page.dart';
import 'package:ahmedabad_police/ui/views/settings_widget.dart';

class HomeTabPage extends StatefulWidget {
  HomeTabPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _HomeTabPageState createState() => _HomeTabPageState();
  static String routeName = '/home_page';
}

/// This is the private State class that goes with NavBarPage.
class _HomeTabPageState extends State<HomeTabPage> {
  String _currentPage = 'Dashboard';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Dashboard': OfficerDashboardPage(),
      'Settings': SettingsPage(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_sharp,
              size: 24,
            ),
            label: 'Settings',
          )
        ],
        backgroundColor: Colors.white,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: AppTheme.secondaryColor,
        unselectedItemColor: Color(0x8A000000),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
