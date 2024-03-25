import SwiftUI

struct CardView: View {
    @State private var likeCards: [CardData] = []
    @State private var dislikeCards: [CardData] = []
    @State private var currentCard: CardData?
    @State private var showToDoList = false
    @State private var currentCardIndex: Int?
    let cardData = [
        CardData(imageName: "image1", textContent: "여행지 1", type: CardType(name: "좋아요", score: 1)),
        CardData(imageName: "image2", textContent: "여행지 2", type: CardType(name: "싫어요", score: -1)),
        CardData(imageName: "image3", textContent: "여행지 3", type: CardType(name: "좋아요", score: 1)),
        CardData(imageName: "image4", textContent: "여행지 4", type: CardType(name: "싫어요", score: -1)),
        CardData(imageName: "image5", textContent: "여행지 5", type: CardType(name: "좋아요", score: 1)),
        CardData(imageName: "image5", textContent: "여행지에게 만난 사람에게 음식점 추천받아서 방문하기", type: CardType(name: "좋아요", score: 1)),
    ]
    
    var body: some View {
        
        ZStack {
            if let currentCard = currentCard {
                VStack(spacing: 20) {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(currentCard.textContent)
                        .font(.title)
                        .padding()
                    HStack {
                        Button(action: {
                            dislikeCards.append(currentCard)
                            getNextCard()
                        }) {
                            Image(systemName: "heart.slash")
                        }
                        Button(action: {
                            likeCards.append(currentCard)
                            getNextCard()
                        }) {
                            Image(systemName: "heart")
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
            } else if showToDoList {
                ToDoListView(likeDatas: $likeCards, dislikeDatas: $dislikeCards)
            } else {
                Button(action: {
                    currentCardIndex = 0
                    currentCard = cardData[currentCardIndex!]
                }) {
                    Text("시작하기")
                }
            }
            
            // 추가된 버튼
            if let currentIndex = currentCardIndex, currentIndex == cardData.count - 1 {
                VStack {
                    Spacer()
                    NavigationLink(destination: ToDoListView(likeDatas: $likeCards, dislikeDatas: $dislikeCards)) {
                        Text("ToDoList로 넘어가기")
                    }
                    
                }
                .padding()
            }
            
        }
        
        
    }
    
    func getNextCard() {
        //        if let currentIndex = currentCardIndex {
        if currentCardIndex != nil {
            let remainingCards = cardData.enumerated().filter { index, _ in
                !likeCards.contains { $0 == cardData[index] } &&
                !dislikeCards.contains { $0 == cardData[index] }
            }
            if let nextCard = remainingCards.first {
                currentCardIndex = nextCard.offset
                currentCard = cardData[currentCardIndex!]
            } else {
                showToDoList = true
            }
        }
    }
}



