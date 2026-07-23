import 'package:crm_system/Common/SideBar.dart';
import 'package:crm_system/Pages/CalendarPage.dart';
import 'package:crm_system/Pages/ContactsPage.dart';
import 'package:crm_system/Pages/DashboardPage.dart';
import 'package:crm_system/Pages/DealsPage.dart';
import 'package:crm_system/Pages/ReportsPage.dart';
import 'package:crm_system/Pages/TasksPage.dart';
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedIndex = 0;
  bool _isSidebarCollapsed = false;

  final List<Widget> _pages = [
    const DashboardPage(),
    const ContactsPage(),
    const DealsPage(),
    const TasksPage(),
    const CalendarPage(),
    const ReportsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFD6D6D6),
              Color(0xFFF5F5F5),
              Color(0xFFFFFFFF),
              Color(0xFFE8E8E8),
            ],
            stops: [0.0, 0.4, 0.7, 1.0],
          ),
        ),
        child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.3),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF424242)),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          'CRM System',
          style: TextStyle(
            color: Color(0xFF212121),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined,
                color: Color(0xFF424242)),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child: SafeArea(
          child: Sidebar(
            selectedIndex: _selectedIndex,
            onItemTap: (index) {
              setState(() => _selectedIndex = index);
              Navigator.pop(context);
            },
            isCollapsed: false,
            onToggleCollapse: () {},
          ),
        ),
      ),
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Sidebar(
          selectedIndex: _selectedIndex,
          onItemTap: (index) {
            setState(() => _selectedIndex = index);
          },
          isCollapsed: _isSidebarCollapsed,
          onToggleCollapse: () {
            setState(() => _isSidebarCollapsed = !_isSidebarCollapsed);
          },
        ),
        Expanded(
          child: Column(
            children: [
              _buildTopBar(),
              Expanded(
                child: _pages[_selectedIndex],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Search bar
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 130, 128, 128).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white.withOpacity(0.6),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Icon(
                      Icons.search,
                      size: 20,
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Notifications
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Color(0xFF424242),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          // Settings
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              color: Color(0xFF424242),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
