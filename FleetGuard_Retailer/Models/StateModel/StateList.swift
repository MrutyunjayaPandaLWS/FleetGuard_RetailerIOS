/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct StateList : Codable {
	let stateId : Int?
	let stateName : String?
	let stateCode : String?
	let countryId : Int?
	let countryName : String?
	let countryCode : String?
	let isActive : Bool?
	let countryType : String?
	let mobilePrefix : String?
	let row : Int?

	enum CodingKeys: String, CodingKey {

		case stateId = "stateId"
		case stateName = "stateName"
		case stateCode = "stateCode"
		case countryId = "countryId"
		case countryName = "countryName"
		case countryCode = "countryCode"
		case isActive = "isActive"
		case countryType = "countryType"
		case mobilePrefix = "mobilePrefix"
		case row = "row"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		stateId = try values.decodeIfPresent(Int.self, forKey: .stateId)
		stateName = try values.decodeIfPresent(String.self, forKey: .stateName)
		stateCode = try values.decodeIfPresent(String.self, forKey: .stateCode)
		countryId = try values.decodeIfPresent(Int.self, forKey: .countryId)
		countryName = try values.decodeIfPresent(String.self, forKey: .countryName)
		countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		countryType = try values.decodeIfPresent(String.self, forKey: .countryType)
		mobilePrefix = try values.decodeIfPresent(String.self, forKey: .mobilePrefix)
		row = try values.decodeIfPresent(Int.self, forKey: .row)
	}

}