// Bestehender Code...

// Neue Funktion zur Berechnung der Randposition relativ zu den Knoten außerhalb des SVG
function getEdgePosition(node) {
    const offset = 5; // Abstand vom Rand
    let edgePosition = { x: node.x, y: node.y };

    // Berechnung der Position am Rand des SVG
    if (node.x < 0) {
        edgePosition.x = offset; // Linker Rand
    } else if (node.x > width) {
        edgePosition.x = width - offset; // Rechter Rand
    }

    if (node.y < 0) {
        edgePosition.y = offset; // Oberer Rand
    } else if (node.y > height) {
        edgePosition.y = height - offset; // Unterer Rand
    }

    return edgePosition;
}

// Funktion zur Erstellung von Proxy-Knoten am Bildschirmrand
function createProxyNode(originalNode) {
    const proxyPosition = getEdgePosition(originalNode);
    const proxyNode = {
        id: nodes.length + 1,
        name: "Proxy für " + originalNode.name,
        color: "grey",
        x: proxyPosition.x,
        y: proxyPosition.y
    };
    nodes.push(proxyNode);
    links.push({ source: originalNode.id, target: proxyNode.id });
    return proxyNode;
}

function createProxies(nodeColor) {
    const nodesOutside = nodes.filter(node => node.x < 0 || node.x > width || node.y < 0 || node.y > height);
    nodesOutside.forEach(node => {
        if (node.color === nodeColor) {
        createProxyNode(node);
        console.log("Proxy erstellt für: ", node.name);
    }
    });
    updateGraph();
}

// Hilfsfunktion, um den Graphen zu aktualisieren
function updateGraph() {
    // Knoten aktualisieren
    const node = container.select(".nodes").selectAll("circle").data(nodes);
    node.enter().append("circle")
        .attr("class", "node")
        .attr("r", 10)
        .merge(node)
        .attr("cx", d => d.x)
        .attr("cy", d => d.y)
        .style("fill", d => d.color)
        .call(d3.drag()
            .on("start", dragstarted)
            .on("drag", dragged)
            .on("end", dragended));
    node.exit().remove();

    node.append("title")
        .text(d => d.name);

    simulation.nodes(nodes);
    // simulation.force("link").links(links);
    // simulation.alpha(1).restart();
}




