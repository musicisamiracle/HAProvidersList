//
//  ProResponse.swift
//  HAProvidersList
//
//  Created by Dane Thomas on 11/14/20.
//

import Foundation

typealias ProResponse = [ProResponseEntity]

/*
 {
 "entityId":"1222893113",
 "companyName":"Summit Preservation, LLC",
 "ratingCount":"7",
 "compositeRating":"5.0",
 "companyOverview":"Summit Preservation prides itself on creating beautiful surfaces for your home. You can always expect a great experience with us, a reasonable rate and a quality finish to the job. Call us today!",
 "canadianSP":false,
 "spanishSpeaking":false,
 "phoneNumber":"(330) 555-3136",
 "latitude":39.8873,
 "longitude":-104.8805,
 "servicesOffered":"Flooring & Carpet, Tile",
 "specialty":"Additions & Remodeling",
 "primaryLocation":"Henderson, CO",
 "email":"contact@summitpresllc.biz"
 }
 */

struct ProResponseEntity: Codable {
    let entityId: String
    let companyName: String
    let ratingCount: String
    let compositeRating: String
    let companyOverview: String
    let canadianSP: Bool
    let spanishSpeaking: Bool
    let phoneNumber: String
    let latitude: Double?
    let longitude: Double?
    let servicesOffered: String?
    let specialty: String
    let primaryLocation: String
    let email: String
}
