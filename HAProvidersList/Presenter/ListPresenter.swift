//
//  ListPresenter.swift
//  HAProvidersList
//
//  Created by Dane Thomas on 11/14/20.
//

import Foundation
import Combine

protocol ListPresentable {
    var proResponse: CurrentValueSubject<ProResponse, Error> { get }
    func loadProviders()
    func didSelect(at indexPath: IndexPath)
}

final class ListPresenter: ListPresentable {
    let interactor: ProvidersInteractable
    let router: ProsRoutable
    
    var proResponse = CurrentValueSubject<ProResponse, Error>([])
    
    init(interactor: ProvidersInteractable, router: ProsRoutable) {
        self.interactor = interactor
        self.router = router
    }
    
    func loadProviders() {
        self.interactor.getProviders { (result) in
            switch result {
            case .success(let proResponse):
                self.proResponse.send(proResponse.sorted(by: { $0.companyName < $1.companyName }))
            case .failure(let error):
                self.proResponse.send(completion: .failure(error))
            }
        }
    }
    
    func didSelect(at indexPath: IndexPath) {
        let row = indexPath.row
        guard row >= 0 && row < self.proResponse.value.count else { return }
        let selectedPro = self.proResponse.value[row]
        self.router.showDetailVC(with: selectedPro)
    }
}
