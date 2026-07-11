import 'package:flutter/material.dart';
import 'package:event_management_app/core/constants/app_images.dart';
import 'package:event_management_app/screens/event/event_details_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Favourite",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Pattern
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                AppImages.backgroundPattern,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: 2,
            itemBuilder: (context, index) {
              return const FavouriteEventCard();
            },
          ),
        ],
      ),
    );
  }
}

class FavouriteEventCard extends StatelessWidget {
  const FavouriteEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Image
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  "assets/images/event1.png",
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: GestureDetector(
                  onTap: () {
                    // TODO: Toggle Favourite
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 26,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Made in Melanin! Black History Month Social.....",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),

                // Date & Time
                Row(
                  children: const [
                    Icon(Icons.calendar_month, color: Colors.black, size: 18),
                    SizedBox(width: 10),
                    Text(
                      "28 October 2025 6:00pm GMT",
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Location
                Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.black, size: 18),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Add to calendar logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffD32F2F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Add to my calendar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
