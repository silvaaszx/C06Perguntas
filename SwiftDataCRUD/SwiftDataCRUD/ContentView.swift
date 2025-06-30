import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Task.timestamp, order: .forward) private var tasks: [Task]

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks, id: \.id) { task in
                    VStack(alignment: .leading) {
                        Text(task.title)
                            .font(.headline)
                        Text(task.timestamp, style: .date)
                            .font(.caption)
                    }
                    .onTapGesture {
                        update(task)
                    }
                }
                .onDelete(perform: deleteTasks)
            }
            .navigationTitle("Minhas Tarefas")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: addTask) {
                        Label("Adicionar", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addTask() {
        let nova = Task(title: "Nova tarefa em \(Date().formatted())")
        modelContext.insert(nova)
        try? modelContext.save()
    }

    private func update(_ task: Task) {
        task.title = "Atualizada em \(Date().formatted(date: .abbreviated, time: .shortened))"
        try? modelContext.save()
    }

    private func deleteTasks(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(tasks[index])
        }
        try? modelContext.save()
    }
}
