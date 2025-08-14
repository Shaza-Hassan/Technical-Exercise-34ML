//
//  ExperienceModel.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

import Foundation

struct Experience: Codable, Identifiable {
    let id: String
    let title: String
    let coverPhoto: String
    let description: String
    let viewsNo: Int
    let likesNo: Int
    let city: City
    let isLiked: Bool?
}

struct Tag: Codable, Identifiable {
    let id: Int
    let name: String
    let disable: String?
    let topPick: Int
    
}

struct City: Codable, Identifiable {
    let id: Int
    let name: String
    let disable: String?
    let topPick: Int
    
}

struct Era: Codable {
    let id: String
    let value: String
    let createdAt: String
    let updatedAt: String

}

struct GMapLocation: Codable {
    let type: String
    let coordinates: [Double] // [longitude, latitude]
}

struct TranslatedOpeningHour: Codable {
    let day: String
    let time: String
}

struct TicketPrice: Codable {
    let type: String
    let price: Double
}

struct Review: Codable, Identifiable {
    let id: String
    let experience: String
    let name: String
    let rating: Int
    let comment: String
    let createdAt: String
}
