import 'package:cie_team1/generic/genericBorderContainer.dart';
import 'package:test/test.dart';
import 'package:flutter/material.dart';

@Timeout(const Duration(seconds: 10))

void main(){
  group("simpleRenderTest", () {
    test('rendersBorderContainerDecoration', () {
      Widget widget;
      final Container borderContainer = GenericBorderContainer.buildGenericBorderedElement(widget);
      assert(borderContainer.decoration.debugAssertIsValid());
    });

    test('rendersBlurredLineDecoration', () {
      final Container line = GenericBorderContainer .buildGenericBlurredLine();
      assert(line.decoration.debugAssertIsValid());
    });
  });
}


