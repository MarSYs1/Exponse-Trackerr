//
//  Recents.swift
//  Exponse Tracker
//
//  Created by Mauro de Oliveira André on 29/12/2023.
//

import SwiftUI

struct Recents: View {
    
    //: Properts
    @AppStorage("userName") var userName: String = ""
    
    //: View Properts
    
    @State private var stardate: Date = .now.startOfMonth
    @State private var endDate: Date = .now.endMonth
    @State private var selectedCategory: Category = .exponse
    
    //: For animate
    @Namespace private var animation
    
    var body: some View {
        GeometryReader{
            //: For Animation porpose
            let size = $0.size
            NavigationStack{
                ScrollView(.vertical){
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]){
                        Section{
                            
                            Button(action: {
                                
                            }, label: {
                                Text("\(format(date: stardate, format: "dd - MMM yy")) to \(format(date: endDate, format: "dd - MMM yy"))")
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                            })
                            .hSpacing(.leading)
                            
                            //: Card View
                            CardView(income: 24829, exponse: 4926)
                            
                            //: Custom segment control
                            customSegmentControl()
                                .padding(.bottom, 10)
                            
                            ForEach(sampleTransaction.filter({ $0.category == selectedCategory.rawValue})){ transaction in
                                TransactionCardView(transaction: transaction)
                            }
                            
                        } header: {
                            HeaderView(size)
                        }
                    }
                    .padding(15)
                }
                .background(.gray.opacity(0.15))
            }
        }
    }
    
    //: Header View
    @ViewBuilder
    func HeaderView(_ size: CGSize) -> some View{
        HStack(spacing: 10){
            
            VStack(alignment: .leading, spacing: 5 ,content: {
                Text("Welcome!")
                    .font(.title.bold())
                
                if !userName.isEmpty{
                    Text(userName)
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            })
            .visualEffect { content, geometryProxy in
                content
                    .scaleEffect(headerScale(size, proxy: geometryProxy), anchor: .topLeading)
            }
            
            Spacer(minLength: 0)
            
            NavigationLink{
                
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(appTint.gradient, in: .circle)
                    .contentShape(.circle)
            }
        }
        .hSpacing(.leading)
        .padding(.bottom, userName.isEmpty ? 10 : 5)
        .background(
            VStack(spacing: 0){
                Rectangle()
                  .fill(.ultraThinMaterial)
                
                Divider()
            }
                .visualEffect{ content, geometryProxy in
                    content
                        .opacity(headerBGOpacity(geometryProxy))
                }
            .padding(.horizontal, -15)
            .padding(.top, -(safeArea.top + 15))
        )
    }
    
    //: Segment control
    @ViewBuilder
    func customSegmentControl() -> some View{
        HStack(spacing: 0){
            ForEach(Category.allCases, id: \.rawValue){category in
                Text(category.rawValue)
                    .hSpacing()
                    .padding(.vertical, 10)
                    .background{
                        if category == selectedCategory{
                            Capsule()
                                .fill(.background)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                    .contentShape(.capsule)
                    .onTapGesture{
                        withAnimation(.snappy){
                            selectedCategory = category
                        }
                    }
            }
        }
        .background(.gray.opacity(0.15), in: .capsule)
        .padding(.top, 5)
    }
    
    func headerBGOpacity(_ proxy: GeometryProxy) -> CGFloat{
        let minY = proxy.frame(in: .scrollView).minY + safeArea.top
        return minY > 0 ? 0 : (-minY / 15)
    }
    
    func headerScale(_ size: CGSize, proxy: GeometryProxy) -> CGFloat{
        let minY = proxy.frame(in: .scrollView).minY
        let screenHeight = size.height
        
        let progress = minY / screenHeight
        let scale = (min(max(progress, 0), 1)) * 0.4
        
        return 1 + scale
    }
}

#Preview {
    ContentView()
}
