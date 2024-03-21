import SwiftUI

struct Question {
    var text: String
    var rating: Int
    
    init(text: String, rating: Int = 0) {
        self.text = text
        self.rating = rating
    }
}

struct SurveyView: View {
    @State private var questions: [Question] = [
        Question(text: "이 앱에 대한 만족도는 어떻습니까?"),
        Question(text: "사용하기 쉬웠습니까?"),
        Question(text: "디자인은 어떠셨습니까?")
    ]
    @State private var currentQuestionIndex = 0
    
    var body: some View {
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
    
    func moveToPreviousQuestion() {
        currentQuestionIndex -= 1
    }
    
    func moveToNextQuestion() {
        currentQuestionIndex += 1
    }
    
    func finishSurvey() {
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

struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView()
    }
}
