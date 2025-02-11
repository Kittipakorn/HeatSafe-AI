//
//  Device.swift
//  Heatsafe
//
//  Created by Kittiapakorn Seenak on 9/2/2568 BE.
//

import SwiftUI

struct DeviceView: View {
    var body: some View {
        VStack{
            ZStack{
                Text("Kratrack Watch⌚️")
                    .font(.title2)
                    .bold()
                    .frame(width: .infinity)
                HStack{
                    Spacer()
                    Image(systemName: "plus.circle")
                        .font(.system(size: 20))
                }.padding(.horizontal)
            }
            
            ScrollView{
                VStack{
                    Image("watch")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    
                    VStack(spacing: 15){
                        HStack{
                            Circle()
                                .foregroundColor(Color.cyan)
                                .overlay(
                                    Image(systemName: "inset.filled.applewatch.case")
                                        .foregroundColor(.white)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 3)
                                    
                                )
                                .frame(width: 40)                                .cornerRadius(100)
                            
                            Text("Faces")
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
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.white)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 3)
                                    
                                )
                                .frame(width: 40)                                .cornerRadius(100)
                            Text("Fitness")
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
                                    Image(systemName: "rectangle.split.2x2.fill")
                                        .foregroundColor(.white)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 3)
                                    
                                )
                                .frame(width: 40)                                .cornerRadius(100)
                            Text("Apps")
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
                                    Image(systemName: "gearshape.fill")
                                        .foregroundColor(.white)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 3)
                                    
                                )
                                .frame(width: 40)                                .cornerRadius(100)
                            
                            Text("Settings")
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
                                    Image(systemName: "app.badge.fill")
                                        .foregroundColor(.white)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 3)
                                    
                                )
                                .frame(width: 40)                                .cornerRadius(100)
                            Text("Notifications")
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
                                .frame(width: 40)                                .cornerRadius(100)
                            Text("Security")
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
                    
                    
                }.padding()
            }
        }
        .background(Color(red: 204/255, green: 240/255, blue: 1).opacity(0.5))
    }
}

#Preview {
    DeviceView()
}
