//
//  ListViewController.swift
//  HAProvidersList
//
//  Created by Dane Thomas on 11/14/20.
//

import UIKit
import Combine

class ListViewController: UIViewController {
    
    let presenter: ListPresentable
    var cancellables: [AnyCancellable] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    init?(coder: NSCoder, presenter: ListPresentable) {
        self.presenter = presenter
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.cancellables.append(self.presenter.proResponse.sink(receiveCompletion: { (completion) in
            // handle completion or error
        }, receiveValue: { _ in
            self.tableView.reloadData()
        }))
        
        
        self.presenter.loadProviders()
    }


}

extension ListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.proResponse.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        let pros = self.presenter.proResponse.value
        let row = indexPath.row
        guard row >= 0 && row < pros.count else { return cell }
        let proEntity = pros[row]
        cell.nameLabel.text = proEntity.companyName
        cell.ratingLabel.text = ProHelpers.makeRatingsText(from: proEntity)
        cell.ratingLabel.textColor = self.getColorFor(proEntity.compositeRating, ratingCount: proEntity.ratingCount)
        return cell
    }
    
    func getColorFor(_ rating: String, ratingCount: String) -> UIColor {
        guard let ratingDouble = Double(rating),
              let count = Double(ratingCount),
              count > 0 else { return .black }
        
        if ratingDouble >= 4 {
            return .green
        } else if ratingDouble >= 3 && ratingDouble < 4 {
            return .orange
        } else if ratingDouble < 3 {
            return .red
        }
        
        return .black
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.didSelect(at: indexPath)
    }
}

