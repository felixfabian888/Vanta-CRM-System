import 'dart:ui';
import 'package:flutter/material.dart';
import 'sidebar_item.dart';

class Sidebar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTap;
  final bool isCollapsed;
  final VoidCallback onToggleCollapse;

  const Sidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemTap,
    required this.isCollapsed,
    required this.onToggleCollapse,
  });

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final List<_MenuItem> _menuItems = [
    _MenuItem(icon: Icons.dashboard_outlined, label: 'Dashboard'),
    _MenuItem(icon: Icons.people_outline, label: 'Contacts'),
    _MenuItem(icon: Icons.handshake_outlined, label: 'Deals'),
    _MenuItem(icon: Icons.task_outlined, label: 'Tasks'),
    _MenuItem(icon: Icons.calendar_today_outlined, label: 'Calendar'),
    _MenuItem(icon: Icons.bar_chart_outlined, label: 'Reports'),
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: widget.isCollapsed ? 80 : 260,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.3),
                Colors.white.withOpacity(0.15),
              ],
            ),
            border: Border(
              right: BorderSide(
                color: Colors.white.withOpacity(0.4),
                width: 1,
              ),
            ),
          ),
          child: Column(
            children: [
              // Header with logo and collapse button
              _buildHeader(),

              const SizedBox(height: 8),

              // Menu items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    ..._menuItems.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      return SidebarItem(
                        icon: item.icon,
                        label: item.label,
                        isSelected: widget.selectedIndex == index,
                        isCollapsed: widget.isCollapsed,
                        onTap: () => widget.onItemTap(index),
                      );
                    }),
                  ],
                ),
              ),

              const Divider(color: Colors.white24, height: 1),

              // User profile section
              _buildUserProfile(),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.isCollapsed ? 12 : 20,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: widget.isCollapsed
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        children: [
          if (!widget.isCollapsed) ...[
            // Logo and app name
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.8),
                        width: 1.5,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.hub_outlined,
                        size: 20,
                        color: Color(0xFF424242),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'CRM System',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212121),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Collapse/expand button
          IconButton(
            onPressed: widget.onToggleCollapse,
            icon: Icon(
              widget.isCollapsed ? Icons.chevron_right : Icons.chevron_left,
              size: 20,
              color: const Color(0xFF616161),
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.isCollapsed ? 12 : 16,
        vertical: 12,
      ),
      child: widget.isCollapsed
          ? Column(
              children: [
                _buildAvatar(),
                const SizedBox(height: 8),
                SidebarItem(
                  icon: Icons.logout,
                  label: 'Logout',
                  isSelected: false,
                  isCollapsed: true,
                  onTap: () {
                    // TODO: Handle logout
                  },
                ),
              ],
            )
          : Row(
              children: [
                _buildAvatar(),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF212121),
                        ),
                      ),
                      Text(
                        'john@example.com',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // TODO: Handle logout
                  },
                  icon: const Icon(
                    Icons.logout,
                    size: 20,
                    color: Color(0xFF616161),
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF9E9E9E),
            const Color(0xFF616161),
          ],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.8),
          width: 2,
        ),
      ),
      child: const Center(
        child: Text(
          'JD',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String label;

  _MenuItem({required this.icon, required this.label});
}

// Extension to add asMap() to List
extension ListExtension<T> on List<T> {
  Iterable<MapEntry<int, T>> asMap() sync* {
    for (int i = 0; i < length; i++) {
      yield MapEntry(i, this[i]);
    }
  }
}
