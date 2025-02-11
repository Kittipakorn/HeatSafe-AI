//
//  ProfileView.swift
//  Heatsafe
//
//  Created by Kittiapakorn Seenak on 10/2/2568 BE.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 20){
                Image("ปกAI")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .cornerRadius(100)
                VStack(alignment: .leading){
                    Text("iostream")
                        .bold()
                        .font(.title2)
                    Text("170 cm | 49 kg | 65 years old")
                }
                Spacer()
            }
            
            VStack(spacing: 15){
                HStack{
                    Circle()
                        .foregroundColor(Color.cyan)
                        .overlay(
                            Image(systemName: "gear.circle.fill")
                                .foregroundColor(.white)
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 3)
                            
                        )
                        .frame(width: 40)
                        .cornerRadius(100)
                    
                    Text("App settings")
                        .bold()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                Divider()
                HStack{
                    Circle()
                        .foregroundColor(Color.cyan)
                        .overlay(
                            Image(systemName: "sos.circle.fill")
                                .foregroundColor(.white)
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 3)
                            
                        )
                        .frame(width: 40)
                        .cornerRadius(100)
                    Text("SOS settings")
                        .bold()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                Divider()
                HStack{
                    Circle()
                        .foregroundColor(Color.cyan)
                        .overlay(
                            Image(systemName: "lock.fill")
                                .foregroundColor(.white)
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 3)
                            
                        )
                        .frame(width: 40)
                        .cornerRadius(100)
                    Text("Permissions")
                        .bold()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                Divider()
                HStack{
                    Circle()
                        .foregroundColor(Color.cyan)
                        .overlay(
                            Image(systemName: "questionmark.circle.fill")
                                .foregroundColor(.white)
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 3)
                            
                        )
                        .frame(width: 40)
                        .cornerRadius(100)
                    Text("About")
                        .bold()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background()
            .cornerRadius(20)
            
            Spacer()
            
        }
        .padding()
        .background(Color(red: 204/255, green: 240/255, blue: 1).opacity(0.5))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .previewLayout(.sizeThatFits)
    }
}
