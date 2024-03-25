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
        Question(text: "새로운 음식에 대해 두려움이 얼마나 있습니까?\n없다:1점 매우많다:5점"),
        Question(text: "현지 문화와 역사에 대한 관심이 얼마나 있습니까?\n없다:1점 매우많다:5점"),
        Question(text: "여행 전 여행자 보험을 매번 가입하나요?"),
        Question(text: "모험적인 활동을 통해 새로운 경험을 찾는 것을 얼마나 선호하시나요?\n없다:1점 매우많다:5점"),
    ]
    @State private var currentQuestionIndex = 0
    @State private var isSurveyCompleted = false
    
    var body: some View {
        if isSurveyCompleted {
            RecommendView()
        } else {
            VStack(alignment: .leading, spacing: 20) {
                Text("질문 \(currentQuestionIndex + 1): \(questions[currentQuestionIndex].text)")
                RatingView(rating: $questions[currentQuestionIndex].rating)
                
                HStack {
                    if currentQuestionIndex > 0 {
                        Button("이전", action: moveToPreviousQuestion)
                    }
                    Spacer()
                    if currentQuestionIndex < questions.count - 1 {
                        Button("다음", action: moveToNextQuestion)
                    } else {
                        Button("완료", action: finishSurvey)
                    }
                }
            }
            .padding()
        }
    }
    
    func moveToPreviousQuestion() {
        currentQuestionIndex -= 1
    }
    
    func moveToNextQuestion() {
        currentQuestionIndex += 1
    }
    
    func finishSurvey() {
        isSurveyCompleted = true
        // 여기에 설문 조사를 마치는 동작을 추가할 수 있습니다.
    }
}

struct RatingView: View {
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1..<6) { number in
                Button(action: {
                    self.rating = number
                }) {
                    Text("\(number)")
                        .foregroundColor(number == self.rating ? .blue : .gray)
                        .font(.system(size: 20))
                        .padding(5)
                        .overlay(
                            Circle()
                                .stroke(number == self.rating ? Color.blue : Color.gray, lineWidth: 2)
                        )
                }
            }
        }
    }
}

#Preview {
    
    SurveyView()
    
}

