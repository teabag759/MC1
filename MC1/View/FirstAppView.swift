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
        NavigationStack{
            NavigationLink(destination: SurveyView()) {
                Text("두 번째 뷰로 이동")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstAppView()
    }
}
