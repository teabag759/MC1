//
//  ContentView.swift
//  MC1
//
//  Created by ram on 3/21/24.
//

import SwiftUI

struct FirstAppView: View {
    @State private var isActiveSurveyView = false
    
    var body: some View {
        ZStack {
            Color.clear
                .contentShape(Rectangle()) // 화면 전체에 대한 탭을 감지하기 위해
                .onTapGesture {
                    self.isActiveSurveyView = true
                }
            
            VStack {
                Text("뭐해볼까?")
            }
        }
        .fullScreenCover(isPresented: $isActiveSurveyView) {
            SurveyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstAppView()
    }
}
