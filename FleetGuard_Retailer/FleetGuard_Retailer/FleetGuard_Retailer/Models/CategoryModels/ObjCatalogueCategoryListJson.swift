/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ObjCatalogueCategoryListJson : Codable {
	let catogoryId : Int?
	let catalogueBrandId : Int?
	let catalogueBrandName : String?
	let catogoryName : String?
	let subCategoryID : Int?
	let subCategoryName : String?
	let catogoryImage : String?
	let memberId : String?
	let redemptionDateTime : String?
	let redemptionRefNo : String?
	let preferedModeOfRedemption : String?
	let redemptionStatus : String?
	let encashValue : String?
	let totalPointsRedemed : String?
	let schemeId : Int?
	let token : String?
	let actorId : Int?
	let isActive : Bool?
	let actorRole : String?
	let actionType : Int?

	enum CodingKeys: String, CodingKey {

		case catogoryId = "catogoryId"
		case catalogueBrandId = "catalogueBrandId"
		case catalogueBrandName = "catalogueBrandName"
		case catogoryName = "catogoryName"
		case subCategoryID = "subCategoryID"
		case subCategoryName = "subCategoryName"
		case catogoryImage = "catogoryImage"
		case memberId = "memberId"
		case redemptionDateTime = "redemptionDateTime"
		case redemptionRefNo = "redemptionRefNo"
		case preferedModeOfRedemption = "preferedModeOfRedemption"
		case redemptionStatus = "redemptionStatus"
		case encashValue = "encashValue"
		case totalPointsRedemed = "totalPointsRedemed"
		case schemeId = "schemeId"
		case token = "token"
		case actorId = "actorId"
		case isActive = "isActive"
		case actorRole = "actorRole"
		case actionType = "actionType"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		catogoryId = try values.decodeIfPresent(Int.self, forKey: .catogoryId)
		catalogueBrandId = try values.decodeIfPresent(Int.self, forKey: .catalogueBrandId)
		catalogueBrandName = try values.decodeIfPresent(String.self, forKey: .catalogueBrandName)
		catogoryName = try values.decodeIfPresent(String.self, forKey: .catogoryName)
		subCategoryID = try values.decodeIfPresent(Int.self, forKey: .subCategoryID)
		subCategoryName = try values.decodeIfPresent(String.self, forKey: .subCategoryName)
		catogoryImage = try values.decodeIfPresent(String.self, forKey: .catogoryImage)
		memberId = try values.decodeIfPresent(String.self, forKey: .memberId)
		redemptionDateTime = try values.decodeIfPresent(String.self, forKey: .redemptionDateTime)
		redemptionRefNo = try values.decodeIfPresent(String.self, forKey: .redemptionRefNo)
		preferedModeOfRedemption = try values.decodeIfPresent(String.self, forKey: .preferedModeOfRedemption)
		redemptionStatus = try values.decodeIfPresent(String.self, forKey: .redemptionStatus)
		encashValue = try values.decodeIfPresent(String.self, forKey: .encashValue)
		totalPointsRedemed = try values.decodeIfPresent(String.self, forKey: .totalPointsRedemed)
		schemeId = try values.decodeIfPresent(Int.self, forKey: .schemeId)
		token = try values.decodeIfPresent(String.self, forKey: .token)
		actorId = try values.decodeIfPresent(Int.self, forKey: .actorId)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		actorRole = try values.decodeIfPresent(String.self, forKey: .actorRole)
		actionType = try values.decodeIfPresent(Int.self, forKey: .actionType)
	}

}