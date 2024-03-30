//
//  ListOfMoviesInteractor.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 25/03/24.
//
//9052eef714cfc2180bcea731a6415776

import UIKit
import Foundation

class ListOfMoviesInteractor {
    
    // Método para obtener la lista de películas populares desde la API
    func getListOfMovies(completion: @escaping (Result<PopularMovieResponseEntity, Error>) -> Void) {
        
        // URL de la API para obtener películas populares
        let urlString = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=9052eef714cfc2180bcea731a6415776"

        // Creación de la URL a partir de la cadena de URL
        guard let url = URL(string: urlString) else {
            // Si la URL es inválida, llama a la cláusula de finalización con un error
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        // Creación de una solicitud URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // Configuración del método HTTP como GET
        request.setValue("application/json", forHTTPHeaderField: "Accept") // Establecer el encabezado Accept como application/json

        // Creación de una sesión de URLSession compartida
        let session = URLSession.shared
        
        // Creación de una tarea de URLSession para realizar la solicitud de red
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                // Si se produce un error durante la solicitud, llama a la cláusula de finalización con el error
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                // Si no se recibe ningún dato, llama a la cláusula de finalización con un error
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            // Imprimir los datos recibidos (opcional)
            if let responseDataString = String(data: data, encoding: .utf8) {
                print("Datos recibidos!")
            }
            
            do {
                // Utilizar JSONDecoder para decodificar los datos JSON en una instancia de PopularMovieResponseEntity
                let decoder = JSONDecoder()
                let result = try decoder.decode(PopularMovieResponseEntity.self, from: data)
                // Llamar a la cláusula de finalización con el resultado exitoso y los datos decodificados
                completion(.success(result))
            } catch {
                // Si se produce un error durante la decodificación, llama a la cláusula de finalización con el error
                completion(.failure(error))
            }
        }

        // Iniciar la tarea de URLSession
        task.resume()
    }

}

        

