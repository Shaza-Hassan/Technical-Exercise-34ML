//
//  TopNavigationView.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 15/08/2025.
//

import SwiftUI

struct TopNavigationView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image(AppImages.menu.rawValue)
            
            HStack(spacing: 10) {
                Image(AppImages.search.rawValue)
                    .resizable()
                    .frame(width: 14, height: 14)
                
                ZStack(alignment:.leading) {
                    if viewModel.searchText.isEmpty {
                        Text("Try “Luxor”")
                            .font(.GothamRounded.book(17))
                            .foregroundColor(.hintColor)
                    }
                    
                    HStack {
                        TextField("", text: $viewModel.searchText)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .submitLabel(.search)
                            .focused($isFocused)
                            .font(.GothamRounded.book(17))
                            .onSubmit {
                                viewModel.fetchSearchResult()
                            }
                        
                        if !viewModel.searchText.isEmpty {
                            Button {
                                isFocused = false
                                viewModel.clearSearch()
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                
            }
            .frame(idealHeight: 36, maxHeight: 36)
            .padding(.horizontal,14)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.searchBarBackground)
            )
            
            
            Image(AppImages.filter.rawValue)
                .resizable()
                .frame(width: 18,height: 14)

        }
        .padding(.horizontal, 18)
        .frame(
            idealWidth: .infinity,
            maxWidth: .infinity,
            idealHeight: 60,
            maxHeight: 60,
            alignment: .center
        )
    }
}

#Preview {
    TopNavigationView(
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
