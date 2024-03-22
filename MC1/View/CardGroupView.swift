//
//  CardGroupView.swift
//  MC1
//
//  Created by ram on 3/21/24.
//

import SwiftUI

struct CardGroupView: View {
    @State private var currentIndex = 0 // 현재 카드 인덱스
    var data: [CardData] = [
        CardData(imageName: "photo", textContent: "내용을 입력하세요", type: CardType(name: "모험", score: 5)),
        CardData(imageName: "photo", textContent: "다른 내용을 입력하세요", type: CardType(name: "계획", score: 4)),
        CardData(imageName: "photo", textContent: "또 다른 내용을 입력하세요", type: CardType(name: "소통", score: 3))
    ]
    
    var body: some View {
        VStack {
            
            CardView(data: data[currentIndex], actionHandler: moveToNextCard)
                .padding(.horizontal, 20)
            
        }
    }
    
    func moveToNextCard() {
        if currentIndex < data.count - 1 {
            currentIndex += 1
        } else {
            // 마지막 카드일 경우 추가적인 작업 수행
        }
    }
}
