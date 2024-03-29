////
////  LabelWithAdaptiveTextHeight.swift
////  AofX
////
////  Created by Kevin Jimenez on 9/24/21.
////  Copyright © 2021 Aesthet(X). All rights reserved.
////
//
//
////  LabelWithAdaptiveTextHeight.swift
////  123
////
////  Created by https://github.com/backslash-f on 12/19/14.
////
//
///*
// Designed with single-line UILabels in mind, this subclass 'resizes' the label's text (it changes the label's font size)
// everytime its size (frame) is changed. This 'fits' the text to the new height, avoiding undesired text cropping.
// Kudos to this Stack Overflow thread: bit.ly/setFontSizeToFillUILabelHeight
// */
//
//import Foundation
//import UIKit
//
//class LabelWithAdaptiveTextHeight: UILabel {
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        font = fontToFitHeight()
//    }
//
//    // Returns an UIFont that fits the new label's height.
//    private func fontToFitHeight() -> UIFont {
//
//        var minFontSize: CGFloat = DISPLAY_FONT_MINIMUM // CGFloat 18
//        var maxFontSize: CGFloat = DISPLAY_FONT_BIG     // CGFloat 67
//        var fontSizeAverage: CGFloat = 0
//        var textAndLabelHeightDiff: CGFloat = 0
//
//        while (minFontSize <= maxFontSize) {
//
//            fontSizeAverage = minFontSize + (maxFontSize - minFontSize) / 2
//
//            // Abort if text happens to be nil
//            guard text?.characters.count > 0 else {
//                break
//            }
//
//            if let labelText: NSString = text {
//                let labelHeight = frame.size.height
//
//                let testStringHeight = labelText.sizeWithAttributes(
//                    [NSFontAttributeName: font.fontWithSize(fontSizeAverage)]
//                ).height
//
//                textAndLabelHeightDiff = labelHeight - testStringHeight
//
//                if (fontSizeAverage == minFontSize || fontSizeAverage == maxFontSize) {
//                    if (textAndLabelHeightDiff < 0) {
//                        return font.fontWithSize(fontSizeAverage - 1)
//                    }
//                    return font.fontWithSize(fontSizeAverage)
//                }
//
//                if (textAndLabelHeightDiff < 0) {
//                    maxFontSize = fontSizeAverage - 1
//
//                } else if (textAndLabelHeightDiff > 0) {
//                    minFontSize = fontSizeAverage + 1
//
//                } else {
//                    return font.fontWithSize(fontSizeAverage)
//                }
//            }
//        }
//        return font.fontWithSize(fontSizeAverage)
//    }
//}
