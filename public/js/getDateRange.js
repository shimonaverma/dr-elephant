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

$(document).ready(function(){

  /* Plot graph for data obtained from ajax call */
  $.getJSON('/rest/getDateRange?id=' + queryString()['job-def-id'], function(data) {
    makeList(data);
  });
});


function  makeList(data) {
  var sdate = document.getElementById("startDate");
  var edate = document.getElementById("endDate");

  //Add the Options to the DropDownList.
  for (var i = 0; i < data.length; i++) {
    var option = document.createElement("OPTION");
    option.innerHTML = data[i].date;
    option.value = data[i].date;
    sdate.options.add(option);
  }
  for (var i = 0; i < data.length; i++) {
    var option = document.createElement("OPTION");
    option.innerHTML = data[i].date;
    option.value = data[i].date;
    edate.options.add(option);
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
