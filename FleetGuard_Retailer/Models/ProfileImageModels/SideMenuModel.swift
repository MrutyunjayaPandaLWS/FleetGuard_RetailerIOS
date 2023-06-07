//
//  SideMenuModel.swift
//  Plumbedin Rewards
//
//  Created by Arkmacbook on 02/07/21.
//

import Foundation

struct SideMenuModel {
    var parentName : String?
    var parentList : [SecondMenuList]?
    var parentID : Int?
    var parentExpand : Bool?
    var parentImage : String?
    var parentDropDownImage: String?
}

struct SecondMenuList {
    var sideMenuItem : String?
    var sideMenuID : Int?
    var sidemenuImage : String?
}
