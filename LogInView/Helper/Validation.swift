//
//  Validation.swift
//  LogInView
//
//  Created by Admin on 17.01.2020.
//  Copyright © 2020 Flower. All rights reserved.
//

import Foundation

class Validation {
    
    static func password(_ password: String) -> Bool {
        
        if password.count >= 5, password.count <= 20 {
            
            let special = CharacterSet(charactersIn: "!@#$%^&*()-+")
            let number = CharacterSet(charactersIn: "0123456789")
            let upper = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            let lower = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
            
            if password.rangeOfCharacter(from: lower) == nil {
                return false
            }
            if password.rangeOfCharacter(from: upper) == nil {
                return false
            }
            if password.rangeOfCharacter(from: number) == nil {
                return false
            }
            if password.rangeOfCharacter(from: special) == nil {
                return false
            }
            
        } else {
            return false
        }
        
        return true
    }
    
}
