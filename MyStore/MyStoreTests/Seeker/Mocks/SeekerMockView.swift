//
//  SeekerMockView.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

import Foundation
@testable import MyStore

class SeekerMockView: PresenterToViewSeekerProtocol {
    enum Invocations {
    case validateQueryCalled
    }
    
    var invocations: [Invocations] = []
    
    func validateQuery(isValid: Bool) {
        invocations.append(.validateQueryCalled)
    }
    
}
