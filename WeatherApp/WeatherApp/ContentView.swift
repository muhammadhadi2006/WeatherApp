//
//  ContentView.swift
//  WeatherApp
//
//  Created by Hadi on 26/07/2024.
//

import SwiftUI

struct Day: Identifiable {
    let id = UUID().uuidString
    var name: String
    var icon: String
    var degrees: Int
}

struct ContentView: View {
    
    let days: [Day] = [
        Day(name: "TUE", icon: "cloud.sun.fill", degrees: 74),
        Day(name: "WED", icon: "sun.max.fill", degrees: 70),
        Day(name: "THU", icon: "wind", degrees: 66),
        Day(name: "FRI", icon: "sun.horizon.fill", degrees: 60),
        Day(name: "SAT", icon: "snow", degrees: 55)
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: .white)
            
            VStack(spacing: 10){
                CityName(city: "Cupertino, CA")
            
                VStack {
                 CurrentWeather(todaysWeather: "cloud.sun.fill", todayTemperature: 76)
                }
           Spacer()

                
                VStack(spacing: 8) {
                    
                    HStack {
                        
                        ForEach(days) { day in
                            DayView(day: day)
                        }
                    }
                
                }
                Spacer()
                ZStack {
                    Button(action: {
                        
                    }, label: {
                      RoundedRectangle(cornerRadius: 10)
                            //frame(width: 350, height: 0)
                            .frame(width: .width * 0.8 , height: .width * 0.140)
                            .foregroundStyle(.white)
                            
                    })
                    
                    Text("Change Day Time")
                        .foregroundStyle(.blue)
                        .font(.system(size: 20 , weight: .bold))
                        

                }
                Spacer()
            }
        }
    }
}

#Preview {
    
    ContentView()
}

struct DayView: View {
    
    let day: Day
    
    var body: some View {
        VStack {
            Text(day.name)
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.white)
            
            Image(systemName: day.icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(day.degrees)°")
                .font(.system(size: 23, weight: .semibold))
                .foregroundStyle(.white)
                .padding()
        }
    }
}
struct BackgroundView: View {
    let topColor: Color
    let bottomColor: Color
    
    var body: some View {
        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityName: View {
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 30, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct CurrentWeather: View {
    var todaysWeather: String
    var todayTemperature: Int
    
    var body: some View {
        Image(systemName: todaysWeather)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(todayTemperature)°")
            .font(.system(size: 80))
            .foregroundStyle(.white)
    }
}
