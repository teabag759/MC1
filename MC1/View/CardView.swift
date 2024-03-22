import SwiftUI

struct CardView: View {
    @State var cardData: [CardData] = [
        CardData(
            imageName: "street_food.jpg",
            textContent: "지역 특산 음식을 맛보고 길거리 음식도 경험해볼게요!",
            type: CardType(name: "먹거리", score: 5)
        ),
        CardData(
            imageName: "travelers_meeting.jpg",
            textContent: "숙소에서 다른 여행객들과 교류하고 현지 친구를 사귈게요!",
            type: CardType(name: "사람들", score: 4)
        ),
        CardData(
            imageName: "nature_activities.jpg",
            textContent: "아름다운 자연 속에서 트레킹, 캠핑, 수영 등을 즐길게요!",
            type: CardType(name: "자연", score: 5)
        ),
        CardData(
            imageName: "cultural_experience.jpg",
            textContent: "박물관, 미술관, 역사 유적지를 방문하고 현지 문화를 경험할게요!",
            type: CardType(name: "문화", score: 4)
        ),
        // 추가 예시
        CardData(
            imageName: "sports_challenge.jpg",
            textContent: "새로운 스포츠에 도전하고 짜릿한 경험을 할게요!",
            type: CardType(name: "스포츠", score: 3)
        ),
        CardData(
            imageName: "volunteer_activity.jpg",
            textContent: "현지 봉사활동에 참여하고 의미 있는 여행을 할게요!",
            type: CardType(name: "봉사", score: 5)
        ),
        CardData(
            imageName: "art_activity.jpg",
            textContent: "그림, 음악, 공예 등 예술 활동을 통해 새로운 영감을 얻을게요!",
            type: CardType(name: "예술", score: 4)
        ),
        CardData(
            imageName: "alone_time.jpg",
            textContent: "혼자 여행하며 나 자신을 돌아보고 새로운 깨달음을 얻을게요!",
            type: CardType(name: "혼자만의 시간", score: 5)
        ),
        // CardData 예시 추가
    ]
  @State private var dislike: [CardData] = [] // Dislike 배열
  @State private var like: [CardData] = [] // Like 배열
  @State private var currentCardIndex = 0 // 현재 카드 인덱스
  @State private var showToDoList = false // ToDoList 표시 여부

  var body: some View {
    ZStack {
      // 카드 스크롤 뷰
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
            ForEach(cardData[currentCardIndex...], id: \.id) { card in
                CardViewItem(card: card) { type in
                    switch type {
                    case .like:
                        like.append(card)
                        dislike.removeAll(where: { $0.id == card.id })
                        if currentCardIndex < cardData.count - 1 {
                            currentCardIndex += 1
                        } else {
                            showToDoList = true
                        }
                    case .dislike:
                        dislike.append(card)
                        like.removeAll(where: { $0.id == card.id })
                        if currentCardIndex < cardData.count - 1 {
                            currentCardIndex += 1
                        } else {
                            showToDoList = true
                        }
                    }
                }
            }

        }
        .padding()
      }
      .disabled(showToDoList)

      // ToDoList 표시
//      if showToDoList {
//        ToDoListView(like: like, dislike: dislike)
//      }
    }
  }
}

struct CardViewItem: View {
  var card: CardData
  var onSwiped: (CardType) -> Void

  var body: some View {
    ZStack(alignment: .topTrailing) {
      Image(systemName: "photo")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .cornerRadius(10)

        Text(card.textContent)
        .padding()
        .foregroundColor(.white)
        .background(Color.black.opacity(0.5))

      // 카드 스와이프 제스처
      .gesture(
        DragGesture()
          .onEnded { value in
            let horizontalAmount = value.translation.width
            if horizontalAmount > 100 {
              onSwiped(.like)
            } else if horizontalAmount < -100 {
              onSwiped(.dislike)
            }
          }
      )
    }
  }
}


#Preview{ CardView()}
