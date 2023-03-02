
import Foundation
struct RemoveGiftModels : Codable {
    let memberName : String?
    let points : String?
    let dreamGiftName : String?
    let mobile : String?
    let returnValue : Int?
    let returnMessage : String?
    let totalRecords : Int?

    enum CodingKeys: String, CodingKey {

        case memberName = "memberName"
        case points = "points"
        case dreamGiftName = "dreamGiftName"
        case mobile = "mobile"
        case returnValue = "returnValue"
        case returnMessage = "returnMessage"
        case totalRecords = "totalRecords"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        memberName = try values.decodeIfPresent(String.self, forKey: .memberName)
        points = try values.decodeIfPresent(String.self, forKey: .points)
        dreamGiftName = try values.decodeIfPresent(String.self, forKey: .dreamGiftName)
        mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
        returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
        returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
        totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
    }

}
