/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstPromotionListJsonApi : Codable {
	let promotionName : String?
	let proShortDesc : String?
	let proLongDesc : String?
	let proImage : String?
	let footer : String?
	let is_Expired : Bool?
	let is_Active : Bool?
	let views : Int?
	let totalClaims : Int?
	let promotion_Type : Int?
	let totalViews : Int?
	let totalBlocks : Int?
	let isReserved : Bool?
	let isClaimed : Bool?
	let pushUserActionID : Int?
	let totalResponses : Int?
	let cliamIdUsageStatus : Bool?
	let url : String?
	let view : String?
	let claim : String?
	let reserve : String?
	let comment : String?
	let validity : String?
	let targetCustomers : Int?
	let promotionTypeName : String?
	let mobileNo : String?
	let memberId : String?
	let memberName : String?
	let totalRecords : Int?
	let canClaim : Bool?
	let canReverse : Bool?
	let canComment : Bool?
	let totalComment : Int?
	let actionUrl : String?
	let categoryId : Int?
	let categoryName : String?
	let albumImageID : Int?
	let title : String?
	let firstName : String?
	let lastName : String?
	let fullName : String?
	let pointBalance : Int?
	let canView : Bool?
	let allowUnReserve : Bool?
	let isReservable : Bool?
	let approvalStatusID : Int?
	let approvalStatus : String?
	let remarks : String?
	let emailID : String?
	let isApprovable : Bool?
	let validFrom : String?
	let validTo : String?
	let outletName : String?
	let redeemLocationAll : Bool?
	let promotionId : Int?

	enum CodingKeys: String, CodingKey {

		case promotionName = "promotionName"
		case proShortDesc = "proShortDesc"
		case proLongDesc = "proLongDesc"
		case proImage = "proImage"
		case footer = "footer"
		case is_Expired = "is_Expired"
		case is_Active = "is_Active"
		case views = "views"
		case totalClaims = "totalClaims"
		case promotion_Type = "promotion_Type"
		case totalViews = "totalViews"
		case totalBlocks = "totalBlocks"
		case isReserved = "isReserved"
		case isClaimed = "isClaimed"
		case pushUserActionID = "pushUserActionID"
		case totalResponses = "totalResponses"
		case cliamIdUsageStatus = "cliamIdUsageStatus"
		case url = "url"
		case view = "view"
		case claim = "claim"
		case reserve = "reserve"
		case comment = "comment"
		case validity = "validity"
		case targetCustomers = "targetCustomers"
		case promotionTypeName = "promotionTypeName"
		case mobileNo = "mobileNo"
		case memberId = "memberId"
		case memberName = "memberName"
		case totalRecords = "totalRecords"
		case canClaim = "canClaim"
		case canReverse = "canReverse"
		case canComment = "canComment"
		case totalComment = "totalComment"
		case actionUrl = "actionUrl"
		case categoryId = "categoryId"
		case categoryName = "categoryName"
		case albumImageID = "albumImageID"
		case title = "title"
		case firstName = "firstName"
		case lastName = "lastName"
		case fullName = "fullName"
		case pointBalance = "pointBalance"
		case canView = "canView"
		case allowUnReserve = "allowUnReserve"
		case isReservable = "isReservable"
		case approvalStatusID = "approvalStatusID"
		case approvalStatus = "approvalStatus"
		case remarks = "remarks"
		case emailID = "emailID"
		case isApprovable = "isApprovable"
		case validFrom = "validFrom"
		case validTo = "validTo"
		case outletName = "outletName"
		case redeemLocationAll = "redeemLocationAll"
		case promotionId = "promotionId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		promotionName = try values.decodeIfPresent(String.self, forKey: .promotionName)
		proShortDesc = try values.decodeIfPresent(String.self, forKey: .proShortDesc)
		proLongDesc = try values.decodeIfPresent(String.self, forKey: .proLongDesc)
		proImage = try values.decodeIfPresent(String.self, forKey: .proImage)
		footer = try values.decodeIfPresent(String.self, forKey: .footer)
		is_Expired = try values.decodeIfPresent(Bool.self, forKey: .is_Expired)
		is_Active = try values.decodeIfPresent(Bool.self, forKey: .is_Active)
		views = try values.decodeIfPresent(Int.self, forKey: .views)
		totalClaims = try values.decodeIfPresent(Int.self, forKey: .totalClaims)
		promotion_Type = try values.decodeIfPresent(Int.self, forKey: .promotion_Type)
		totalViews = try values.decodeIfPresent(Int.self, forKey: .totalViews)
		totalBlocks = try values.decodeIfPresent(Int.self, forKey: .totalBlocks)
		isReserved = try values.decodeIfPresent(Bool.self, forKey: .isReserved)
		isClaimed = try values.decodeIfPresent(Bool.self, forKey: .isClaimed)
		pushUserActionID = try values.decodeIfPresent(Int.self, forKey: .pushUserActionID)
		totalResponses = try values.decodeIfPresent(Int.self, forKey: .totalResponses)
		cliamIdUsageStatus = try values.decodeIfPresent(Bool.self, forKey: .cliamIdUsageStatus)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		view = try values.decodeIfPresent(String.self, forKey: .view)
		claim = try values.decodeIfPresent(String.self, forKey: .claim)
		reserve = try values.decodeIfPresent(String.self, forKey: .reserve)
		comment = try values.decodeIfPresent(String.self, forKey: .comment)
		validity = try values.decodeIfPresent(String.self, forKey: .validity)
		targetCustomers = try values.decodeIfPresent(Int.self, forKey: .targetCustomers)
		promotionTypeName = try values.decodeIfPresent(String.self, forKey: .promotionTypeName)
		mobileNo = try values.decodeIfPresent(String.self, forKey: .mobileNo)
		memberId = try values.decodeIfPresent(String.self, forKey: .memberId)
		memberName = try values.decodeIfPresent(String.self, forKey: .memberName)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
		canClaim = try values.decodeIfPresent(Bool.self, forKey: .canClaim)
		canReverse = try values.decodeIfPresent(Bool.self, forKey: .canReverse)
		canComment = try values.decodeIfPresent(Bool.self, forKey: .canComment)
		totalComment = try values.decodeIfPresent(Int.self, forKey: .totalComment)
		actionUrl = try values.decodeIfPresent(String.self, forKey: .actionUrl)
		categoryId = try values.decodeIfPresent(Int.self, forKey: .categoryId)
		categoryName = try values.decodeIfPresent(String.self, forKey: .categoryName)
		albumImageID = try values.decodeIfPresent(Int.self, forKey: .albumImageID)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
		lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
		fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
		pointBalance = try values.decodeIfPresent(Int.self, forKey: .pointBalance)
		canView = try values.decodeIfPresent(Bool.self, forKey: .canView)
		allowUnReserve = try values.decodeIfPresent(Bool.self, forKey: .allowUnReserve)
		isReservable = try values.decodeIfPresent(Bool.self, forKey: .isReservable)
		approvalStatusID = try values.decodeIfPresent(Int.self, forKey: .approvalStatusID)
		approvalStatus = try values.decodeIfPresent(String.self, forKey: .approvalStatus)
		remarks = try values.decodeIfPresent(String.self, forKey: .remarks)
		emailID = try values.decodeIfPresent(String.self, forKey: .emailID)
		isApprovable = try values.decodeIfPresent(Bool.self, forKey: .isApprovable)
		validFrom = try values.decodeIfPresent(String.self, forKey: .validFrom)
		validTo = try values.decodeIfPresent(String.self, forKey: .validTo)
		outletName = try values.decodeIfPresent(String.self, forKey: .outletName)
		redeemLocationAll = try values.decodeIfPresent(Bool.self, forKey: .redeemLocationAll)
		promotionId = try values.decodeIfPresent(Int.self, forKey: .promotionId)
	}

}