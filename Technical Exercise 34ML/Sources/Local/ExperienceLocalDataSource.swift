//
//  ExperienceLocalDataSource.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 16/08/2025.
//

import Foundation

import RealmSwift


final class ExperienceLocalDataSource: ExperienceLocalDataSourceProtocol {
    
    
    func saveExperiences(_ experiences: [Experience]) {
        
        do {
            let realm = try Realm() // 👈 new instance here, thread-safe
            try realm.write {
                for exp in experiences {
                    let obj = ExperienceRealm(from: exp)
                    realm.add(obj, update: .modified)
                }
            }
        } catch {
            print("Realm write failed: \(error)")
        }
    }
    
    func saveExperience(_ experience: Experience) {
        do {
            let realm = try Realm()
            let obj = ExperienceRealm(from: experience)
            try realm.write {
                realm.add(obj, update: .modified)
            }
        } catch {
            print("Realm write failed: \(error)")

        }
    }
    
    func getRecommendedExperiences() -> [Experience] {
        do {
            let realm = try Realm()
            return realm.objects(ExperienceRealm.self)
                .filter("recommended == true")
                .map { $0.toDomain() }
            
        } catch {
            print("Realm write failed: \(error)")

            return []
        }
        
    }
    
    func getRecentExperiences() -> [Experience] {
        do {
            let realm = try Realm()
            return realm.objects(ExperienceRealm.self)
                .sorted(byKeyPath: "id", ascending: false)
                .map { $0.toDomain() }
        } catch {
            print("Realm write failed: \(error)")

            return []
        }
        
    }
    
    func searchExperiences(query: String) -> [Experience] {
        do {
            let realm = try Realm()
            return realm.objects(ExperienceRealm.self)
                .filter("title CONTAINS[c] %@", query)
                .map { $0.toDomain() }
        } catch {
            print("Realm write failed: \(error)")

            return []
        }
    }
}
