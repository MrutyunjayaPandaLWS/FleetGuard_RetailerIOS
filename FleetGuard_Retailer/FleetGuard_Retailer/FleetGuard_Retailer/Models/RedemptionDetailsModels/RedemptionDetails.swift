

import Foundation
struct RedemptionDetails : Codable {
	let redemptionId : Int?
	let shippingAddressId : Int?
	let addressId : Int?
	let addressType : String?
	let fullName : String?
	let mobile : String?
	let email : String?
	let address1 : String?
	let address2 : String?
	let cityId : Int?
	let cityName : String?
	let countryId : Int?
	let countryName : String?
	let landmark : String?
	let stateId : Int?
	let stateName : String?
	let zip : String?
	let token : String?
	let actorId : Int?
	let isActive : Bool?
	let actorRole : String?
	let actionType : Int?

	enum CodingKeys: String, CodingKey {

		case redemptionId = "redemptionId"
		case shippingAddressId = "shippingAddressId"
		case addressId = "addressId"
		case addressType = "addressType"
		case fullName = "fullName"
		case mobile = "mobile"
		case email = "email"
		case address1 = "address1"
		case address2 = "address2"
		case cityId = "cityId"
		case cityName = "cityName"
		case countryId = "countryId"
		case countryName = "countryName"
		case landmark = "landmark"
		case stateId = "stateId"
		case stateName = "stateName"
		case zip = "zip"
		case token = "token"
		case actorId = "actorId"
		case isActive = "isActive"
		case actorRole = "actorRole"
		case actionType = "actionType"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		redemptionId = try values.decodeIfPresent(Int.self, forKey: .redemptionId)
		shippingAddressId = try values.decodeIfPresent(Int.self, forKey: .shippingAddressId)
		addressId = try values.decodeIfPresent(Int.self, forKey: .addressId)
		addressType = try values.decodeIfPresent(String.self, forKey: .addressType)
		fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		address1 = try values.decodeIfPresent(String.self, forKey: .address1)
		address2 = try values.decodeIfPresent(String.self, forKey: .address2)
		cityId = try values.decodeIfPresent(Int.self, forKey: .cityId)
		cityName = try values.decodeIfPresent(String.self, forKey: .cityName)
		countryId = try values.decodeIfPresent(Int.self, forKey: .countryId)
		countryName = try values.decodeIfPresent(String.self, forKey: .countryName)
		landmark = try values.decodeIfPresent(String.self, forKey: .landmark)
		stateId = try values.decodeIfPresent(Int.self, forKey: .stateId)
		stateName = try values.decodeIfPresent(String.self, forKey: .stateName)
		zip = try values.decodeIfPresent(String.self, forKey: .zip)
		token = try values.decodeIfPresent(String.self, forKey: .token)
		actorId = try values.decodeIfPresent(Int.self, forKey: .actorId)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		actorRole = try values.decodeIfPresent(String.self, forKey: .actorRole)
		actionType = try values.decodeIfPresent(Int.self, forKey: .actionType)
	}

}
