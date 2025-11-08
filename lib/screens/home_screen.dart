import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD700),
        elevation: 6,
        shadowColor: Colors.amberAccent.withOpacity(0.5),
        title: Text(
          'Finance Mate',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ===== HEADER USER =====
            FadeInDown(
              duration: const Duration(milliseconds: 600),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Gina Gustiani 👋",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFFFD700),
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  BounceInDown(
                    duration: const Duration(milliseconds: 900),
                    child: const CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.amber,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== MY CARDS =====
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: const Text(
                'My Cards',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD700),
                ),
              ),
            ),
            const SizedBox(height: 12),

            FadeInRight(
              duration: const Duration(milliseconds: 900),
              child: SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    AtmCard(
                      bankName: 'Bank A',
                      cardNumber: '**** 2345',
                      balance: 'Rp50.000.000',
                      color1: Color(0xFF1A1A1A),
                      color2: Color(0xFF222222),
                    ),
                    AtmCard(
                      bankName: 'Bank B',
                      cardNumber: '**** 8765',
                      balance: 'Rp5.350.000',
                      color1: Color.fromARGB(255, 1, 79, 151),
                      color2: Color(0xFF202020),
                    ),
                    AtmCard(
                      bankName: 'Bank C',
                      cardNumber: '**** 9423',
                      balance: 'Rp15.000.000',
                      color1: Color(0xFF1A1A1A),
                      color2: Color.fromARGB(255, 59, 24, 24),
                    ),
                    AtmCard(
                      bankName: 'Bank D',
                      cardNumber: '**** 3887',
                      balance: 'Rp12.350.000',
                      color1: Color.fromARGB(255, 7, 92, 66),
                      color2: Color(0xFF202020),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ===== GRID MENU =====
            FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: const Text(
                'Menu',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD700),
                ),
              ),
            ),
            const SizedBox(height: 12),

            ZoomIn(
              duration: const Duration(milliseconds: 1000),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  GridMenuItem(icon: Icons.health_and_safety, label: 'Health'),
                  GridMenuItem(icon: Icons.travel_explore, label: 'Travel'),
                  GridMenuItem(icon: Icons.fastfood, label: 'Food'),
                  GridMenuItem(icon: Icons.event, label: 'Event'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== TRANSACTIONS =====
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: const Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD700),
                ),
              ),
            ),
            const SizedBox(height: 8),

            FadeInUp(
              duration: const Duration(milliseconds: 1100),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1C),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amberAccent.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionItem(transaction: transactions[index]);
                  },
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
