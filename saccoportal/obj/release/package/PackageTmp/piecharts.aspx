<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="piecharts.aspx.cs" Inherits="SACCOPortal.piecharts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="col-md-6"><canvas id="myChart" width="400" height="200"></canvas></div>
        <div class="col-md-6>">
            <canvas id="pie" ></canvas>
        </div>
    
   <script src="Scripts/Chart.bundle.min.js"></script>
    <script src="Scripts/Chart.min.js"></script>

    <script>
        var data = {
            labels: ["plouf", "plif"],
            datasets: [
              {
                  data: [10, 30],
                  backgroundColor: ['#46be8a', '#57c7d4']
              }
            ]
        };


        var ctx = document.getElementById("pie");
        var myLineChart = new Chart(ctx, {
            type: 'pie',
            data: data
        });

    </script>
  
    <%--<script>    
            var numberWithCommas = function (x) {
                return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            };

             var Deposits2012 = function () {
                 return <%=Member.totaldeposits12%>;
             };
            var Deposits2013 = function () {
                 return <%=Member.totaldeposits13%>;
            };
            var Deposits2014 = function () {
                 return <%=Member.totaldeposits14%>;
            };
            var Deposits2015 = function () {
                 return <%=Member.totaldeposits15%>;
             };

             var Deposits2016 = function () {
                 return <%=Member.totaldeposits16%>;
             };
             var Deposits2017 = function () {
                 return <%=Member.totaldeposits17%>;
             };
        
            var Shares2012 = function () {
                 return <%=Member.currentshares12%>;
             };
            var Shares2013 = function () {
                 return <%=Member.currentshares13%>;
            };
            var Shares2014 = function () {
                 return <%=Member.currentshares14%>;
            };
            var Shares2015 = function () {
                 return <%=Member.currentshares15%>;
             };
             var Shares2016 = function () {
                 return <%=Member.currentshares16%>;
             };
             var Shares2017 = function () {
                 return <%=Member.currentshares17%>;
             };

            var barChartData = {
                labels: ["2013","2014","2015","2016","2017"],
                datasets: [
                    {
                        fillColor: "rgba(39,174,97,0.5)",
                        highlightFill: "rgba(39,174,97,0.75)",
                        data: [Deposits2013(), Deposits2014(), Deposits2015(), Deposits2016(), Deposits2017()]
                    },
                   
                  {
                      fillColor: "rgba(112,31,133,0.5)",
                      highlightFill: "rgba(112,31,133,0.75)",
                      data: [Shares2013(),Shares2014(),Shares2015(),Shares2016(), Shares2017()]
                  }
                ]

            }
            var ctx = document.getElementById("bar").getContext("2d");
            window.myBar = new Chart(ctx).Bar(barChartData, {
                responsive: true,
            });
 </script>--%>


   <%-- <script type="text/javascript">
        // Return with commas in between
        var numberWithCommas = function (x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        };

             var Deposits2016 = function () {
                 return <%=Member.totaldeposits16%>;
             };
             var Deposits2017 = function () {
                 return <%=Member.totaldeposits17%>;
             };
             
            
             var Shares2016 = function () {
                 return <%=Member.currentshares16%>;
             };
             var Shares2017 = function () {
                 return <%=Member.currentshares17%>;
             };



        var dataPack1 = [Deposits2016, Deposits2017()];
        var dataPack2 = [Shares2016(), Shares2017()];
        var dates = ["2016", "2017"];

        // Chart.defaults.global.elements.rectangle.backgroundColor = '#FF0000';

        var bar_ctx = document.getElementById('bar-chart');
        var bar_chart = new Chart(bar_ctx, {
            type: 'bar',
            data: {
                labels: dates,
                datasets: [
                {
                    label: 'Deposits',
                    data: dataPack1,
                    //data: [Deposits2016(), Deposits2017()],
                    backgroundColor: "rgba(55, 160, 225, 0.7)",
                    hoverBackgroundColor: "rgba(55, 160, 225, 0.7)",
                    hoverBorderWidth: 2,
                    hoverBorderColor: 'lightgrey'
                },
                {
                    label: 'Shares',
                    data: dataPack2,
                    //data: [Shares2016(), Shares2017()],
                    backgroundColor: "rgba(225, 58, 55, 0.7)",
                    hoverBackgroundColor: "rgba(225, 58, 55, 0.7)",
                    hoverBorderWidth: 2,
                    hoverBorderColor: 'lightgrey'
                },
                ]
            },
            options: {
                animation: {
                    duration: 10,
                },
                tooltips: {
                    mode: 'label',
                    callbacks: {
                        label: function (tooltipItem, data) {
                            return data.datasets[tooltipItem.datasetIndex].label + ": " + numberWithCommas(tooltipItem.yLabel);
                        }
                    }
                },
                scales: {
                    xAxes: [{
                        stacked: true,
                        gridLines: { display: false },
                    }],
                    yAxes: [{
                        stacked: true,
                        ticks: {
                            callback: function (value) { return numberWithCommas(value); },
                        },
                    }],
                }, // scales
                legend: { display: true }
            } // options
        }
        );

    </script>--%>

    <script type="text/javascript">
         var Deposits2016 = function () {
                 return <%=Member.totaldeposits16%>;
             };
             var Deposits2017 = function () {
                 return <%=Member.totaldeposits17%>;
             };
             
            
             var Shares2016 = function () {
                 return <%=Member.currentshares16%>;
             };
             var Shares2017 = function () {
                 return <%=Member.currentshares17%>;
             };

        var canvas = document.getElementById('myChart');
        var data = {
            labels: ["2016", "2017"],
            datasets: [
                {
                    label: "Deposits",
                    backgroundColor: "rgba(255,99,132,0.2)",
                    borderColor: "rgba(255,99,132,1)",
                    borderWidth: 2,
                    hoverBackgroundColor: "rgba(255,99,132,0.4)",
                    hoverBorderColor: "rgba(255,99,132,1)",
                    data: [Deposits2016(), Deposits2017()],
                },
                {
                    label: "Shares",
                    backgroundColor: "rgba(255,99,182,0.5)",
                    borderColor: "rgba(255,99,132,1)",
                    borderWidth: 2,
                    hoverBackgroundColor: "rgba(255,99,132,0.4)",
                    hoverBorderColor: "rgba(255,99,132,1)",
                    data: [Shares2016(), Shares2017()],
                }
            ]
        };
        var option = {
            scales: {
                yAxes: [{
                    stacked: true,
                    gridLines: {
                        display: true,
                        color: "rgba(255,99,132,0.2)"
                    }
                }],
                xAxes: [{
                    gridLines: {
                        display: false
                    }
                }]
            }
        };

        var myBarChart = Chart.Bar(canvas, {
            data: data,
            options: option
        });

    </script>

</asp:Content>
