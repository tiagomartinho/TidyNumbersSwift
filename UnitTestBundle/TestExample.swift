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

    func testLarge() {
        let sample = """
      100
      132
      1000
      7
      111111111111111110
      905
      391458953027532635
      723897627649600590
      11122233441
      412223334467890000
      522444557790
      771206424036780011
      89
      811112333445578899
      999999999999999999
      430315219406019114
      11333445538
      10999999999
      21233455667777788
      839744037703188439
      123334660146
      11111223333444441
      468091894546410352
      62
      270268070556368391
      71244667900
      549
      485379876698498904
      34166538267235763
      134798929036721004
      866433223939793507
      13378801123478899
      625768649238376319
      110
      311123444556666888
      661334556899
      655117260471837669
      969029391256960441
      406040728221622439
      32597726358849364
      24418431731
      41122445667889
      21
      111111111082590416
      111111122222222200
      72
      11223455688887
      11131234458
      86968879979
      11122222334444433
      827
      22233345566677889
      222142849565
      22244567888
      119892253166711850
      205189601823081245
      145868669967
      1000000000000000000
      712245667778
      25343589837
      112224555511
      214566777888
      451325057379850438
      11111111111100
      568565500917251027
      549679922519235684
      33
      457600632250227540
      180788405795872325
      453631111486311627
      439999999999
      780
      122222211635179876
      76999999999999
      351476985533135900
      11123444567788889
      780424905887093387
      12234445566728969
      9
      252244566677899999
      314628981565438056
      25567899559567
      460669185871677122
      107884168971852062
      71123345678898
      32999999999999999
      1
      11234445666882438
      14458999373
      62223466778
      989999999999999999
      111111111110
      653161544328834085
      767667779778
      67468469469984
      773792795920127467
      82233334456679
      12333162168292
      12355566778900
      11411234445899
      111100001222556799
      """

        let output = sut.methodToTest(sample)

        let expected = """
        Case #1: 129
        Case #2: 999
        Case #3: 7
        Case #4: 99999999999999999
        Case #5: 899
        Case #6: 389999999999999999
        Case #7: 699999999999999999
        Case #8: 11122233399
        Case #9: 399999999999999999
        Case #10: 499999999999
        Case #11: 699999999999999999
        Case #12: 89
        Case #13: 799999999999999999
        Case #14: 999999999999999999
        Case #15: 399999999999999999
        Case #16: 11333444999
        Case #17: 9999999999
        Case #18: 19999999999999999
        Case #19: 799999999999999999
        Case #20: 123334599999
        Case #21: 11111223333399999
        Case #22: 467999999999999999
        Case #23: 59
        Case #24: 269999999999999999
        Case #25: 69999999999
        Case #26: 499
        Case #27: 479999999999999999
        Case #28: 33999999999999999
        Case #29: 134789999999999999
        Case #30: 799999999999999999
        Case #31: 13377999999999999
        Case #32: 599999999999999999
        Case #33: 99
        Case #34: 299999999999999999
        Case #35: 599999999999
        Case #36: 599999999999999999
        Case #37: 899999999999999999
        Case #38: 399999999999999999
        Case #39: 29999999999999999
        Case #40: 23999999999
        Case #41: 39999999999999
        Case #42: 19
        Case #43: 99999999999999999
        Case #44: 111111119999999999
        Case #45: 69
        Case #46: 11223455679999
        Case #47: 11129999999
        Case #48: 79999999999
        Case #49: 11122222333999999
        Case #50: 799
        Case #51: 22233345566677889
        Case #52: 199999999999
        Case #53: 22244567888
        Case #54: 118999999999999999
        Case #55: 199999999999999999
        Case #56: 145799999999
        Case #57: 999999999999999999
        Case #58: 699999999999
        Case #59: 24999999999
        Case #60: 112224499999
        Case #61: 199999999999
        Case #62: 449999999999999999
        Case #63: 9999999999999
        Case #64: 567999999999999999
        Case #65: 499999999999999999
        Case #66: 33
        Case #67: 456999999999999999
        Case #68: 179999999999999999
        Case #69: 449999999999999999
        Case #70: 399999999999
        Case #71: 779
        Case #72: 119999999999999999
        Case #73: 69999999999999
        Case #74: 349999999999999999
        Case #75: 11123444567788889
        Case #76: 779999999999999999
        Case #77: 12234445566699999
        Case #78: 9
        Case #79: 249999999999999999
        Case #80: 299999999999999999
        Case #81: 25567889999999
        Case #82: 459999999999999999
        Case #83: 99999999999999999
        Case #84: 69999999999999
        Case #85: 29999999999999999
        Case #86: 1
        Case #87: 11234445666799999
        Case #88: 14458899999
        Case #89: 59999999999
        Case #90: 899999999999999999
        Case #91: 99999999999
        Case #92: 599999999999999999
        Case #93: 699999999999
        Case #94: 66999999999999
        Case #95: 699999999999999999
        Case #96: 79999999999999
        Case #97: 12299999999999
        Case #98: 12355566778899
        Case #99: 11399999999999
        Case #100: 99999999999999999
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
