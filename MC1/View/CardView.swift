import SwiftUI


struct CardView: View {
    
    var data: CardData
    var actionHandler: () -> Void // 액션 핸들러 클로저
    
    var body: some View {
        VStack {
            Image(systemName: data.imageName) // 이미지 예시
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            
            Text(data.textContent) // 텍스트 내용
                .padding()
            
            HStack {
                Button(action: {
                    // Like 버튼 눌렀을 때의 액션
                    self.actionHandler()
                }) {
                    Image(systemName: "hand.thumbsup.fill")
                }
                .padding()
                
                Button(action: {
                    // Dislike 버튼 눌렀을 때의 액션
                    self.actionHandler()
                }) {
                    Image(systemName: "hand.thumbsdown.fill")
                }
                .padding()
            }
        }
        .frame(width: 250, height: 350) // 카드의 크기 조절
        .background(Color.white) // 카드 배경색
        .cornerRadius(20) // 카드 모서리 둥글게 처리
        .shadow(radius: 5) // 그림자 효과 추가
    }
}
