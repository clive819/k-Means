//
//  Criteria.swift
//  KMeans
//
//  Created by Clive Liu on 1/13/20.
//  Copyright © 2020 Clive Liu. All rights reserved.
//


public protocol KMStoppingCriterion {
    mutating func fit(iteration: Int, centroids: Vectors)
    func shouldStop() -> Bool
}


public struct IterationCriterion: KMStoppingCriterion {
    
    private let maxIteration: Int
    private var currentIteration: Int
    
    public init(_ maxIteration: Int) {
        self.maxIteration = maxIteration
        currentIteration = 0
    }
    
    public mutating func fit(iteration: Int, centroids: Vectors) {
        currentIteration = iteration
    }
    
    public func shouldStop() -> Bool {
        return currentIteration >= maxIteration
    }
    
}


public struct DistanceCriterion: KMStoppingCriterion {
    
    private let epsilon: Double
    private var prev: Vectors
    private var satisfied: Bool
    
    public init(_ epsilon: Double) {
        self.epsilon = epsilon
        prev = []
        satisfied = false
    }
    
    public mutating func fit(iteration: Int, centroids: Vectors) {
        if !prev.isEmpty {
            var dis = 0.0
            for i in 0..<prev.count {
                dis += prev[i].distance(to: centroids[i])
            }
            satisfied = dis <= epsilon
        }
        prev = centroids
    }
    
    public func shouldStop() -> Bool {
        return satisfied
    }
    
}
