
import Foundation
struct SendSuccessModels : Codable {
	let sendSMSForSuccessfulRedemptionMobileAppResult : Bool?

	enum CodingKeys: String, CodingKey {

		case sendSMSForSuccessfulRedemptionMobileAppResult = "SendSMSForSuccessfulRedemptionMobileAppResult"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sendSMSForSuccessfulRedemptionMobileAppResult = try values.decodeIfPresent(Bool.self, forKey: .sendSMSForSuccessfulRedemptionMobileAppResult)
	}

}
