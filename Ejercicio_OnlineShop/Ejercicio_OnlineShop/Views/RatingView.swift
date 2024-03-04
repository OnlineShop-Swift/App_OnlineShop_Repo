//
//  RatingView.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 4/3/24.
//
// source https://github.com/JZDesign/FiveStarRating_SwiftUI/tree/master

import SwiftUI

public struct RatingView: View {
    var rating: Decimal

    public var body: some View {
        ZStack {
            BackgroundStars(color: Color.gray)
            ForegroundStars(rating: rating, color: Color.yellow)
        }
        .frame(minWidth: 1, idealWidth: 100, maxWidth: 150, minHeight: 1, idealHeight: 30, maxHeight: 50, alignment: .center)

    }
}

private struct StarImage: View {


    var body: some View {
        Image(systemName: "star.fill")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}


private struct BackgroundStars: View {
    var color: Color


    var body: some View {
        HStack {
            ForEach(0..<5) { _ in
                StarImage()
            }
        }.foregroundColor(color)
    }
}

private struct ForegroundStars: View {
    var rating: Decimal
    var color: Color


    init(rating: Decimal, color: Color) {
        self.rating = rating
        self.color = color
    }


    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                RatingStar(
                    rating: self.rating,
                    color: self.color,
                    index: index
                )
            }
        }
    }
}



struct RatingStar: View {
    var rating: CGFloat
    var color: Color
    var index: Int
    
    
    var maskRatio: CGFloat {
        let mask = rating - CGFloat(index)
        
        switch mask {
        case 1...: return 1
        case ..<0: return 0
        default: return mask
        }
    }


    init(rating: Decimal, color: Color, index: Int) {
        
        self.rating = CGFloat(Double(rating.description) ?? 0)
        self.color = color
        self.index = index
    }


    var body: some View {
        GeometryReader { star in
            StarImage()
                .foregroundColor(self.color)
                .mask(
                    Rectangle()
                        .size(
                            width: star.size.width * self.maskRatio,
                            height: star.size.height
                        )
                    
                )
        }
    }
}







struct FiveStarView_Previews: PreviewProvider {


    static var previews: some View {
        VStack {
            RatingView(rating: 3.8)


        }
    }
}
