import XCTest

extension Int {
    var isTidy: Bool {
        let digits = self.digits
        for (index, _) in digits.enumerated() {
            if index == digits.count - 1 {
                break
            }
            let currentDigit = digits[index]
            let nextDigit = digits[index + 1]
            if currentDigit > nextDigit {
                return false
            }
        }
        return true
    }

    var digits: [Int] {
        return "\(self)".flatMap {
            Int(String($0))
        }
    }
}

func lastTidy(from number: Int) -> Int {
    if number.isTidy {
        return number
    }

    let digits = number.digits
    var tidyNumber = [Int]()
    for (index, _) in digits.enumerated() {
        let currentDigit = digits[index]
        if index == (digits.count - 1) {
            tidyNumber.append(currentDigit)
            break
        }
        let nextDigit = digits[index + 1]
        if currentDigit > nextDigit {
            tidyNumber.append(currentDigit - 1)
            for _ in 1...digits.count - index - 1 {
                tidyNumber.append(9)
            }
            break
        } else {
            tidyNumber.append(currentDigit)
        }
    }
    return lastTidy(from: Int(tidyNumber.reduce(into: "") {
        $0.append("\($1)")
    })!)
}

class TestExample: XCTestCase {

    var sut: SystemUnderTest!

    override func setUp() {
        super.setUp()
        sut = SystemUnderTest()
    }

    func testSample() {
        let sample = """
        4
        132
        1000
        7
        111111111111111110
        """

        let output = sut.methodToTest(sample)

        let expected = """
        Case #1: 129
        Case #2: 999
        Case #3: 7
        Case #4: 99999999999999999
        """
        XCTAssertEqual(expected, output)
    }

    func testSmall() {
        let sample = """
        100
        132
        1000
        7
        700
        154
        709
        181
        735
        441
        424
        364
        649
        925
        87
        692
        177
        397
        375
        342
        596
        768
        107
        967
        825
        393
        502
        999
        372
        155
        826
        383
        217
        173
        946
        212
        124
        560
        484
        924
        232
        264
        223
        980
        891
        179
        103
        636
        564
        244
        1
        117
        199
        453
        56
        814
        553
        27
        460
        433
        43
        34
        787
        879
        828
        9
        146
        328
        296
        792
        948
        498
        110
        357
        135
        584
        561
        903
        938
        982
        954
        638
        425
        922
        894
        827
        675
        930
        994
        757
        191
        704
        626
        469
        764
        303
        239
        653
        869
        932
        557
        """

        let output = sut.methodToTest(sample)

        let expected = """
        Case #1: 129
        Case #2: 999
        Case #3: 7
        Case #4: 699
        Case #5: 149
        Case #6: 699
        Case #7: 179
        Case #8: 699
        Case #9: 399
        Case #10: 399
        Case #11: 359
        Case #12: 599
        Case #13: 899
        Case #14: 79
        Case #15: 689
        Case #16: 177
        Case #17: 389
        Case #18: 369
        Case #19: 339
        Case #20: 589
        Case #21: 699
        Case #22: 99
        Case #23: 899
        Case #24: 799
        Case #25: 389
        Case #26: 499
        Case #27: 999
        Case #28: 369
        Case #29: 155
        Case #30: 799
        Case #31: 379
        Case #32: 199
        Case #33: 169
        Case #34: 899
        Case #35: 199
        Case #36: 124
        Case #37: 559
        Case #38: 479
        Case #39: 899
        Case #40: 229
        Case #41: 259
        Case #42: 223
        Case #43: 899
        Case #44: 889
        Case #45: 179
        Case #46: 99
        Case #47: 599
        Case #48: 559
        Case #49: 244
        Case #50: 1
        Case #51: 117
        Case #52: 199
        Case #53: 449
        Case #54: 56
        Case #55: 799
        Case #56: 499
        Case #57: 27
        Case #58: 459
        Case #59: 399
        Case #60: 39
        Case #61: 34
        Case #62: 779
        Case #63: 799
        Case #64: 799
        Case #65: 9
        Case #66: 146
        Case #67: 299
        Case #68: 289
        Case #69: 789
        Case #70: 899
        Case #71: 489
        Case #72: 99
        Case #73: 357
        Case #74: 135
        Case #75: 579
        Case #76: 559
        Case #77: 899
        Case #78: 899
        Case #79: 899
        Case #80: 899
        Case #81: 599
        Case #82: 399
        Case #83: 899
        Case #84: 889
        Case #85: 799
        Case #86: 669
        Case #87: 899
        Case #88: 899
        Case #89: 699
        Case #90: 189
        Case #91: 699
        Case #92: 599
        Case #93: 469
        Case #94: 699
        Case #95: 299
        Case #96: 239
        Case #97: 599
        Case #98: 799
        Case #99: 899
        Case #100: 557
        """
        XCTAssertEqual(expected, output)
    }

    func testSingleDigitReturnsSameDigit() {
        XCTAssertEqual(lastTidy(from: 7), 7)
    }

    func testSameDigitsReturnsSameDigit() {
        XCTAssertEqual(lastTidy(from: 111111), 111111)
    }

    func testIsTidy() {
        XCTAssertTrue(7.isTidy)
        XCTAssertTrue(129.isTidy)
    }

    func testIsNotTidy() {
        XCTAssertFalse(132.isTidy)
    }

    func testLastTidy() {
        XCTAssertEqual(lastTidy(from: 132), 129)
        XCTAssertEqual(lastTidy(from: 1000), 999)
        XCTAssertEqual(lastTidy(from: 111111111111111110), 99999999999999999)
    }
}

class SystemUnderTest {
    func methodToTest(_ input: String) -> String {
        let inputs = input.split(separator: "\n").dropFirst()
        var result = ""
        for (index, number) in inputs.enumerated() {
            result.append("Case #\(index + 1): \(lastTidy(from: Int(String(number))!))")
            if index < inputs.count - 1 {
                result.append("\n")
            }
        }
        return result
    }
}
