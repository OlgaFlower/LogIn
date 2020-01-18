////
////  Validation.swift
////  LogInView
////
////  Created by Admin on 17.01.2020.
////  Copyright © 2020 Flower. All rights reserved.
////
//
//import Foundation
//
//protocol ValidatorConvertible {
//    func validated(_ value: String) throws -> String
//}
//
//
//
//class ValidationError: Error {
//    var message: String
//    
//    init(_ message: String) {
//        self.message = message
//    }
//}
//
//
//
//enum ValidatorType {
//    case password
//    case email
//}
//
//
//
//enum ValidatorFactory {
//    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
//        switch type {
//        case .password: return PasswordValidator()
//        case .email: return EmailValidator()
//        }
//    }
//}
//
//
//struct PasswordValidator: ValidatorConvertible {
//    func validated(_ value: String) throws -> String {
//        guard value != "" else { throw ValidationError("Password is required")}
//        
//        
//        let special = CharacterSet(charactersIn: "!@#$%^&*()-+")
//        let number = CharacterSet(charactersIn: "0123456789")
//        let upper = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
//        let lower = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
//        
//        switch value {
//        case value.rangeOfCharacter(from: lower) == nil: break
//        }
//        
////            if value.count < 5 || value.count > 20 {
////
////            }
////            if value.rangeOfCharacter(from: lower) == nil {
////                throw ValidationError("Password must be with at least one lowercase character, one uppercase character, one special symbol and one numeric character")
////            }
////            if value.rangeOfCharacter(from: upper) == nil {
////                throw ValidationError("Password must be with at least one lowercase character, one uppercase character, one special symbol and one numeric character")
////            }
////            if value.rangeOfCharacter(from: number) == nil {
////                throw ValidationError("Password must be with at least one lowercase character, one uppercase character, one special symbol and one numeric character")
////            }
////            if value.rangeOfCharacter(from: special) == nil {
////                throw ValidationError("Password must be with at least one lowercase character, one uppercase character, one special symbol and one numeric character")
////            }
//        
//        return value
//    }
//    
//    
//}
//
//struct EmailValidator: ValidatorConvertible {
//    
//    let specialAt = CharacterSet(charactersIn: "@*")
//    let specialPoint = CharacterSet(charactersIn: ".!")
//    
//    func validated(_ value: String) throws -> String {
//        
//        if value.rangeOfCharacter(from: specialAt) == nil {
//            throw ValidationError("Email must be with ")
//        }
//        
//        return value
//    }
//    
//    
//}
//
//
//
//
//
//
//
//
//
//class Validation {
//    
//    static let special = CharacterSet(charactersIn: "!@#$%^&*()-+")
//    static let number = CharacterSet(charactersIn: "0123456789")
//    static let upper = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
//    static let lower = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
//    
//    
//    
//    
////    static func password(_ password: String) -> Bool {
////
////        if password.count >= 5, password.count <= 20 {
////
////            let special = CharacterSet(charactersIn: "!@#$%^&*()-+")
////            let number = CharacterSet(charactersIn: "0123456789")
////            let upper = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
////            let lower = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
////
////            if password.rangeOfCharacter(from: lower) == nil {
////                return false
////            }
////            if password.rangeOfCharacter(from: upper) == nil {
////                return false
////            }
////            if password.rangeOfCharacter(from: number) == nil {
////                return false
////            }
////            if password.rangeOfCharacter(from: special) == nil {
////                return false
////            }
////            print("Valid password \(password)")
////
////        } else {
////            print("Not valid password \(password)")
////            return false
////        }
////
////        return true
////    }
////
////
////
////    static func email(_ email: String) -> Bool {
////        if email.count >= 5, email.count <= 25 {
////
////        }
////        return true
////    }
//    
//    
//}
