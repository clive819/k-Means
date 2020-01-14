## k-Means Clustering
[See Wikipedia](https://en.wikipedia.org/wiki/K-means_clustering)

## Usage example
`var vs = [1.0,2.0,3.0,4.0,5.0,6.0].map({Vector([$0])})
let k = KMeans(criteria: [IterationCriterion(10), DistanceCriterion(1e-6)])
for _ in 0..<10 {
    print(k.fit(numClusters: 2, data: vs))
}`

`[KMeans.Vector(data: [2.0], length: 1), KMeans.Vector(data: [5.0], length: 1)]
[KMeans.Vector(data: [4.5], length: 1), KMeans.Vector(data: [1.5], length: 1)]
[KMeans.Vector(data: [5.0], length: 1), KMeans.Vector(data: [2.0], length: 1)]
[KMeans.Vector(data: [5.0], length: 1), KMeans.Vector(data: [2.0], length: 1)]
[KMeans.Vector(data: [2.0], length: 1), KMeans.Vector(data: [5.0], length: 1)]
[KMeans.Vector(data: [2.5], length: 1), KMeans.Vector(data: [5.5], length: 1)]
[KMeans.Vector(data: [5.0], length: 1), KMeans.Vector(data: [2.0], length: 1)]
[KMeans.Vector(data: [5.0], length: 1), KMeans.Vector(data: [2.0], length: 1)]
[KMeans.Vector(data: [2.0], length: 1), KMeans.Vector(data: [5.0], length: 1)]
[KMeans.Vector(data: [5.0], length: 1), KMeans.Vector(data: [2.0], length: 1)]`