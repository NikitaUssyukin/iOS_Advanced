//
//  Extensions.swift
//  FinanceTrackingAssistant
//
//  Created by Yakuza on 23/12/2021.
//

import Foundation

extension Optional where Wrapped == String {
    var _boundString: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    public var boundString: String {
        get {
            return _boundString ?? ""
        }
        set {
            _boundString = newValue.isEmpty ? nil : newValue
        }
    }
}
