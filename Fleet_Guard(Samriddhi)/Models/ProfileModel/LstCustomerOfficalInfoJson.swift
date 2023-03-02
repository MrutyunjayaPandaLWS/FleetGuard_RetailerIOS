/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstCustomerOfficalInfoJson : Codable {
	let companyName : String?
	let phoneResidence : String?
	let phoneOffice : String?
	let officalEmail : String?
	let designation : String?
	let incorporationDate : String?
	let firmTypeID : Int?
	let firmSize : String?
	let firmMobile : String?
	let stdCode : String?
	let jobTypeID : Int?
	let sapCode : String?
	let gstNumber : String?
	let storeName : String?
	let departmentIdOfficial : Int?
	let designationIdOfficial : Int?
	let ownerName : String?
	let venderCode : String?
	let targetValue : Int?
	let targetCreditPeriod : Int?
	let industryID : Int?
	let countryId : Int?
	let stateId : Int?
	let zip : String?
	let cityId : Int?
	let firmAddress : String?
	let countryName : String?
	let stateName : String?
	let cityName : String?
	let firmTypeName : String?
	let jobTypeName : String?
	let address : String?
	let tahasilImage : String?
	let establishDate : String?
	let isGSTNumber : String?
	let targetPoint : Int?

	enum CodingKeys: String, CodingKey {

		case companyName = "companyName"
		case phoneResidence = "phoneResidence"
		case phoneOffice = "phoneOffice"
		case officalEmail = "officalEmail"
		case designation = "designation"
		case incorporationDate = "incorporationDate"
		case firmTypeID = "firmTypeID"
		case firmSize = "firmSize"
		case firmMobile = "firmMobile"
		case stdCode = "stdCode"
		case jobTypeID = "jobTypeID"
		case sapCode = "sapCode"
		case gstNumber = "gstNumber"
		case storeName = "storeName"
		case departmentIdOfficial = "departmentIdOfficial"
		case designationIdOfficial = "designationIdOfficial"
		case ownerName = "ownerName"
		case venderCode = "venderCode"
		case targetValue = "targetValue"
		case targetCreditPeriod = "targetCreditPeriod"
		case industryID = "industryID"
		case countryId = "countryId"
		case stateId = "stateId"
		case zip = "zip"
		case cityId = "cityId"
		case firmAddress = "firmAddress"
		case countryName = "countryName"
		case stateName = "stateName"
		case cityName = "cityName"
		case firmTypeName = "firmTypeName"
		case jobTypeName = "jobTypeName"
		case address = "address"
		case tahasilImage = "tahasilImage"
		case establishDate = "establishDate"
		case isGSTNumber = "isGSTNumber"
		case targetPoint = "targetPoint"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		companyName = try values.decodeIfPresent(String.self, forKey: .companyName)
		phoneResidence = try values.decodeIfPresent(String.self, forKey: .phoneResidence)
		phoneOffice = try values.decodeIfPresent(String.self, forKey: .phoneOffice)
		officalEmail = try values.decodeIfPresent(String.self, forKey: .officalEmail)
		designation = try values.decodeIfPresent(String.self, forKey: .designation)
		incorporationDate = try values.decodeIfPresent(String.self, forKey: .incorporationDate)
		firmTypeID = try values.decodeIfPresent(Int.self, forKey: .firmTypeID)
		firmSize = try values.decodeIfPresent(String.self, forKey: .firmSize)
		firmMobile = try values.decodeIfPresent(String.self, forKey: .firmMobile)
		stdCode = try values.decodeIfPresent(String.self, forKey: .stdCode)
		jobTypeID = try values.decodeIfPresent(Int.self, forKey: .jobTypeID)
		sapCode = try values.decodeIfPresent(String.self, forKey: .sapCode)
		gstNumber = try values.decodeIfPresent(String.self, forKey: .gstNumber)
		storeName = try values.decodeIfPresent(String.self, forKey: .storeName)
		departmentIdOfficial = try values.decodeIfPresent(Int.self, forKey: .departmentIdOfficial)
		designationIdOfficial = try values.decodeIfPresent(Int.self, forKey: .designationIdOfficial)
		ownerName = try values.decodeIfPresent(String.self, forKey: .ownerName)
		venderCode = try values.decodeIfPresent(String.self, forKey: .venderCode)
		targetValue = try values.decodeIfPresent(Int.self, forKey: .targetValue)
		targetCreditPeriod = try values.decodeIfPresent(Int.self, forKey: .targetCreditPeriod)
		industryID = try values.decodeIfPresent(Int.self, forKey: .industryID)
		countryId = try values.decodeIfPresent(Int.self, forKey: .countryId)
		stateId = try values.decodeIfPresent(Int.self, forKey: .stateId)
		zip = try values.decodeIfPresent(String.self, forKey: .zip)
		cityId = try values.decodeIfPresent(Int.self, forKey: .cityId)
		firmAddress = try values.decodeIfPresent(String.self, forKey: .firmAddress)
		countryName = try values.decodeIfPresent(String.self, forKey: .countryName)
		stateName = try values.decodeIfPresent(String.self, forKey: .stateName)
		cityName = try values.decodeIfPresent(String.self, forKey: .cityName)
		firmTypeName = try values.decodeIfPresent(String.self, forKey: .firmTypeName)
		jobTypeName = try values.decodeIfPresent(String.self, forKey: .jobTypeName)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		tahasilImage = try values.decodeIfPresent(String.self, forKey: .tahasilImage)
		establishDate = try values.decodeIfPresent(String.self, forKey: .establishDate)
		isGSTNumber = try values.decodeIfPresent(String.self, forKey: .isGSTNumber)
		targetPoint = try values.decodeIfPresent(Int.self, forKey: .targetPoint)
	}

}