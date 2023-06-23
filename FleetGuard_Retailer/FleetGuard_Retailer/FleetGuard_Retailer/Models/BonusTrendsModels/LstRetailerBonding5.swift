/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstRetailerBonding5 : Codable {
    let currentYearPoint : Int?
    let previousYearPoint : Int?
    let mileStonePoint : Int?
    let monthName : String?
    let monthNo : Int?
    let year : Int?
    let pointsEarned : Int?
    let totalPoint : Int?
    let previousOpeningBalance : Int?
    let grandTotalPoints : Int?
    let frequency : Int?
    let range : Int?
    let rowNo : Int?
    let retailerBondingId : Int?
    let statementCycle : String?
    let description : String?
    let rlP_NO : String?
    let outletName : String?
    let companyName : String?
    let date : String?
    let fromDate : String?
    let toDate : String?
    let milstoneCode : String?
    let status : String?
    let pdF_LINK : String?

    enum CodingKeys: String, CodingKey {

        case currentYearPoint = "currentYearPoint"
        case previousYearPoint = "previousYearPoint"
        case mileStonePoint = "mileStonePoint"
        case monthName = "monthName"
        case monthNo = "monthNo"
        case year = "year"
        case pointsEarned = "pointsEarned"
        case totalPoint = "totalPoint"
        case previousOpeningBalance = "previousOpeningBalance"
        case grandTotalPoints = "grandTotalPoints"
        case frequency = "frequency"
        case range = "range"
        case rowNo = "rowNo"
        case retailerBondingId = "retailerBondingId"
        case statementCycle = "statementCycle"
        case description = "description"
        case rlP_NO = "rlP_NO"
        case outletName = "outletName"
        case companyName = "companyName"
        case date = "date"
        case fromDate = "fromDate"
        case toDate = "toDate"
        case milstoneCode = "milstoneCode"
        case status = "status"
        case pdF_LINK = "pdF_LINK"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        currentYearPoint = try values.decodeIfPresent(Int.self, forKey: .currentYearPoint)
        previousYearPoint = try values.decodeIfPresent(Int.self, forKey: .previousYearPoint)
        mileStonePoint = try values.decodeIfPresent(Int.self, forKey: .mileStonePoint)
        monthName = try values.decodeIfPresent(String.self, forKey: .monthName)
        monthNo = try values.decodeIfPresent(Int.self, forKey: .monthNo)
        year = try values.decodeIfPresent(Int.self, forKey: .year)
        pointsEarned = try values.decodeIfPresent(Int.self, forKey: .pointsEarned)
        totalPoint = try values.decodeIfPresent(Int.self, forKey: .totalPoint)
        previousOpeningBalance = try values.decodeIfPresent(Int.self, forKey: .previousOpeningBalance)
        grandTotalPoints = try values.decodeIfPresent(Int.self, forKey: .grandTotalPoints)
        frequency = try values.decodeIfPresent(Int.self, forKey: .frequency)
        range = try values.decodeIfPresent(Int.self, forKey: .range)
        rowNo = try values.decodeIfPresent(Int.self, forKey: .rowNo)
        retailerBondingId = try values.decodeIfPresent(Int.self, forKey: .retailerBondingId)
        statementCycle = try values.decodeIfPresent(String.self, forKey: .statementCycle)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        rlP_NO = try values.decodeIfPresent(String.self, forKey: .rlP_NO)
        outletName = try values.decodeIfPresent(String.self, forKey: .outletName)
        companyName = try values.decodeIfPresent(String.self, forKey: .companyName)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        fromDate = try values.decodeIfPresent(String.self, forKey: .fromDate)
        toDate = try values.decodeIfPresent(String.self, forKey: .toDate)
        milstoneCode = try values.decodeIfPresent(String.self, forKey: .milstoneCode)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        pdF_LINK = try values.decodeIfPresent(String.self, forKey: .pdF_LINK)
    }

}
