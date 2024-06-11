import UIKit

"http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?targetDt=20240607&key=5e3ccd2099b956a228782d1733df3b89"

"5e3ccd2099b956a228782d1733df3b89"

let movieURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=5e3ccd2099b956a228782d1733df3b89&targetDt=20240607"

let structUrl = URL(string: movieURL)!
// 문자열을 가지고 URL구조체를 생성할 수 있는 생성자 => String이 구조체URL로 바뀐다.
// 옵셔널로 생성되는 이유는 URL에서 에러가 날 수도 있기 때문이다. => 바인딩 시켜줘야함
// 암튼 String형식으로 된 URL을 URL구조체 형식으로 바꿔주는 것이다.

let session = URLSession.shared
// 애플이 미리 만들어 놓은, 서버와 통신하는 객체인 URLSession
// 보통 configuaraion: .default 또는 URLSession.shared 이렇게 생성한다. shared를 더 많이 사용함(싱글톤)
// 싱글톤: 메모리에 유일하게 하나만 존재하게 하는 객체
// 암튼 서버와 통신하는 객체를 만든 것이다.

let task = session.dataTask(with: structUrl) { data, response, error in
    // 1. 관습적으로 에러를 먼저 관리
    // 에러가 있으면 리턴(함수 종료)
    if error != nil {
        print(error!)
        return
    }
    
    // 여기서 response를 처리할 수도 있음
    
    // 하지만 우리에게 제일 중요한 건 data
    guard let safeData = data else {
        return
    }
//    print(String(decoding: safeData, as: UTF8.self)) // 데이터를 출력하는 법
    let movieArray = parseJSON1(safeData)
    dump(movieArray!)
}
// dataTask(with: URL구조체를 이용하여, completionHandler: 클로저 형식으로 사용(엔터 누르기))
// 클로저가 사용하는 파라미터: 데이터, 응답, 에러 **모두 옵셔널**
// URL주소(구조체)를 가지고 네트워크 통신을 다 한 뒤에 그 결과를 data?, response?, error?를 주는 것! (클로저 방식)
// URL구조체를 가지고 dataTask함수로 가서 알아서 일을 한다. 서버와 통신을 한 뒤에 저 세가지 결과를 주는 것이다.
// 저 세가지 값을 가지고 처리하는 것은 우리의 일
// dataTask함수에서 HTTP요청 메세지를 작성하여 서버와 통신을 하는데 왜 GET형식을 쓰지 않는가?
// 그 이유는 GET메서드는 URL주소만 있어도 GET역할을 하기 때문에 넣어줄 필요가 없다. (제일 기본적인 메서드이기 때문에)
// dataTask에서 HTTP버전 뭐 등등 알아서 해줌

// 세션 추가 설명
// session: 기간, 설명

task.resume()
// 일반적으로 이런 작업은 "멈춤"상태에서 시작함
// 따라서 resume()을 통해 실행
// session.dataTask()를 실행한 결과를 task에 담지 않고 바로 중괄호 뒤에 .resume()을 붙여도 된다.

// 이렇게 통신을 하면 HTTP응답 메세지 body에 있는 json데이터가 클로저로 넘어오는 것


func parseJSON1(_ movieData: Data) -> [DailyBoxOfficeList]? {
    
    do {
        // 스위프트5
        // 자동으로 원하는 클래스/구조체 형태로 분석
        // JSONDecoder
        let decoder = JSONDecoder()
        
        let decodedData = try decoder.decode(MovieData.self, from: movieData)

        return decodedData.boxOfficeResult.dailyBoxOfficeList
        
    } catch {
        
        return nil
    }
    
}


// 서버에서 주는 형태
struct MovieData: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Codable {
    let rank: String
    let movieNm: String
    let audiCnt: String
    let audiAcc: String
    let openDt: String
}
