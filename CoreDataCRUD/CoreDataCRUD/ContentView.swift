import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \MyTask.timestamp, ascending: true)],
        animation: .default
    )
    private var tasks: FetchedResults<MyTask>


    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    VStack(alignment: .leading) {
                        Text(task.title ?? "Sem título")
                            .font(.headline)
                        Text(task.timestamp ?? Date(), style: .date)
                            .font(.caption)
                    }
                    .onTapGesture {
                        update(task)
                    }
                }
                .onDelete(perform: deleteTasks)
            }
            .navigationTitle("Tarefas")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addTask) {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addTask() {
        withAnimation {
            let newTask = MyTask(context: viewContext)
            newTask.title = "Nova tarefa em \(Date())"
            newTask.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Erro ao salvar: \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func update(_ task: MyTask) {
        task.title = "Atualizada em \(Date())"
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Erro ao atualizar: \(nsError), \(nsError.userInfo)")
        }
    }

    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Erro ao deletar: \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
