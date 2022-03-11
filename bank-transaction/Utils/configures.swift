//
//  Configures.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 10/03/22.
//

import Foundation

protocol Configurable {}
extension Configurable {
    @discardableResult
    func configure(completion: (Self) -> Void) -> Self {
        completion(self)
        return self
    }
}

extension NSObject: Configurable {}
