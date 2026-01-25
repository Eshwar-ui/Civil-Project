import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/enterprise_components.dart';

class OperationalExpensesScreen extends StatelessWidget {
  const OperationalExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EnterpriseHeader(
                title: 'Operational Expenses',
                subtitle: 'Skyline Towers P2',
                onBack: () => context.pop(),
              ),
              const SizedBox(height: 24),

              // Total Budget Card (Premium Look)
              _buildTotalBudgetCard(),

              const SizedBox(height: 32),
              const SectionHeader(title: 'Expense Breakdown'),
              const SizedBox(height: 16),
              _buildBreakdownList(),

              const SizedBox(height: 32),
              SectionHeader(
                title: 'Supply Details',
                actionLabel: 'View All',
                onAction: () {},
              ),
              const SizedBox(height: 16),
              _buildSupplierList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTotalBudgetCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E6BE6), Color(0xFF164EAB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E6BE6).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Total Budget Spent',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 8),
          const Text(
            '₹ 12,45,000',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.trending_up,
                color: Colors.greenAccent,
                size: 16,
              ),
              const SizedBox(width: 4),
              const Text(
                '12% increase from last month',
                style: TextStyle(color: Colors.white60, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBreakdownList() {
    return Column(
      children: [
        _buildBreakdownItem(
          'Steel Reinforcement',
          '₹ 4,50,000',
          0.6,
          Colors.blue,
        ),
        const SizedBox(height: 16),
        _buildBreakdownItem(
          'Cement & Concrete',
          '₹ 3,20,000',
          0.45,
          Colors.orange,
        ),
        const SizedBox(height: 16),
        _buildBreakdownItem('Labor Charges', '₹ 2,80,000', 0.35, Colors.green),
        const SizedBox(height: 16),
        _buildBreakdownItem(
          'Machinery Fuel & Rent',
          '₹ 1,95,000',
          0.25,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildBreakdownItem(
    String label,
    String amount,
    double progress,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                amount,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFFF1F5F9),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupplierList() {
    final suppliers = [
      'Hanson Building Materials',
      'Cement Corp Int.',
      'Steel Work Solutions',
    ];
    final amounts = ['₹ 1,20,000', '₹ 85,000', '₹ 2,40,000'];

    if (suppliers.isEmpty) {
      return const EmptyStateWidget(
        icon: Icons.receipt_long_outlined,
        title: 'No Expenses Yet',
        description:
            'Record your first supply bill or operational expense to see the breakdown here.',
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: suppliers.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.business,
                  color: Color(0xFF1E6BE6),
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      suppliers[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      'Bill Payment Pending',
                      style: TextStyle(color: Color(0xFF74777F), fontSize: 11),
                    ),
                  ],
                ),
              ),
              Text(
                amounts[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
