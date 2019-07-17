<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi" async></script>
        <script type="text/javascript">
            var queryObject="";
            var queryObjectLen="";
            $.ajax({
                type : 'POST',
                url : 'bookcategory.jsp',
                dataType:'json',
                success : function(data) {
                	console.log(JSON.stringify(data,4,3));
                    queryObject = eval('(' + JSON.stringify(data) + ')');
                    
                    queryObjectLen = queryObject.bookdetails.length;
                },
                    error : function(xhr, type) {
                    alert('server error occoured')
                }
            });
            google.load("visualization", "1", {packages:["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
           var data = new google.visualization.DataTable();
                data.addColumn('string', 'bcategoryid');
                data.addColumn('number', 'qoh');
                for(var i=0;i<queryObjectLen;i++)
                {
                    var bcategoryid = queryObject.bookdetails[i].bcategoryid;
                    var qoh = queryObject.bookdetails[i].qoh;
                    data.addRows([
                        [bcategoryid,parseInt(qoh)]
                    ]);
                }
                var options = {
                    title: 'Books Available by Genre',
                };
  var chart = new google.visualization.PieChart(document.getElementById('chart_div'));

 chart.draw(data,options);
 }
        </script>
        </head>
        <body>
              <div id="chart_div"></div>
         </body>
        </html>