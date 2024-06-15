
const width = 300;
const height = 600;

var nodeColor = "null";
var nodeNumber = 0;
var audioToggle = false;
var vibroToggle = false;
var audioMS = null;
var vibroMS = null;

const svg = d3.select("#graph").append("svg")
    .attr("width", width)
    .attr("height", height);

    svg.append("defs").append("clipPath")
    .attr("id", "clip")
    .append("rect")
    .attr("width", width)
    .attr("height", height);

    svg.attr("clip-path", "url(#clip)");

    svg.append("rect")
    .attr("width", width)
    .attr("height", height)
    .style("stroke", "black")
    .style("fill", "none")
    .style("stroke-width", 2);


    svg.attr("clip-path", "url(#clip)");
// Beispieldaten
const nodes = [
    { id: 1, name: "Knoten 1", color: "green" },
    { id: 2, name: "Knoten 2", color: "blue" },
    { id: 3, name: "Knoten 3", color: "red" },
    { id: 4, name: "Knoten 4", color: "green" },
    { id: 5, name: "Knoten 5", color: "blue" },
    { id: 6, name: "Knoten 6", color: "red" },
    { id: 7, name: "Knoten 7", color: "green" },
    { id: 8, name: "Knoten 8", color: "blue" },
    { id: 9, name: "Knoten 9", color: "green" },
    { id: 10, name: "Knoten 10", color: "red" },
    { id: 11, name: "Knoten 11", color: "blue" },
    { id: 12, name: "Knoten 12", color: "blue" },
    { id: 13, name: "Knoten 13", color: "blue" },
    { id: 14, name: "Knoten 14", color: "green" },
    { id: 15, name: "Knoten 15", color: "blue" },
    { id: 16, name: "Knoten 16", color: "green" },
    { id: 17, name: "Knoten 17", color: "blue" },
    { id: 18, name: "Knoten 18", color: "red" },
    { id: 19, name: "Knoten 19", color: "blue" },
    { id: 20, name: "Knoten 20", color: "blue" },
    { id: 21, name: "Knoten 21", color: "green" },
    { id: 22, name: "Knoten 22", color: "blue" },
    { id: 23, name: "Knoten 23", color: "red" },
    { id: 24, name: "Knoten 24", color: "green" },
    { id: 25, name: "Knoten 25", color: "blue" },
    { id: 26, name: "Knoten 26", color: "green" },
    { id: 27, name: "Knoten 27", color: "blue" },
    { id: 28, name: "Knoten 28", color: "green" },
    { id: 29, name: "Knoten 29", color: "blue" },
    { id: 30, name: "Knoten 30", color: "blue" }
   
];

const links = [
    { source: 1, target: 2 },
    { source: 1, target: 3 },
    { source: 2, target: 4 },
    { source: 2, target: 5 },
    { source: 3, target: 6 },
    { source: 3, target: 7 },
    { source: 4, target: 8 },
    { source: 4, target: 9 },
    { source: 5, target: 10 },
    { source: 5, target: 11 },
    { source: 6, target: 12 },
    { source: 6, target: 13 },
    { source: 7, target: 14 },
    { source: 7, target: 15 },
    { source: 8, target: 16 },
    { source: 8, target: 17 },
    { source: 9, target: 18 },
    { source: 9, target: 19 },
    { source: 10, target: 20 },
    { source: 10, target: 21 },
    { source: 11, target: 22 },
    { source: 11, target: 23 },
    { source: 12, target: 24 },
    { source: 12, target: 25 },
    { source: 13, target: 26 },
    { source: 13, target: 27 },
    { source: 14, target: 28 },
    { source: 14, target: 29 },
    { source: 15, target: 1 },
    { source: 16, target: 2 },
    { source: 17, target: 3 },
    { source: 18, target: 4 },
    { source: 19, target: 5 },
    { source: 20, target: 6 },
    { source: 21, target: 7 },
    { source: 22, target: 8 },
    { source: 23, target: 9 },
    { source: 24, target: 10 },
    { source: 25, target: 11 },
    { source: 26, target: 12 },
    { source: 27, target: 13 },
    { source: 28, target: 14 },
];

