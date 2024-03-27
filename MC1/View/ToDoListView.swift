//
//  ToDoListView.swift
//  MC1
//
//  Created by ram on 3/21/24.
//

import SwiftUI

struct ToDoListView: View {
//    @State private var todolist: [ToDoData] = [
//        ToDoData(textContent: "할일 1", isCompleted: false),
//        ToDoData(textContent: "할일 2", isCompleted: false),
//        ToDoData(textContent: "할일 3", isCompleted: false)
//    ]
    @Binding var todolist:[ToDoData]
    @State private var completedData: [ToDoData] = [] // 추가: 완료된 할일을 저장할 배열

    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(todolist.indices, id: \.self) { index in
                        TodoItemView(todoItem: $todolist[index])
                            .id(index)
                            .animation(.easeOut(duration: 0.5))
                            .transition(AnyTransition.move(edge: todoItemIsCompleted(at: index) ? .bottom : .leading))
                    }
                    .onDelete(perform: deleteTodo)
                }
                .onReceive(NotificationCenter.default.publisher(for: .todoItemChanged)) { _ in
                    sortTodos()
                    print(todolist)
                }
                
                // 추가: 완료된 할일을 표시할 리스트
//                if !completedData.isEmpty {
//                    List {
//                        ForEach(completedData) { item in
//                            Text(item.textContent)
//                        }
//                    }
//                }
                
                Spacer()
            }
            .navigationBarTitle("Travel to do list")
        }
    }
    
    func deleteTodo(at offsets: IndexSet) {
        todolist.remove(atOffsets: offsets)
    }
    
    private func sortTodos() {
        todolist.sort { !$0.isCompleted && $1.isCompleted }
        // 추가: sortTodos가 호출될 때마다 완료된 할일을 새로 업데이트
        completedData = todolist.filter { $0.isCompleted }
    }
    
    private func todoItemIsCompleted(at index: Int) -> Bool {
        return todolist[index].isCompleted
    }
}

struct TodoItemView: View {
    @Binding var todoItem: ToDoData
    
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


struct ToDoData: Identifiable {
    let id = UUID()
    var textContent: String
    var isCompleted: Bool
}

#Preview{CardView()}

