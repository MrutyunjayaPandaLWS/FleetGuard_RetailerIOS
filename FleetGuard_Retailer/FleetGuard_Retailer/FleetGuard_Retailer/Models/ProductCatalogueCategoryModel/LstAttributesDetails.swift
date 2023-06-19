/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstAttributesDetails : Codable {
    let attributeId : Int?
    let totalEarning : Double?
    let categoryCode : String?
    let imageUrl : String?
    let attributeValue : String?
    let attributeType : String?
    let attributeContents : String?
    let attributeNames : String?
    let attributeCurrencyId : String?

    enum CodingKeys: String, CodingKey {

        case attributeId = "attributeId"
        case totalEarning = "totalEarning"
        case categoryCode = "categoryCode"
        case imageUrl = "imageUrl"
        case attributeValue = "attributeValue"
        case attributeType = "attributeType"
        case attributeContents = "attributeContents"
        case attributeNames = "attributeNames"
        case attributeCurrencyId = "attributeCurrencyId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        attributeId = try values.decodeIfPresent(Int.self, forKey: .attributeId)
        totalEarning = try values.decodeIfPresent(Double.self, forKey: .totalEarning)
        categoryCode = try values.decodeIfPresent(String.self, forKey: .categoryCode)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
        attributeValue = try values.decodeIfPresent(String.self, forKey: .attributeValue)
        attributeType = try values.decodeIfPresent(String.self, forKey: .attributeType)
        attributeContents = try values.decodeIfPresent(String.self, forKey: .attributeContents)
        attributeNames = try values.decodeIfPresent(String.self, forKey: .attributeNames)
        attributeCurrencyId = try values.decodeIfPresent(String.self, forKey: .attributeCurrencyId)
    }

}
