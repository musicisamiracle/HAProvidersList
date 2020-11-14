//
//  DetailPresenter.swift
//  HAProvidersList
//
//  Created by Dane Thomas on 11/14/20.
//

import Foundation

protocol DetailPresentable {
    var proDetails: ProResponseEntity { get }
    func callWasTapped()
    func emailWasTapped()
}

final class DetailPresenter: DetailPresentable {
    let proDetails: ProResponseEntity
    
    init(proDetails: ProResponseEntity) {
        self.proDetails = proDetails
    }
    
    func callWasTapped() {
        print("phone = \(self.proDetails.phoneNumber)")
    }
    
    func emailWasTapped() {
        print("email = \(self.proDetails.email)")
    }
}
