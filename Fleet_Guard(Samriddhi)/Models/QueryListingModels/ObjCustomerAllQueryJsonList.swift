/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ObjCustomerAllQueryJsonList : Codable {
	let customerTicketID : Int?
	let customerTicketRefNo : String?
	let createdDate : String?
	let jCreatedDate : String?
	let helpTopic : String?
	let ticketStatus : String?
	let lastModifiedDate : String?
	let jLastModifiedDate : String?
	let modifiedBy : String?
	let querySummary : String?
	let queryDetails : String?
	let helpTopicID : Int?
	let querySource : String?
	let subHelpTopic : String?
	let subHelpTopicID : Int?
	let totalRows : Int?
	let rating : String?
	let memberName : String?
	let memberId : String?
	let mobile : String?
	let deviceId : String?
	let comments : String?
	let isReply : Int?

	enum CodingKeys: String, CodingKey {

		case customerTicketID = "customerTicketID"
		case customerTicketRefNo = "customerTicketRefNo"
		case createdDate = "createdDate"
		case jCreatedDate = "jCreatedDate"
		case helpTopic = "helpTopic"
		case ticketStatus = "ticketStatus"
		case lastModifiedDate = "lastModifiedDate"
		case jLastModifiedDate = "jLastModifiedDate"
		case modifiedBy = "modifiedBy"
		case querySummary = "querySummary"
		case queryDetails = "queryDetails"
		case helpTopicID = "helpTopicID"
		case querySource = "querySource"
		case subHelpTopic = "subHelpTopic"
		case subHelpTopicID = "subHelpTopicID"
		case totalRows = "totalRows"
		case rating = "rating"
		case memberName = "memberName"
		case memberId = "memberId"
		case mobile = "mobile"
		case deviceId = "deviceId"
		case comments = "comments"
		case isReply = "isReply"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		customerTicketID = try values.decodeIfPresent(Int.self, forKey: .customerTicketID)
		customerTicketRefNo = try values.decodeIfPresent(String.self, forKey: .customerTicketRefNo)
		createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
		jCreatedDate = try values.decodeIfPresent(String.self, forKey: .jCreatedDate)
		helpTopic = try values.decodeIfPresent(String.self, forKey: .helpTopic)
		ticketStatus = try values.decodeIfPresent(String.self, forKey: .ticketStatus)
		lastModifiedDate = try values.decodeIfPresent(String.self, forKey: .lastModifiedDate)
		jLastModifiedDate = try values.decodeIfPresent(String.self, forKey: .jLastModifiedDate)
		modifiedBy = try values.decodeIfPresent(String.self, forKey: .modifiedBy)
		querySummary = try values.decodeIfPresent(String.self, forKey: .querySummary)
		queryDetails = try values.decodeIfPresent(String.self, forKey: .queryDetails)
		helpTopicID = try values.decodeIfPresent(Int.self, forKey: .helpTopicID)
		querySource = try values.decodeIfPresent(String.self, forKey: .querySource)
		subHelpTopic = try values.decodeIfPresent(String.self, forKey: .subHelpTopic)
		subHelpTopicID = try values.decodeIfPresent(Int.self, forKey: .subHelpTopicID)
		totalRows = try values.decodeIfPresent(Int.self, forKey: .totalRows)
		rating = try values.decodeIfPresent(String.self, forKey: .rating)
		memberName = try values.decodeIfPresent(String.self, forKey: .memberName)
		memberId = try values.decodeIfPresent(String.self, forKey: .memberId)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		deviceId = try values.decodeIfPresent(String.self, forKey: .deviceId)
		comments = try values.decodeIfPresent(String.self, forKey: .comments)
		isReply = try values.decodeIfPresent(Int.self, forKey: .isReply)
	}

}