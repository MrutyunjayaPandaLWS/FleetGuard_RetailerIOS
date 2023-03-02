/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct MyProfileModel : Codable {
	let lstCustomerJson : [LstCustomerJson]?
	let lstVehicleJson : [String]?
	let lstCustomerOfficalInfoJson : [LstCustomerOfficalInfoJson]?
	let lstCustomerIdentityInfo : [LstCustomerIdentityInfo1]?
	let customerBasicInfoList : String?
	let objCustomer : String?
	let objCustomerDetails : String?
	let objCustomerOfficalInfo : String?
	let hierarchyMapDetails : String?
	let customerFamilyList : String?
	let customerPreferenceList : String?
	let mappedProductList : String?
	let subscriptionDetails : String?
	let lstWorkSiteInfoDetails : String?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case lstCustomerJson = "lstCustomerJson"
		case lstVehicleJson = "lstVehicleJson"
		case lstCustomerOfficalInfoJson = "lstCustomerOfficalInfoJson"
		case lstCustomerIdentityInfo = "lstCustomerIdentityInfo"
		case customerBasicInfoList = "customerBasicInfoList"
		case objCustomer = "objCustomer"
		case objCustomerDetails = "objCustomerDetails"
		case objCustomerOfficalInfo = "objCustomerOfficalInfo"
		case hierarchyMapDetails = "hierarchyMapDetails"
		case customerFamilyList = "customerFamilyList"
		case customerPreferenceList = "customerPreferenceList"
		case mappedProductList = "mappedProductList"
		case subscriptionDetails = "subscriptionDetails"
		case lstWorkSiteInfoDetails = "lstWorkSiteInfoDetails"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lstCustomerJson = try values.decodeIfPresent([LstCustomerJson].self, forKey: .lstCustomerJson)
		lstVehicleJson = try values.decodeIfPresent([String].self, forKey: .lstVehicleJson)
		lstCustomerOfficalInfoJson = try values.decodeIfPresent([LstCustomerOfficalInfoJson].self, forKey: .lstCustomerOfficalInfoJson)
		lstCustomerIdentityInfo = try values.decodeIfPresent([LstCustomerIdentityInfo1].self, forKey: .lstCustomerIdentityInfo)
		customerBasicInfoList = try values.decodeIfPresent(String.self, forKey: .customerBasicInfoList)
		objCustomer = try values.decodeIfPresent(String.self, forKey: .objCustomer)
		objCustomerDetails = try values.decodeIfPresent(String.self, forKey: .objCustomerDetails)
		objCustomerOfficalInfo = try values.decodeIfPresent(String.self, forKey: .objCustomerOfficalInfo)
		hierarchyMapDetails = try values.decodeIfPresent(String.self, forKey: .hierarchyMapDetails)
		customerFamilyList = try values.decodeIfPresent(String.self, forKey: .customerFamilyList)
		customerPreferenceList = try values.decodeIfPresent(String.self, forKey: .customerPreferenceList)
		mappedProductList = try values.decodeIfPresent(String.self, forKey: .mappedProductList)
		subscriptionDetails = try values.decodeIfPresent(String.self, forKey: .subscriptionDetails)
		lstWorkSiteInfoDetails = try values.decodeIfPresent(String.self, forKey: .lstWorkSiteInfoDetails)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
