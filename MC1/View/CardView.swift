import SwiftUI
struct CardView: View {
    @Binding var cardData: CardData
    @Binding var likeDatas: [CardData]
    @Binding var dislikeDatas: [CardData]
    
    var body: some View {
        VStack {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            
            Text(cardData.textContent)
                .font(.caption)
                .padding()
                .foregroundColor(.black)
        }
        .frame(width: 300, height: 400)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
        .gesture(
            DragGesture()
                .onChanged { value in
                    // Update data based on swipe direction
                    if value.translation.width > 100 {
                        dislikeDatas.append(cardData)
                    } else if value.translation.width < -100 {
                        likeDatas.append(cardData)
                    }
                }
        )
        // Allow user interaction for gesture
        .allowsHitTesting(true)
    }
}

// MainView
struct MainView: View {
    @State private var cardDatas: [CardData] = [
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
    @State private var likeDatas: [CardData] = []
    @State private var dislikeDatas: [CardData] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                if cardDatas.isEmpty {
                    NavigationLink("To Do List", destination: ToDoListView(likeDatas: $likeDatas, dislikeDatas: $dislikeDatas))
                } else {
                    CardView(cardData: $cardDatas[0], likeDatas: $likeDatas, dislikeDatas: $dislikeDatas)
                        .onAppear {
                            cardDatas.removeFirst()
                        }
                }
            }
        }
    }
}

//// CardView
//struct CardView: View {
//    @Binding var cardData: CardData
//    @Binding var likeDatas: [CardData]
//    @Binding var dislikeDatas: [CardData]
//    
//    var body: some View {
//        VStack {
//            Image(systemName: "photo")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 200, height: 200)
//                .padding()
//            
//            Text(cardData.textContent)
//                .font(.caption)
//                .padding()
//                .foregroundColor(.black)
////                .background(Color.black.opacity(0.5))
//        }
//        .frame(width: 300, height: 400) // 카드의 크기 조절
//        .background(Color.white) // 카드 배경색
//        .cornerRadius(20) // 카드 모서리 둥글게 처리
//        .shadow(radius: 5) // 그림자 효과 추가
//        .gesture(
//          DragGesture(minimumDistance: 10) // 최소 이동 거리 설정
//            .onEnded { value in
//              if value.translation.width > 0 {
//                likeDatas.append(cardData)
//              } else if value.translation.width < 0 {
//                dislikeDatas.append(cardData)
//              }
//            }
//          
//        )
//        
//
//    }
//}
//
//// MainView
//struct MainView: View {
//    @State private var cardDatas: [CardData] = [
//        CardData(
//            imageName: "street_food.jpg",
//            textContent: "지역 특산 음식을 맛보고 길거리 음식도 경험해볼게요!",
//            type: CardType(name: "먹거리", score: 5)
//        ),
//        CardData(
//            imageName: "travelers_meeting.jpg",
//            textContent: "숙소에서 다른 여행객들과 교류하고 현지 친구를 사귈게요!",
//            type: CardType(name: "사람들", score: 4)
//        ),
//        CardData(
//            imageName: "nature_activities.jpg",
//            textContent: "아름다운 자연 속에서 트레킹, 캠핑, 수영 등을 즐길게요!",
//            type: CardType(name: "자연", score: 5)
//        ),
//        CardData(
//            imageName: "cultural_experience.jpg",
//            textContent: "박물관, 미술관, 역사 유적지를 방문하고 현지 문화를 경험할게요!",
//            type: CardType(name: "문화", score: 4)
//        ),
//        // 추가 예시
//        CardData(
//            imageName: "sports_challenge.jpg",
//            textContent: "새로운 스포츠에 도전하고 짜릿한 경험을 할게요!",
//            type: CardType(name: "스포츠", score: 3)
//        ),
//        CardData(
//            imageName: "volunteer_activity.jpg",
//            textContent: "현지 봉사활동에 참여하고 의미 있는 여행을 할게요!",
//            type: CardType(name: "봉사", score: 5)
//        ),
//        CardData(
//            imageName: "art_activity.jpg",
//            textContent: "그림, 음악, 공예 등 예술 활동을 통해 새로운 영감을 얻을게요!",
//            type: CardType(name: "예술", score: 4)
//        ),
//        CardData(
//            imageName: "alone_time.jpg",
//            textContent: "혼자 여행하며 나 자신을 돌아보고 새로운 깨달음을 얻을게요!",
//            type: CardType(name: "혼자만의 시간", score: 5)
//        ),
//        // CardData 예시 추가
//    ]
//    // CardData 모델에 데이터 추가
//    
//    
//    
//    @State private var likeDatas: [CardData] = []
//    @State private var dislikeDatas: [CardData] = []
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                if cardDatas.isEmpty {
//                    NavigationLink("To Do List", destination: ToDoListView(likeDatas: $likeDatas, dislikeDatas: $dislikeDatas))
//                } else {
//                    CardView(cardData: $cardDatas[0], likeDatas: $likeDatas, dislikeDatas: $dislikeDatas)
//                        .onAppear {
//                            cardDatas.removeFirst()
//                        }
//                }
//            }
//        }
//    }
//}

// ToDoListView
struct ToDoListView: View {
    @Binding var likeDatas: [CardData]
    @Binding var dislikeDatas: [CardData]
    
    var body: some View {
        List {
            Section(header: Text("Like")) {
                ForEach(likeDatas) { data in
                    Text(data.textContent)
                }
            }
            
            Section(header: Text("Dislike")) {
                ForEach(dislikeDatas) { data in
                    Text(data.textContent)
                }
            }
        }
    }
}
#Preview{ MainView()}
