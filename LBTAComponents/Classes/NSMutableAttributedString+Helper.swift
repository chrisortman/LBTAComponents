//
//  NSMutableAttributedString+Helper.swift
//  Pods
//
//  Created by Brian Voong on 11/16/16.
//
//

import Foundation

extension NSMutableAttributedString {
    
    @objc public func appendNewLine() {
        append(NSAttributedString(string: "\n"))
    }
    
    @objc public func centerAlignWithSpacing(_ lineSpacing: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = lineSpacing
        setParagraphStyle(paragraphStyle: paragraphStyle)
    }
    
    @objc public func setLineSpacing(_ lineSpacing: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        setParagraphStyle(paragraphStyle: paragraphStyle)
    }
    
    @objc func setParagraphStyle(paragraphStyle: NSParagraphStyle) {
        let range = NSMakeRange(0, string.count)
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
    }
}
