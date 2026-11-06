//
//  LoginController.swift
//  ROAM
//
//  Created by Khayala Mirza on 29/10/2026.
//

import UIKit

class LoginController: BaseController {
    
    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in to see your favorites and saved plans."
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.textColor = .white
        tf.keyboardType = .emailAddress
        tf.backgroundColor = UIColor(named: "textfield_background")
        tf.font = .systemFont(ofSize: 16, weight: .regular)
        tf.layer.cornerRadius = 10
        tf.clipsToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your password"
        tf.textColor = .white
        tf.isSecureTextEntry = true
        tf.keyboardType = .default
        tf.backgroundColor = UIColor(named: "textfield_background")
        tf.font = .systemFont(ofSize: 16, weight: .regular)
        tf.layer.cornerRadius = 10
        tf.clipsToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    private var forgotPasswordButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Forgot Password?", for: .normal)
        bt.setTitleColor(UIColor(named: "button_bg"), for: .normal)
        bt.contentHorizontalAlignment = .right
        bt.backgroundColor = .clear
        bt.titleLabel?.font = .boldSystemFont(ofSize: 13)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    private var loginButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Log in", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.backgroundColor = UIColor(named: "button_bg")
        bt.layer.cornerRadius = 26
        bt.titleLabel?.font = .boldSystemFont(ofSize: 13)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    private var orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var googleButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Continue with Google", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = UIColor(named: "textfield_background")
        bt.layer.cornerRadius = 26
        bt.titleLabel?.font = .boldSystemFont(ofSize: 13)
        bt.addTarget(self, action: #selector(googleTapped), for: .touchUpInside)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    lazy var appleButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Continue with Apple", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = UIColor(named: "textfield_background")
        bt.layer.cornerRadius = 26
        bt.titleLabel?.font = .boldSystemFont(ofSize: 13)
        bt.addTarget(self, action: #selector(appleTapped), for: .touchUpInside)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    private var newHereLabel:UILabel = {
        let label = UILabel()
        label.text = "New here?"
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var signUpButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Sign up", for: .normal)
        bt.setTitleColor(UIColor(named: "button_bg"), for: .normal)
        bt.backgroundColor = .clear
        bt.titleLabel?.font = .boldSystemFont(ofSize: 13)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    private var continueAsGuestButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Continue as guest", for: .normal)
        bt.setTitleColor(.lightGray, for: .normal)
        bt.backgroundColor = .clear
        bt.titleLabel?.font = .boldSystemFont(ofSize: 13)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    private var loginStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 12
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    private var signUpStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 8
        sv.alignment = .center
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    private var signUpContainer: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private var users = [User]()
    private var adapter: LoginAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
                    image: UIImage(systemName: "chevron.left"),
                    style: .plain,
                    target: self,
            action: #selector(backButtonTapped))
    }
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    override func configureUI() {
        view.backgroundColor = UIColor(named: "background")
        
        adapter = LoginAdapter(controller: self)
        adapter?.completion = { data in
            print("email: \(data.email)")
            print("fullname: \(data.fullname)")
        }
        
        view.addSubview(loginStackView)
        
        loginStackView.addArrangedSubview(welcomeLabel)
        loginStackView.addArrangedSubview(infoLabel)
        loginStackView.addArrangedSubview(emailLabel)
        loginStackView.addArrangedSubview(emailTextField)
        loginStackView.addArrangedSubview(passwordLabel)
        loginStackView.addArrangedSubview(passwordTextField)
        loginStackView.addArrangedSubview(forgotPasswordButton)
        loginStackView.addArrangedSubview(loginButton)
        loginStackView.addArrangedSubview(orLabel)
        loginStackView.addArrangedSubview(googleButton)
        loginStackView.addArrangedSubview(appleButton)
        loginStackView.addArrangedSubview(signUpContainer)
        loginStackView.addArrangedSubview(continueAsGuestButton)
        
        signUpContainer.addSubview(signUpStackView)
        signUpStackView.addArrangedSubview(newHereLabel)
        signUpStackView.addArrangedSubview(signUpButton)
    }
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            loginStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.88),
            
            welcomeLabel.heightAnchor.constraint(equalToConstant: 36),
            infoLabel.heightAnchor.constraint(equalToConstant: 20),
            emailLabel.heightAnchor.constraint(equalToConstant: 12),
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
            passwordLabel.heightAnchor.constraint(equalToConstant: 12),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 20),
            loginButton.heightAnchor.constraint(equalToConstant: 56),
            orLabel.heightAnchor.constraint(equalToConstant: 16),
            googleButton.heightAnchor.constraint(equalToConstant: 52),
            appleButton.heightAnchor.constraint(equalToConstant: 52),
            continueAsGuestButton.heightAnchor.constraint(equalToConstant: 20),
            
            signUpContainer.heightAnchor.constraint(equalToConstant: 20),
            signUpStackView.topAnchor.constraint(equalTo: signUpContainer.topAnchor),
            signUpStackView.bottomAnchor.constraint(equalTo: signUpContainer.bottomAnchor),
            signUpStackView.centerXAnchor.constraint(equalTo: signUpContainer.centerXAnchor),
            
        ])
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        continueAsGuestButton.addTarget(self, action: #selector(asGuestTapped), for: .touchUpInside)
    }
    @objc private func loginTapped() {
        guard let writtenEmail = emailTextField.text, !writtenEmail.isEmpty, writtenEmail.contains("@"),
              let writtenPassword = passwordTextField.text, !writtenPassword.isEmpty
        else  {
            let message = "Login Incomplete! Try again. All gaps must be filled"
            showDefaultAlert(message: message)
            return
        }
        guard writtenPassword.count >= 8 else {
        showDefaultAlert(message: "Password must contain at least 8 characters.")
            return
        }
        if users.contains(where: {
            $0.email == writtenEmail &&  $0.password == writtenPassword
        }) {
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.setHomeAsRoot()
            }
            
        } else {
            showDefaultAlert(message: "Email or Password is incorrect")
        }
    }
    private func getFilePath() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0].appendingPathComponent("User.json")
    }
    private func fetchData() {
        do {
            let data = try Data(contentsOf: getFilePath())
            users = try JSONDecoder().decode([User].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    @objc private func forgotPasswordTapped() {
        let message = "It would be fixed"
        showDefaultAlert(message: message)
    }
    @objc private func googleTapped() {
        adapter?.loginWithGoogle()
    }
    @objc private func appleTapped() {
        adapter?.loginWithApple()
    }
    @objc private func signUpTapped() {
        let controller = RegisterController()
            navigationController?.pushViewController(controller, animated: true)
    }
    @objc private func asGuestTapped() {
        let controller = TabBarController()
            navigationController?.pushViewController(controller, animated: true)
    }
}
