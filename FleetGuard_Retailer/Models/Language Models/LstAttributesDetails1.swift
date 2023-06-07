

import Foundation
struct LstAttributesDetails1 : Codable {
    let attributeId : Int?
    let totalEarning : Double?
    let categoryCode : String?
    let imageUrl : String?
    let attributeValue : String?
    let attributeType : String?
    let attributeContents : String?
    let attributeNames : String?
    let attributeCurrencyId : String?
    let currency : Int?

    enum CodingKeys: String, CodingKey {

        case attributeId = "attributeId"
        case totalEarning = "totalEarning"
        case categoryCode = "categoryCode"
        case imageUrl = "imageUrl"
        case attributeValue = "attributeValue"
        case attributeType = "attributeType"
        case attributeContents = "attributeContents"
        case attributeNames = "attributeNames"
        case attributeCurrencyId = "attributeCurrencyId"
        case currency = "currency"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        attributeId = try values.decodeIfPresent(Int.self, forKey: .attributeId)
        totalEarning = try values.decodeIfPresent(Double.self, forKey: .totalEarning)
        categoryCode = try values.decodeIfPresent(String.self, forKey: .categoryCode)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
        attributeValue = try values.decodeIfPresent(String.self, forKey: .attributeValue)
        attributeType = try values.decodeIfPresent(String.self, forKey: .attributeType)
        attributeContents = try values.decodeIfPresent(String.self, forKey: .attributeContents)
        attributeNames = try values.decodeIfPresent(String.self, forKey: .attributeNames)
        attributeCurrencyId = try values.decodeIfPresent(String.self, forKey: .attributeCurrencyId)
        currency = try values.decodeIfPresent(Int.self, forKey: .currency)
    }

}
