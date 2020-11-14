//
//  HAButton.swift
//  HAProvidersList
//
//  Created by Dane Thomas on 11/15/20.
//

import UIKit

class HAButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = .HAOrange
        self.setTitleColor(.white, for: .normal)
    }

}
