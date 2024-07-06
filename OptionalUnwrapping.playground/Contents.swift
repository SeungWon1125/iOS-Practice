import UIKit

let number1: Int = 10
let number2: Int? = nil
let number3: Int? = 3

func square(number: Int) {
    print("\(number)의 제곱값은 \(number * number)입니다.")
}

//square(number: number1)


// MARK: - 1. nil-coalescing -> 기본값 넣어주기
print("--- 1. nil-coalescing -> 기본값 넣어주기 ---")
square(number: number2 ?? 0) // 잘못 들어가면 0으로 넣어주기 (but, 올바른 동작은 아님)
square(number: number3 ?? 0)

// MARK: - 2. forced-unwrappind -> 위험하게 벗기기 (강제로)
print("--- 2. forced-unwrappind -> 위험하게 벗기기 (강제로) ---")
//square(number: number2!) // 오류 발생
square(number: number3!)

// MARK: - 3. optional binding1(if-let) -> 조심히 벗기기
print("--- 3. optional binding1(if-let) -> 조심히 벗기기 ---")
if let num = number2 { // number2가 nil이 아니면 num에 할당해주고 다음 함수를 실행
    square(number: num)
} else {
    print("unwrapping 실패")
}

if let num = number3 {
    square(number: num)
} else {
    print("unwrapping 실패")
}

// MARK: - 4. optional binding2(guard-let) -> 조심히 벗기기
print("4. optional binding2(guard-let) -> 조심히 벗기기")
// 기본적으로 함수 안에서 사용
func guardLetExample(_ number: Int?) {
    guard let num = number else { // number가 nil이면 다음 함수 실행
        print("unwrapping 실패")
        return
    }
    // number가 nil이 아니면(unwrapping성공이면)다음 줄로 이동
    square(number: num)
}

guardLetExample(number2)
guardLetExample(number3)

