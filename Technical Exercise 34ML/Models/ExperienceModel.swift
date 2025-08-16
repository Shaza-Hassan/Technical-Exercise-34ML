//
//  ExperienceModel.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

import Foundation

struct Experience: Codable, Identifiable, Equatable {
    let id: String
    let title: String
    let coverPhoto: String
    let description: String
    let viewsNo: Int
    let likesNo: Int
    let city: City
    let isLiked: Bool?
    let recommended: Int
    
    func updateLikesNo(_ newLikesNo: Int) -> Experience {
        let updatedSelf = Experience(
            id: id,
            title: title,
            coverPhoto: coverPhoto,
            description: description,
            viewsNo: viewsNo,
            likesNo: newLikesNo,
            city: city,
            isLiked: true,
            recommended: recommended
        )
        return updatedSelf
    }
    
    static func == (lhs: Experience, rhs: Experience) -> Bool {
        return lhs.id == rhs.id
    }
}

struct City: Codable, Identifiable {
    let id: Int
    let name: String
    let disable: String?
    let topPick: Int
}


let dummyExperience = Experience(
    id: "7351979e-7951-4aad-876f-49d5027438bf",
    title: "Temple of Isis (Philae)",
    coverPhoto: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/21/DBiLufkgRD42qnvG83yuJzXiaV2NVp-metad214aWhEdnY2T2dvTzRobXRNcThkRXZOTk5sMjh5SVZCMW5BV2ZsMi5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20250815%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20250815T194745Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=d7598e269ca976c3e881db30afca40b0eb84caa0d2b76f3e1b717b1edb5257c7",
    description: "Philae is currently an island in the reservoir of the Aswan Low Dam, downstream of the Aswan Dam and Lake Nasser, Egypt. Philae was originally located near the expansive First Cataract of the Nile River in southern Egypt, and was the site of an Ancient Egyptian temple complex. These rapids and the surrounding area have been variously flooded since the initial construction of the Old Aswan Dam in 1902. The temple complex was later dismantled and relocated to nearby Agilkia Island as part of the UNESCO Nubia Campaign project, protecting this and other complexes before the 1970 completion of the Aswan High Dam.",
    viewsNo: 14989,
    likesNo: 1357,
    city: City(
        id: 10,
        name: "Aswan",
        disable: nil,
        topPick: 0
    ),
    isLiked: nil, recommended: 1
    )
