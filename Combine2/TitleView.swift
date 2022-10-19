//
//  TitleView.swift
//  Combine2
//
//  Created by cmStudent on 2022/07/12.
//

import SwiftUI

struct TitleView: View {
    @State var isShowing = true
    var body: some View {
        if(isShowing) {
            VStack {
                Spacer()
                Text("ジョーク")
                    .font(.largeTitle)
                
                Spacer()
                Button {
                    isShowing = false
                } label: {
                    Text("始める")
                }
                Spacer()
            }
        } else {
            HomeView()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
