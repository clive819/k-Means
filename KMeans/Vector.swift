//
//  Vector.swift
//  KMeans
//
//  Created by Clive Liu on 1/13/20.
//  Copyright © 2020 Clive Liu. All rights reserved.
//

import Foundation


public struct Vector {
    
    private let data: [Double]
    private let length: Int
    
    init(_ data: [Double]) {
        self.data = data
        length = data.count
    }
    
    public func distance(to other: Vector) -> Double {
        var ans = 0.0
        for i in 0..<length {
            ans += pow(data[i] - other.data[i], 2)
        }
        return sqrt(ans)
    }
    
    public static func new(like vector: Vector, with val: Double) -> Vector {
        return Vector(Array(repeating: val, count: vector.length))
    }
    
}


extension Vector: Equatable {
    
    public static func == (left: Vector, right: Vector) -> Bool {
        guard left.length == right.length else { return false }
        for i in 0..<left.length {
            if left.data[i] != right.data[i] {
                return false
            }
        }
        return true
    }
    
    public static func != (left: Vector, right: Vector) -> Bool {
        return !(left == right)
    }
    
    public static func + (left: Vector, right: Vector) -> Vector {
        var ans = Array(repeating: 0.0, count: left.length)
        for i in 0..<left.length {
            ans[i] = left.data[i] + right.data[i]
        }
        return Vector(ans)
    }
    
    public static func += (left: inout Vector, right: Vector) {
        left = left + right
    }
    
    public static func - (left: Vector, right: Vector) -> Vector {
        var ans = Array(repeating: 0.0, count: left.length)
        for i in 0..<left.length {
            ans[i] = left.data[i] - right.data[i]
        }
        return Vector(ans)
    }
    
    public static func -= (left: inout Vector, right: Vector) {
        left = left - right
    }
    
    public static func * (left: Vector, right: Vector) -> Vector {
        var ans = Array(repeating: 0.0, count: left.length)
        for i in 0..<left.length {
            ans[i] = left.data[i] * right.data[i]
        }
        return Vector(ans)
    }
    
    public static func *= (left: inout Vector, right: Vector) {
        left = left * right
    }
    
    public static func / (left: Vector, right: Vector) -> Vector {
        var ans = Array(repeating: 0.0, count: left.length)
        for i in 0..<left.length {
            ans[i] = left.data[i] / right.data[i]
        }
        return Vector(ans)
    }
    
    public static func /= (left: inout Vector, right: Vector) {
        left = left / right
    }
    
}


public typealias Vectors = [Vector]
