/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstPushHistoryJson : Codable {
	let pushHistoryId : Int?
	let modifiedBy : Int?
	let createdDate : String?
	let jCreatedDate : String?
	let createdBy : Int?
	let sourceType : String?
	let isActive : Int?
	let isRead : Int?
	let pushMessage : String?
	let pushId : String?
	let loyaltyId : String?
	let pushType : String?
	let imagesURL : String?
	let title : String?

	enum CodingKeys: String, CodingKey {

		case pushHistoryId = "pushHistoryId"
		case modifiedBy = "modifiedBy"
		case createdDate = "createdDate"
		case jCreatedDate = "jCreatedDate"
		case createdBy = "createdBy"
		case sourceType = "sourceType"
		case isActive = "isActive"
		case isRead = "isRead"
		case pushMessage = "pushMessage"
		case pushId = "pushId"
		case loyaltyId = "loyaltyId"
		case pushType = "pushType"
		case imagesURL = "imagesURL"
		case title = "title"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		pushHistoryId = try values.decodeIfPresent(Int.self, forKey: .pushHistoryId)
		modifiedBy = try values.decodeIfPresent(Int.self, forKey: .modifiedBy)
		createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
		jCreatedDate = try values.decodeIfPresent(String.self, forKey: .jCreatedDate)
		createdBy = try values.decodeIfPresent(Int.self, forKey: .createdBy)
		sourceType = try values.decodeIfPresent(String.self, forKey: .sourceType)
		isActive = try values.decodeIfPresent(Int.self, forKey: .isActive)
		isRead = try values.decodeIfPresent(Int.self, forKey: .isRead)
		pushMessage = try values.decodeIfPresent(String.self, forKey: .pushMessage)
		pushId = try values.decodeIfPresent(String.self, forKey: .pushId)
		loyaltyId = try values.decodeIfPresent(String.self, forKey: .loyaltyId)
		pushType = try values.decodeIfPresent(String.self, forKey: .pushType)
		imagesURL = try values.decodeIfPresent(String.self, forKey: .imagesURL)
		title = try values.decodeIfPresent(String.self, forKey: .title)
	}

}