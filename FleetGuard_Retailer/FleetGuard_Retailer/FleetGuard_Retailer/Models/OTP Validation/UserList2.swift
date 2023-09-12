/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct UserList2 : Codable {
	let userType : String?
	let userImage : String?
	let userGender : String?
	let userLastName : String?
	let encrypted_OTP_PIN : String?
	let locationId : Int?
	let merchant_logo : String?
	let custAccountNumber : String?
	let c_MerchantId : Int?
	let merchantId : Int?
	let merchantName : String?
	let commonUserName : String?
	let commonUserMobile : String?
	let pinStatus : Int?
	let email : String?
	let prefix : String?
	let isGeofenceActive : Int?
	let mobile : String?
	let dob : String?
	let merchantMobileNo : String?
	let merchantEmailID : String?
	let country : String?
	let locationCountryID : Int?
	let customerTypeID : Int?
	let custAccountType : String?
	let currency : String?
	let countryCode : String?
	let roleName : String?
	let customerGrade : String?
	let memberSince : String?
	let locationName : String?
	let parentLocationName : String?
	let locationType : String?
	let cityName : String?
	let parentLocationId : Int?
	let superParentLocationId : Int?
	let verifiedStatus : Int?
	let isUserActive : Int?
	let isBlacklisted : Int?
	let isDormant : Int?
	let isOnHold : Int?
	let language : String?
	let isDelete : Int?
	let languageId : Int?
	let sapCode : String?
	let parentCustomerTypeId : Int?
	let userId : Int?
	let name : String?
	let status : String?
	let result : Int?
	let actionType : Int?
	let userName : String?
	let password : String?

	enum CodingKeys: String, CodingKey {

		case userType = "userType"
		case userImage = "userImage"
		case userGender = "userGender"
		case userLastName = "userLastName"
		case encrypted_OTP_PIN = "encrypted_OTP_PIN"
		case locationId = "locationId"
		case merchant_logo = "merchant_logo"
		case custAccountNumber = "custAccountNumber"
		case c_MerchantId = "c_MerchantId"
		case merchantId = "merchantId"
		case merchantName = "merchantName"
		case commonUserName = "commonUserName"
		case commonUserMobile = "commonUserMobile"
		case pinStatus = "pinStatus"
		case email = "email"
		case prefix = "prefix"
		case isGeofenceActive = "isGeofenceActive"
		case mobile = "mobile"
		case dob = "dob"
		case merchantMobileNo = "merchantMobileNo"
		case merchantEmailID = "merchantEmailID"
		case country = "country"
		case locationCountryID = "locationCountryID"
		case customerTypeID = "customerTypeID"
		case custAccountType = "custAccountType"
		case currency = "currency"
		case countryCode = "countryCode"
		case roleName = "roleName"
		case customerGrade = "customerGrade"
		case memberSince = "memberSince"
		case locationName = "locationName"
		case parentLocationName = "parentLocationName"
		case locationType = "locationType"
		case cityName = "cityName"
		case parentLocationId = "parentLocationId"
		case superParentLocationId = "superParentLocationId"
		case verifiedStatus = "verifiedStatus"
		case isUserActive = "isUserActive"
		case isBlacklisted = "isBlacklisted"
		case isDormant = "isDormant"
		case isOnHold = "isOnHold"
		case language = "language"
		case isDelete = "isDelete"
		case languageId = "languageId"
		case sapCode = "sapCode"
		case parentCustomerTypeId = "parentCustomerTypeId"
		case userId = "userId"
		case name = "name"
		case status = "status"
		case result = "result"
		case actionType = "actionType"
		case userName = "userName"
		case password = "password"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		userType = try values.decodeIfPresent(String.self, forKey: .userType)
		userImage = try values.decodeIfPresent(String.self, forKey: .userImage)
		userGender = try values.decodeIfPresent(String.self, forKey: .userGender)
		userLastName = try values.decodeIfPresent(String.self, forKey: .userLastName)
		encrypted_OTP_PIN = try values.decodeIfPresent(String.self, forKey: .encrypted_OTP_PIN)
		locationId = try values.decodeIfPresent(Int.self, forKey: .locationId)
		merchant_logo = try values.decodeIfPresent(String.self, forKey: .merchant_logo)
		custAccountNumber = try values.decodeIfPresent(String.self, forKey: .custAccountNumber)
		c_MerchantId = try values.decodeIfPresent(Int.self, forKey: .c_MerchantId)
		merchantId = try values.decodeIfPresent(Int.self, forKey: .merchantId)
		merchantName = try values.decodeIfPresent(String.self, forKey: .merchantName)
		commonUserName = try values.decodeIfPresent(String.self, forKey: .commonUserName)
		commonUserMobile = try values.decodeIfPresent(String.self, forKey: .commonUserMobile)
		pinStatus = try values.decodeIfPresent(Int.self, forKey: .pinStatus)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		prefix = try values.decodeIfPresent(String.self, forKey: .prefix)
		isGeofenceActive = try values.decodeIfPresent(Int.self, forKey: .isGeofenceActive)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		dob = try values.decodeIfPresent(String.self, forKey: .dob)
		merchantMobileNo = try values.decodeIfPresent(String.self, forKey: .merchantMobileNo)
		merchantEmailID = try values.decodeIfPresent(String.self, forKey: .merchantEmailID)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		locationCountryID = try values.decodeIfPresent(Int.self, forKey: .locationCountryID)
		customerTypeID = try values.decodeIfPresent(Int.self, forKey: .customerTypeID)
		custAccountType = try values.decodeIfPresent(String.self, forKey: .custAccountType)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
		roleName = try values.decodeIfPresent(String.self, forKey: .roleName)
		customerGrade = try values.decodeIfPresent(String.self, forKey: .customerGrade)
		memberSince = try values.decodeIfPresent(String.self, forKey: .memberSince)
		locationName = try values.decodeIfPresent(String.self, forKey: .locationName)
		parentLocationName = try values.decodeIfPresent(String.self, forKey: .parentLocationName)
		locationType = try values.decodeIfPresent(String.self, forKey: .locationType)
		cityName = try values.decodeIfPresent(String.self, forKey: .cityName)
		parentLocationId = try values.decodeIfPresent(Int.self, forKey: .parentLocationId)
		superParentLocationId = try values.decodeIfPresent(Int.self, forKey: .superParentLocationId)
		verifiedStatus = try values.decodeIfPresent(Int.self, forKey: .verifiedStatus)
		isUserActive = try values.decodeIfPresent(Int.self, forKey: .isUserActive)
		isBlacklisted = try values.decodeIfPresent(Int.self, forKey: .isBlacklisted)
		isDormant = try values.decodeIfPresent(Int.self, forKey: .isDormant)
		isOnHold = try values.decodeIfPresent(Int.self, forKey: .isOnHold)
		language = try values.decodeIfPresent(String.self, forKey: .language)
		isDelete = try values.decodeIfPresent(Int.self, forKey: .isDelete)
		languageId = try values.decodeIfPresent(Int.self, forKey: .languageId)
		sapCode = try values.decodeIfPresent(String.self, forKey: .sapCode)
		parentCustomerTypeId = try values.decodeIfPresent(Int.self, forKey: .parentCustomerTypeId)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		result = try values.decodeIfPresent(Int.self, forKey: .result)
		actionType = try values.decodeIfPresent(Int.self, forKey: .actionType)
		userName = try values.decodeIfPresent(String.self, forKey: .userName)
		password = try values.decodeIfPresent(String.self, forKey: .password)
	}

}
