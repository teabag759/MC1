import SwiftUI

struct CardView: View {
    @State private var likeCards: [CardData] = []
    @State private var dislikeCards: [CardData] = []
    @State private var currentCard: CardData?
    @State private var showToDoList = false
    @State private var currentCardIndex: Int?
    @State var todolist:[ToDoData] = []
    let cardData = [
        CardData(imageName: "cooking", textContent: "현지에서 쿠킹 클래스 듣기", type: CardType(name: "좋아요", score: 1)),
        CardData(imageName: "vol", textContent: "아이들에게 재능 기부하기", type: CardType(name: "싫어요", score: -1)),
        CardData(imageName: "cafe", textContent: "노란색 식탁보를 가진 카페 들어가기", type: CardType(name: "좋아요", score: 1)),
        CardData(imageName: "food", textContent: "여행지에서 처음 만난 사람에게 맛집을 추천받아 가기", type: CardType(name: "싫어요", score: -1)),
      
    ]
    
    var body: some View {
        ZStack {
            if let currentCard = currentCard {
                VStack(spacing: 20) {
                    Image(currentCard.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                    Text(currentCard.textContent)
                        .font(.title)
                        .padding()
                    HStack {
                        Spacer()
                        Button(action: {
                           
                            dislikeCards.append(currentCard)
                            getNextCard()
                        }) {
                            Image(systemName: "heart.slash")
                        }
                        Spacer()
                        Button(action: {
                            todolist.append(ToDoData(textContent: currentCard.textContent, isCompleted: false))
                            likeCards.append(currentCard)
                            getNextCard()
                        }) {
                            Image(systemName: "heart")
                        }
                        Spacer()
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
            } else if showToDoList {
                ToDoListView(todolist: $todolist)
            }
        }
        .onAppear {
            currentCardIndex = 0
            currentCard = cardData[currentCardIndex!]
        }
    }
    
    func getNextCard() {
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


#Preview {
    CardView()
}
