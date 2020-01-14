//
//  main.swift
//  KMeans
//
//  Created by Clive Liu on 1/12/20.
//  Copyright © 2020 Clive Liu. All rights reserved.
//


var vs = [1.0,2.0,3.0,4.0,5.0,6.0].map({Vector([$0])})
let k = KMeans(criteria: [IterationCriterion(10), DistanceCriterion(1e-6)])
for _ in 0..<10 {
    print(k.fit(numClusters: 2, data: vs))
}
