//
//  TransactionCardView.swift
//  Exponse Tracker
//
//  Created by Mauro de Oliveira André on 30/12/2023.
//

import SwiftUI

struct TransactionCardView: View {
    
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 12){
            Text("\(String(transaction.title.prefix(1)))")
                .font(.title)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .frame(width: 45, height: 45)
                .background(transaction.color.gradient, in: .circle)
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(transaction.title)
                    .foregroundStyle(Color.primary)
                
                Text(transaction.remarks)
                    .font(.caption)
                    .foregroundStyle(Color.primary.secondary)
                
                Text(format(date: transaction.dateAdded, format: "dd MMM yy"))
                    .font(.caption)
                    .foregroundStyle(.gray)
            })
            .lineLimit(1)
            .hSpacing(.leading)
            
            Text(currencyString(transaction.amount, alloweDigits: 2))
                .fontWeight(.semibold)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(.background, in: .rect(cornerRadius: 10))
    }
}

#Preview {
    TransactionCardView(transaction: sampleTransaction[0])
}
