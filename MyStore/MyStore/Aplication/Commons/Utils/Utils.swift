//
//  Utils.swift
//  MyStore
//
//  Created by Andrey Carreño on 19/02/24.
//

import Foundation
class Utils {
    static func encodeUrl(url: String) -> String {
        return url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
}
