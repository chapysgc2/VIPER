import Foundation


protocol ListofMoviesInteractable : AnyObject {
    
    func getListOfMovies() async throws -> PopularMovieResponseEntity
}


class ListOfMoviesInteractor : ListofMoviesInteractable {
    
    // Método para obtener la lista de películas populares desde la API
    func getListOfMovies() async throws -> PopularMovieResponseEntity {
        
        // URL de la API para obtener películas populares
        let urlString = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=9052eef714cfc2180bcea731a6415776"

        // Creación de la URL a partir de la cadena de URL
        guard let url = URL(string: urlString) else {
            // Si la URL es inválida, lanza un error
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        
        // Creación de una solicitud URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // Configuración del método HTTP como GET
        request.setValue("application/json", forHTTPHeaderField: "Accept") // Establecer el encabezado Accept como application/json

        // Realizar la solicitud de red de forma asíncrona y obtener los datos
        let (data, _) = try await URLSession.shared.data(for: request)

        // Utilizar JSONDecoder para decodificar los datos JSON en una instancia de PopularMovieResponseEntity
        let decoder = JSONDecoder()
        let result = try decoder.decode(PopularMovieResponseEntity.self, from: data)
        
        // Devolver el resultado decodificado
        return result
    }
}


class ListOfMoviesInteractorMock : ListofMoviesInteractable {
    
    func getListOfMovies() async -> PopularMovieResponseEntity {
        return PopularMovieResponseEntity(results: [
                .init(id: 0, title: "El Gran Gatsby", overview: "Un joven y misterioso millonario llega a Long Island, Nueva York, donde intenta revivir un amor del pasado con una mujer casada de la alta sociedad.", imageURL: "https://images.unsplash.com/photo-1516724562728-afc824a36d56", votes: 8),
                .init(id: 1, title: "Forrest Gump", overview: "Forrest Gump, un hombre con un coeficiente intelectual bajo, se involucra en acontecimientos históricos a lo largo de varias décadas en los Estados Unidos.", imageURL: "https://images.unsplash.com/photo-1536633652879-24e9031b564f", votes: 9),
                .init(id: 2, title: "La La Land", overview: "Un pianista de jazz y una aspirante a actriz se enamoran mientras persiguen sus sueños en Los Ángeles, pero su relación se ve desafiada por las presiones de la vida.", imageURL: "https://images.unsplash.com/photo-1472417583563-d23c07dbcb02", votes: 7),
                .init(id: 3, title: "El Señor de los Anillos: La Comunidad del Anillo", overview: "Un joven hobbit llamado Frodo Baggins es encargado con una tarea épica de destruir un anillo mágico y salvar a su mundo de la oscuridad.", imageURL: "https://images.unsplash.com/photo-1583166023940-b078eb6e1a84", votes: 9),
                .init(id: 4, title: "El Padrino", overview: "La saga de una poderosa familia de la mafia italiana en Nueva York, centrada en el patriarca Vito Corleone y su hijo Michael.", imageURL: "https://images.unsplash.com/photo-1551488831-00ddcb8e10bf", votes: 10)
            


        ])
    }
}
