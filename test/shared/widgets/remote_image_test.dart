import 'package:flutter_test/flutter_test.dart';
import 'package:ghana_tourism_app/shared/widgets/remote_image.dart';

void main() {
  test('converts Wikimedia file pages to direct image URLs', () {
    expect(
      resolveRemoteImageUrl(
        'https://commons.wikimedia.org/wiki/File:Black_Volta_River.jpg',
      ),
      'https://commons.wikimedia.org/wiki/Special:FilePath/Black_Volta_River.jpg',
    );
  });

  test('leaves direct image URLs unchanged', () {
    const url = 'https://i.pinimg.com/example.jpg';

    expect(resolveRemoteImageUrl(url), url);
  });
}
