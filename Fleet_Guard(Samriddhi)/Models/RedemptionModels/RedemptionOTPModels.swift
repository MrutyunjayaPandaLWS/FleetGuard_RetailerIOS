

import Foundation
struct RedemptionOTPModels : Codable {
	let returnMessage : String?
	let returnValue : Int?
	let totalRecords : Int?
	let adminList : String?
	let merchantEmailSMSDetails : String?
	let merchantEmailSMSParameterDetails : String?

	enum CodingKeys: String, CodingKey {

		case returnMessage = "ReturnMessage"
		case returnValue = "ReturnValue"
		case totalRecords = "TotalRecords"
		case adminList = "AdminList"
		case merchantEmailSMSDetails = "MerchantEmailSMSDetails"
		case merchantEmailSMSParameterDetails = "MerchantEmailSMSParameterDetails"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
		adminList = try values.decodeIfPresent(String.self, forKey: .adminList)
		merchantEmailSMSDetails = try values.decodeIfPresent(String.self, forKey: .merchantEmailSMSDetails)
		merchantEmailSMSParameterDetails = try values.decodeIfPresent(String.self, forKey: .merchantEmailSMSParameterDetails)
	}

}
