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
            // 추천 화면 내용
            VStack {
                Text("추천 화면")
                // 여기에 추천 화면을 구성하는 내용을 추가할 수 있습니다.
                // Next 버튼
                NavigationLink(destination: CardView()) {
                    Text("Next")
                }
//                Button(action: {
//                    self.showCardGroupView = true
//                }) {
//                    Text("Next")
//                }
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(10)
                
            }
            
            
            
            // CardGroupView (풀커버 페이지)
            .fullScreenCover(isPresented: $showCardGroupView) {
                CardView()
            }
        }
    }
}
