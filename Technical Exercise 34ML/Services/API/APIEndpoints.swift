//
//  APIEndpoints.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

import Foundation

enum APIEndpoints {
    
    static let baseURL = "https://aroundegypt.34ml.com/api/v2"
    
    case recommendedExperiences
    case recentExperiences
    case searchExperiences(title: String)
    case singleExperience(id: String)
    case likeExperience(id: String)
    
    var url: URL? {
        switch self {
        case .recommendedExperiences:
            return URL(string: "\(Self.baseURL)/experiences?filter[recommended]=true")
            
        case .recentExperiences:
            return URL(string: "\(Self.baseURL)/experiences")
            
        case .searchExperiences(let title):
            let encodedTitle = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? title
            return URL(string: "\(Self.baseURL)/experiences?filter[title]=\(encodedTitle)")
            
        case .singleExperience(let id):
            return URL(string: "\(Self.baseURL)/experiences/\(id)")
            
        case .likeExperience(let id):
            return URL(string: "\(Self.baseURL)/experiences/\(id)/like")
        }
    }
    
    var httpMethod: String {
        switch self {
        case .likeExperience:
            return "POST"
        default:
            return "GET"
        }
    }
}
