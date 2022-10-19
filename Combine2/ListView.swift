//
//  ListView.swift
//  Combine2
//
//  Created by cmStudent on 2022/07/12.
//

import SwiftUI

struct ListView: View {
    @State var isShowing = true
    @Binding var jokeLists: [String]
    var body: some View {
        if isShowing {
            VStack {
                HStack {
                    Button {
                        isShowing = false
                    } label: {
                        Text("戻る")
                    }
                    Spacer()
                }
                
                List {
                    ForEach(jokeLists, id: \.self) { text in
                        Text(text)
                    }
                }
            }
        } else {
            HomeView()
        }
        
        
    }
}





//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
