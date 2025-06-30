import SwiftUI

struct ContentView: View {
    @StateObject private var usuariosViewModel = UserViewModel()

    var body: some View {
        NavigationView {
            List(usuariosViewModel.listaDeUsuarios) { usuario in
                VStack(alignment: .leading) {
                    Text(usuario.name)
                        .font(.headline)
                    Text(usuario.email)
                        .font(.subheadline)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Usuários")
            .task {
                await usuariosViewModel.buscarUsuarios()
            }
        }
    }
}
