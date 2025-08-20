import 'package:flutter/widgets.dart';
import 'package:pub_meme/data/enums/spacing_enum.dart';

extension SpacingExtension on Spacing {
  SizedBox get h => SizedBox(height: value);
  SizedBox get w => SizedBox(width: value);

  EdgeInsets get all => EdgeInsets.all(value);
  EdgeInsets get symmetric => EdgeInsets.symmetric(horizontal: value, vertical: value);
  EdgeInsets get only => EdgeInsets.only(left: value, right: value);
}
  