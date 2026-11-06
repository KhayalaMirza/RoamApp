//
//  LoginAdapter.swift
//  ROAM
//
//  Created by Khayala Mirza on 05/11/2026.

import Foundation
import GoogleSignIn
import AuthenticationServices

class LoginAdapter: NSObject {
    var controller: LoginController
    
    var completion: ((UserGoogle) -> Void)?
    
    init(controller: LoginController) {
        self.controller = controller
        super.init()
    }
    func loginWithGoogle() {
        GIDSignIn.sharedInstance.signIn(withPresenting: controller) { signInResult, error in
            guard error == nil else { return }
            guard let signInResult = signInResult else { return }
            
            let user = signInResult.user
            let emailAddress = user.profile?.email
            let fullName = user.profile?.name
        
            let userModel: UserGoogle = .init(email: emailAddress ?? "",
                                        fullname: fullName ?? "")
            self.completion?(userModel)
        }
    }
    func loginWithApple() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}
extension LoginAdapter: ASAuthorizationControllerDelegate {

    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential
        else { return }
        let email = credential.email ?? ""
        let fullName = PersonNameComponentsFormatter().string(from: credential.fullName ?? PersonNameComponents())
        let user = UserGoogle(email: email,
                        fullname: fullName)
        completion?(user)
    }
    func authorizationController (controller: ASAuthorizationController, didCompleteWithError error: Error) {
        if let authError = error as? ASAuthorizationError, authError.code == .canceled { return }
        print("Apple Sign In Error:\(error.localizedDescription)")
    }
}
extension LoginAdapter: ASAuthorizationControllerPresentationContextProviding {

    func presentationAnchor( for controller: ASAuthorizationController ) -> ASPresentationAnchor {
    guard let window = self.controller.view.window else { fatalError("LoginController window not found")
    }
     return window
    }
}
