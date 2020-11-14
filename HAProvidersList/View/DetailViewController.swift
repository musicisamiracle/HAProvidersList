//
//  DetailViewController.swift
//  HAProvidersList
//
//  Created by Dane Thomas on 11/14/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    let presenter: DetailPresentable
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specialtyLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var servicesLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var callButton: HAButton!
    @IBOutlet weak var emailButton: HAButton!
    
    
    
    init?(coder: NSCoder, presenter: DetailPresentable) {
        self.presenter = presenter
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.styleView()
        self.display(pro: self.presenter.proDetails)
    }

    func styleView() {
        self.nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.specialtyLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        self.ratingLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.locationLabel.font = UIFont.systemFont(ofSize: 16)
        self.servicesLabel.font = UIFont.systemFont(ofSize: 16)
        self.overviewLabel.font = UIFont.systemFont(ofSize: 14)
        
    }
    
    func display(pro: ProResponseEntity) {
        self.nameLabel.text = pro.companyName
        self.specialtyLabel.text = pro.specialty
        self.ratingLabel.text = ProHelpers.makeRatingsText(from: pro)
        self.locationLabel.text = pro.primaryLocation
        self.servicesLabel.text = pro.servicesOffered ?? "Services Not Available"
        self.overviewLabel.text = pro.companyOverview
    }
    
    @IBAction func callWasTapped(_ sender: UIButton) {
        self.presenter.callWasTapped()
    }
    
    @IBAction func emailWasTapped(_ sender: UIButton) {
        self.presenter.emailWasTapped()
    }
}
