
import Foundation
struct UserStatusModels : Codable {
	let returnMessage : String?
	let returnValue : Int?
	let totalRecords : Int?
	let isActive : Bool?

	enum CodingKeys: String, CodingKey {

		case returnMessage = "ReturnMessage"
		case returnValue = "ReturnValue"
		case totalRecords = "TotalRecords"
		case isActive = "IsActive"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
	}

}
