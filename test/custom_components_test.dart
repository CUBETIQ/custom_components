import 'package:flutter_test/flutter_test.dart';
import 'package:custom_components/components/CImage/CImage.dart';

void main() {
  testWidgets("CImage Testing", (WidgetTester tester) async {
    String imageUrl =
        "https://i.pinimg.com/originals/56/18/80/56188007ae6e434446ea28f58a5849a8.jpg";
    await tester.pumpWidget(CImage(imageUrl: imageUrl));
  });
}
