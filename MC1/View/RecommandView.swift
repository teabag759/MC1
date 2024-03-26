//
//  RecommandView.swift
//  MC1
//
//  Created by ram on 3/21/24.
//

import SwiftUI

struct RecommendView: View {
    @State private var showCardGroupView = false
    var hor = 30
    var vet = 15
    var body: some View {
        ZStack {
            //TODO : 추천 화면 내용
            VStack {
                Text("당신의 여행 유형은")
                
                Text("계획적인 쩝쩝박사")
                    .font(.system(size:30))
                    .font(.headline)
                Image("type_female")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(50)
                    .padding(EdgeInsets(top: CGFloat(vet), leading: CGFloat(hor), bottom: CGFloat(vet), trailing: CGFloat(hor)))
                Text("- 여행을 떠나기 전에 여행지 정보를 수집하는 것을 즐긴다.\n- 맛있다는 맛집은 모두 지도에 정리한다.\n- 사전 정보가 없는 새로운 시도에 두려움을 가진다.\n- 매사 조심스러운 당신, 다음 여행에서는 한번쯤 모험을 즐겨보는 건 어떨까요?")
                
                NavigationLink(destination: CardView()) {
                    Text("next")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: CGFloat(vet), leading: CGFloat(hor), bottom: CGFloat(vet), trailing: CGFloat(hor)))
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(20)
                    
                }
                Spacer()
     
            }
            
            
            
            
        }
    }
}
#Preview{
    RecommendView()
}
