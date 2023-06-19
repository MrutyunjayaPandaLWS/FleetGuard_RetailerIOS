
import Foundation
struct GetCatalogueCategoryDetailsResult : Codable {
	let returnMessage : String?
	let returnValue : Int?
	let totalRecords : Int?
	let objCatalogueCategoryListJson : [ObjCatalogueCategoryListJson]?
	let responseCode : String?

	enum CodingKeys: String, CodingKey {

		case returnMessage = "ReturnMessage"
		case returnValue = "ReturnValue"
		case totalRecords = "TotalRecords"
		case objCatalogueCategoryListJson = "ObjCatalogueCategoryListJson"
		case responseCode = "ResponseCode"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
		objCatalogueCategoryListJson = try values.decodeIfPresent([ObjCatalogueCategoryListJson].self, forKey: .objCatalogueCategoryListJson)
		responseCode = try values.decodeIfPresent(String.self, forKey: .responseCode)
	}

}
