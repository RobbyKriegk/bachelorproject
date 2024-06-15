function vibrateBasedOnNodeCount(nodeCount, vibroMS) {
    let className;
    vibroMS = vibroMS ? vibroMS : 2000;

    if (nodeCount <= 5) {
        className = 'lightVibrate';
    } else if (nodeCount > 5 && nodeCount <= 10) {
        className = 'mediumVibrate';
    } else {
        className = 'strongVibrate';
    }

    const selectedNodes = d3.selectAll(".active").nodes();
    selectedNodes.forEach(node => {
        node.classList.add(className);
        setTimeout(() => node.classList.remove(className), vibroMS);
    });
}