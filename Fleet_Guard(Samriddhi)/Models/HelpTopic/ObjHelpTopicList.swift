/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ObjHelpTopicList : Codable {
	let helpTopicId : Int?
	let helpTopicName : String?
	let iS_ACTIVE : Bool?
	let escalationInHours : Int?
	let createDate : String?
	let type : Int?
	let subHelpTopicId : Int?
	let subHelpTopicName : String?
	let customerView : Bool?

	enum CodingKeys: String, CodingKey {

		case helpTopicId = "helpTopicId"
		case helpTopicName = "helpTopicName"
		case iS_ACTIVE = "iS_ACTIVE"
		case escalationInHours = "escalationInHours"
		case createDate = "createDate"
		case type = "type"
		case subHelpTopicId = "subHelpTopicId"
		case subHelpTopicName = "subHelpTopicName"
		case customerView = "customerView"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		helpTopicId = try values.decodeIfPresent(Int.self, forKey: .helpTopicId)
		helpTopicName = try values.decodeIfPresent(String.self, forKey: .helpTopicName)
		iS_ACTIVE = try values.decodeIfPresent(Bool.self, forKey: .iS_ACTIVE)
		escalationInHours = try values.decodeIfPresent(Int.self, forKey: .escalationInHours)
		createDate = try values.decodeIfPresent(String.self, forKey: .createDate)
		type = try values.decodeIfPresent(Int.self, forKey: .type)
		subHelpTopicId = try values.decodeIfPresent(Int.self, forKey: .subHelpTopicId)
		subHelpTopicName = try values.decodeIfPresent(String.self, forKey: .subHelpTopicName)
		customerView = try values.decodeIfPresent(Bool.self, forKey: .customerView)
	}

}