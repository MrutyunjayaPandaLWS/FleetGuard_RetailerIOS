/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstCustomerFeedBackJsonApi : Codable {
	let customerEmail : String?
	let merchantname : String?
	let merchantEmail : String?
	let merchantMobile : String?
	let merchantId : Int?
	let customerImage : String?
	let password : String?
	let customerMobile : String?
	let lastActive : String?
	let prefix : String?
	let customerType : String?
	let allowPlanner : Bool?
	let customerTypeId : Int?
	let loyaltyIdQRCode : String?
	let customerStatus : Int?
	let userId : Int?
	let customerId : Int?
	let firstName : String?
	let lastName : String?
	let loyaltyId : String?
	let title : String?
	let address : String?
	let designation : String?
	let company : String?
	let present : Bool?
	let tardy : Bool?
	let attendanceDate : String?
	let present_Count : Int?
	let tardy_Count : Int?
	let absent_Count : Int?
	let month_Name : String?
	let month_No : Int?
	let locationName : String?
	let encashBalance : Int?
	let customerGrade : String?
	let languageId : Int?
	let languageName : String?
	let nativeStateId : Int?
	let nativeStateName : String?
	let district : String?
	let locationId : Int?
	let requiredPoints : Int?
	let profilePicture : String?
	let bonusDate : String?
	let bonusName : String?
	let bonusValue : String?
	let issueDescription : String?
	let storeName : String?
	let verifiedStatus : Int?
	let cashBack : Int?
	let verificationStatus : String?
	let callStatusId : Int?
	let callRemarks : String?
	let isBlacklisted : Int?
	let isDormant : Int?
	let isOnHold : Int?
	let pinStatus : Int?
	let ownerName : String?
	let walletNumber : String?
	let referralCode : String?
	let insuranceReferanceId : String?
	let nominee : String?
	let nomineeDOB : String?
	let customerRelation : String?
	let targetAchieved : String?
	let insuranceExpiredDate : String?
	let addressTypeVerified : Bool?
	let identificationTypeVerified : Bool?
	let customerCartCount : Int?
	let callingTime : String?
	let cityID : String?
	let cityName : String?
	let skuMinPrice : Int?
	let skuMaxPrice : Int?
	let targetPoint : Int?
	let userCode : String?
	let stateID : Int?
	let stateName : String?
	let passBookNumber : String?

	enum CodingKeys: String, CodingKey {

		case customerEmail = "customerEmail"
		case merchantname = "merchantname"
		case merchantEmail = "merchantEmail"
		case merchantMobile = "merchantMobile"
		case merchantId = "merchantId"
		case customerImage = "customerImage"
		case password = "password"
		case customerMobile = "customerMobile"
		case lastActive = "lastActive"
		case prefix = "prefix"
		case customerType = "customerType"
		case allowPlanner = "allowPlanner"
		case customerTypeId = "customerTypeId"
		case loyaltyIdQRCode = "loyaltyIdQRCode"
		case customerStatus = "customerStatus"
		case userId = "userId"
		case customerId = "customerId"
		case firstName = "firstName"
		case lastName = "lastName"
		case loyaltyId = "loyaltyId"
		case title = "title"
		case address = "address"
		case designation = "designation"
		case company = "company"
		case present = "present"
		case tardy = "tardy"
		case attendanceDate = "attendanceDate"
		case present_Count = "present_Count"
		case tardy_Count = "tardy_Count"
		case absent_Count = "absent_Count"
		case month_Name = "month_Name"
		case month_No = "month_No"
		case locationName = "locationName"
		case encashBalance = "encashBalance"
		case customerGrade = "customerGrade"
		case languageId = "languageId"
		case languageName = "languageName"
		case nativeStateId = "nativeStateId"
		case nativeStateName = "nativeStateName"
		case district = "district"
		case locationId = "locationId"
		case requiredPoints = "requiredPoints"
		case profilePicture = "profilePicture"
		case bonusDate = "bonusDate"
		case bonusName = "bonusName"
		case bonusValue = "bonusValue"
		case issueDescription = "issueDescription"
		case storeName = "storeName"
		case verifiedStatus = "verifiedStatus"
		case cashBack = "cashBack"
		case verificationStatus = "verificationStatus"
		case callStatusId = "callStatusId"
		case callRemarks = "callRemarks"
		case isBlacklisted = "isBlacklisted"
		case isDormant = "isDormant"
		case isOnHold = "isOnHold"
		case pinStatus = "pinStatus"
		case ownerName = "ownerName"
		case walletNumber = "walletNumber"
		case referralCode = "referralCode"
		case insuranceReferanceId = "insuranceReferanceId"
		case nominee = "nominee"
		case nomineeDOB = "nomineeDOB"
		case customerRelation = "customerRelation"
		case targetAchieved = "targetAchieved"
		case insuranceExpiredDate = "insuranceExpiredDate"
		case addressTypeVerified = "addressTypeVerified"
		case identificationTypeVerified = "identificationTypeVerified"
		case customerCartCount = "customerCartCount"
		case callingTime = "callingTime"
		case cityID = "cityID"
		case cityName = "cityName"
		case skuMinPrice = "skuMinPrice"
		case skuMaxPrice = "skuMaxPrice"
		case targetPoint = "targetPoint"
		case userCode = "userCode"
		case stateID = "stateID"
		case stateName = "stateName"
		case passBookNumber = "passBookNumber"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		customerEmail = try values.decodeIfPresent(String.self, forKey: .customerEmail)
		merchantname = try values.decodeIfPresent(String.self, forKey: .merchantname)
		merchantEmail = try values.decodeIfPresent(String.self, forKey: .merchantEmail)
		merchantMobile = try values.decodeIfPresent(String.self, forKey: .merchantMobile)
		merchantId = try values.decodeIfPresent(Int.self, forKey: .merchantId)
		customerImage = try values.decodeIfPresent(String.self, forKey: .customerImage)
		password = try values.decodeIfPresent(String.self, forKey: .password)
		customerMobile = try values.decodeIfPresent(String.self, forKey: .customerMobile)
		lastActive = try values.decodeIfPresent(String.self, forKey: .lastActive)
		prefix = try values.decodeIfPresent(String.self, forKey: .prefix)
		customerType = try values.decodeIfPresent(String.self, forKey: .customerType)
		allowPlanner = try values.decodeIfPresent(Bool.self, forKey: .allowPlanner)
		customerTypeId = try values.decodeIfPresent(Int.self, forKey: .customerTypeId)
		loyaltyIdQRCode = try values.decodeIfPresent(String.self, forKey: .loyaltyIdQRCode)
		customerStatus = try values.decodeIfPresent(Int.self, forKey: .customerStatus)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
		customerId = try values.decodeIfPresent(Int.self, forKey: .customerId)
		firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
		lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
		loyaltyId = try values.decodeIfPresent(String.self, forKey: .loyaltyId)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		designation = try values.decodeIfPresent(String.self, forKey: .designation)
		company = try values.decodeIfPresent(String.self, forKey: .company)
		present = try values.decodeIfPresent(Bool.self, forKey: .present)
		tardy = try values.decodeIfPresent(Bool.self, forKey: .tardy)
		attendanceDate = try values.decodeIfPresent(String.self, forKey: .attendanceDate)
		present_Count = try values.decodeIfPresent(Int.self, forKey: .present_Count)
		tardy_Count = try values.decodeIfPresent(Int.self, forKey: .tardy_Count)
		absent_Count = try values.decodeIfPresent(Int.self, forKey: .absent_Count)
		month_Name = try values.decodeIfPresent(String.self, forKey: .month_Name)
		month_No = try values.decodeIfPresent(Int.self, forKey: .month_No)
		locationName = try values.decodeIfPresent(String.self, forKey: .locationName)
		encashBalance = try values.decodeIfPresent(Int.self, forKey: .encashBalance)
		customerGrade = try values.decodeIfPresent(String.self, forKey: .customerGrade)
		languageId = try values.decodeIfPresent(Int.self, forKey: .languageId)
		languageName = try values.decodeIfPresent(String.self, forKey: .languageName)
		nativeStateId = try values.decodeIfPresent(Int.self, forKey: .nativeStateId)
		nativeStateName = try values.decodeIfPresent(String.self, forKey: .nativeStateName)
		district = try values.decodeIfPresent(String.self, forKey: .district)
		locationId = try values.decodeIfPresent(Int.self, forKey: .locationId)
		requiredPoints = try values.decodeIfPresent(Int.self, forKey: .requiredPoints)
		profilePicture = try values.decodeIfPresent(String.self, forKey: .profilePicture)
		bonusDate = try values.decodeIfPresent(String.self, forKey: .bonusDate)
		bonusName = try values.decodeIfPresent(String.self, forKey: .bonusName)
		bonusValue = try values.decodeIfPresent(String.self, forKey: .bonusValue)
		issueDescription = try values.decodeIfPresent(String.self, forKey: .issueDescription)
		storeName = try values.decodeIfPresent(String.self, forKey: .storeName)
		verifiedStatus = try values.decodeIfPresent(Int.self, forKey: .verifiedStatus)
		cashBack = try values.decodeIfPresent(Int.self, forKey: .cashBack)
		verificationStatus = try values.decodeIfPresent(String.self, forKey: .verificationStatus)
		callStatusId = try values.decodeIfPresent(Int.self, forKey: .callStatusId)
		callRemarks = try values.decodeIfPresent(String.self, forKey: .callRemarks)
		isBlacklisted = try values.decodeIfPresent(Int.self, forKey: .isBlacklisted)
		isDormant = try values.decodeIfPresent(Int.self, forKey: .isDormant)
		isOnHold = try values.decodeIfPresent(Int.self, forKey: .isOnHold)
		pinStatus = try values.decodeIfPresent(Int.self, forKey: .pinStatus)
		ownerName = try values.decodeIfPresent(String.self, forKey: .ownerName)
		walletNumber = try values.decodeIfPresent(String.self, forKey: .walletNumber)
		referralCode = try values.decodeIfPresent(String.self, forKey: .referralCode)
		insuranceReferanceId = try values.decodeIfPresent(String.self, forKey: .insuranceReferanceId)
		nominee = try values.decodeIfPresent(String.self, forKey: .nominee)
		nomineeDOB = try values.decodeIfPresent(String.self, forKey: .nomineeDOB)
		customerRelation = try values.decodeIfPresent(String.self, forKey: .customerRelation)
		targetAchieved = try values.decodeIfPresent(String.self, forKey: .targetAchieved)
		insuranceExpiredDate = try values.decodeIfPresent(String.self, forKey: .insuranceExpiredDate)
		addressTypeVerified = try values.decodeIfPresent(Bool.self, forKey: .addressTypeVerified)
		identificationTypeVerified = try values.decodeIfPresent(Bool.self, forKey: .identificationTypeVerified)
		customerCartCount = try values.decodeIfPresent(Int.self, forKey: .customerCartCount)
		callingTime = try values.decodeIfPresent(String.self, forKey: .callingTime)
		cityID = try values.decodeIfPresent(String.self, forKey: .cityID)
		cityName = try values.decodeIfPresent(String.self, forKey: .cityName)
		skuMinPrice = try values.decodeIfPresent(Int.self, forKey: .skuMinPrice)
		skuMaxPrice = try values.decodeIfPresent(Int.self, forKey: .skuMaxPrice)
		targetPoint = try values.decodeIfPresent(Int.self, forKey: .targetPoint)
		userCode = try values.decodeIfPresent(String.self, forKey: .userCode)
		stateID = try values.decodeIfPresent(Int.self, forKey: .stateID)
		stateName = try values.decodeIfPresent(String.self, forKey: .stateName)
		passBookNumber = try values.decodeIfPresent(String.self, forKey: .passBookNumber)
	}

}