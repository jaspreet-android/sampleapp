//
//  AlertView.swift
//  maggnet
//
//  Created by Deepak on 12/09/22.
//

import Foundation
import SwiftUI

class AlertViewModel {
    
    @AppStorage("token") private var token: String = ""
    @AppStorage("username") private var username: String = ""
    @AppStorage( "userID" ) private var userID: Int = 0
    
    func makeAlert(with error: NetworkError, message: inout String, alert: inout Bool ) {
        
        if error.initialError.responseCode == 401 {
            self.token = ""
            self.username = ""
            self.userID = 0
        } else {
            message = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
            alert.toggle()
        }
    }
    
    func makeSuccessAlert( with response: GlobalResponse, showAlert: inout Bool, alertMessage: inout String ) {
        alertMessage = response.message
        showAlert.toggle()
    }

}
