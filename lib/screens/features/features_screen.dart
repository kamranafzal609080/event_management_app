import 'package:flutter/material.dart';
import 'package:event_management_app/core/constants/app_images.dart';
import 'package:event_management_app/core/widgets/feature_event_card.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.backgroundPattern,
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Features",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          // TODO: Filter Bottom Sheet
                        },
                        child: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: const Icon(
                            Icons.tune,
                            color: Colors.black,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: const [

                      FeatureEventCard(),

                      SizedBox(height: 20),

                      FeatureEventCard(),

                      SizedBox(height: 20),

                      FeatureEventCard(),

                      SizedBox(height: 20),

                    ],
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