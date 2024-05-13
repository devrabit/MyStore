//
//  Attribute.swift
//  MyStore
//
//  Created by Andrey Carreño on 10/05/24.
//

import Foundation

public struct AttributeEntity: Codable {
    public var id: String?
    public var value_id: String?
    public var attribute_group_name: String?
    public var source: Int
    public var name: String?
    public var value_name: String?
    public init(id: String? = nil, value_id: String? = nil, attribute_group_name: String? = nil, source: Int, name: String? = nil, value_name: String? = nil) {
        self.id = id
        self.value_id = value_id
        self.attribute_group_name = attribute_group_name
        self.source = source
        self.name = name
        self.value_name = value_name
    }
}
