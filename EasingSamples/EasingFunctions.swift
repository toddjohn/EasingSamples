//
//  EasingFunctions.swift
//  EasingSamples
//
//  Created by Todd Johnson on 2/26/16.
//  Copyright © 2016 toddjohn. All rights reserved.
//

import Foundation

// y = x
func LinearInterpolation(t: Float) -> Float {
    return t
}

// y = x^2
func QuadraticEaseIn(t: Float) -> Float {
    return t * t
}

// y = -x^2 + 2x
func QuadraticEaseOut(t: Float) -> Float {
    return -(t * (t - 2))
}

// y = (1/2)((2x)^2)             ; where x in [0, 0.5)
// y = -(1/2)((2x-1)*(2x-3) - 1) ; where x in [0.5, 1]
func QuadraticEaseInOut(t: Float) -> Float {
    if (t < 0.5) {
        return 2 * t * t
    }

    return (-2 * t * t) + (4 * t) - 1
}

// y = x^3
func CubicEaseIn(t: Float) -> Float {
    return t * t * t
}

// y = (x - 1)^3 + 1
func CubicEaseOut(t: Float) -> Float {
    let u = (t - 1)
    return u * u * u + 1
}

// y = (1/2)((2x)^3)       ; where x in [0, 0.5)
// y = (1/2)((2x-2)^3 + 2) ; where x in [0.5, 1]
func CubicEaseInOut(t: Float) -> Float {
    if (t < 0.5) {
        return 4 * t * t * t
    }

    let u = ((2 * t) - 2)
    return 0.5 * u * u * u + 1
}

func QuarticEaseIn(t: Float) -> Float {
    return t * t * t * t
}

// y = 1 - (x - 1)^4
func QuarticEaseOut(t: Float) -> Float {
    let u = (t - 1)
    return u * u * u * (1 - t) + 1
}

// y = (1/2)((2x)^4)        ; where x in [0, 0.5)
// y = -(1/2)((2x-2)^4 - 2) ; where x in [0.5, 1]
func QuarticEaseInOut(t: Float) -> Float {
    if (t < 0.5) {
        return 8 * t * t * t * t
    }

    let u = (t - 1)
    return -8 * u * u * u * u + 1
}

// y = sin((x-1) * π/2)
func SineEaseIn(t: Float) -> Float {
    return sin((t - 1) * Float(M_PI_2)) + 1
}

// y = sin(x * π/2)
func SineEaseOut(t: Float) -> Float {
    return sin(t * Float(M_PI_2))
}

// y = 1/2(1 - cos(x * π))
func SineEaseInOut(t: Float) -> Float {
    return 0.5 * (1 - cos(t * Float(M_PI)))
}

// y = sin(13 * π/2 * x) * pow(2, 10 * (x - 1))
func ElasticEaseIn(t: Float) -> Float {
    return sin(13 * Float(M_PI_2) * t) * pow(2, 10 * (t - 1))
}

// y = sin(-13 * π/2 * (x + 1)) * pow(2, -10x) + 1
func ElasticEaseOut(t: Float) -> Float {
    return sin(-13 * Float(M_PI_2) * (t + 1)) * pow(2, -10 * t) + 1
}

// y = (1/2) * sin(13 * π/2 * (2*x)) * pow(2, 10 * ((2*x) - 1))      ; where x in [0,0.5)
// y = (1/2) * (sin(-13 * π/2 * ((2x-1)+1)) * pow(2,-10(2*x-1)) + 2) ; where x in [0.5, 1]
func ElasticEaseInOut(t: Float) -> Float {
    if (t < 0.5) {
        return 0.5 * sin(13 * Float(M_PI_2) * (2 * t)) * pow(2, 10 * ((2 * t) - 1))
    }

    return 0.5 * (sin(-13 * Float(M_PI_2) * ((2 * t - 1) + 1)) * pow(2, -10 * (2 * t - 1)) + 2)
}

// y = 2^(10(x - 1))
func ExponentialEaseIn(t: Float) -> Float {
    return (t == 0.0) ? t : pow(2, 10 * (t - 1))
}

// y = -2^(-10x) + 1
func ExponentialEaseOut(t: Float) -> Float {
    return (t == 1.0) ? t : 1 - pow(2, -10 * t)
}

// y = (1/2)2^(10(2x - 1))         ; where x in [0,0.5)
// y = -(1/2)*2^(-10(2x - 1))) + 1 ; where x in [0.5,1]
func ExponentialEaseInOut(t: Float) -> Float {
    if (t == 0.0 || t == 1.0) {
        return t
    }

    if (t < 0.5) {
        return 0.5 * pow(2, (20 * t) - 10)
    } else {
        return -0.5 * pow(2, (-20 * t) + 10) + 1
    }
}

// y = x^3-x*sin(x*pi)
func BackEaseIn(t: Float) -> Float {
    return t * t * t - t * sin(t * Float(M_PI))
}

// y = 1-((1-x)^3-(1-x)*sin((1-x)*pi))
func BackEaseOut(t: Float) -> Float {
    let f = (1 - t)
    return 1 - (f * f * f - f * sin(f * Float(M_PI)))
}

// y = (1/2)*((2x)^3-(2x)*sin(2*x*pi))           ; where x in [0, 0.5)
// y = (1/2)*(1-((1-x)^3-(1-x)*sin((1-x)*pi))+1) ; where x in [0.5, 1]
func BackEaseInOut(t: Float) -> Float {
    if (t < 0.5) {
        let f = 2 * t
        return 0.5 * (f * f * f - f * sin(f * Float(M_PI)))
    } else {
        let f = (1 - (2*t - 1))
        return 0.5 * (1 - (f * f * f - f * sin(f * Float(M_PI)))) + 0.5
    }
}

func BounceEaseIn(t: Float) -> Float {
    return 1 - BounceEaseOut(1 - t)
}

func BounceEaseOut(t: Float) -> Float {
    if (t < 4/11.0) {
        return (121 * t * t)/16.0
    } else if (t < 8/11.0) {
        return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0
    } else if (t < 9/10.0) {
        return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0
    } else {
        return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0
    }
}

func BounceEaseInOut(t: Float) -> Float {
    if (t < 0.5) {
        return 0.5 * BounceEaseIn(t*2)
    } else {
        return 0.5 * BounceEaseOut(t * 2 - 1) + 0.5
    }
}
