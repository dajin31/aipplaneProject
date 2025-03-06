// 탭 연동
document.addEventListener('DOMContentLoaded', function() {
    const container = document.querySelector('.slides-container');
    const slides = document.querySelectorAll('.slide');
    const prevButton = document.querySelector('.slide-button.prev');
    const nextButton = document.querySelector('.slide-button.next');

    let currentIndex = 0;
    const slidesToShow = 6; // 한 번에 보여줄 슬라이드 수
    const slideWidth = container.clientWidth/ slidesToShow - 30;

    slides.forEach(item => {
        item.style.minWidth = slideWidth + "px";
    })

    // 초기 버튼 상태 설정
    updateButtonStates();

    // 이전 버튼 클릭
    prevButton.addEventListener('click', () => {
        if (currentIndex > 0) {
            currentIndex--;
            updateSlidePosition();
        }
    });

    // 다음 버튼 클릭
    nextButton.addEventListener('click', () => {
        if (currentIndex < slides.length - slidesToShow) {
            currentIndex++;
            updateSlidePosition();
        }
    });

    // 슬라이드 위치 업데이트
    function updateSlidePosition() {
        container.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
        updateButtonStates();
    }

    // 버튼 상태 업데이트
    function updateButtonStates() {
        prevButton.style.opacity = currentIndex === 0 ? '0.5' : '1';
        prevButton.style.cursor = currentIndex === 0 ? 'default' : 'pointer';

        nextButton.style.opacity = currentIndex >= slides.length - slidesToShow ? '0.5' : '1';
        nextButton.style.cursor = currentIndex >= slides.length - slidesToShow ? 'default' : 'pointer';
    }

    // 반응형 처리
    window.addEventListener('resize', () => {
        const newSlideWidth = container.clientWidth / slidesToShow;
        slides.forEach(slide => {
            slide.style.minWidth = `${newSlideWidth}px`;
        });
        updateSlidePosition();
    });
});

// 날씨 API 연동
async function getWeather(city) {
    const API_KEY = 'your_api_key';
    try {
        const response = await fetch(
            `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${API_KEY}&units=metric`
        );
        const data = await response.json();
        return data;
    } catch (error) {
        console.error('날씨 정보를 가져오는데 실패했습니다:', error);

    }
}

// 날씨 위젯 업데이트
async function updateWeatherWidget() {
    const weatherData = await getWeather('Seoul');
    if (weatherData) {
        document.getElementById('weather-widget').innerHTML = `
            <div class="weather-info">
                <h4>서울</h4>
                <p>${weatherData.main.temp}°C</p>
                <p>${weatherData.weather[0].description}</p>
                <img src="http://openweathermap.org/img/w/${weatherData.weather[0].icon}.png" alt="날씨 아이콘">
            </div>
        `;
    }
}

// 페이지 로드 시 날씨 정보 업데이트
// document.addEventListener('DOMContentLoaded', updateWeatherWidget);