import SwiftUI
struct CardTestView: View {
    @State private var cardData: [CardData] = [
        CardData(imageName: "image1", textContent: "텍스트1", type: CardType(name: "좋아요", score: 1)),
        CardData(imageName: "image2", textContent: "텍스트2", type: CardType(name: "싫어요", score: -1)),
        CardData(imageName: "image3", textContent: "텍스트3", type: CardType(name: "좋아요", score: 1)),
    ]
    @State private var likeCards: [CardData] = []
    @State private var dislikeCards: [CardData] = []
    @State private var currentCardIndex = 0
    @State private var tmp = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                // 카드 뷰
                if currentCardIndex < cardData.count {
                    CardView(cardData: $cardData[currentCardIndex], tmp: tmp) { type in
                        if tmp == "like" {
                            likeCards.append(cardData[currentCardIndex])
                        } else if tmp == "dislike" {
                            dislikeCards.append(cardData[currentCardIndex])
                        }
                        currentCardIndex += 1
                        tmp = ""
                    }
                } else {
                    // 마지막 카드 - ToDoListView로 이동 버튼
                    Button(action: {
                        // ToDoListView로 이동 코드
                    }) {
                        Text("To Do List 보기")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationBarTitle("카드 테스트")
        }
    }
}

struct CardView: View {
    @Binding var cardData: CardData
    @Binding var tmp:String
    var onButtonTap: (CardType) -> Void
    
    var body: some View {
        VStack {
            // 여행 이미지
            Image(cardData.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            // 설명 텍스트
            Text(cardData.textContent)
                .padding()
            
            // 좋아요/싫어요 버튼
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    onButtonTap(.dislike)
                }) {
                    Image(systemName: "heart.slash")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

