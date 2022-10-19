//
//  HomeView.swift
//  Combine2
//
//  Created by cmStudent on 2022/07/11.
//

import SwiftUI
import Foundation

struct HomeView: View {
    @StateObject private var viewModel = WebAPIViewModel()
    @State var isShowing = true
    var body: some View {
        if isShowing {
            VStack {
                Spacer()
                Text(viewModel.joke)
                Spacer()
                HStack {
                    Spacer()
                    // ボタンを押す度に新しいジョークを取得します
                    Button(action: {
                        viewModel.fetchJoke()
                    }) {
                        Text("取得")
                    }
                    
                    Spacer()
                    
                    Button {
                        isShowing = false
                    } label: {
                        Text("履歴")
                    }
                    Spacer()
                }
                Spacer()
            }
        } else {
            ListView(jokeLists: $viewModel.List)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
