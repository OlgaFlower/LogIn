//
//  Validation.swift
//  LogInView
//
//  Created by Admin on 17.01.2020.
//  Copyright © 2020 Flower. All rights reserved.
//

import Foundation

class Validation {
    
    static func passValidator(_ pass: String) -> Bool {
        if pass.count <= 20 {
            
            let special = CharacterSet(charactersIn: "!@#$%^&*()-+")
            let number = CharacterSet(charactersIn: "0123456789")
            let upper = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            let lower = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
            let restricted = CharacterSet(charactersIn: #",./:;<=>?[\]“‘“"_`{|}~ "#)
            
            if pass.rangeOfCharacter(from: lower) == nil {
                return false
            }
            if pass.rangeOfCharacter(from: upper) == nil {
                return false
            }
            if pass.rangeOfCharacter(from: number) == nil {
                return false
            }
            if pass.rangeOfCharacter(from: special) == nil {
                return false
            }
            if pass.rangeOfCharacter(from: restricted) != nil {
                return false
            }
        }
        return true
    }
    
    
    static func emailValidator(_ email: String) -> Bool {
        let symbolAt = CharacterSet(charactersIn: "@")
        let point = CharacterSet(charactersIn: ".")
        
        if email.count <= 25 {
            if email.rangeOfCharacter(from: symbolAt) == nil {
                return false
            }
            if email.rangeOfCharacter(from: point) == nil {
                return false
            }
            if let range = email.range(of: ".") {
                let afterPointChars = email[range.upperBound...]
                if afterPointChars.count < 2 { return false }
            }
            if repeatingSymbol(email) == false {
                return false
            }
        }
        return true
    }
    
    
    static func repeatingSymbol(_ email: String) -> Bool {
        let temp = email.sorted()
        for i in 0 ..< temp.count - 1 {
            if temp[i] == "@" || temp[i] == ".", temp[i] == temp[i + 1] {
                return false
            }
        }
        return true
    }
    
}
