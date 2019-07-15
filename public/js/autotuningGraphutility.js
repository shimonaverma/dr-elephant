/*
 * Copyright 2016 LinkedIn Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

/* Show loading sign during ajax call */
$(document).ajaxStart(function() {
  $("#loading-indicator").show();
});

$(document).ajaxStop(function() {
  $("#loading-indicator").hide();
});

/* Plot the performance graph for the data */
function plotter(data ) {


  var lastEle = data[data.length-1];
  data.pop();
  var lastEle2 = data[data.length-1];
  data.pop();
  var lastEle3 = data[data.length-1];
  data.pop();

  var graphContainer = d3.select("#visualisation");
  var MARGINS = {top: 50, right: 50, bottom: 100, left: 50},
      WIDTH = graphContainer.style("width").replace("px", ""),
      HEIGHT = graphContainer.style("height").replace("px", ""),
      GRAPH_WIDTH = WIDTH - MARGINS.left - MARGINS.right,
      GRAPH_HEIGHT = HEIGHT - MARGINS.top - MARGINS.bottom;
  var parseDate = d3.time.format("%Y-%m-%d %H:%M:%S").parse;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  var table1 = d3.select('#table').append('table');

  var thead = table1.append('thead');
  var tbody = table1.append('tbody');

  var columns = ['createdTs','resourceused', 'inputSize', 'executionTime'], column_id = 'code', column_class = 'norm';

  thead.append('tr')
      .selectAll('th')
      .data(['Job Executions','Resources Used (GB Hours)', 'Input Size (GB)', 'Execution Time (sec)'])
      .enter()
      .append('th')
      .text(function(column) {
        return column;
      });

  var rows = tbody.selectAll('tr')
      .data(data)
      .enter()
      .append('tr');



  var cells = rows.selectAll('td')
      .data(function(row) {
        return columns.map(function(column) {
          return {
            column: column,
            value: row[column],
            id: row[column_id],
            class: row[column_class]
          };
        });
      })
      .enter()
      .append('td')
      .html(function(d) {
        return d.value;
      });
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  for( i=0 ;i < data.length ; i++){
    data[i].suggestedParameters.sort(function(a,b){
          return (a.parameterId > b.parameterId) ? 1 : -1;
        }
    );
  };

  data.forEach(function(d) {
    d.createdTs = parseDate(d.createdTs);});

  var xScale = d3.time.scale()
          .range([2*MARGINS.left, GRAPH_WIDTH-MARGINS.right])
          .domain(d3.extent(data, function(d) { return d.createdTs; })),

      yScale = d3.scale.linear()
          .range([MARGINS.bottom + GRAPH_HEIGHT-10, 2*MARGINS.top+20])
          .domain([0,Math.max(
              d3.max(data, function (d) { return Math.max(d.inputSize) }),
              d3.max(data, function (d) { return Math.max(d.resourceused) })
          )]);
  var yScaleRight = d3.scale.linear()
      .range([MARGINS.bottom + GRAPH_HEIGHT-10, 2*MARGINS.top+20])
      .domain([
        d3.min(data, function (d) { return Math.min(d.executionTime) }),
        d3.max(data, function (d) { return Math.max(d.executionTime) })]);

  var customTimeFormat = d3.time.format("%b-%d %I:%M:%S");


  var xAxis = d3.svg.axis()
          .scale(xScale)
          .orient("bottom")
          .ticks(5)
          .tickFormat(customTimeFormat)
          .tickSize(1),

      yAxis = d3.svg.axis()
          .scale(yScale)
          .orient("left")
          .ticks(6)
  ;

  var yAxisRight = d3.svg.axis()
      .scale(yScaleRight)
      .orient("right")
      .ticks(6);


  graphContainer.append("svg:g")
      .attr("class", "x axis")
      .attr("transform", "translate(0 ," + (MARGINS.bottom + GRAPH_HEIGHT-10)+ ")")
      .call(xAxis)
      .selectAll("text")
      .style("text-anchor","end")
      .attr("dx", "-.8em")
      .attr("dy", ".15em")
      .attr("transform","rotate(-20)");

  graphContainer.append("svg:g")
      .attr("class", "y axis")
      .attr("transform", "translate(" + (MARGINS.left) + ", 0)")
      .call(yAxis)
      .selectAll("text")
      .attr("fill", "rgb(0, 119, 181)");

  graphContainer.append("svg:g")
      .attr("class", "y axis")
      .attr("transform", "translate(" + (GRAPH_WIDTH) + ", 0)")
      .call(yAxisRight)
      .attr("id", "ExecTimeAxis")
      .selectAll("text")
      .attr("fill", "rgb(0, 119, 181)");


  //specify meaning of graphs

  graphContainer.append("svg:text")
      .style("font-size", "16px")
      .style("fill", "#006060")
      .attr("transform", "translate(" + (MARGINS.left/10) + ", " + (MARGINS.top + 22) + ")")
      .text("ResourcesUsed(GB Hours)");


  graphContainer.append("svg:text")
      .attr("id","ExecText")
      .style("font-size", "16px")
      .style("fill", "#006060")
      .attr("transform", "translate(" + (GRAPH_WIDTH - MARGINS.left-35) + ", " +(MARGINS.top + 22) + ")")
      .text("Execution Time(sec)");


  // Add the small rectangles to specify the graph meaning
  graphContainer.append("rect")
      .attr("x", GRAPH_WIDTH - 18)
      .attr("width", 14)
      .attr("height", 14)
      .style("fill", 'blue' );

  graphContainer.append("text")
      .attr("x", GRAPH_WIDTH - 26)
      .attr("y", 9)
      .attr("dy", ".30em")
      .style("text-anchor", "end")
      .text(function(d) { return "Resource Usage" });

  graphContainer.append("rect")
      .attr("x", GRAPH_WIDTH - 18)
      .attr("y", 20)
      .attr("width", 14)
      .attr("height", 14)
      .style("fill", '#FF0000' )
      .on("click", function(){
        var active   = InputSizePath.active ? false : true,
            newOpacity = active ? 0 : 1;
        d3.select("#InputSizePath").style("opacity", newOpacity);
        d3.select("#InputSizeDots").style("opacity", newOpacity);
        InputSizePath.active = active;
      });

  graphContainer.append("text")
      .attr("x", GRAPH_WIDTH - 26)
      .attr("y", 29)
      .attr("dy", ".30em")
      .style("text-anchor", "end")
      .text(function(d) { return "Input Size(GB)" })
      .on("click", function(){
        var active   = InputSizePath.active ? false : true,
            newOpacity = active ? 0 : 1;
        d3.select("#InputSizePath").style("opacity", newOpacity);
        d3.select("#InputSizeDots").style("opacity", newOpacity);
        InputSizePath.active = active;
      });

  graphContainer.append("rect")
      .attr("x", GRAPH_WIDTH - 18)
      .attr("y", 40)
      .attr("width", 14)
      .attr("height", 14)
      .style("fill", 'green' )
      .on("click", function(){
        var active   = ExecTime.active ? false : true,
            newOpacity = active ? 0 : 1;
        d3.select("#ExecTime").style("opacity", newOpacity);
        d3.select("#ExecDots").style("opacity", newOpacity);
        d3.select("#ExecTimeAxis").style("opacity", newOpacity);
        d3.select("#ExecText").style("opacity", newOpacity);
        ExecTime.active = active;
      });

  graphContainer.append("text")
      .attr("x", GRAPH_WIDTH - 30)
      .attr("y", 50)
      .attr("dy", ".30em")
      .style("text-anchor", "end")
      .on("click", function(){
        // Determine if current line is visible
        var active   = ExecTime.active ? false : true,
            newOpacity = active ? 0 : 1;
        // Hide or show the elements
        d3.select("#ExecTime").style("opacity", newOpacity);
        d3.select("#ExecDots").style("opacity", newOpacity);
        d3.select("#ExecTimeAxis").style("opacity", newOpacity);
        d3.select("#ExecText").style("opacity", newOpacity);
        // Update whether or not the elements are active
        ExecTime.active = active;
      })
      .text(function(d) { return "Execution Time" });


  var lineGen = d3.svg.line()
      .x(function(d) { return xScale(d.createdTs); })
      .y(function(d) {
        return yScale(d.resourceused);
      })
      .interpolate('linear');

  var lineGenInputSize = d3.svg.line()
      .x(function(d){ return xScale(d.createdTs); })
      .y(function(d) {
        return yScale(d.inputSize);
      })
      .interpolate('linear');

  var lineGenExecTime = d3.svg.line()
      .x(function(d){ return xScale(d.createdTs); })
      .y(function(d) {
        return yScaleRight(d.executionTime);
      })
      .interpolate('linear');



  var div = d3.select("body").append("div")
      .attr("class", "tooltip")
      .style("opacity", 0);


  graphContainer.append("svg:g")
      .selectAll("scatter-dots")
      .data(data)
      .enter().append("svg:circle")
      .style({stroke: 'white', fill: 'blue'})
      .attr("cx", function (d) { return xScale(d.createdTs); } )
      .attr("cy", function (d) { return yScale(d.resourceused); } )
      .attr("r", 6)

      .on("mouseover", function(d) {
        div.transition()
            .duration(50)
            .style("opacity", .9);
        div.html(d.jobExecutionId)
            .style('top', (d3.event.pageY + 10)+'px')
            .style('left', (d3.event.pageX + 10)+'px');
        ;
      })
      .on("mouseout", function(d) {
        div.transition()
            .duration(500)
            .style("opacity", 0);
      });

  graphContainer.append("svg:g")
      .attr("id","InputSizeDots")
      .selectAll("scatter-dots")
      .data(data)
      .enter().append("svg:circle")
      .style({stroke: 'white', fill: '#FF0000'})
      .attr("cx", function (d) { return xScale(d.createdTs); } )
      .attr("cy", function (d) { return yScale(d.inputSize); } )
      .attr("r", 5);


  graphContainer.append("svg:g")
      .attr("id","ExecDots")
      .selectAll("scatter-dots")
      .data(data)
      .enter().append("svg:circle")
      .style({stroke: 'white', fill: 'green'})
      .attr("cx", function (d) { return xScale(d.createdTs); } )
      .attr("cy", function (d) { return yScaleRight(d.executionTime); } )
      .attr("r", 5);


//plot linear graphs

  graphContainer.append('svg:path')
      .attr('d', lineGen(data))
      .attr('stroke', 'blue')
      .attr('stroke-width', 3)
      .attr('fill', 'none');


  graphContainer.append('svg:path')
      .attr('d', lineGenInputSize(data))
      .attr("id", "InputSizePath")
      .attr('stroke', '#FF0000')
      .attr('stroke-width', 2)
      .attr('fill', 'none');

  graphContainer.append('svg:path')
      .attr('d', lineGenExecTime(data))
      .attr("id", "ExecTime")
      .attr('stroke', 'green')
      .attr('stroke-width', 1)
      .attr('fill', 'none');


  //Mark the date when autotuning is enabled for the first time

  graphContainer.append('svg:line')
      .style('stroke', 'black')
      .attr('stroke-width', 1)
      .attr('x1', xScale(parseDate(lastEle.createdTs)))
      .attr('y1', 94)
      .attr('x2', xScale(parseDate(lastEle.createdTs)))
      .attr('y2', MARGINS.bottom + GRAPH_HEIGHT-10);

  graphContainer.append("text")
      .attr('x', xScale(parseDate(lastEle.createdTs)))
      .attr('y', 89)
      .attr("text-anchor", "middle")
      .style("font-size", "15px")
      .text("Autotuning enabled");

  graphContainer.append("text")
      .attr('x', xScale(parseDate(lastEle2.createdTs)))
      .attr('y', 109)
      .attr("text-anchor", "middle")
      .style("font-size", "15px")
      .text("Best Parameter Set");



  graphContainer.append('svg:line')
      .style('stroke', 'black')
      .attr('stroke-width', 1)
      .attr('x1', xScale(parseDate(lastEle2.createdTs)))
      .attr('y1', 111)
      .attr('x2', xScale(parseDate(lastEle2.createdTs)))
      .attr('y2', MARGINS.bottom + GRAPH_HEIGHT-10);

  graphContainer.append("text")
      .attr('x',2*MARGINS.left )
      .attr('y', 12)
      .attr("text-anchor", "middle")
      .style("font-size", "16px")
      .text(function(d){
        if(lastEle3.Autotuning== true)
          return "";
        else
          return "Autotuning Disabled";
      });

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Plot for parameters //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  for (var i =0 ;i <=7 ;i++){

    var yParam = d3.scale.linear().range([MARGINS.top + GRAPH_HEIGHT, MARGINS.top+40]).domain([0,
      d3.max(data, function (d) { return Math.max(d.suggestedParameters[i].parameterValue) })]);

    var yAxisParam = d3.svg.axis()
        .scale(yParam)
        .orient("left")
        .ticks(5);

    var width = GRAPH_WIDTH;
    var height = HEIGHT;

    //Create SVG element
    var paramcontainer1 = d3.select("#parameter")
        .append("svg")
        .attr("width", width)
        .attr("height", height);

    paramcontainer1.append("svg:g")
        .attr("class", "y axis")
        .attr("transform", "translate(" + (2*MARGINS.left) + ", 0)")
        .call(yAxisParam)
        .attr("id", "ExecTimeAxis")
        .selectAll("text")
        .attr("fill", "rgb(0, 119, 181)");

    paramcontainer1.append("svg:g")
        .attr("class", "x axis")
        .attr("transform", "translate(0 ," + (HEIGHT - MARGINS.bottom) + ")")
        .call(xAxis)
        .selectAll("text")
        .style("text-anchor","end")
        .attr("dx", "-.8em")
        .attr("dy", ".15em")
        .attr("transform","rotate(-25)");

    var lineGenParam = d3.svg.line()
        .x(function(d){ return xScale(d.createdTs); })
        .y(function(d) {if(Object.keys(d.suggestedParameters).length<= i){return 0;}
        else
        { return yParam(d.suggestedParameters[i].parameterValue);}
        });


    paramcontainer1.append('svg:path')
        .attr('d', lineGenParam(data))
        .attr('stroke', 'blue')
        .attr('stroke-width', 1)
        .attr('fill', 'none');

    var id = data[0].suggestedParameters[i].parameterName;

    paramcontainer1.append("text")
        .attr("x", GRAPH_WIDTH - 26)
        .attr('y', 50)
        .attr("text-anchor", "end")
        .style("font-size", "15px")
        .text("Parameter: "+ id);

    var unit="";
    if(id.includes(".mb") || id.includes(".java.opts")){
      unit = "Value in MB";
    }
    else if(id.includes("Split") || id.includes("split")){
      unit = "Value in Bytes";
    }

    paramcontainer1.append("text")
        .attr("x", 2*MARGINS.left)
        .attr('y', 70)
        .attr("text-anchor", "end")
        .style("font-size", "15px")
        .style("fill", "#006060")
        .text(unit);
  }
}


/* Return the query parameters */
function queryString() {

  var query_string = {};
  var query = window.location.search.substring(1);   // Returns the query parameters excluding ?
  var vars = query.split("&");

  for (var i = 0; i < vars.length; i++) {
    var pair = vars[i].split("=");
    if (typeof query_string[pair[0]] === "undefined") {
      query_string[pair[0]] = pair[1];
    }
  }
  return query_string;
}
