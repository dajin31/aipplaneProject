// 날씨 API 키와 엔드포인트 설정
const WEATHER_API_KEY = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst\n'; // 이미 가지고 있는 API 키로 교체하세요
const WEATHER_API_ENDPOINT = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0';

// 날씨 정보를 표시할 요소
const weatherContent = document.getElementById('weather-widget');

// 현재 날짜와 시간 정보 생성 함수
function getCurrentDateAndTime() {
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0');
    const hours = now.getHours();
    const minutes = now.getMinutes();

    // API 요청에 필요한 날짜 형식 (YYYYMMDD)
    const baseDate = `${year}${month}${day}`;

    // API 요청에 필요한 시간 형식 (HHMM)
    // 매 시간 30분에 API가 업데이트되므로, 현재 시간이 30분 이전이면 이전 시간 데이터를 요청
    let baseHour = hours;
    if (minutes < 30) {
        baseHour = (hours - 1 + 24) % 24;
    }
    const baseTime = `${String(baseHour).padStart(2, '0')}30`;

    return { baseDate, baseTime };
}

// 날씨 아이콘 선택 함수
function getWeatherIcon(skyCondition, precipitationType) {
    const sky = parseInt(skyCondition);
    const pty = parseInt(precipitationType);

    if (pty === 1) return '🌧️'; // 비
    if (pty === 2) return '🌨️'; // 비/눈
    if (pty === 3) return '❄️'; // 눈
    if (pty === 4) return '🌦️'; // 소나기
    if (pty === 5) return '🌧️'; // 빗방울
    if (pty === 6) return '🌨️'; // 빗방울/눈날림
    if (pty === 7) return '❄️'; // 눈날림

    if (sky === 1) return '☀️'; // 맑음
    if (sky === 3) return '⛅'; // 구름많음
    if (sky === 4) return '☁️'; // 흐림

    return '🌈'; // 기본값
}

// 날씨 상태 텍스트 변환 함수
function getWeatherDescription(skyCondition, precipitationType) {
    const sky = parseInt(skyCondition);
    const pty = parseInt(precipitationType);

    if (pty === 1) return '비';
    if (pty === 2) return '비/눈';
    if (pty === 3) return '눈';
    if (pty === 4) return '소나기';
    if (pty === 5) return '빗방울';
    if (pty === 6) return '빗방울/눈날림';
    if (pty === 7) return '눈날림';

    if (sky === 1) return '맑음';
    if (sky === 3) return '구름많음';
    if (sky === 4) return '흐림';

    return '알 수 없음';
}

// 날씨 데이터 가져오기
function fetchWeatherData(nx = '60', ny = '127') { // 기본값은 서울
    const { baseDate, baseTime } = getCurrentDateAndTime();
    console.log('fetchWeatherData() 함수 실행됨'); // 추가
    // CORS 이슈를 피하기 위해 프록시 서버를 사용하거나, 서버 측에서 API를 호출하는 것이 좋습니다.
    // 여기서는 직접 호출하는 방식으로 예시를 작성합니다.
    const url = `${WEATHER_API_ENDPOINT}?serviceKey=${WEATHER_API_KEY}&numOfRows=60&pageNo=1&dataType=JSON&base_date=${baseDate}&base_time=${baseTime}&nx=${nx}&ny=${ny}`;

    // 날씨 데이터 가져오기
    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('날씨 데이터를 가져오는데 실패했습니다.');
            }
            return response.json();
        })
        .then(data => {
            // API 응답 확인
            if (data.response.header.resultCode !== '00') {
                throw new Error(data.response.header.resultMsg || 'API 오류');
            }

            // 날씨 데이터 처리
            processWeatherData(data.response.body.items.item);
        })
        .catch(error => {
            console.error('날씨 API 오류:', error);
            weatherContent.innerHTML = `
                <div class="error">
                    날씨 정보를 불러올 수 없습니다.<br>
                    ${error.message}
                </div>
            `;
        });
}

// 날씨 데이터 처리 함수
function processWeatherData(items) {
    // 카테고리별로 데이터 추출
    const weatherData = {
        temperature: '0',
        skyCondition: '1',
        precipitation: '0',
        humidity: '0',
        precipitationType: '0',
        windSpeed: '0'
    };

    items.forEach(item => {
        switch (item.category) {
            case 'T1H': // 기온
                weatherData.temperature = item.fcstValue;
                break;
            case 'SKY': // 하늘상태
                weatherData.skyCondition = item.fcstValue;
                break;
            case 'RN1': // 1시간 강수량
                weatherData.precipitation = item.fcstValue;
                break;
            case 'REH': // 습도
                weatherData.humidity = item.fcstValue;
                break;
            case 'PTY': // 강수형태
                weatherData.precipitationType = item.fcstValue;
                break;
            case 'WSD': // 풍속
                weatherData.windSpeed = item.fcstValue;
                break;
        }
    });

    // 날씨 정보 표시
    displayWeatherInfo(weatherData);
}

