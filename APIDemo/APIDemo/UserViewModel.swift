import Foundation

@MainActor
class UserViewModel: ObservableObject {
    // Lista de usuários que será mostrada na tela
    @Published var listaDeUsuarios: [User] = []

    // Função que busca os usuários da internet
    func buscarUsuarios() async {
        // URL da API
        guard let endereco = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("Endereço inválido")
            return
        }

        do {
            // Faz a requisição para a internet
            let (dadosRecebidos, _) = try await URLSession.shared.data(from: endereco)

            // Decodifica os dados para uma lista de 'User'
            let usuariosDecodificados = try JSONDecoder().decode([User].self, from: dadosRecebidos)

            // Atualiza a lista que será mostrada na tela
            self.listaDeUsuarios = usuariosDecodificados

        } catch {
            // Em caso de erro, exibe no console
            print("Erro ao buscar os usuários: \(error.localizedDescription)")
        }
    }
}
