import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const GridMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Pilih gambar berdasarkan label menu
    String imagePath;
    switch (label) {
      case 'Health':
        imagePath = 'assets/images/health.jpg';
        break;
      case 'Travel':
        imagePath = 'assets/images/travel.jpg';
        break;
      case 'Food':
        imagePath = 'assets/images/food.jpg';
        break;
      case 'Event':
        imagePath = 'assets/images/event.jpg';
        break;
      default:
        imagePath = 'assets/images/default.jpg';
    }

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      splashColor: Colors.amber.withOpacity(0.2),
      highlightColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              offset: const Offset(4, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),

              // Overlay hitam semi transparan biar teks tetap terlihat
              Container(
                color: Colors.black.withOpacity(0.5),
              ),

              // Isi card
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFD700).withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(14),
                    child: Icon(
                      icon,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    label,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
