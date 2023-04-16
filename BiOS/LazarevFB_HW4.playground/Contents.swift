// №1
let vkData = "19067"
let fbData = "13400"
let instData = "_10045"
let youTubeData = "10$0d00"
let webSiteData = "I0I12"

// 1-ый способ
var coalescSum: Int = 0

coalescSum += Int(vkData) ?? 0

coalescSum += Int(fbData) ?? 0

coalescSum += Int(instData) ?? 0

coalescSum += Int (youTubeData) ?? 0

coalescSum += Int(webSiteData) ?? 0

// 2-ой способ
var bindingSum: Int = 0

if let number = Int(vkData) {
    bindingSum += number
}

if let number = Int(fbData) {
    bindingSum += number
}

if let number = Int(instData) {
    bindingSum += number
}

if let number = Int(youTubeData) {
    bindingSum += number
}

if let number = Int(webSiteData) {
    bindingSum += number
}

// 3-ий способ
var unwrapSum: Int = 0

if Int(vkData) != nil {
    unwrapSum += Int(vkData)!
}

if Int(fbData) != nil {
    unwrapSum += Int(vkData)!
}

if Int(instData) != nil {
    unwrapSum += Int(vkData)!
}

if Int(youTubeData) != nil {
    unwrapSum += Int(vkData)!
}

if Int(webSiteData) != nil {
    unwrapSum += Int(vkData)!
}



// №2
var isConfirmed:Bool? = nil

var amount = youTubeData

if let number = Int(amount) {
    switch isConfirmed {
    case true?:
        print ("The payment for $\(number) has been confirmed by user")
    case false?:
        print ("The payment for $\(number) has been declined by user")
    case nil:
        print ("The payment is yet to be confirmed or declined by user")
    }
} else {
    print ("Oops! Something went wrong! Check the payment amount.")
}

// №3
var arraySum: Int = 0

let data = [vkData, fbData, instData, youTubeData, webSiteData]

for dataSample in data {
    if let sample = Int(dataSample) {
        arraySum += sample
    }
}
