const audioCtx = new (window.AudioContext || window.webkitAudioContext)();

function playSound(color) {
    // Erstellen Sie einen OscillatorNode
    const oscillator = audioCtx.createOscillator();

    // Setzen Sie die Frequenz des Oszillators basierend auf der ausgewählten Farbe
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

    // Verbinden Sie den Oszillator mit dem Ausgang
    oscillator.connect(audioCtx.destination);

    // Starten Sie den Oszillator
    oscillator.start();

    // Stoppen Sie den Oszillator nach einer halben Sekunde
    setTimeout(() => {
        oscillator.stop();
    }, 2000);
}