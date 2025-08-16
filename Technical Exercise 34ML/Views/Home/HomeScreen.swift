//
//  HomeScreen.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 15/08/2025.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            TopNavigationView(viewModel: viewModel)
            
            switch viewModel.screen {
            case .defualtScreen:
                HomeDefualtScreen(viewModel: viewModel)
            case .searchResult:
                SearchResult(viewModel: viewModel)
            }
            
        }
        .frame(
            idealWidth: .infinity,
            maxWidth: .infinity,
            idealHeight: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
        .sheet(
            item: $viewModel.selectedItem,
            content: { item in
                ExperienceScreen(
                    viewModel: ExperienceViewModel(
                        experience: item,
                        repo: ExperienceRepo()
                    ),
                    onUpdate: {
                        experience in
                        viewModel.updateExperienceInList(exp: experience)
                    }
                )
            })
    }
}

#Preview {
    HomeScreen(viewModel: HomeViewModel(
        repo: HomeRepo()
    ))
}
