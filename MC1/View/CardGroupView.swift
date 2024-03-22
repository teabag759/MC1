//
//  CardGroupView.swift
//  MC1
//
//  Created by ram on 3/21/24.
//
//
//import SwiftUI
//
//struct CardGroupView: View {
//    @State private var currentIndex = 0 // 현재 카드 인덱스
//    
//    @State var data: [CardData] = [
//        CardData(imageName: "photo", textContent: "내용을 입력하세요", type: CardType(name: "모험", score: 5)),
//        CardData(imageName: "photo", textContent: "다른 내용을 입력하세요", type: CardType(name: "계획", score: 4)),
//        CardData(imageName: "photo", textContent: "또 다른 내용을 입력하세요", type: CardType(name: "소통", score: 3))
//    ]
////    var actionHandler: () -> Void // 액션 핸들러 클로저
//    var body: some View {
//        VStack {
//            
////            CardView(data: data[currentIndex], actionHandler: moveToNextCard)
////                .padding(.horizontal, 20)
//            
//            Image(systemName: data[currentIndex].imageName) // 이미지 예시
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 200, height: 200)
//                    .padding()
//                
//                Text(data[currentIndex].textContent) // 텍스트 내용
//                    .padding()
//                
//                HStack {
//                    Button(action: {
//                        // Like 버튼 눌렀을 때의 액션
//                        self.actionHandler()
//                    }) {
//                        Image(systemName: "hand.thumbsup.fill")
//                    }
//                    .padding()
//                    
//                    Button(action: {
//                        // Dislike 버튼 눌렀을 때의 액션
//                        self.actionHandler()
//                    }) {
//                        Image(systemName: "hand.thumbsdown.fill")
//                    }
//                    .padding()
//                }
//            }
//            .frame(width: 250, height: 350) // 카드의 크기 조절
//            .background(Color.white) // 카드 배경색
//            .cornerRadius(20) // 카드 모서리 둥글게 처리
//            .shadow(radius: 5) // 그림자 효과 추가
//        
//        
//    }
//    
//    func moveToNextCard() {
//        if currentIndex < data.count - 1 {
//            currentIndex += 1
//        } else {
//            // 마지막 카드일 경우 추가적인 작업 수행
//        }
//    }
//}
