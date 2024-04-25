import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/pages/rack.dart';



class ItemsWidget extends StatelessWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        _buildCard(
          context,
          images: [
            const AssetImage('asset/6352842_sd.jpg'),
            const AssetImage('asset/keyboard.jpg'),
            const AssetImage('asset/phone.jpg'),
            const AssetImage('asset/speaker.jpg'),
          ],
          texts: ['Headsets', 'Keyboard', 'Phone', 'Speaker'],
        ),
        // Add more cards here if needed
      ],
    );
  }

  Widget _buildCard(BuildContext context, {required List<ImageProvider> images, required List<String> texts}) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProductDetails screen when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyShopPage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Set background color of container and card
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Jo Electronics",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.white, // Set background color of card
              elevation: 0, // Set elevation to 0 to match container's shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildImageAndText(images[0], texts[0]),
                      _buildImageAndText(images[1], texts[1]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildImageAndText(images[2], texts[2]),
                      _buildImageAndText(images[3], texts[3]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageAndText(ImageProvider image, String text) {
    return Column(
      children: [
        Image(image: image, width: 80, height: 80),
        const SizedBox(height: 8),
        Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
