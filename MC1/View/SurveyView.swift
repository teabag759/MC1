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

struct SurveyView2: View {
  var body: some View {
      ZStack() {
        VStack(alignment: .leading, spacing: -24) {
          VStack(spacing: 0) {
            HStack(spacing: 8) {
              HStack(spacing: 8) {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(maxWidth: .infinity, minHeight: 3, maxHeight: 3)
                  .background(Color(red: 0.12, green: 0.14, blue: 0.16))
                  .cornerRadius(100)
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(maxWidth: .infinity, minHeight: 3, maxHeight: 3)
                  .background(Color(red: 0.12, green: 0.14, blue: 0.16).opacity(0.20))
                  .cornerRadius(100)
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(maxWidth: .infinity, minHeight: 3, maxHeight: 3)
                  .background(Color(red: 0.12, green: 0.14, blue: 0.16).opacity(0.20))
                  .cornerRadius(100)
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(maxWidth: .infinity, minHeight: 3, maxHeight: 3)
                  .background(Color(red: 0.12, green: 0.14, blue: 0.16).opacity(0.20))
                  .cornerRadius(100)
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(maxWidth: .infinity, minHeight: 3, maxHeight: 3)
                  .background(Color(red: 0.12, green: 0.14, blue: 0.16).opacity(0.20))
                  .cornerRadius(100)
              }
              .frame(maxWidth: .infinity, minHeight: 3, maxHeight: 3)
              ZStack() {
                ZStack() {

                }
                .frame(width: 24, height: 24)
                .offset(x: 0, y: 0)
              }
              .frame(width: 32, height: 32)
            }
            .padding(EdgeInsets(top: 8, leading: 20, bottom: 6, trailing: 12))
            .frame(maxWidth: .infinity, minHeight: 46, maxHeight: 46)
            .cornerRadius(24)
            VStack(alignment: .leading, spacing: 20) {
              VStack(spacing: 4) {
                Text("What are your feeling regarding our new website?")
                  .font(Font.custom("Inter", size: 16).weight(.semibold))
                  .lineSpacing(20)
                  .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.16))
              }
              .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
              VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top, spacing: 8) {
                  HStack(alignment: .top, spacing: 10) {
                    ZStack() {

                    }
                    .frame(width: 40, height: 40)
                  }
                  .padding(4)
                  .background(Color(red: 0.18, green: 0.21, blue: 0.24).opacity(0.10))
                  .cornerRadius(12)
                  HStack(alignment: .top, spacing: 10) {
                    ZStack() {

                    }
                    .frame(width: 40, height: 40)
                  }
                  .padding(4)
                  .background(Color(red: 0.18, green: 0.21, blue: 0.24).opacity(0.10))
                  .cornerRadius(12)
                  HStack(alignment: .top, spacing: 10) {
                    ZStack() {

                    }
                    .frame(width: 40, height: 40)
                  }
                  .padding(4)
                  .background(Color(red: 0.18, green: 0.21, blue: 0.24).opacity(0.10))
                  .cornerRadius(12)
                  HStack(alignment: .top, spacing: 10) {
                    ZStack() {

                    }
                    .frame(width: 40, height: 40)
                  }
                  .padding(4)
                  .background(Color(red: 0.12, green: 0.14, blue: 0.16))
                  .cornerRadius(12)
                  HStack(alignment: .top, spacing: 10) {
                    ZStack() {

                    }
                    .frame(width: 40, height: 40)
                  }
                  .padding(4)
                  .background(Color(red: 0.18, green: 0.21, blue: 0.24).opacity(0.10))
                  .cornerRadius(12)
                }
                HStack(alignment: .top, spacing: 0) {
                  Text("Text input")
                    .font(Font.custom("Inter", size: 12).weight(.medium))
                    .lineSpacing(16)
                    .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.16))
                  Text("Text input")
                    .font(Font.custom("Inter", size: 12).weight(.medium))
                    .lineSpacing(16)
                    .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.16))
                  Text("Text input")
                    .font(Font.custom("Inter", size: 12).weight(.medium))
                    .lineSpacing(16)
                    .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.16))
                }
                .frame(maxWidth: .infinity)
              }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
            .frame(maxWidth: .infinity, minHeight: 156, maxHeight: 156)
            HStack(spacing: 20) {
              ZStack() {

              }
              .frame(width: 40, height: 20)
              .background(.white)
              .cornerRadius(100)
              .overlay(
                RoundedRectangle(cornerRadius: 100)
                  .inset(by: 1)
                  .stroke(Color(red: 0.12, green: 0.14, blue: 0.16), lineWidth: 1)
              )
              Rectangle()
                .foregroundColor(.clear)
                .frame(maxWidth: .infinity, minHeight: 4, maxHeight: 4)
              HStack(spacing: 8) {
                HStack(spacing: 0) {
                  HStack(spacing: 0) {
                    Text("Previous")
                      .font(Font.custom("Inter", size: 15).weight(.medium))
                      .lineSpacing(20)
                      .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.16))
                  }
                  .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                }
                .padding(10)
                .cornerRadius(100000)
                HStack(spacing: 0) {
                  HStack(spacing: 0) {
                    Text("Next")
                      .font(Font.custom("Inter", size: 15).weight(.medium))
                      .lineSpacing(20)
                      .foregroundColor(.white)
                  }
                  .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                }
                .padding(10)
                .background(Color(red: 0.12, green: 0.14, blue: 0.16))
                .cornerRadius(100000)
              }
            }
            .padding(20)
            .frame(maxWidth: .infinity)
          }
          .frame(maxWidth: .infinity, minHeight: 282, maxHeight: 282)
          .background(
            LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 0.61, blue: 0.30), Color(red: 1, green: 0.36, blue: 0.52)]), startPoint: .leading, endPoint: .trailing)
          )
          .cornerRadius(24)
        }
        .frame(height: 282)
        .offset(x: 0, y: -2.50)
        .shadow(
          color: Color(red: 0.11, green: 0.11, blue: 0.13, opacity: 0.15), radius: 25, y: 20
        )
      }
      .frame(width: 460, height: 407)
      .background(
        LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 0.61, blue: 0.30), Color(red: 1, green: 0.36, blue: 0.52)]), startPoint: .leading, endPoint: .trailing)
      )
      .cornerRadius(18)
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
        ZStack{
            
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

