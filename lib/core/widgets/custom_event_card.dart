import 'package:flutter/material.dart';

class CustomEventCard extends StatelessWidget {
  const CustomEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [

          /// Top Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/images/person.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),

               SizedBox(width: 12),

               Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Tech Meetup",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      "Wed, 5 Nov 2025, 2:00PM - 3:00PM",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),

                  ],
                ),
              ),

              const Icon(
                Icons.favorite_border,
                color: Colors.black54,
              ),

            ],
          ),

          const SizedBox(height: 12),

          /// Location
          Row(
            children: [

              const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 18,
              ),

              const SizedBox(width: 6),

              Expanded(
                child: Text(
                  "2464 Royal Ln. Mesa, New Jersey 45463",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
              ),

            ],
          ),

          const SizedBox(height: 15),

          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 42,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Add to my calendar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}