//
//  AuthViewModel.swift
//  maggnet
//
//  Created by Deepak on 12/09/22.
//

import Foundation
import Combine
import SwiftUI

class AuthViewModel: AlertViewModel, ObservableObject {
    
    @AppStorage( "newRelease" ) private var newRelease: Bool = true
    @AppStorage( "initialToken" ) private var initialToken: String = ""
    @AppStorage("token") private var token: String = ""
    @AppStorage("username") private var username: String = ""
    @AppStorage( "userID" ) private var userID: Int = 0
    @AppStorage( "interestedInCategory" ) private var interestedInCategory: Int = 0
    @AppStorage( "genderPreference" ) private var locallyStoredGenderPreference: Int = 0
    
    @Published var birthdayDate: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date()) ?? Date()
    @Published var signUpCountryCode: String = "United States"
    @Published var signUpPhoneNumber: String = ""
    @Published var singUpVerificationCode: String = ""
    @Published var signUpFullName: String = ""
    @Published var signUpGender: Int? = nil
    
    @Published var agreement: Bool = false
    
    @Published var genderFilter: String = ""
    
    @Published var signInCountryCode: String = "United States"
    @Published var signInPhoneNumber: String = ""
    @Published var signInVerificationCode: String = ""
    
    @Published var navigateToSignInVerificationCode: Bool = false
    
    // alerts
    @Published var showAlert: Bool = false
    @Published var sendVerificationCodeAlertMessage: String = ""
    
    @Published var showSignUpAlert: Bool = false
    @Published var signUpAlertMessage: String = ""
    
    @Published var showCheckVerificationCodeAlert: Bool = false
    @Published var checkVerificationCodeAlertMessage: String = ""
    
    @Published var navigateToCheckVerificationCode: Bool = false
    @Published var navigateToFullNamePage: Bool = false
    @Published var navigateToChooseGender: Bool = false
    
    // check publishers validation
    @Published var isSendVerificationCodeClickable: Bool = false
    @Published var isCheckVerificationCodeClickable: Bool = false
    @Published var isSignInProceedClickable: Bool = false
    
    @Published var loadingGenders: Bool = false
    @Published var connectionType: Int? = nil
    
    @Published var genderPreference: Int = 0
    
    @Published var loadingConnectionTypes: Bool = false
    

    
//    private var cancellableSet: Set<AnyCancellable> = []
//    var dataManager: AuthServiceProtocol
//
//    init( dataManager: AuthServiceProtocol = AuthService.shared) {
//        self.dataManager = dataManager
//        super.init()
//
//        isSignUpPhoneNumberValidPublisher
//            .receive(on: RunLoop.main)
//            .assign(to: \.isSendVerificationCodeClickable, on: self)
//            .store(in: &cancellableSet)
//
//        isVerificationCodeValidPublisher
//            .receive(on: RunLoop.main)
//            .assign(to: \.isCheckVerificationCodeClickable, on: self)
//            .store(in: &cancellableSet)
//
//        isSignInPhoneNumberValidPublisher
//            .receive(on: RunLoop.main)
//            .assign(to: \.isSignInProceedClickable, on: self)
//            .store(in: &cancellableSet)
//    }
//
//    // sign up
//    private var isSignUpPhoneNumberValidPublisher: AnyPublisher<Bool, Never> {
//        $signUpPhoneNumber
//            .map { !$0.isEmpty }
//            .eraseToAnyPublisher()
//    }
//
//    private var isVerificationCodeValidPublisher: AnyPublisher<Bool, Never> {
//        $singUpVerificationCode
//            .map { $0.count == 6 }
//            .eraseToAnyPublisher()
//    }
//
//    // sign in
//    private var isSignInPhoneNumberValidPublisher: AnyPublisher<Bool, Never> {
//        $signInPhoneNumber
//            .map { !$0.isEmpty }
//            .eraseToAnyPublisher()
//    }
}
