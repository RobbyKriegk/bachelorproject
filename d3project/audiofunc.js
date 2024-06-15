const audioCtx = new (window.AudioContext || window.webkitAudioContext)();

function playSound(color) {
    const oscillator = audioCtx.createOscillator();

    switch(color) {
        case 'red':
            oscillator.frequency.value = 261.63; // C4
            break;
        case 'blue':
            oscillator.frequency.value = 293.66; // D4
            break;
        case 'green':
            oscillator.frequency.value = 329.63; // E4
            break;
        case 'null':
            oscillator.frequency.value = 0;
            break;    
        default:
            return;
    }
    oscillator.connect(audioCtx.destination);
    oscillator.start();
    setTimeout(() => {
        oscillator.stop();
    }, 2000);
}