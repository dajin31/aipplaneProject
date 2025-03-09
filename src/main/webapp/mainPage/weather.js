async function fetchWeatherFromServer(nx, ny) {
    try {
        const response = await fetch(`/weather?nx=${nx}&ny=${ny}`);
        if (!response.ok) throw new Error("서버 응답 오류: " + response.status);
        const data = await response.json();

        if (data.error) {
            throw new Error(data.error);
        }

        return data;
    } catch (error) {
        console.error("날씨 데이터를 가져오는 중 오류 발생:", error);
    }
}

// 날씨 데이터 파싱 함수
function parseWeatherData(data) {
    console.log('Raw weather data:', data); // 디버깅 로그

    if (!data || !data.weather || !data.weather.items || !data.weather.items.item) {
        console.error('날씨 데이터 구조 오류', data);
        return null;
    }

    // ! items 배열 -> 배열 변환함
    const items = Array.isArray(data.weather.items.item)
        ? data.weather.items.item
        : [data.weather.items.item];

    console.log('Parsed items:', items);

    const result = {
        baseDate: items[0]?.baseDate,
        baseTime: items[0]?.baseTime,
        temperature: null,
        humidity: null,
        windSpeed: null,
        skyCondition: null,
        precipitation: null
    };

    // 카테고리별 데이터 추출
    items.forEach(item => {
        switch(item.category) {
            case "TMP": // 기온 (1시간 기온)
            case "T1H": // 기온
                result.temperature = item.fcstValue;
                break;
            case "REH": // 습도
                result.humidity = item.fcstValue;
                break;
            case "WSD": // 풍속
                result.windSpeed = item.fcstValue;
                break;
            case "SKY": // 하늘상태
                result.skyCondition = getSkyCondition(item.fcstValue);
                break;
            case "PTY": // 강수형태
                result.precipitation = getPrecipitationType(item.fcstValue);
                break;
        }
    });
    console.log('Parsed result:', result); // 디버깅을 위한 로그
    return result;
}

// 하늘상태 텍스트 변환
function getSkyCondition(value) {
    switch(value) {
        case "1": return "맑음";
        case "3": return "구름많음";
        case "4": return "흐림";
        default: return "알 수 없음";
    }
}

// 강수형태 텍스트 변환
function getPrecipitationType(value) {
    switch(value) {
        case "0": return "없음";
        case "1": return "비";
        case "2": return "비/눈";
        case "3": return "눈";
        case "4": return "소나기";
        default: return "알 수 없음";
    }
}

// 날씨 아이콘 선택
function getWeatherIcon(weatherData) {
    if (!weatherData) return "☁️";

    if (weatherData.precipitation && weatherData.precipitation !== "없음") {
        if (weatherData.precipitation === "눈") return "❄️";
        if (weatherData.precipitation === "비/눈") return "🌨️";
        return "🌧️";
    }

    if (weatherData.skyCondition === "맑음") {
        return "☀️";
    }

    if (weatherData.skyCondition === "구름많음") {
        return "⛅";
    }

    return "☁️";
}

// 날짜 포맷팅
function formatDate(dateStr, timeStr) {
    if (!dateStr || !timeStr) return "";

    const year = dateStr.substring(0, 4);
    const month = dateStr.substring(4, 6);
    const day = dateStr.substring(6, 8);
    const hour = timeStr.substring(0, 2);
    const minute = timeStr.substring(2, 4);

    return `${year}년 ${month}월 ${day}일 ${hour}:${minute}`;
}

// 날씨 정보 렌더링 함수
function renderWeatherInfo(weatherData) {
    const weatherContainer = document.getElementById("weatherResult");

    if (!weatherData) {
        weatherContainer.innerHTML = `
            <div class="weather-error">
                <p>날씨 데이터를 가져오지 못했습니다.</p>
            </div>
        `;
        return;
    }

    const parsedData = parseWeatherData(weatherData);
    console.log('Final parsed data:', parsedData); // 디버깅을 위한 로그

    if (!parsedData) {
        weatherContainer.innerHTML = `
            <div class="weather-error">
                <p>날씨 데이터를 파싱하지 못했습니다.</p>
            </div>
        `;
        return;
    }

    // 온도 표시 부분을 수정
    const temperature = parsedData.temperature
        ? parseFloat(parsedData.temperature).toFixed(1)
        : '--';

    const weatherIcon = getWeatherIcon(parsedData);
    const formattedDate = formatDate(parsedData.baseDate, parsedData.baseTime);

    weatherContainer.innerHTML = `
        <div class="weather-card">
            <div class="weather-header">
                <h3>날씨 정보</h3>
                <span class="weather-date">${formatDate(parsedData.baseDate, parsedData.baseTime)}</span>
            </div>
            <div class="weather-body">
                <div class="weather-main">
                    <div class="weather-icon">${getWeatherIcon(parsedData)}</div>
                    <div class="weather-temp">
                        <span class="temp-value">${temperature}</span>
                        <span class="temp-unit">°C</span>
                    </div>
                    <div class="weather-desc">
                        ${parsedData.skyCondition || '정보 없음'}
                        ${parsedData.precipitation && parsedData.precipitation !== "없음"
        ? ` / ${parsedData.precipitation}`
        : ''}
                    </div>
                </div>
                <div class="weather-location">
                    <p>서울</p>
                    <p class="location-coords">nx: 60, ny: 127</p>
                </div>
            </div>
            <div class="weather-details">
                <div class="weather-detail-item">
                    <div class="detail-icon">💧</div>
                    <div class="detail-info">
                        <span class="detail-label">습도</span>
                        <span class="detail-value">${parsedData.humidity ? `${parsedData.humidity}%` : '15%'}</span>
                    </div>
                </div>
                <div class="weather-detail-item">
                    <div class="detail-icon">🌬️</div>
                    <div class="detail-info">
                        <span class="detail-label">풍속</span>
                        <span class="detail-value">${parsedData.windSpeed ? `${parsedData.windSpeed} m/s` : '--'}</span>
                    </div>
                </div>
            </div>
        </div>
    `;
}

// 페이지 로드 시 자동으로 날씨 데이터 가져오기
document.addEventListener("DOMContentLoaded", async () => {
    const defaultNx = "60";  // 기본 X 좌표값 (예: 서울)
    const defaultNy = "127"; // 기본 Y 좌표값 (예: 서울)

    // 로딩 상태 표시
    const weatherContainer = document.getElementById("weatherResult");
    weatherContainer.innerHTML = `
        <div class="weather-loading">
            <p>날씨 정보를 불러오는 중...</p>
        </div>
    `;

    const weatherData = await fetchWeatherFromServer(defaultNx, defaultNy);
    renderWeatherInfo(weatherData);
});

