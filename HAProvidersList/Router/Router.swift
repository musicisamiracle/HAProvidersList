//
//  Router.swift
//  HAProvidersList
//
//  Created by Dane Thomas on 11/14/20.
//

import UIKit

protocol ProsRoutable {
    func showListVC()
    func showDetailVC(with: ProResponseEntity)
}

final class Router: ProsRoutable {
    
    let navController: UINavigationController
    
    init() {
        self.navController = UINavigationController()
    }
    
    func showListVC() {
        let listVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "ListVC", creator: { (coder) -> ListViewController? in
            return ListViewController(coder: coder, presenter: ListPresenter(interactor: ProvidersInteractor(), router: self))
        })
        
        self.navController.viewControllers = [listVC]
    }
    
    func showDetailVC(with pro: ProResponseEntity) {
        let detailVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "DetailVC", creator: { (coder) -> DetailViewController? in
            return DetailViewController(coder: coder, presenter: DetailPresenter(proDetails: pro))
        })
        
        self.navController.pushViewController(detailVC, animated: true)
    }
}
