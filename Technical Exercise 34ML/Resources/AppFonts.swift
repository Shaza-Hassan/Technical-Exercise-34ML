//
//  AppFonts.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 15/08/2025.
//

import SwiftUI

extension Font {
    enum GothamRounded {
        static func bold(_ size: CGFloat) -> Font {
            .custom("GothamRnd-Bold", size: size)
        }
        
        static func medium(_ size: CGFloat) -> Font {
            .custom("GothamRnd-Medium", size: size)
        }
        
        static func book(_ size: CGFloat) -> Font {
            .custom("GothamRnd-Book", size: size)
        }
    }
}
