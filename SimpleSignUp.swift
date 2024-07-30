    
                                            
import SwiftUI

struct SimpleSignUpView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            // Lock icon
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 84, height: 84)
                .foregroundColor(.blue)
                .padding(.bottom, 20)
            
            VStack(spacing: 8) {
                // Welcome text
                Text("Welcome to ")
                    .font(.title)
                    .fontWeight(.bold) +
                Text("SwiftUI.art")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                // Subtitle text
                Text("Create your account")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }.padding()

            
            // First name TextField
            TextField("First name", text: $firstName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            // Last name TextField
            TextField("Last name", text: $lastName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            // Email TextField
            TextField("Email address", text: $email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
            
            // Password SecureField
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .textContentType(.password)
            
            // Error message
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
                    .padding([.top, .horizontal])
            }
            
            // Sign Up button
            Button(action: {
                signUp()
            }) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(maxWidth: .infinity)
                        .padding()
                } else {
                    Text("Sign up")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            .background(Color.black)
            .cornerRadius(8)
            .disabled(isLoading)
            
            Spacer()
            
            // Disclaimer text
            Text("By clicking \"Sign up\" above, you agree to SwiftUI.art's Terms & Conditions and Privacy Policy.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Spacer()
        }
        .padding(.horizontal,24)
        
    }
    
    func signUp() {
        // Reset the error message
        errorMessage = nil
        
        // Validate first name, last name, email, and password
        guard !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill in all fields."
            return
        }
        
        guard isValidEmail(email) else {
            errorMessage = "Please enter a valid email address."
            return
        }
        
        // Start loading
        isLoading = true
        
        // Simulate a network request with a 3-second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            // Stop loading
            isLoading = false
            
            // Perform your sign-up logic here
            // ...
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        // Basic email validation regex
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

#Preview {
    SimpleSignUpView()
}
                                        
