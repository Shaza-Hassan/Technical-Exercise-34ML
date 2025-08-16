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
    
    @Published var selectedItem: Experience? = nil
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
            }
        }
    }
    
    func likeExperience(exp: Experience){
        Task {
            do {
                let likeCounts = try await repo.likeExperience(experienceId: exp.id)
                let newExp = exp.updateLikesNo(likeCounts)
                updateExperienceInList(exp: newExp)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func updateExperienceInList(exp: Experience){
        switch screen {
        case .defualtScreen:
            if exp.recommended == 1 {
                guard let expIndex = self.recommendedExperiences.value?.firstIndex(where: {$0 == exp}) else {
                    return
                }
                var exps = self.recommendedExperiences.value
                exps?[expIndex] = exp
                self.recommendedExperiences = .loaded(exps ?? [])
            } else {
                guard let expIndex = self.recentExperiences.value?.firstIndex(where: {$0 == exp}) else {
                    return
                }
                var exps = self.recentExperiences.value
                exps?[expIndex] = exp
                self.recentExperiences = .loaded(exps ?? [])
            }
        case .searchResult:
            guard let expIndex = self.searchResult.value?.firstIndex(where: {$0 == exp}) else {
                return
            }
            var exps = self.searchResult.value
            exps?[expIndex] = exp
            self.searchResult = .loaded(exps ?? [])
        }
        
        
    }
    
    func clearSearch(){
        self.searchText = ""
        self.screen = .defualtScreen
        searchResult = .idle
    }
}
