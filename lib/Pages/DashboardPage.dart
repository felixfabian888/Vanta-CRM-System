import 'package:flutter/material.dart';
import '../common/glass_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome header
          Text(
            'Welcome back, John!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Here\'s what\'s happening with your business today',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 32),

          // Stats cards
          Row(
            children: [
              _buildStatCard(
                icon: Icons.people,
                label: 'Total Contacts',
                value: '1,234',
                change: '+12%',
                isPositive: true,
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                icon: Icons.handshake,
                label: 'Active Deals',
                value: '45',
                change: '+8%',
                isPositive: true,
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                icon: Icons.attach_money,
                label: 'Revenue',
                value: '\$52,430',
                change: '+23%',
                isPositive: true,
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                icon: Icons.task_alt,
                label: 'Tasks Completed',
                value: '89',
                change: '-5%',
                isPositive: false,
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Charts and activity
          Row(
            children: [
              // Recent activity
              Expanded(
                flex: 2,
                child: GlassCard(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Activity',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildActivityItem(
                        icon: Icons.person_add,
                        title: 'New contact added',
                        subtitle: 'Sarah Johnson was added to your contacts',
                        time: '2 hours ago',
                      ),
                      const Divider(height: 24),
                      _buildActivityItem(
                        icon: Icons.trending_up,
                        title: 'Deal closed',
                        subtitle:
                            'Enterprise deal with Acme Corp closed for \$15,000',
                        time: '5 hours ago',
                      ),
                      const Divider(height: 24),
                      _buildActivityItem(
                        icon: Icons.task,
                        title: 'Task completed',
                        subtitle: 'Follow-up call with Tech Solutions',
                        time: '1 day ago',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Quick actions
              Expanded(
                child: GlassCard(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quick Actions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildQuickAction(Icons.person_add, 'Add Contact'),
                      const SizedBox(height: 12),
                      _buildQuickAction(Icons.handshake, 'New Deal'),
                      const SizedBox(height: 12),
                      _buildQuickAction(Icons.task, 'Create Task'),
                      const SizedBox(height: 12),
                      _buildQuickAction(Icons.email, 'Send Email'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required String change,
    required bool isPositive,
  }) {
    return Expanded(
      child: GlassCard(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    size: 24,
                    color: const Color(0xFF424242),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isPositive
                        ? Colors.green.withOpacity(0.2)
                        : Colors.red.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    change,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isPositive ? Colors.green[700] : Colors.red[700],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 20,
            color: const Color(0xFF424242),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        Text(
          time,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAction(IconData icon, String label) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // TODO: Handle action
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white.withOpacity(0.6),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: const Color(0xFF424242),
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF424242),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
