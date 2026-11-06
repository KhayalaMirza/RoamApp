//
//  RegisterController.swift
//  ROAM
//
//  Created by Khayala Mirza on 05/11/2026.
//

import UIKit

class RegisterController: BaseController {
    
    private var createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Create account"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Save tours, places and AI plans in one place."
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Full name"
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var fullNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Your fullname"
        tf.textColor = .white
        tf.keyboardType = .default
        tf.textContentType = .name
        tf.autocapitalizationType = .words
        tf.backgroundColor = UIColor(named: "textfield_background")
        tf.font = .systemFont(ofSize: 16, weight: .regular)
        tf.layer.cornerRadius = 10
        tf.clipsToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
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
        tf.placeholder = "name@gmail.com"
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
        tf.placeholder = "At least 8 characters"
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
    private var agreeTermsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        button.tintColor = .systemGray
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private var agreeTermsLabel: UILabel = {
        let label = UILabel()
        label.text = "I agree to the Terms and Privacy Policy"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var signUpButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Sign up", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.backgroundColor = UIColor(named: "button_bg")
        bt.layer.cornerRadius = 26
        bt.titleLabel?.font = .boldSystemFont(ofSize: 16)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    private var alreadyHaveAccountLabel:UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var loginButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Log in", for: .normal)
        bt.setTitleColor(UIColor(named: "button_bg"), for: .normal)
        bt.backgroundColor = .clear
        bt.titleLabel?.font = .boldSystemFont(ofSize: 12)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    private var registerStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 12
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    private var agreeTermsStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 8
        sv.alignment = .center
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    private var agreeTermsContainer: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    private var loginStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 8
        sv.alignment = .center
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    private var loginContainer: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func configureUI() {
        view.backgroundColor = UIColor(named: "background")
        
        view.addSubview(registerStackView)
        
        registerStackView.addArrangedSubview(createAccountLabel)
        registerStackView.addArrangedSubview(infoLabel)
        registerStackView.addArrangedSubview(fullNameLabel)
        registerStackView.addArrangedSubview(fullNameTextField)
        registerStackView.addArrangedSubview(emailLabel)
        registerStackView.addArrangedSubview(emailTextField)
        registerStackView.addArrangedSubview(passwordLabel)
        registerStackView.addArrangedSubview(passwordTextField)
        registerStackView.addArrangedSubview(agreeTermsContainer)
        
        agreeTermsContainer.addSubview(agreeTermsStackView)
        agreeTermsStackView.addArrangedSubview(agreeTermsButton)
        agreeTermsStackView.addArrangedSubview(agreeTermsLabel)
        
        registerStackView.addArrangedSubview(signUpButton)
        registerStackView.addArrangedSubview(loginContainer)
        
        loginContainer.addSubview(loginStackView)
        loginStackView.addArrangedSubview(alreadyHaveAccountLabel)
        loginStackView.addArrangedSubview(loginButton)
    }
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            registerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            registerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.88),
            
            createAccountLabel.heightAnchor.constraint(equalToConstant: 36),
            infoLabel.heightAnchor.constraint(equalToConstant: 20),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 12),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 52),
            emailLabel.heightAnchor.constraint(equalToConstant: 12),
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
            passwordLabel.heightAnchor.constraint(equalToConstant: 12),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            agreeTermsButton.heightAnchor.constraint(equalToConstant: 22),
            agreeTermsButton.widthAnchor.constraint(equalToConstant: 22),
            agreeTermsLabel.heightAnchor.constraint(equalToConstant: 22),
            signUpButton.heightAnchor.constraint(equalToConstant: 54),
            
            agreeTermsContainer.heightAnchor.constraint(equalToConstant: 22),
            agreeTermsStackView.topAnchor.constraint(equalTo: agreeTermsContainer.topAnchor),
            agreeTermsStackView.bottomAnchor.constraint(equalTo: agreeTermsContainer.bottomAnchor),
            agreeTermsStackView.leadingAnchor.constraint(equalTo: agreeTermsContainer.leadingAnchor),
            agreeTermsStackView.trailingAnchor.constraint(lessThanOrEqualTo: agreeTermsContainer.trailingAnchor),

            loginContainer.heightAnchor.constraint(equalToConstant: 18),
            loginStackView.topAnchor.constraint(equalTo: loginContainer.topAnchor),
            loginStackView.bottomAnchor.constraint(equalTo: loginContainer.bottomAnchor),
            loginStackView.centerXAnchor.constraint(equalTo: loginContainer.centerXAnchor),
        ])
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        agreeTermsButton.addTarget(self, action: #selector(agreeTermsTapped), for: .touchUpInside)
    }
    @objc private func signUpButtonTapped() {
        guard let writtenFullName = fullNameTextField.text, !writtenFullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
        let writtenEmail = emailTextField.text, !writtenEmail.isEmpty, writtenEmail.contains("@")
         else {
        showDefaultAlert(message: "Sign Up Incomplete! All fields must be filled. Email must be contain @.")
                return
        }
        guard let writtenPassword = passwordTextField.text,!writtenPassword.isEmpty, writtenPassword.count >= 8 else {
        showDefaultAlert(message: "Password must contain at least 8 characters.")
                return
        }
        guard !users.contains(where: { $0.email == writtenEmail }) else {
        showDefaultAlert(message: "This email is already registered.")
                return
            }
        let user = User(
            email: emailTextField.text ?? "",
            fullname: fullNameTextField.text ?? "",
            password: passwordTextField.text ?? "")
        UserDefaults.standard.set(user.fullname, forKey: "fullname")
        UserDefaults.standard.set(user.email, forKey: "email")
        UserDefaults.standard.set(user.password, forKey: "password")
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        saveUser()
        users.append(user)
        let login = LoginController()
        navigationController?.pushViewController(login, animated: true)
    }
    private func getFilePath() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls[0].appendingPathComponent("User.json")
        print(url)
        return url
    }
    private func saveUser() {
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: getFilePath())
        } catch {
            print(error.localizedDescription)
        }
    }
    private func fetchData() {
        do {
            let data = try Data(contentsOf: getFilePath())
            users = try JSONDecoder().decode([User].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @objc private func loginButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    @objc private func agreeTermsTapped() {
        agreeTermsButton.isSelected.toggle()
    }
}
