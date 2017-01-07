//: Playground - noun: a place where people can play

import Foundation

let dataset: [[Double]] = [[2.7810836,2.550537003,0],
               [1.465489372,2.362125076,0],
               [3.396561688,4.400293529,0],
               [1.38807019,1.850220317,0],
               [3.06407232,3.005305973,0],
               [7.627531214,2.759262235,1],
               [5.332441248,2.088626775,1],
               [6.922596716,1.77106367,1],
               [8.675418651,-0.242068655,1],
               [7.673756466,3.508563011,1]]

struct Neuron {
    var weights: [Double]
    
    init(_ numInputs: Int) {
        weights = (0..<numInputs).map{ _ in drand48() }
    }
    
    func activate(inputs: [Double]) -> Double {
        // last weight is bias term
        let activation = zip(inputs, weights).reduce(weights.last!, { result, weightTup in
            return result + weightTup.0 * weightTup.1
        })
        
        return activation
    }
}

struct Layer {
    var neurons: [Neuron]
    
    init(numInputs: Int, numberOfNeurons: Int) {
        neurons = (0..<numberOfNeurons).map{ _ in Neuron(numInputs) }
    }
}

struct NeuralNetwork {
    let outputLayer: Layer
    let hiddenLayer: Layer
    
    init(inputs: Int, numOfHiddenNeurons: Int, numOfOutputNeurons: Int) {
        hiddenLayer = Layer(numInputs: inputs, numberOfNeurons: numOfHiddenNeurons)
        outputLayer = Layer(numInputs: inputs, numberOfNeurons: numOfOutputNeurons)
    }
}

// test
let nn = NeuralNetwork(inputs: 5, numOfHiddenNeurons: 1, numOfOutputNeurons: 2)
print(nn)

let arr1 = [2, 4, 5, 7]
let arr2 = ["hello", "wat", "ok", "cool", "yeah"]
let aa = zip(arr1, arr2)


let rr = aa.reduce("", { obj, oo in
    var obj1 = obj
    obj1 += oo.1
    return obj1
})

print(rr)