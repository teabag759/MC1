import SwiftUI

struct Question {
    var text: String
    var rating: Int
    var total: Int
    
    init(text: String, rating: Int = 0, total: Int = 0) {
        self.text = text
        self.rating = rating
        self.total = total
    }
}


struct SurveyView: View {
    @State private var questions: [Question] = [
        Question(text: "혼자 여행하는 것을 좋아하나요?"),
        Question(text: "여행 계획을 짜기 위해 어플을 사용한 적이 있나요?"),
        Question(text: "새로운 음식에 대해 두려움이 얼마나 있습니까?"),
        Question(text: "현지 문화와 역사에 대한 관심이 얼마나 있습니까?"),
        Question(text: "모험적인 활동을 통해 새로운 경험을 찾는 것을 얼마나 선호하시나요?"),
    ]
    @State private var currentQuestionIndex = 0
    @State private var isSurveyCompleted = false
    
    var body: some View {
        VStack{
            VStack{
                VStack{
                    Spacer()
                        .frame(height:30)
                    HStack {
                        
                        ForEach(0..<5) { index in
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(maxWidth: .infinity, minHeight: 3, maxHeight: 3)
                                .background(Color(red: 0.12, green: 0.14, blue: 0.16)
                                    .opacity(index == currentQuestionIndex  ? 1.0 : 0.20))
                                .cornerRadius(100)
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 3, maxHeight: 3)
                }
                .padding(.horizontal,20)
                Spacer()
                ZStack{
                    
                    if isSurveyCompleted {
                        RecommendView()
                    } else {
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Spacer()
                            HStack{
                                Spacer()
                                Text( "\(questions[currentQuestionIndex].text)")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(nil)
                                Spacer()
                            }
                            
                            Spacer()
                            RatingView(rating: $questions[currentQuestionIndex].rating)
                            HStack{
                                Text("         비동의")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("동의         ")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                            }
                            HStack {
                                if currentQuestionIndex > 0 {
                                    Button("이전", action: moveToPreviousQuestion)
                                }
                                Spacer()
                                if currentQuestionIndex < questions.count - 1 {
                                    Button("다음", action: moveToNextQuestion)
                                } else {
                                    Button("완료") {
                                        // Optional action to perform before navigation
                                        
                                        // Navigate to RecommendView
                                        withAnimation {
                                            self.isSurveyCompleted = true
                                        }
                                        
                                        
                                    }
                                    .background(
                                        NavigationLink(destination: RecommendView(), isActive: $isSurveyCompleted) {
                                            EmptyView()
                                        }
                                    )
                                }
                                
                            }
                            
                        }
                        .padding()
                    }
                }
                
            }
            .frame(maxWidth: .infinity, minHeight: 254, maxHeight: 400)
            .background(Color(red: 0.99, green: 0.97, blue: 0.91))
            .cornerRadius(24)
        }
        .frame(maxWidth: .infinity, minHeight: 474, maxHeight: 474)
        .shadow(
            color: Color(red: 0.11, green: 0.11, blue: 0.13, opacity: 0.15), radius: 25, y: 20
        )
        .padding(.horizontal,26)
        
    }
    
    
    
    func moveToPreviousQuestion() {
        currentQuestionIndex -= 1
    }
    
    func moveToNextQuestion() {
        currentQuestionIndex += 1
    }
    
    func finishSurvey() {
        isSurveyCompleted = true

    }
}



#Preview {
    
    SurveyView()
    
}

