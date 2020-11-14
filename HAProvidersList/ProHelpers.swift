//
//  ProHelpers.swift
//  HAProvidersList
//
//  Created by Dane Thomas on 11/14/20.
//

import Foundation

struct ProHelpers {
    
    static func makeRatingsText(from proEntity: ProResponseEntity) -> String {
        guard let count = Double(proEntity.ratingCount),
              count > 0 else { return "References Available" }
        
        return "Rating: \(proEntity.compositeRating) | \(count) rating(s)"
    }
}
