//
//  Extensions.swift
//  LogInView
//
//  Created by Admin on 24.01.2020.
//  Copyright © 2020 Flower. All rights reserved.
//

import UIKit

extension String {
    //MARK: - Return char's indexes (ext.)
    func indexOf(_ input: String, options: String.CompareOptions = .literal) -> String.Index? {
        return self.range(of: input, options: options)?.lowerBound
    }

    func lastIndexOf(_ input: String) -> String.Index? {
        return indexOf(input, options: .backwards)
    }
}