// 날씨 정보 표시 함수
function displayWeatherInfo(weatherData) {
    const icon = getWeatherIcon(weatherData.skyCondition, weatherData.precipitationType);
    const description = getWeatherDescription(weatherData.skyCondition, weatherData.precipitationType);

    weatherContent.innerHTML = `
        <div class="weather-icon">${icon}</div>
        <div class="weather-temp">${weatherData.temperature}°C</div>
        <div class="weather-desc">${description}</div>
        <div class="weather-details">
            <div class="weather-detail">습도: ${weatherData.humidity}%</div>
            <div class="weather-detail">강수량: ${weatherData.precipitation}mm</div>
            <div class="weather-detail">풍속: ${weatherData.windSpeed}m/s</div>
        </div>
    `;
}

// 위도/경도를 기상청 격자 좌표로 변환하는 함수
function convertToGrid(lat, lng) {
    const RE = 6371.00877; // 지구 반경(km)
    const GRID = 5.0; // 격자 간격(km)
    const SLAT1 = 30.0; // 투영 위도1(degree)
    const SLAT2 = 60.0; // 투영 위도2(degree)
    const OLON = 126.0; // 기준점 경도(degree)
    const OLAT = 38.0; // 기준점 위도(degree)
    const XO = 43; // 기준점 X좌표(GRID)
    const YO = 136; // 기준점 Y좌표(GRID)

    const DEGRAD = Math.PI / 180.0;
    const RADDEG = 180.0 / Math.PI;

    const re = RE / GRID;
    const slat1 = SLAT1 * DEGRAD;
    const slat2 = SLAT2 * DEGRAD;
    const olon = OLON * DEGRAD;
    const olat = OLAT * DEGRAD;

    let sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
    let sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
    let ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
    ro = re * sf / Math.pow(ro, sn);

    let ra = Math.tan(Math.PI * 0.25 + (lat) * DEGRAD * 0.5);
    ra = re * sf / Math.pow(ra, sn);
    let theta = lng * DEGRAD - olon;
    if (theta > Math.PI) theta -= 2.0 * Math.PI;
    if (theta < -Math.PI) theta += 2.0 * Math.PI;
    theta *= sn;

    const nx = Math.floor(ra * Math.sin(theta) + XO + 0.5);
    const ny = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);

    return { nx, ny };
}

// 주요 도시 격자 좌표
const cityGrids = {
    '서울': { nx: 60, ny: 127 },
    '부산': { nx: 98, ny: 76 },
    '대구': { nx: 89, ny: 90 },
    '인천': { nx: 55, ny: 124 },
    '광주': { nx: 58, ny: 74 },
    '대전': { nx: 67, ny: 100 },
    '울산': { nx: 102, ny: 84 },
    '세종': { nx: 66, ny: 103 },
    '제주': { nx: 52, ny: 38 }
};

// 현재 위치 기반 날씨 정보 가져오기 (선택적)
function getWeatherByCurrentLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
            position => {
                const { latitude, longitude } = position.coords;
                const gridCoords = convertToGrid(latitude, longitude);
                fetchWeatherData(gridCoords.nx, gridCoords.ny);
            },
            error => {
                console.error('위치 정보를 가져올 수 없습니다:', error);
                // 기본값으로 서울 날씨 정보 가져오기
                fetchWeatherData();
            }
        );
    } else {
        // 위치 정보를 지원하지 않는 브라우저는 서울 날씨 정보 가져오기
        fetchWeatherData();
    }
}

// 페이지 로드 시 날씨 정보 가져오기
document.addEventListener('DOMContentLoaded', function()  {
    // API 키가 설정되었는지 확인
    if (WEATHER_API_KEY === 'wlyAJBWheYEKlFs%2FbQKAmZYp1G%2FTDKpex1PIM%2BeLUtDj95XJmHUmYTer9tpQVR46BrFawvMAGwQzZoL7SXj0DQ%3D%3D') {
        const element = document.getElementById('weather-widget'); // 또는 document.querySelector('.someClass');
        if (!element) {
            console.error('Element with ID/class "weather-widget" not found.');
            return; // 요소가 없으면 더 이상 진행하지 않음
        }
        weatherContent.innerHTML = `
            <div class="error">
                날씨 API 키가 설정되지 않았습니다.<br>
                weather.js 파일에서 WEATHER_API_KEY 값을 설정해주세요.
            </div>
        `;
        return;
    }

    // 날씨 정보 가져오기 (서울 기본값)
    fetchWeatherData();

    // 또는 현재 위치 기반 날씨 정보 가져오기 (선택적)
    // getWeatherByCurrentLocation();
});