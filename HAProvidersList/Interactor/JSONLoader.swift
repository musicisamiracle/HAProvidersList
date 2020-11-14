//
//  JSONLoader.swift
//  HAProvidersList
//
//  Created by Dane Thomas on 11/14/20.
//

import Foundation

struct JSONLoader {
    static func getDataFromJson(fileName: String, owner: AnyObject) -> Data? {
        let bundle = Bundle(for: type(of: owner))
        if let url = bundle.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
}
