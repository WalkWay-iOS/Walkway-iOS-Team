//
//  Extensions+String.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/29.
//

import UIKit

extension String {
    
    func removeCharacters(from forbiddenChars: CharacterSet) -> String {
           let passed = self.unicodeScalars.filter { !forbiddenChars.contains($0) }
           return String(String.UnicodeScalarView(passed))
    }
    
    func validateEmail() -> Bool {
        let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return predicate.evaluate(with: self)
    }
    
    func validatePassword() -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        
        return predicate.evaluate(with: self)
    }
}

extension String {

    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일"
        return formatter
    }()

    var date: Date? {
        return String.dateFormatter.date(from: self)
    }

    var length: Int {
        return self.count
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}
