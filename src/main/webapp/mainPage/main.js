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