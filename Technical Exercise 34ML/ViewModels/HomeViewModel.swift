//
//  HomeViewModel.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

@MainActor
class HomeViewModel : ObservableObject {
    private let repo: HomeRepoProtocol
    
    @Published var screen: ScreenType = .defualtScreen
    @Published var searchText: String = ""
    
    @Published var recommendedExperiences: UIStateModel<[Experience]> = .idle
    @Published var recentExperiences: UIStateModel<[Experience]> = .idle
    @Published var searchResult : UIStateModel<[Experience]> = .idle
    
    init(repo: HomeRepoProtocol) {
        self.repo = repo
    }
    
    func fetchRecommendedExperiences() {
        recommendedExperiences = .loading

        Task {
            do {
                let experiences = try await repo.fetchRecommendedExperiences()
                recommendedExperiences = .loaded(experiences)
            } catch {
                recommendedExperiences = .error(error.localizedDescription)
            }
        }
    }
    
    func fetchRecentExperiences() {
        recentExperiences = .loading

        Task {
            do {
                let experiences = try await repo.fetchRecentExperiences()
                recentExperiences = .loaded(experiences)
            } catch {
                recentExperiences = .error(error.localizedDescription)
            }
        }
    }
    
    func fetchSearchResult(){
        self.screen = .searchResult
        searchResult = .loading
        Task {
            do {
                let experiences = try await repo.fetchSearchExperiences(query: searchText)
                searchResult = .loaded(experiences)
                print(experiences)
            } catch {
                searchResult = .error(error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
    
    func clearSearch(){
        self.searchText = ""
        self.screen = .defualtScreen
        searchResult = .idle
    }
}
