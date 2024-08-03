function pieChart(data = [], parentWidth = 270, parentHeight = 270) {

    const width = parentWidth;
    const height = Math.min(parentHeight, width);

    const color = d3.scaleOrdinal()
        .domain(data.map(d => d.name))
        .range(d3.quantize(t => d3.interpolateSpectral(t * 0.8 + 0.1), data.length).reverse());

    const pie = d3.pie()
        .sort(null)
        .value(d => d.value);

    const arc = d3.arc()
        .innerRadius(0)
            .outerRadius(width / 2);

    const labelRadius = arc.outerRadius()() * 0.8;

    const arcLabel = d3.arc()
        .innerRadius(labelRadius)
        .outerRadius(labelRadius);

    const arcs = pie(data);

    const svg = d3.create("svg")
        .attr("width", width)
        .attr("height", height)
        .attr("viewBox", [-width / 2, 0, width, height])
        .attr("style", "width: 100%; height: 100%; font: 10px sans-serif;");

    svg.append("g")
        .attr("stroke", "white")
        .selectAll("path")
        .data(arcs)
        .join("path")
        .attr("fill", d => color(d.data.name))
        .attr("d", arc)
        .append("title")
        .text(d => `${d.data.name}: ${d.data.value.toLocaleString("en-US")}`);

    svg.append("g")
        .attr("text-anchor", "middle")
        .selectAll("text")
        .data(arcs)
        .join("text")
        .attr("transform", d => `translate(${arcLabel.centroid(d)})`)
        .call(text => text.append("tspan")
            .attr("y", "-0.4em")
            .attr("font-weight", "bold")
            .text(d => d.data.name))
        .call(text => text.filter(d => (d.endAngle - d.startAngle) > 0.25).append("tspan")
            .attr("x", 0)
            .attr("y", "0.7em")
            .attr("fill-opacity", 0.7)
            .text(d => d.data.value.toLocaleString("en-US")));

    return svg.node();
}