//
//  SearchResult.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 15/08/2025.
//

import SwiftUI

struct SearchResult: View {
    
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        switch viewModel.searchResult {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView()
        case .loaded(let t):
            handleSearchResultView(result: t)
        case .error(let string):
            Text(string)
                .font(.GothamRounded.bold(22))
                .foregroundColor(.red)
        }
    }
    
    
    func handleSearchResultView(result: [Experience]) -> some View {
        ScrollView(.vertical,showsIndicators: false){
            LazyVStack {
                ForEach(result){
                    experince in
                    ExperienceCardView(
                        isRecommended: false,
                        experience: experince,
                        fullWidth: true
                    )
                }
            }
            .padding(.horizontal, 18)
            .padding(.top,24)

        }
    }
}

#Preview {
    SearchResult(
        viewModel: HomeViewModel(
            repo: HomeRepo(
                recommendedRemoteDataSource: RecommendedRemoteDataSource(),
                searchExperienceRemoteDataSource: SearchExperienceRemoteDataSource(),
                recentRemoteDataSource: RecentRemoteDataSource(),
                likeExperienceRemoteDataSource: LikeExperienceRemoteDataSource()
            )
        )
        
    )
}
