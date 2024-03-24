//
//  ToDoListView.swift
//  MC1
//
//  Created by ram on 3/21/24.
//

import SwiftUI

struct ToDoListView: View {
    @Binding var likeDatas: [CardData]
    @Binding var dislikeDatas: [CardData]
    
    @State private var completedData: [CardData] = [] // 추가: 완료된 할일을 저장할 배열

    
    var body: some View {
        
            VStack {
                List {
                    ForEach(likeDatas.indices, id: \.self) { index in
                        TodoItemView(todoItem: $likeDatas[index])
                            .id(index)
                            .animation(.easeOut(duration: 0.5))
                            .transition(AnyTransition.move(edge: todoItemIsCompleted(at: index) ? .bottom : .leading))
                    }
                    .onDelete(perform: deleteTodo)
                }
                .onReceive(NotificationCenter.default.publisher(for: .todoItemChanged)) { _ in
                    sortTodos()
                }
                
                // 추가: 완료된 할일을 표시할 리스트
                if !completedData.isEmpty {
                    List {
                        ForEach(completedData) { item in
                            Text(item.textContent)
                        }
                    }
                }
                
                Spacer()
            }
            .navigationBarTitle("ToDo List")
        
    }
    
    func deleteTodo(at offsets: IndexSet) {
        likeDatas.remove(atOffsets: offsets)
    }
    
    private func sortTodos() {
        likeDatas.sort { !$0.isCompleted && $1.isCompleted }
        // 추가: sortTodos가 호출될 때마다 완료된 할일을 새로 업데이트
        completedData = likeDatas.filter { $0.isCompleted }
    }
    
    private func todoItemIsCompleted(at index: Int) -> Bool {
        return likeDatas[index].isCompleted
    }
}

struct TodoItemView: View {
    @Binding var todoItem: CardData
    
    var body: some View {
        HStack {
            Button(action: toggleCompletion) {
                Image(systemName: todoItem.isCompleted ? "checkmark.square" : "square")
            }
            .buttonStyle(BorderlessButtonStyle())
            
            Text(todoItem.textContent)
                .strikethrough(todoItem.isCompleted)
                .onTapGesture {
                    withAnimation {
                        todoItem.isCompleted.toggle()
                        NotificationCenter.default.post(name: .todoItemChanged, object: nil)
                    }
                }
            
            Spacer()
        }
        .padding()
    }
    
    private func toggleCompletion() {
        withAnimation {
            todoItem.isCompleted.toggle()
            NotificationCenter.default.post(name: .todoItemChanged, object: nil)
        }
    }
}



extension Notification.Name {
    static let todoItemChanged = Notification.Name("todoItemChanged")
}
