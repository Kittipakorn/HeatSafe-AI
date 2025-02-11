import SwiftUI

struct HealthView: View {
    var body: some View {
        VStack{
            ZStack{
                Text("Health🧍")
                    .font(.title2)
                    .bold()
                    .frame(width: .infinity)
            }
            ZStack{
                Image("avatar")
                    .offset(y:-70)
                
                HStack{
                    VStack(alignment: .leading, spacing: 20){
                        VStack(alignment: .leading){
                            Text("Height")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.cyan)
                            Text("170 cm")
                                .font(.title3)
                        }
                        VStack(alignment: .leading){
                            Text("Weight")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.cyan)
                            Text("49 kg")
                                .font(.title3)
                        }
                        VStack(alignment: .leading){
                            Text("BMI")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.cyan)
                            Text("16.95")
                                .font(.title3)
                        }
                    }
                    Spacer()
                }.offset(y:-230)
                    .frame(width: 350)
                
                ScrollView{
                    Rectangle()
                            .opacity(0)
                            .frame(height: 300)
                    VStack{
                        
                        VStack(spacing: 20){
                            HStack{
                                Text("Disease")
                                    .bold()
                                    .foregroundColor(.cyan)
                                Spacer()
                            }
                            HStack{
                                Text("ปลอดภัยจ้าา")
                                    .foregroundColor(.black.opacity(0.6))
                                Spacer()
                            }
                        }
                        
                        Divider()
                        VStack{
                            HStack{
                                Text("Activity")
                                    .bold()
                                    .foregroundColor(.cyan)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            HStack(alignment: .bottom){
                                Text("1000")
                                    .font(.title2)
                                Text("kcal")
                                    .foregroundColor(.gray)
                                Spacer()
                                
                                HStack(alignment: .bottom){
                                    Rectangle()
                                        .frame(width: 10,height: 40)
                                        .foregroundColor(.gray)
                                    Rectangle()
                                        .frame(width: 10,height: 50)
                                        .foregroundColor(.gray)
                                    Rectangle()
                                        .frame(width: 10,height: 10)
                                        .foregroundColor(.gray)
                                    Rectangle()
                                        .frame(width: 10,height: 30)
                                        .foregroundColor(.cyan)
                                }
                            }.bold()
                        }
                        Divider()
                        
                        VStack{
                            HStack{
                                Text("Heart Rate")
                                    .bold()
                                    .foregroundColor(.cyan)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            HStack(alignment: .bottom){
                                Text("81")
                                    .font(.title2)
                                Text("BPM")
                                    .foregroundColor(.gray)
                                Spacer()
                                
                                HStack(alignment: .bottom){
                                    Rectangle()
                                        .frame(width: 10,height: 40)
                                        .foregroundColor(.gray)
                                    Rectangle()
                                        .frame(width: 10,height: 50)
                                        .foregroundColor(.gray)
                                    Rectangle()
                                        .frame(width: 10,height: 10)
                                        .foregroundColor(.gray)
                                    Rectangle()
                                        .frame(width: 10,height: 30)
                                        .foregroundColor(.cyan)
                                }
                            }.bold()
                        }
                        Divider()
                        VStack{
                            HStack{
                                Text("Temperature")
                                    .bold()
                                    .foregroundColor(.cyan)
                                Spacer()
                            }
                            Image("tempGraph")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300)
                        }
                        
                        Spacer()
                        
                    }
                    .padding()
                    .padding(.bottom,20)
                    .background()
                    .cornerRadius(30)
                    
                }.padding()
//                    .offset(y:300)
            }
        }
        .background(Color(red: 204/255, green: 240/255, blue: 1).opacity(0.5))
    }
}

struct HealthView_Previews: PreviewProvider {
    static var previews: some View {
        HealthView()
            .previewLayout(.sizeThatFits)
    }
}
