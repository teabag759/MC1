//
//  RecommandView.swift
//  MC1
//
//  Created by ram on 3/21/24.
//

import SwiftUI

struct RecommendView: View {
    @State private var showCardGroupView = false
    
    var body: some View {
        ZStack {
            //TODO : 추천 화면 내용
            VStack {
                Text("추천 화면")

                NavigationLink(destination: CardView()) {
                    Text("Next")
                }
     
            }
            
            
            
            
        }
    }
}
