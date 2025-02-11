//
//  Home.swift
//  Heatsafe
//
//  Created by Kittiapakorn Seenak on 9/2/2568 BE.
//

import SwiftUI

struct HomeView: View {
    @State private var isSheetPresented = false
    
    var body: some View {
        VStack{
            HStack{
                Text("Welcome")
                    .font(.title2)
                    .italic()
                Text("iostream!")
                    .font(.title2)
                    .italic()
                    .bold()
                Spacer()
                Image("ปกAI")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .cornerRadius(100)
            }
            ScrollView(){
                
                ZStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("36°C☀️")
                                .font(.system(size: 50))
                                .bold()
                                .foregroundColor(.cyan)
                            Spacer()
                            HStack{
                                Text("BMI")
                                    .bold()
                                    .foregroundColor(.cyan)
                                Text("16.96")
                            }
                            HStack{
                                Text("Weight")
                                    .bold()
                                    .foregroundColor(.cyan)
                                Text("49 kg.")
                            }
                            HStack{
                                Text("Height")
                                    .bold()
                                    .foregroundColor(.cyan)
                                Text("170 cm.")
                            }
                            
                        }
                        .font(.system(size: 20))
                        Spacer()
                    }.padding(.top, 10.0)
                        .padding(.leading, 17.0)
                    HStack{
                        Spacer()
                        Image("avatar")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200,height: 400)
                    }
                }
                
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("🔥Calories")
                                .font(.system(size: 13))
                                .bold()
                            Text("100")
                                .font(.title)
                                .bold()
                            Text("/500kcal")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                        }.padding(.leading)
                        Spacer()
                        Divider()
                            .frame(height: 70)
                        Spacer()
                        VStack(alignment: .leading){
                            Text("🏃‍➡️Steps")
                                .font(.system(size: 13))
                                .bold()
                            Text("1745")
                                .font(.title)
                                .bold()
                            Text("/6000steps")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                        }.padding()
                        
                        Spacer()
                        Divider()
                            .frame(height: 70)
                        Spacer()
                        VStack(alignment: .leading){
                            Text("⏰Times")
                                .font(.system(size: 13))
                                .bold()
                            Text("10")
                                .font(.title)
                                .bold()
                            Text("/30mins")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                        }.padding(.trailing)
                    }.padding()
                        .background()
                        .cornerRadius(20)
                    
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Image(systemName: "heart.circle.fill")
                                .foregroundColor(.red)
                            Text("Heart Rate")
                            Text("86 BPM")
                            Image("heartrateGraph")
                                .resizable()
                                .frame(width: 140,height: 70)
                            Spacer()
                        } .padding()
                            .bold()
                            .background()
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading){
                            Image(systemName: "wind.circle.fill")
                                .foregroundColor(.cyan)
                            Text("Pressure")
                            Text("90/69 mmHg")
                            Image("pressureGraph")
                                .resizable()
                                .frame(width: 140,height: 70)
                            Spacer()
                        } .padding()
                            .bold()
                            .background()
                            .cornerRadius(20)
                    }
                    
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Image(systemName: "lungs.fill")
                                .foregroundColor(.green)
                            Text("Oxygen")
                            Text("99 %")
                            Image("oxygenGraph")
                                .resizable()
                                .frame(width: 140,height: 70)
                            Spacer()
                        } .padding()
                            .bold()
                            .background()
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading){
                            Image(systemName: "drop.circle.fill")
                                .foregroundColor(.pink)
                            Text("Sweat")
                            Text("Yes")
                            Image("humidityGraph")
                                .resizable()
                                .frame(width: 140,height: 70)
                            Spacer()
                        } .padding()
                            .bold()
                            .background()
                            .cornerRadius(20)
                    }
                    Spacer()
                }
            }
        }.padding()
            .background(Color(red: 204/255, green: 240/255, blue: 1).opacity(0.5))
    }
}

#Preview {
    ContentView()
}
