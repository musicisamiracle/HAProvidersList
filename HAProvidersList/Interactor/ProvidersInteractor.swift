//
//  ProvidersInteractor.swift
//  HAProvidersList
//
//  Created by Dane Thomas on 11/14/20.
//

import Foundation

enum AppError: Error, LocalizedError {
    case badJSON(message: String)
    
    var localizedString: String {
        switch self {
        case .badJSON(let message):
            return message
        }
    }
}

protocol ProvidersInteractable {
    func getProviders(completion: @escaping (Result<ProResponse, Error>) -> Void)
}

class ProvidersInteractor: ProvidersInteractable {
    
    
    func getProviders(completion: @escaping (Result<ProResponse, Error>) -> Void) {
        guard let jsonData = JSONLoader.getDataFromJson(fileName: "pro_data", owner: Self.self) else {
            completion(.failure(AppError.badJSON(message: "Unable to get json data")))
            return
        }
        
        do {
            let proResponse = try JSONDecoder().decode(ProResponse.self, from: jsonData)
            completion(.success(proResponse))
        } catch let error {
            completion(.failure(AppError.badJSON(message: error.localizedDescription)))
        }
    }
}
