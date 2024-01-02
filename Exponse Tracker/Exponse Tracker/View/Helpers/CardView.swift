//
//  CardView.swift
//  Exponse Tracker
//
//  Created by Mauro de Oliveira André on 30/12/2023.
//

import SwiftUI

struct CardView: View {
    var income: Double
    var exponse: Double
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
            
            VStack(spacing: 0){
                HStack(spacing: 12){
                    Text("\(currencyString(income - exponse))")
                        .font(.title.bold())
                    
                    Image(systemName: exponse > income ? "chart.line.downtrend" : "chart.line.uptrend.xyaxis")
                        .font(.title3)
                        .foregroundStyle(exponse > income ? .red : .green)
                    
                }
                .padding(.bottom, 25)
                
                HStack(spacing: 0){
                    ForEach(Category.allCases, id: \.rawValue){ category in
                        
                        let symbolImage = category == .income ? "arrow.down" : "arrow.up"
                        let tint = category == .income ? Color.green : Color.red
                        
                        HStack(spacing: 10){
                            Image(systemName: symbolImage)
                                .font(.callout.bold())
                                .foregroundStyle(tint)
                                .frame(width: 35, height: 35)
                                .background{
                                  Circle()
                                        .fill(tint.opacity(0.25).gradient)
                            }
                            
                            VStack(alignment: .leading, spacing: 4){
                                Text(category.rawValue)
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                                
                                Text(currencyString(category == .income ? income : exponse, alloweDigits: 0))
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.primary)
                            }
                            
                            if category == .income{
                                Spacer(minLength: 0)
                            }
                        }
                        .padding([.horizontal, .bottom], 25)
                        .padding(.top, 15)
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollView{
        CardView(income: 4590, exponse: 2389)
    }
}
