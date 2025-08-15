//
//  UIStateModel.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 16/08/2025.
//

import Foundation

enum UIStateModel<T> {
    case idle
    case loading
    case loaded(T)
    case error(String)
    
    var isIdle: Bool {
        if case .idle = self { return true }
        return false
    }
    
    var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }
    
    var value: T? {
        if case .loaded(let data) = self { return data }
        return nil
    }
    
    var errorMessage: String? {
        if case .error(let message) = self { return message }
        return nil
    }
}
