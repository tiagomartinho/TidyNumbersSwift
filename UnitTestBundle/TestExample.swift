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
            result.append("Case #\(index+1): \(lastTidy(from: Int(String(number))!))")
            if index < inputs.count - 1 {
                result.append("\n")
            }
        }
        return result
    }
}
