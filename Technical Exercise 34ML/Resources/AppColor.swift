//
//  AppColor.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 15/08/2025.
//

import Foundation
import SwiftUI

enum AppColor : String {
    case searchBachground = "search-bar-background"
    case hintColor = "hint-color"
    case recommendedBackground = "recommended-background"
}

extension Color {
    static var searchBackground : Color {
        Color(AppColor.searchBachground.rawValue)
    }
    
    static var hintColor: Color {
        Color(AppColor.hintColor.rawValue)
    }
    
    static var recommendBackground : Color {
        Color(AppColor.recommendedBackground.rawValue)
    }
}
