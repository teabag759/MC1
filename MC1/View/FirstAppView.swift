//
//  ContentView.swift
//  MC1
//
//  Created by ram on 3/21/24.
//

import SwiftUI

struct FirstAppView: View {
    @State private var isActiveSurveyView = false
    @State private var isAnimating = false
    var hor = 80
    var vet = 15
    var body: some View {
        NavigationStack{
            
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 414, height: 896.34)
                   
                Image("ocean")
                    .resizable()
                
                VStack{
                    Spacer()
                    Image("first")
                        
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    NavigationLink(destination: SurveyView()) {
                        Text("Start")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: CGFloat(vet), leading: CGFloat(hor), bottom: CGFloat(vet), trailing: CGFloat(hor)))
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(20)
                        
                    }
                    Spacer()
                    
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstAppView()
    }
}
