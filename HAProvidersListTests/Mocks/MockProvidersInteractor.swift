//
//  MockProvidersInteractor.swift
//  HAProvidersListTests
//
//  Created by Dane Thomas on 11/15/20.
//

import Foundation
@testable import HAProvidersList

class MockProvidersInteractor: ProvidersInteractable {
    
    let mockResponse: ProResponse = [
        ProResponseEntity(entityId: "1", companyName: "B company", ratingCount: "", compositeRating: "",
                          companyOverview: "", canadianSP: false, spanishSpeaking: false, phoneNumber: "",
                          latitude: nil, longitude: nil, servicesOffered: nil, specialty: "", primaryLocation: "",
                          email: ""),
        ProResponseEntity(entityId: "2", companyName: "A company", ratingCount: "", compositeRating: "",
                          companyOverview: "", canadianSP: false, spanishSpeaking: false, phoneNumber: "",
                          latitude: nil, longitude: nil, servicesOffered: nil, specialty: "", primaryLocation: "",
                          email: ""),
        ProResponseEntity(entityId: "3", companyName: "D company", ratingCount: "", compositeRating: "",
                          companyOverview: "", canadianSP: false, spanishSpeaking: false, phoneNumber: "",
                          latitude: nil, longitude: nil, servicesOffered: nil, specialty: "", primaryLocation: "",
                          email: "")
    ]
    func getProviders(completion: @escaping (Result<ProResponse, Error>) -> Void) {
        completion(.success(mockResponse))
    }
}
