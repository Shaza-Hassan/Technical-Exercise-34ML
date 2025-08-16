//
//  ExperienceRealm.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 16/08/2025.
//

import Foundation

import RealmSwift

class ExperienceRealm: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String
    @Persisted var coverPhoto: String
    @Persisted var descriptionText: String
    @Persisted var viewsNo: Int
    @Persisted var likesNo: Int
    @Persisted var recommended: Bool
    @Persisted var isLiked: Bool?
    @Persisted var city: CityRealm?
    
    convenience init(from experience: Experience) {
        self.init()
        self.id = experience.id
        self.title = experience.title
        self.coverPhoto = experience.coverPhoto
        self.descriptionText = experience.description
        self.viewsNo = experience.viewsNo
        self.likesNo = experience.likesNo
        self.recommended = experience.recommended == 1
        self.isLiked = experience.isLiked
        self.city = CityRealm(from: experience.city)
    }
    
    func toDomain() -> Experience {
        
        Experience(
            id: id,
            title: title,
            coverPhoto: coverPhoto,
            description: descriptionText,
            viewsNo: viewsNo,
            likesNo: likesNo,
            city: City(
                id: city?.id ?? 0,
                name: city?.name ?? "",
                disable: city?.disable,
                topPick: (city?.topPick ?? false) ? 1 : 0
            ),
            isLiked: isLiked,
            recommended: recommended ? 1 : 0,
        )
    }
}

class CityRealm: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var disable: String?
    @Persisted var topPick: Bool
    
    convenience init(from city: City) {
        self.init()
        self.id = city.id
        self.name = city.name
        self.disable = city.disable
        self.topPick = city.topPick == 1
    }
    
    func toDomain() -> City {
        City(
            id: id,
            name: name,
            disable: disable,
            topPick: topPick ? 1 : 0
        )
    }
}