const simulation = d3.forceSimulation(nodes)
    .force("link", d3.forceLink(links).id(d => d.id).distance(50))
    .force("charge", d3.forceManyBody().strength(-400))
    .force("center", d3.forceCenter(width / 2, height / 2));

const container = svg.append('g');
    
const link = container.append("g")
    .attr("class", "links")
    .selectAll("line")
    .data(links)
    .enter().append("line")
    .attr("class", "link");

const node = container.append("g")
    .attr("class", "nodes")
    .selectAll("circle")
    .data(nodes)
    .enter().append("circle")
    .attr("class", "node")
    .attr("r", 10)
    .attr("cx", d => d.x)
    .attr("cy", d => d.y)
    .call(d3.drag()
        .on("start", dragstarted)
        .on("drag", dragged)
        .on("end", dragended));

node.append("title")
    .text(d => d.name);

simulation
    .nodes(nodes)
    .on("tick", ticked);


const zoom = d3.zoom()
    .scaleExtent([-10, 10])
    .on("zoom", function(event) {
        container.attr("transform", event.transform);
    });

    
svg.call(zoom);
    
function ticked() {
    link
        .attr("x1", d => d.source.x)
        .attr("y1", d => d.source.y)
        .attr("x2", d => d.target.x)
        .attr("y2", d => d.target.y);

    node
        .attr("cx", d => d.x)
        .attr("cy", d => d.y)
        .style("fill", d => d.color);
}

function dragstarted(event, d) {
    if (!event.active) simulation.alphaTarget(0.3).restart();
    d.fx = d.x;
    d.fy = d.y;
}

function dragged(event, d) {
    d.fx = event.x;
    d.fy = event.y;
}

function dragended(event, d) {
    if (!event.active) simulation.alphaTarget(0);
    d.fx = null;
    d.fy = null;
}

function chooseColor(color) {
    const nodes = d3.selectAll(".node");
    nodes.classed("active", false);
    const selectedNodes = nodes.filter(d => d.color === color);
    
    selectedNodes.classed("active", true);
    selectedNodes.style("stroke", "black");
    selectedNodes.style("stroke-width", 2);
    nodeNumber = selectedNodes.size();
}

document.getElementById("color-form").addEventListener("submit", function(event) {

    event.preventDefault();
    nodeColor = document.getElementById("color-select").value;
    resetNodes();
    chooseColor(nodeColor);
    audioToggle ? playSound(nodeColor, audioMS) : null;
    vibroToggle ? vibrateBasedOnNodeCount(nodeNumber, vibroMS) : null;
});

document.getElementById("proxy-form").addEventListener("submit", function(event) {
    event.preventDefault();
    if(nodeColor != "null") {
    createProxies(nodeColor);
    }

    
});

document.getElementById("proxy-form").addEventListener("reset", function(event) {
    event.preventDefault();
    const nodes = d3.selectAll(".node");
    nodes.each(function(d) {
        if(d.color == "grey") {
            d3.select(this).remove();
        } 
    });
});

document.getElementById("audio-form").addEventListener("submit", function(event) {
    event.preventDefault();
    audioToggle = true;
    audioMS = document.getElementById("audio-input").value;
});

document.getElementById("audio-form").addEventListener("reset", function(event) {
    event.preventDefault();
    audioToggle = false;
}
);



document.getElementById("vibro-form").addEventListener("submit", function(event) {
    event.preventDefault();
    vibroToggle = true;
    vibroMS = document.getElementById("vibro-input").value;
});

document.getElementById("vibro-form").addEventListener("reset", function(event) {
    event.preventDefault();
    vibroToggle = false;
}
);

function isNodeVisible(node) {
    
    if(node.x <= width + 10 || node.y <= height + 10) {
        return true;
    }
    return false;
}

function resetNodes() {
    const nodes = d3.selectAll(".node");
    nodes.style("fill", d => d.color);
    nodes.style("stroke", "none");
}

