//
//  KMeans.swift
//  KMeans
//
//  Created by Clive Liu on 1/13/20.
//  Copyright © 2020 Clive Liu. All rights reserved.
//


public class KMeans {
    
    private var criteria: [KMStoppingCriterion]
    
    init(criteria: [KMStoppingCriterion]) {
        self.criteria = criteria
    }
    
    public func fit(numClusters: Int, data: Vectors) -> Vectors {
        guard data.count >= numClusters else { return data }
        var iteration = 0, centroids = randomSelect(numClusters, from: data)
        
        while !meetsCriteria(iteration: iteration, centroids: centroids) {
            // MARK: - (Step 1) Assign to clusters
            var clusters: [Vectors] = Array(repeating: [], count: numClusters)
            for vector in data {
                let idx = findClosestCenter(vector, centroids)
                clusters[idx].append(vector)
            }
            
            // MARK: - (Step 2) Update centroids
            updateCentroids(centroids: &centroids, clusters: clusters)
            
            iteration += 1
        }
        return centroids
    }
    
}


extension KMeans {
    
    private func randomSelect(_ num: Int, from data: Vectors) -> Vectors {
        var ans: Vectors = []
        while ans.count < num {
            if let x = data.randomElement() {
                ans.append(x)
            }
        }
        return ans
    }
    
    private func meetsCriteria(iteration: Int, centroids: Vectors) -> Bool {
        for i in 0..<criteria.count {
            criteria[i].fit(iteration: iteration, centroids: centroids)
            if criteria[i].shouldStop() {
                return true
            }
        }
        return false
    }
    
    private func findClosestCenter(_ point: Vector, _ centroids: Vectors) -> Int {
        var idx = 0, minDistance = Double(Int.max)
        var distances = Array(repeating: 0.0, count: centroids.count)
        for i in 0..<centroids.count {
            distances[i] = point.distance(to: centroids[i])
            if distances[i] < minDistance {
                idx = i
                minDistance = distances[i]
            }
        }
        return idx
    }
    
    private func updateCentroids(centroids: inout Vectors, clusters: [Vectors]) {
        for i in 0..<clusters.count {
            var sum = Vector.new(like: centroids[i], with: 0)
            for vector in clusters[i] {
                sum += vector
            }
            centroids[i] = sum / Vector.new(like: sum, with: Double((clusters[i].isEmpty ? 1 : clusters[i].count)))
        }
    }
    
}
