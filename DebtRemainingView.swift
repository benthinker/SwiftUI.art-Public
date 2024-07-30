// Made by SwiftUI.art

import SwiftUI

extension Color {
    static let specialGreen = Color(red: 77/255, green: 169/255, blue: 115/255)
}

struct DebtRemainingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Total debt remaining")
                    .foregroundColor(.gray.opacity(0.9))
                    .font(.headline)
                Spacer()
                Image(systemName: "gearshape")
                    .foregroundColor(Color.specialGreen)
                    .padding(.trailing, 2)
                    .font(.title2)
                Image(systemName: "plus.circle")
                    .foregroundColor(Color.specialGreen)
                    .font(.title2)
            }
            .padding(.top, 10)
            .padding(.horizontal)
            
            Text("$25,000")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
            
            Text("3 years, 2 months left")
                .font(.title3)
                .foregroundColor(.black)
                .padding(.horizontal)
            VStack {
                HStack {
                    Image(systemName: "sparkles")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(Color.white.opacity(0.6))
                        .bold()
                        
                    Text("Save money, be debt-free faster using the Avalanche or Snowball method.")
                        .foregroundColor(.white)
                        .font(.caption)
                        .lineLimit(2)
                    Spacer()
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding(.vertical)
                .background(Color.specialGreen)
                .cornerRadius(10)
                .padding(.horizontal)
                
                Button(action: {
                    // Action for the button
                }) {
                    Text("Update Payment Strategy")
                        .font(.subheadline)
                        .foregroundColor(Color.specialGreen)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,10)
                        .background(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.specialGreen)
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}

#Preview {
    DebtRemainingView()
}

