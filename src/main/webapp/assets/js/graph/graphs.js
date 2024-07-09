function shadeColor(color, percent) {

    var R = parseInt(color.substring(1,3),16);
    var G = parseInt(color.substring(3,5),16);
    var B = parseInt(color.substring(5,7),16);

    R = parseInt(R * (100 + percent) / 100);
    G = parseInt(G * (100 + percent) / 100);
    B = parseInt(B * (100 + percent) / 100);

    R = (R<255)?R:255;
    G = (G<255)?G:255;
    B = (B<255)?B:255;

    var RR = ((R.toString(16).length==1)?"0"+R.toString(16):R.toString(16));
    var GG = ((G.toString(16).length==1)?"0"+G.toString(16):G.toString(16));
    var BB = ((B.toString(16).length==1)?"0"+B.toString(16):B.toString(16));

    return "#"+RR+GG+BB;
}

function disjointChart(nodeFile={}, linkFile={}) {
    // Specify the dimensions of the chart.
    const width = 2000;
    const height = 1400;

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

    node.on("mouseover", mouseout);
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

function barChart (data2)  {

    // Specify the chart’s dimensions.
    const width = 1200;
    const height = 400;
    const marginTop = 20;
    const marginRight = 0;
    const marginBottom = 30;
    const marginLeft = 40;
    const bar_color = "#ff8c00";

    // Declare the x (horizontal position) scale and the corresponding axis generator.
    const x = d3.scaleBand()
        .domain(data2.map(d => d.owner))
        .range([marginLeft, width - marginRight])
        .padding(0.1);

    const xAxis = d3.axisBottom(x).tickSizeOuter(0);

    // Declare the y (vertical position) scale.
    const y = d3.scaleLinear()
        .domain([0, d3.max(data2, d => d.old_page_rank)]).nice()
        .range([height - marginBottom, marginTop]);

    // Create the SVG container.
    const svg = d3.create("svg")
        .attr("viewBox", [0, 0, width, height])
        .attr("style", `max-width: ${width}px; height: auto; font: 10px rubik; overflow: visible;`);

    // const tooltip = d3.select("body")
    //     .append("div")
    //     .attr("class","d3-tooltip")
    //     .style("position", "absolute")
    //     .style("z-index", "10")
    //     .style("visibility", "hidden")
    //     .style("padding", "15px")
    //     .style("background", "rgba(0,0,0,0.6)")
    //     .style("border-radius", "5px")
    //     .style("color", "#fff")
    //     .text("Tool");

    // Create a bar for each letter.
    const bar = svg.append("g")
        .attr("fill", bar_color) // Default color of the bars.
        .selectAll("rect")
        .data(data2)
        .join("rect")
        .style("mix-blend-mode", "multiply") // Darker color when bars overlap during the transition.
        .attr("x", d => x(d.owner))
        .attr("y", d => y(d.old_page_rank))
        .attr("height", d => y(0) - y(d.old_page_rank))
        .attr("width", x.bandwidth())
        .on("mouseover", function(event, d) {
            d3.select('#tooltip2').html(`Data: ${d.old_page_rank}`).style("visibility", "visible").style("opacity", 1);
            d3.select(this)
                .attr("fill", shadeColor(bar_color, -15));
        })
        .on("mousemove", function(event, d){
            d3.select('#tooltip2')
                .style("top", (event.pageY-10)+"px")
                .style("left",(event.pageX+10)+"px");
        })
        .on("mouseout", function() {
            d3.select('#tooltip2').html(``).style("visibility", "hidden").style("opacity", 0);
            d3.select(this).attr("fill", bar_color);
        });

    // Create the axes.
    const gx = svg.append("g")
        .attr("transform", `translate(0,${height - marginBottom})`)
        .call(xAxis);

    const gy = svg.append("g")
        .attr("transform", `translate(${marginLeft},0)`)
        .call(d3.axisLeft(y).tickFormat((y) => y))
        .call(g => g.append("text")
            .attr("x", -marginLeft)
            .attr("y", 0)
            .attr("fill", "currentColor")
            .attr("text-anchor", "start")
            .text("↑ Page Rank"))
        .call(g => g.select(".domain").remove());

    // Return the chart, with an update function that takes as input a domain
    // comparator and transitions the x axis and bar positions accordingly.
    return Object.assign(svg.node(), {
        update(order) {
            x.domain(data2.sort(order).map(d => d.owner));

            const t = svg.transition()
                .duration(750);

            bar.data(data2, d => d.owner)
                .order()
                .transition(t)
                .delay((d, i) => i * 20)
                .attr("x", d => x(d.owner));

            gx.transition(t)
                .call(xAxis)
                .selectAll(".tick")
                .delay((d, i) => i * 20);
        }

    });

}

window.onload = async function() {
    const data2 = await fetch('/api/top10').then(response => response.json());
    const node = await fetch('/api/objects').then(response => response.json());
    const link = await fetch('/api/link').then(response => response.json());

    const barChartSVG = barChart(data2);
    const disjointSVG = disjointChart(node, link);

    barChartSVG.style.marginTop = '50px';
    barChartSVG.style.marginTop = 50;
    const barChartAppend = document.getElementById('bar-chart-append');

    barChartAppend.append(barChartSVG);
    const append = document.getElementById('disjoint-append');
    append.appendChild(disjointSVG);

    $(document).ready(function() {
        $('.selectpicker').selectpicker();
        // Attach the change event listener
        $('#select-order').on('changed.bs.select', function(e, clickedIndex, isSelected, previousValue) {
            console.log('Selected value:', $(this).val());
            switch ($(this).val()) {
                case 'alphabetical':
                    barChartSVG.update((a, b) => a.owner.localeCompare(b.owner));
                    break;
                case 'ascending':
                    barChartSVG.update((a, b) => a.old_page_rank - b.old_page_rank);
                    break;
                case 'descending':
                    barChartSVG.update((a, b) => b.old_page_rank - a.old_page_rank);
                    break;
            }
        });

    });

}



