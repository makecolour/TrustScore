
function chart(nodeFile={}, linkFile={}) {
    // Specify the dimensions of the chart.
    const width = 1920;
    const height = 1080;

    // Specify the color scale.
    const color = d3.scaleOrdinal(d3.schemeCategory10);

    // The force simulation mutates links and nodes, so create a copy
    // so that re-evaluating this cell produces the same result.
    const links = linkFile.map(d => ({...d}));
    const nodes = nodeFile.map(d => ({...d}));

    // Create a simulation with several forces.
    const simulation = d3.forceSimulation(nodes)
        .force("link", d3.forceLink(links).id(d => d.id))
        .force("charge", d3.forceManyBody())
        .force("x", d3.forceX())
        .force("y", d3.forceY());

    // Create the SVG container.
    const svg = d3.create("svg")
        .attr("width", width)
        .attr("height", height)
        .attr("viewBox", [-width / 2, -height / 2, width, height])
        .attr("style", "max-width: 100%; height: auto;");

    // Add a line for each link, and a circle for each node.
    const link = svg.append("g")
        .attr("stroke", "#999")
        .attr("stroke-opacity", 0.6)
        .selectAll("line")
        .data(links)
        .join("line")
        .attr("stroke-width", d => Math.sqrt(d.value));

    const radius = 5;
    const node = svg.append("g")
        .attr("stroke", "#fff")
        .attr("stroke-width", 1)
        .selectAll("circle")
        .data(nodes)
        .join("circle")
        .attr("r", radius)
        .attr("owner", d => d.owner)
        .attr("group", d => d.group);

    node.attr("fill", function (d) {
        return fill(d);
    });

    function fill (d) {
        if(d.group == "user") {
            return "#f27125"
        }else if(d.group == "service_provider") {
            return "#2185d0"
        } else if(color(d.owner)=="#f27125"||color(d.owner)=="#2185d0") {
            if(d.hasOwnProperty('Unnamed: 0'))
            {
                return color(d['Unnamed: 0']);
            }
            else{
                return color(d.id)
            }
        } else {
            return color(d.owner)
        }
    }

    node.append("title")
        .text(d => d.owner);


    //add
    // const Tooltip = d3.select('#tooltip').style('opacity', 0); // Start with the tooltip hidden


    var mouseover = function(d) {
        Tooltip
            .style("opacity", 1)
        d3.select(this)
            .style("stroke", "black")
            .style("opacity", 1)
    }

    var mouseleave = function(d) {
        Tooltip
            .style("opacity", 0)
        d3.select(this)
            .style("stroke", "none")
            .style("opacity", 0.8)
    }

    function showTooltip(event, d) {
        Tooltip
            .style('opacity', 1)
            .html(`Node data: `) // Example content, replace with your data
            .style('left', `${event.pageX}px`)
            .style('top', `${event.pageY}px`);
    }
    function clicked(event, d) {
        if (event.defaultPrevented) return; // dragged
        d3.select('#tooltip')
            .style('opacity', 1)
            .html(`Node data: ${JSON.stringify(d)}`) // Display all attributes of the node
            .style('left', `${event.pageX}px`)
            .style('top', `${event.pageY}px`);

        d3.select(this).transition()
            .attr("fill", "white")
            .attr("stroke", "black")
            .attr("r", radius * 2)
            .transition()
            .attr("r", radius)
            .attr("stroke", "white")
            .attr("fill", function (d) {return fill(d);});
    }

    node.on("click", clicked);
    function mouseout() {
        d3.select('#tooltip')
            .style('opacity', 0); // Hide the tooltip
    }

    // node.on("mouseout", mouseout);
    //node.on("mouseover", mouseover)
    //node.on("mouseleave", mouseleave)
    // Add a drag behavior.
    node.call(d3.drag()
        .on("start", dragstarted)
        .on("drag", dragged)
        .on("end", dragended));

    // Set the position attributes of links and nodes each time the simulation ticks.
    simulation.on("tick", () => {
        link
            .attr("x1", d => d.source.x)
            .attr("y1", d => d.source.y)
            .attr("x2", d => d.target.x)
            .attr("y2", d => d.target.y);

        node
            .attr("cx", d => d.x)
            .attr("cy", d => d.y);
    });

    // Reheat the simulation when drag starts, and fix the subject position.
    function dragstarted(event) {
        if (!event.active) simulation.alphaTarget(0.3).restart();
        event.subject.fx = event.subject.x;
        event.subject.fy = event.subject.y;
    }

    // Update the subject (dragged node) position during drag.
    function dragged(event) {
        event.subject.fx = event.x;
        event.subject.fy = event.y;
    }

    // Restore the target alpha so the simulation cools after dragging ends.
    // Unfix the subject position now that it’s no longer being dragged.
    function dragended(event) {
        if (!event.active) simulation.alphaTarget(0);
        event.subject.fx = null;
        event.subject.fy = null;
    }

    // When this cell is re-run, stop the previous simulation. (This doesn’t
    // really matter since the target alpha is zero and the simulation will
    // stop naturally, but it’s a good practice.)


    return svg.node();
}
  document.addEventListener('DOMContentLoaded',async function() {
    const node = await fetch('/api/objects').then(response => response.json());
    const link = await fetch('/api/link').then(response => response.json());
    const svg = barChart(node, link);
    const append = document.getElementById('disjoint-append');
    append.appendChild(svg);
  })

