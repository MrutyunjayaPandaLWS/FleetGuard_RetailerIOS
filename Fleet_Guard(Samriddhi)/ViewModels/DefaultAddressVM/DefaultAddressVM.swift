//
//  FG_DefaultAddressVm.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by ADMIN on 04/02/2023.
//

import UIKit

class DefaultAddressVM: popUpDelegate{
    func popupAlertDidTap(_ vc: FG_PopUpVC) {}
    
    weak var VC: FG_DefaultAddressVC?
    var requestApis = RestAPI_Requests()
    var defaultAddressArray = [LstCustomerJson]()
 
    
    func myProfileDetailsApi(parameter: JSON){
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestApis.myProfileDetailsApi(parameters: parameter) { (result, error) in
            if error == nil{
                if result != nil{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        self.defaultAddressArray = result?.lstCustomerJson ?? []
                        self.VC?.addressTextView.text = "\(self.defaultAddressArray[0].firstName ?? "-"),\n\(self.defaultAddressArray[0].mobile ?? "-"),\n\(self.defaultAddressArray[0].address1 ?? "-"),\n\(self.defaultAddressArray[0].cityName ?? "-"),\n\(self.defaultAddressArray[0].stateName ?? "-"),\n\(self.defaultAddressArray[0].countryName ?? "-"),\n\(self.defaultAddressArray[0].zip ?? "-")"
                        self.VC?.selectedname = self.defaultAddressArray[0].firstName ?? "-"
                        self.VC?.selectedemail = self.defaultAddressArray[0].email ?? "-"
                        self.VC?.selectedmobile = self.defaultAddressArray[0].mobile ?? "-"
                        self.VC?.selectedState = self.defaultAddressArray[0].stateName ?? "-"
                        self.VC?.selectedStateID = self.defaultAddressArray[0].stateId ?? 0
                        self.VC?.selectedCity = self.defaultAddressArray[0].cityName ?? "-"
                        self.VC?.selectedCityID = self.defaultAddressArray[0].cityId ?? 0
                        self.VC?.selectedaddress = self.defaultAddressArray[0].address1 ?? "-"
                        self.VC?.selectedpincode = self.defaultAddressArray[0].zip ?? "-"
                        self.VC?.selectedCountryId = self.defaultAddressArray[0].countryId ?? 0
                        self.VC?.selectedCountry = self.defaultAddressArray[0].countryName ?? "-"
                    }

                }else{
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                        print("\(error)")
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.VC?.stopLoading()
                    print("\(error)")
                }
            }
        }
    }
}
