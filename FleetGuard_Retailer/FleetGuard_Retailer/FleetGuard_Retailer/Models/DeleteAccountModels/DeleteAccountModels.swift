//
//  DeleteAccountModels.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by admin on 02/06/23.
//

import Foundation


struct DeleteAccountModels : Codable {
    let isActive : Bool?
    let returnValue : Int?
    let returnMessage : String?
    let totalRecords : Int?

    enum CodingKeys: String, CodingKey {

        case isActive = "isActive"
        case returnValue = "returnValue"
        case returnMessage = "returnMessage"
        case totalRecords = "totalRecords"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
        returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
        returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
        totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
    }


}
