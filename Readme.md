## k-Means Clustering
[See Wikipedia](https://en.wikipedia.org/wiki/K-means_clustering)

## Usage example
```swift
var vs = [1.0,2.0,3.0,4.0,5.0,6.0].map({Vector([$0])})
let k = KMeans(criteria: [IterationCriterion(10), DistanceCriterion(1e-6)])
for _ in 0..<10 {
    print(k.fit(numClusters: 2, data: vs))
}
```

```
[KMeans.Vector(data: [2.0], length: 1), KMeans.Vector(data: [5.0], length: 1)]
[KMeans.Vector(data: [4.5], length: 1), KMeans.Vector(data: [1.5], length: 1)]
[KMeans.Vector(data: [5.0], length: 1), KMeans.Vector(data: [2.0], length: 1)]
[KMeans.Vector(data: [5.0], length: 1), KMeans.Vector(data: [2.0], length: 1)]
[KMeans.Vector(data: [2.0], length: 1), KMeans.Vector(data: [5.0], length: 1)]
[KMeans.Vector(data: [2.5], length: 1), KMeans.Vector(data: [5.5], length: 1)]
[KMeans.Vector(data: [5.0], length: 1), KMeans.Vector(data: [2.0], length: 1)]
[KMeans.Vector(data: [5.0], length: 1), KMeans.Vector(data: [2.0], length: 1)]
[KMeans.Vector(data: [2.0], length: 1), KMeans.Vector(data: [5.0], length: 1)]
[KMeans.Vector(data: [5.0], length: 1), KMeans.Vector(data: [2.0], length: 1)]
```

## Code
### [KMeans.swift](./KMeans/KMeans.swift)
```swift
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
```