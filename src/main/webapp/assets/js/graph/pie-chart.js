function pieChart(data = [], parentWidth = 270, parentHeight = 270) {
    const width = parentWidth;
    const height = Math.min(parentHeight, width);
    const radius = width / 2;
    const minAngleForLabel = 0.2; // Minimum angle (in radians) for displaying a label

    const color = d3.scaleOrdinal()
        .domain(data.map(d => d.name))
        .range(d3.quantize(t => d3.interpolateSpectral(t * 0.8 + 0.1), data.length).reverse());

    const pie = d3.pie().padAngle(0)
        .sort((a, b)=> d3.ascending(a.name, b.name))
        .value(d => d.value);
    const arcHover = d3.arc()
        .innerRadius(0)
        .outerRadius(radius * 1.0); // Increased radius for hover effect

    const arc = d3.arc()
        .innerRadius(0)
        .outerRadius(radius*0.9);

    const labelRadius = arc.outerRadius()() * 0.7;
    const arcLabel = d3.arc()
        .innerRadius(labelRadius)
        .outerRadius(labelRadius);

    const arcs = pie(data);

    const svg = d3.create("svg")
        .attr("width", width)
        .attr("height", height)
        .attr("viewBox", [-width / 2, -height / 2, width, height])
        .attr("style", "width: 100%; height: 100%; font: 10px sans-serif;");

    function generateColor(x){
        if(x.data.name.includes("Good")){
            return "#96CEB4"
        }else if(x.data.name.includes("Bad")){
            return "#E8A09A"}
        else if(x.data.name.includes("Non related")){
            return "#9BBFE0"
        }else if(x.data.name.includes("Ask for services")) {
            return "#FBE29F"
        }else if(x.data.name.includes("Like")) {

        }
        return color(x.data.name);
    }
    const tooltip = d3.select("#tooltip");
    svg.append("g")
        .attr("stroke", "white")
        .selectAll("path")
        .data(arcs)
        .join("path")
        .attr("fill", d => generateColor(d))
        .attr("d", arc)
        .on("mouseover", function(event, d) {
            event.preventDefault();
            const percentage = ((d.data.value / d3.sum(data, d => d.value)) * 100).toFixed(2);
            d3.select(this).transition().duration(200).attr("d", arcHover);
            tooltip.style("opacity", 1)
                .html(`${d.data.name}: ${d.data.value.toLocaleString("en-US")} - ${percentage}%`)
                .style('left', `${event.pageX+5}px`)
                .style('top', `${event.pageY+5}px`);
        })
        .on("mousemove", function(event) {
            tooltip.style('left', `${event.pageX+5}px`)
                .style('top', `${event.pageY+5}px`);
        })
        .on("mouseout", function(event, d) {
            d3.select(this).transition().duration(200).attr("d", arc);
            tooltip.style("opacity", 0);
        })
        // .append("title")
        // .text(d => `${d.data.name}: ${d.data.value.toLocaleString("en-US")}`);

    svg.append("g")
        .attr("text-anchor", "middle")
        .selectAll("text")
        .data(arcs)
        .join("text")
        .filter(d => (d.endAngle - d.startAngle) > minAngleForLabel) // Filter out small slices
        .attr("transform", d => `translate(${arcLabel.centroid(d)})`)
        .style("font-family", "Rubik")
        .call(text => text.append("tspan")
            .attr("y", "-0.4em")
            .attr("font-weight", "bold")
            .text(d => d.data.name))
        .call(text => text.append("tspan")
            .attr("x", 0)
            .attr("y", "0.7em")
            .attr("fill-opacity", 0.7)
            .text(d => d.data.value.toLocaleString("en-US")));

    return svg.node();
}
