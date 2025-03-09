// 탭 연동
document.addEventListener('DOMContentLoaded', function() {
    const container = document.querySelector('.slides-container');
    const track = document.querySelector('.slides-track');
    const slides = document.querySelectorAll('.slide');
    const prevButton = document.querySelector('.slide-button.prev');
    const nextButton = document.querySelector('.slide-button.next');

    // 슬라이드 복제하여 무한 루프 구현
    const slideCount = slides.length;
    const cloneSlides = () => {
        slides.forEach(slide => {
            const clone = slide.cloneNode(true);
            track.appendChild(clone);
        });
    };
    cloneSlides();

    let currentIndex = 0;
    let isTransitioning = false;

    // 슬라이드 이동 함수
    const moveSlides = (direction) => {
        if (isTransitioning) return;
        isTransitioning = true;

        const slideWidth = slides[0].offsetWidth + 30; // margin 포함

        if (direction === 'next') {
            currentIndex++;
            track.style.transform = `translateX(-${currentIndex * slideWidth}px)`;

            // 마지막 슬라이드 도달 시 처음으로 리셋
            if (currentIndex >= slideCount) {
                setTimeout(() => {
                    track.style.transition = 'none';
                    currentIndex = 0;
                    track.style.transform = `translateX(0)`;
                    setTimeout(() => {
                        track.style.transition = 'transform 0.5s ease-in-out';
                    }, 10);
                }, 500);
            }
        } else {
            if (currentIndex === 0) {
                track.style.transition = 'none';
                currentIndex = slideCount;
                track.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
                setTimeout(() => {
                    track.style.transition = 'transform 0.5s ease-in-out';
                    currentIndex--;
                    track.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
                }, 10);
            } else {
                currentIndex--;
                track.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
            }
        }

        setTimeout(() => {
            isTransitioning = false;
        }, 500);
    };

    // 버튼 이벤트 리스너
    nextButton.addEventListener('click', () => moveSlides('next'));
    prevButton.addEventListener('click', () => moveSlides('prev'));

    // 트랜지션 종료 이벤트
    track.addEventListener('transitionend', () => {
        isTransitioning = false;
    });

    // 자동 슬라이드 (선택사항)
    let autoSlideInterval;
    const startAutoSlide = () => {
        autoSlideInterval = setInterval(() => {
            moveSlides('next');
        }, 5000); // 5초마다 자동 슬라이드
    };

    const stopAutoSlide = () => {
        clearInterval(autoSlideInterval);
    };

    // 마우스 호버 시 자동 슬라이드 멈춤
    container.addEventListener('mouseenter', stopAutoSlide);
    container.addEventListener('mouseleave', startAutoSlide);

    // 자동 슬라이드 시작
    startAutoSlide();
});
document.addEventListener("DOMContentLoaded", function () {
    let startValue = 'CJU';
    let endValue = 'PVG';

    // 날짜 관련 기능
    const today = new Date();
    const departDate = document.getElementById('departDate');
    const returnDate = document.getElementById('returnDate');

    // 날짜 포맷팅 함수
    function formatDate(date) {
        const d = new Date(date);
        let month = '' + (d.getMonth() + 1);
        let day = '' + d.getDate();
        const year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [year, month, day].join('-');
    }

    // 초기 날짜 설정
    departDate.value = formatDate(today);
    const tomorrow = new Date(today);
    tomorrow.setDate(tomorrow.getDate() + 1);
    returnDate.value = formatDate(tomorrow);

    // 최소 날짜 설정
    departDate.min = formatDate(today);
    returnDate.min = formatDate(today);

    // 출발일 변경 시 도착일 최소값 설정
    departDate.addEventListener('change', function () {
        returnDate.min = this.value;
        if (returnDate.value < this.value) {
            returnDate.value = this.value;
        }
    });

    document.getElementById("searchStart").addEventListener('click', () => {

        const countryList = "/reservation/openCountryList?type=start";
        const popWidth = 800;
        const popHeigth = 300;

        const options = `width=${popWidth}px, height=${popHeigth}px, top=20, left=20, resizable=no, scrollbars=yes, menubar=no, toolbar=no, location=no, directories=no, status=no`;

        const popupWindow = window.open(countryList, 'countryList', options);

        if (popupWindow) {
            console.log("나라 리스트 오픈");
            popupWindow.opener = window;
        } else {
            alert("아오 에러임");
        }
    })

    document.getElementById("searchEnd").addEventListener('click', () => {
        const countryList = "/reservation/openCountryList?type=end";
        const popWidth = 800;
        const popHeigth = 300;

        const options = `width=${popWidth}px, height=${popHeigth}px, top=20, left=20, resizable=no, scrollbars=yes, menubar=no, toolbar=no, location=no, directories=no, status=no`;

        const popupWindow = window.open(countryList, 'countryList', options);

        if (popupWindow) {
            console.log("나라 리스트 오픈");
            popupWindow.opener = window;
        } else {
            alert("아오 에러임");
        }
    })


    window.addEventListener('message', function (event) {
        console.log(event.source.name);
        if (event.source.name === 'countryList') {
            const selectedAirport = event.data;
            if (event.data.type == 'start') {

                console.log('aiport.jsp에서 받은 start 데이터:', selectedAirport);
                const start = document.getElementById("startCountry");
                start.textContent = event.data.cntName;
                console.log(event.data.aptCode);
                startValue = event.data.aptCode;
            } else {
                console.log('aiport.jsp에서 받은 end 데이터:', selectedAirport);
                const end = document.getElementById("endCountry");
                end.textContent = event.data.cntName;
                endValue = event.data.aptCode;
            }
        }
    });

    document.getElementById("searchEnd").addEventListener('click', () => {
        console.log("클릭")
    })


    document.getElementById("swapBtn").addEventListener("click", () => {
        const startCity = document.getElementById("startCountry");
        const endCity = document.getElementById("endCountry");

        const startCityInput = document.getElementById("startCountryInput");
        const endCityInput = document.getElementById("endCountryInput");


        // // 출발지와 도착지의 innerText를 임시 변수에 저장
        // const temp = startCity.innerText;
        // startCity.innerText = endCity.innerText;
        // endCity.innerText = temp;

        const tempText = startCity.innerText;
        const tempValue = startCityInput.value;

        startCity.innerText = endCity.innerText;
        startCityInput.value = endCityInput.value;

        endCity.innerText = tempText;
        endCityInput.value = tempValue;

    });

    document.getElementById("selectPassenger").addEventListener("click", () => {
        const selectedPassenger = "/reservation/seletedPassenger";
        const popWidth = 800;
        const popHeigth = 300;

        const options = `width=${popWidth}px, height=${popHeigth}px, top=20, left=20, resizable=no, scrollbars=yes, menubar=no, toolbar=no, location=no, directories=no, status=no`;

        const popupWindow = window.open(selectedPassenger, 'selectedPassenger', options);

        if (popupWindow) {
            console.log("탑승객 팝업 오픈");
            popupWindow.opener = window;
        } else {
            alert("아오 에러임");
        }
    })

    window.addEventListener('message', function (event) {
        console.log(event.source.name);
        if (event.source.name === 'selectedPassenger') {
            const selectedPassenger = event.data;
            console.log(selectedPassenger);
            document.getElementById("selectPassenger").style.display = "none";

            const elementById = document.getElementById("passengerDiv");

            const pElement = document.createElement('p');
            pElement.id = 'checkPassenger';

            const adult = event.data.adult;
            const child = event.data.child;


            if (child == '0') {
                pElement.textContent = "성인 : " + adult + "명";
            } else {

                pElement.textContent = "성인 : " + adult + "명 , " + "소아 : " + child + "명";

            }

            elementById.appendChild(pElement);
        }
    });

    document.querySelector('form').addEventListener('submit', function (event) {
        // event.preventDefault();
        // const startValue = document.getElementById("startCountry").textContent;
        document.getElementById("startCountryInput").value = startValue;

        // const endValue = document.getElementById("endCountry").textContent;
        document.getElementById("endCountryInput").value = endValue;

        const departDateValue = document.getElementById("departDate").value;

        const returnDateValue = document.getElementById("returnDate").value;

        const checkValue = document.getElementById("checkPassenger").textContent;

        document.getElementById("checkPassengerInput").value = checkValue;

        const selectValue = document.querySelector('.passenger-select').value;

        console.log(startValue)
        console.log(endValue)
        console.log(departDateValue)
        console.log(returnDateValue)
        console.log(checkValue)
        console.log(selectValue)

    })
});