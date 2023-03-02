/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ObjCustomerDashboardList2 : Codable {
	let payBackPoints : Int?
	let totalEarnedPoints : Int?
	let currentPointBalance : Double?
	let multiplierPointBalance : Double?
	let profileImage : String?
	let qR_Code : String?
	let memberSince : String?
	let messageCount : Int?
	let warningCount : Int?
	let redeemPoints : Int?
	let totalRedeemed : Double?
	let customerTotalPoint : Double?
	let giftEvoucherCount : Int?
	let giftDonateCount : Int?
	let objPromotionCommonList : String?
	let objActivityDetailsList : String?
	let giftingEvoucherCount : Int?
	let redeemablePointsBalance : Double?
	let redeemableEncashBalance : Int?
	let customerType : String?
	let notificationCount : Int?
	let programBehaviour : String?
	let behaviourWisePoints : Int?
	let programBehaviourId : Int?
	let isNotionalPoints : Int?
	let lifeTimeEarningsOppor : String?
	let lifeTimeEarningsAchi : String?
	let lifeTimeEarningsMissed : String?
	let lifeTimeEarningsDue : String?
	let lifeTimeEarningsDamages : String?
	let name : String?
	let customerCredit : Int?
	let customerGrade : String?
	let retailerId : Int?
	let customerId : Int?
	let totalRows : Int?
	let identityProofsNotification : Int?
	let mappedType : String?
	let mappedBalance : String?
	let overAllPoints : Int?
	let subscriberCount : Int?
	let teirUpgradeMessage : String?
	let referralCount : Int?
	let pointExpiryCount : Int?
	let referralBonusPoints : Int?
	let nextTeirUpgradeMessage : String?
	let feedBackSurveyId : Int?
	let isFeedBackGave : Bool?
	let customerOrderStatusId : Int?
	let customerCartCount : Int?
	let behaviourImage : String?
	let mappedUserName : String?
	let mappedUserMobile : String?
	let approvedClaimCount : Int?
	let customerVerifiedStatus : Bool?
	let convertedCurrencyValue : Double?
	let verificationStatus : Int?
	let createdBy : Int?
	let accessedDate : String?
	let createdDate : String?
	let bdeUserName : String?
	let bdeUserMobile : String?
	let customerBonusCampaignStatus : Bool?
	let customerPendingGamesCount : Int?
	let customerRaffleCount : Int?
	let cashBackEligibility : Double?
	let cashBackType : String?
	let remarks : String?
	let totalBrokarage : String?
	let cashBackEarned : String?
	let graphYear : Int?
	let graphMonth : String?
	let sumOfBarChartPoints : Int?
	let sumOfPointsForLineChart : Int?
	let totalWithDrawl : Int?
	let mappedRetailerCount : Int?
	let notionalPointQuarter : Int?
	let customerOrdersCartCount : Int?
	let activeRaffelCount : Int?
	let isReply : Int?
	let totalMappedPlumbers : Int?
	let totalMappedSubDealers : Int?
	let totalMappedCSM : Int?
	let totalEarning : Double?
	let userActionId : Int?
	let userAction : String?
	let walletBalance : Int?
	let enrollment_Date : String?
	let memberShipId : String?
	let mobile : String?
	let residance_Address : String?
	let state : String?
	let city : String?
	let pincode : String?
	let kycType : String?
	let kycDetails : String?
	let panCardDetails : String?
	let distributorCode : String?
	let garageAddress : String?
	let garageName : String?
	let agp : String?
	let imagePath : String?
	let park : String?
	let token : String?
	let actorId : Int?
	let isActive : Bool?
	let actorRole : String?
	let actionType : Int?

	enum CodingKeys: String, CodingKey {

		case payBackPoints = "payBackPoints"
		case totalEarnedPoints = "totalEarnedPoints"
		case currentPointBalance = "currentPointBalance"
		case multiplierPointBalance = "multiplierPointBalance"
		case profileImage = "profileImage"
		case qR_Code = "qR_Code"
		case memberSince = "memberSince"
		case messageCount = "messageCount"
		case warningCount = "warningCount"
		case redeemPoints = "redeemPoints"
		case totalRedeemed = "totalRedeemed"
		case customerTotalPoint = "customerTotalPoint"
		case giftEvoucherCount = "giftEvoucherCount"
		case giftDonateCount = "giftDonateCount"
		case objPromotionCommonList = "objPromotionCommonList"
		case objActivityDetailsList = "objActivityDetailsList"
		case giftingEvoucherCount = "giftingEvoucherCount"
		case redeemablePointsBalance = "redeemablePointsBalance"
		case redeemableEncashBalance = "redeemableEncashBalance"
		case customerType = "customerType"
		case notificationCount = "notificationCount"
		case programBehaviour = "programBehaviour"
		case behaviourWisePoints = "behaviourWisePoints"
		case programBehaviourId = "programBehaviourId"
		case isNotionalPoints = "isNotionalPoints"
		case lifeTimeEarningsOppor = "lifeTimeEarningsOppor"
		case lifeTimeEarningsAchi = "lifeTimeEarningsAchi"
		case lifeTimeEarningsMissed = "lifeTimeEarningsMissed"
		case lifeTimeEarningsDue = "lifeTimeEarningsDue"
		case lifeTimeEarningsDamages = "lifeTimeEarningsDamages"
		case name = "name"
		case customerCredit = "customerCredit"
		case customerGrade = "customerGrade"
		case retailerId = "retailerId"
		case customerId = "customerId"
		case totalRows = "totalRows"
		case identityProofsNotification = "identityProofsNotification"
		case mappedType = "mappedType"
		case mappedBalance = "mappedBalance"
		case overAllPoints = "overAllPoints"
		case subscriberCount = "subscriberCount"
		case teirUpgradeMessage = "teirUpgradeMessage"
		case referralCount = "referralCount"
		case pointExpiryCount = "pointExpiryCount"
		case referralBonusPoints = "referralBonusPoints"
		case nextTeirUpgradeMessage = "nextTeirUpgradeMessage"
		case feedBackSurveyId = "feedBackSurveyId"
		case isFeedBackGave = "isFeedBackGave"
		case customerOrderStatusId = "customerOrderStatusId"
		case customerCartCount = "customerCartCount"
		case behaviourImage = "behaviourImage"
		case mappedUserName = "mappedUserName"
		case mappedUserMobile = "mappedUserMobile"
		case approvedClaimCount = "approvedClaimCount"
		case customerVerifiedStatus = "customerVerifiedStatus"
		case convertedCurrencyValue = "convertedCurrencyValue"
		case verificationStatus = "verificationStatus"
		case createdBy = "createdBy"
		case accessedDate = "accessedDate"
		case createdDate = "createdDate"
		case bdeUserName = "bdeUserName"
		case bdeUserMobile = "bdeUserMobile"
		case customerBonusCampaignStatus = "customerBonusCampaignStatus"
		case customerPendingGamesCount = "customerPendingGamesCount"
		case customerRaffleCount = "customerRaffleCount"
		case cashBackEligibility = "cashBackEligibility"
		case cashBackType = "cashBackType"
		case remarks = "remarks"
		case totalBrokarage = "totalBrokarage"
		case cashBackEarned = "cashBackEarned"
		case graphYear = "graphYear"
		case graphMonth = "graphMonth"
		case sumOfBarChartPoints = "sumOfBarChartPoints"
		case sumOfPointsForLineChart = "sumOfPointsForLineChart"
		case totalWithDrawl = "totalWithDrawl"
		case mappedRetailerCount = "mappedRetailerCount"
		case notionalPointQuarter = "notionalPointQuarter"
		case customerOrdersCartCount = "customerOrdersCartCount"
		case activeRaffelCount = "activeRaffelCount"
		case isReply = "isReply"
		case totalMappedPlumbers = "totalMappedPlumbers"
		case totalMappedSubDealers = "totalMappedSubDealers"
		case totalMappedCSM = "totalMappedCSM"
		case totalEarning = "totalEarning"
		case userActionId = "userActionId"
		case userAction = "userAction"
		case walletBalance = "walletBalance"
		case enrollment_Date = "enrollment_Date"
		case memberShipId = "memberShipId"
		case mobile = "mobile"
		case residance_Address = "residance_Address"
		case state = "state"
		case city = "city"
		case pincode = "pincode"
		case kycType = "kycType"
		case kycDetails = "kycDetails"
		case panCardDetails = "panCardDetails"
		case distributorCode = "distributorCode"
		case garageAddress = "garageAddress"
		case garageName = "garageName"
		case agp = "agp"
		case imagePath = "imagePath"
		case park = "park"
		case token = "token"
		case actorId = "actorId"
		case isActive = "isActive"
		case actorRole = "actorRole"
		case actionType = "actionType"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		payBackPoints = try values.decodeIfPresent(Int.self, forKey: .payBackPoints)
		totalEarnedPoints = try values.decodeIfPresent(Int.self, forKey: .totalEarnedPoints)
		currentPointBalance = try values.decodeIfPresent(Double.self, forKey: .currentPointBalance)
		multiplierPointBalance = try values.decodeIfPresent(Double.self, forKey: .multiplierPointBalance)
		profileImage = try values.decodeIfPresent(String.self, forKey: .profileImage)
		qR_Code = try values.decodeIfPresent(String.self, forKey: .qR_Code)
		memberSince = try values.decodeIfPresent(String.self, forKey: .memberSince)
		messageCount = try values.decodeIfPresent(Int.self, forKey: .messageCount)
		warningCount = try values.decodeIfPresent(Int.self, forKey: .warningCount)
		redeemPoints = try values.decodeIfPresent(Int.self, forKey: .redeemPoints)
		totalRedeemed = try values.decodeIfPresent(Double.self, forKey: .totalRedeemed)
		customerTotalPoint = try values.decodeIfPresent(Double.self, forKey: .customerTotalPoint)
		giftEvoucherCount = try values.decodeIfPresent(Int.self, forKey: .giftEvoucherCount)
		giftDonateCount = try values.decodeIfPresent(Int.self, forKey: .giftDonateCount)
		objPromotionCommonList = try values.decodeIfPresent(String.self, forKey: .objPromotionCommonList)
		objActivityDetailsList = try values.decodeIfPresent(String.self, forKey: .objActivityDetailsList)
		giftingEvoucherCount = try values.decodeIfPresent(Int.self, forKey: .giftingEvoucherCount)
		redeemablePointsBalance = try values.decodeIfPresent(Double.self, forKey: .redeemablePointsBalance)
		redeemableEncashBalance = try values.decodeIfPresent(Int.self, forKey: .redeemableEncashBalance)
		customerType = try values.decodeIfPresent(String.self, forKey: .customerType)
		notificationCount = try values.decodeIfPresent(Int.self, forKey: .notificationCount)
		programBehaviour = try values.decodeIfPresent(String.self, forKey: .programBehaviour)
		behaviourWisePoints = try values.decodeIfPresent(Int.self, forKey: .behaviourWisePoints)
		programBehaviourId = try values.decodeIfPresent(Int.self, forKey: .programBehaviourId)
		isNotionalPoints = try values.decodeIfPresent(Int.self, forKey: .isNotionalPoints)
		lifeTimeEarningsOppor = try values.decodeIfPresent(String.self, forKey: .lifeTimeEarningsOppor)
		lifeTimeEarningsAchi = try values.decodeIfPresent(String.self, forKey: .lifeTimeEarningsAchi)
		lifeTimeEarningsMissed = try values.decodeIfPresent(String.self, forKey: .lifeTimeEarningsMissed)
		lifeTimeEarningsDue = try values.decodeIfPresent(String.self, forKey: .lifeTimeEarningsDue)
		lifeTimeEarningsDamages = try values.decodeIfPresent(String.self, forKey: .lifeTimeEarningsDamages)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		customerCredit = try values.decodeIfPresent(Int.self, forKey: .customerCredit)
		customerGrade = try values.decodeIfPresent(String.self, forKey: .customerGrade)
		retailerId = try values.decodeIfPresent(Int.self, forKey: .retailerId)
		customerId = try values.decodeIfPresent(Int.self, forKey: .customerId)
		totalRows = try values.decodeIfPresent(Int.self, forKey: .totalRows)
		identityProofsNotification = try values.decodeIfPresent(Int.self, forKey: .identityProofsNotification)
		mappedType = try values.decodeIfPresent(String.self, forKey: .mappedType)
		mappedBalance = try values.decodeIfPresent(String.self, forKey: .mappedBalance)
		overAllPoints = try values.decodeIfPresent(Int.self, forKey: .overAllPoints)
		subscriberCount = try values.decodeIfPresent(Int.self, forKey: .subscriberCount)
		teirUpgradeMessage = try values.decodeIfPresent(String.self, forKey: .teirUpgradeMessage)
		referralCount = try values.decodeIfPresent(Int.self, forKey: .referralCount)
		pointExpiryCount = try values.decodeIfPresent(Int.self, forKey: .pointExpiryCount)
		referralBonusPoints = try values.decodeIfPresent(Int.self, forKey: .referralBonusPoints)
		nextTeirUpgradeMessage = try values.decodeIfPresent(String.self, forKey: .nextTeirUpgradeMessage)
		feedBackSurveyId = try values.decodeIfPresent(Int.self, forKey: .feedBackSurveyId)
		isFeedBackGave = try values.decodeIfPresent(Bool.self, forKey: .isFeedBackGave)
		customerOrderStatusId = try values.decodeIfPresent(Int.self, forKey: .customerOrderStatusId)
		customerCartCount = try values.decodeIfPresent(Int.self, forKey: .customerCartCount)
		behaviourImage = try values.decodeIfPresent(String.self, forKey: .behaviourImage)
		mappedUserName = try values.decodeIfPresent(String.self, forKey: .mappedUserName)
		mappedUserMobile = try values.decodeIfPresent(String.self, forKey: .mappedUserMobile)
		approvedClaimCount = try values.decodeIfPresent(Int.self, forKey: .approvedClaimCount)
		customerVerifiedStatus = try values.decodeIfPresent(Bool.self, forKey: .customerVerifiedStatus)
		convertedCurrencyValue = try values.decodeIfPresent(Double.self, forKey: .convertedCurrencyValue)
		verificationStatus = try values.decodeIfPresent(Int.self, forKey: .verificationStatus)
		createdBy = try values.decodeIfPresent(Int.self, forKey: .createdBy)
		accessedDate = try values.decodeIfPresent(String.self, forKey: .accessedDate)
		createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
		bdeUserName = try values.decodeIfPresent(String.self, forKey: .bdeUserName)
		bdeUserMobile = try values.decodeIfPresent(String.self, forKey: .bdeUserMobile)
		customerBonusCampaignStatus = try values.decodeIfPresent(Bool.self, forKey: .customerBonusCampaignStatus)
		customerPendingGamesCount = try values.decodeIfPresent(Int.self, forKey: .customerPendingGamesCount)
		customerRaffleCount = try values.decodeIfPresent(Int.self, forKey: .customerRaffleCount)
		cashBackEligibility = try values.decodeIfPresent(Double.self, forKey: .cashBackEligibility)
		cashBackType = try values.decodeIfPresent(String.self, forKey: .cashBackType)
		remarks = try values.decodeIfPresent(String.self, forKey: .remarks)
		totalBrokarage = try values.decodeIfPresent(String.self, forKey: .totalBrokarage)
		cashBackEarned = try values.decodeIfPresent(String.self, forKey: .cashBackEarned)
		graphYear = try values.decodeIfPresent(Int.self, forKey: .graphYear)
		graphMonth = try values.decodeIfPresent(String.self, forKey: .graphMonth)
		sumOfBarChartPoints = try values.decodeIfPresent(Int.self, forKey: .sumOfBarChartPoints)
		sumOfPointsForLineChart = try values.decodeIfPresent(Int.self, forKey: .sumOfPointsForLineChart)
		totalWithDrawl = try values.decodeIfPresent(Int.self, forKey: .totalWithDrawl)
		mappedRetailerCount = try values.decodeIfPresent(Int.self, forKey: .mappedRetailerCount)
		notionalPointQuarter = try values.decodeIfPresent(Int.self, forKey: .notionalPointQuarter)
		customerOrdersCartCount = try values.decodeIfPresent(Int.self, forKey: .customerOrdersCartCount)
		activeRaffelCount = try values.decodeIfPresent(Int.self, forKey: .activeRaffelCount)
		isReply = try values.decodeIfPresent(Int.self, forKey: .isReply)
		totalMappedPlumbers = try values.decodeIfPresent(Int.self, forKey: .totalMappedPlumbers)
		totalMappedSubDealers = try values.decodeIfPresent(Int.self, forKey: .totalMappedSubDealers)
		totalMappedCSM = try values.decodeIfPresent(Int.self, forKey: .totalMappedCSM)
		totalEarning = try values.decodeIfPresent(Double.self, forKey: .totalEarning)
		userActionId = try values.decodeIfPresent(Int.self, forKey: .userActionId)
		userAction = try values.decodeIfPresent(String.self, forKey: .userAction)
		walletBalance = try values.decodeIfPresent(Int.self, forKey: .walletBalance)
		enrollment_Date = try values.decodeIfPresent(String.self, forKey: .enrollment_Date)
		memberShipId = try values.decodeIfPresent(String.self, forKey: .memberShipId)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		residance_Address = try values.decodeIfPresent(String.self, forKey: .residance_Address)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		pincode = try values.decodeIfPresent(String.self, forKey: .pincode)
		kycType = try values.decodeIfPresent(String.self, forKey: .kycType)
		kycDetails = try values.decodeIfPresent(String.self, forKey: .kycDetails)
		panCardDetails = try values.decodeIfPresent(String.self, forKey: .panCardDetails)
		distributorCode = try values.decodeIfPresent(String.self, forKey: .distributorCode)
		garageAddress = try values.decodeIfPresent(String.self, forKey: .garageAddress)
		garageName = try values.decodeIfPresent(String.self, forKey: .garageName)
		agp = try values.decodeIfPresent(String.self, forKey: .agp)
		imagePath = try values.decodeIfPresent(String.self, forKey: .imagePath)
		park = try values.decodeIfPresent(String.self, forKey: .park)
		token = try values.decodeIfPresent(String.self, forKey: .token)
		actorId = try values.decodeIfPresent(Int.self, forKey: .actorId)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		actorRole = try values.decodeIfPresent(String.self, forKey: .actorRole)
		actionType = try values.decodeIfPresent(Int.self, forKey: .actionType)
	}

}
