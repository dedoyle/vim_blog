```
// vim-snippets

# enter keycode
snippet enter
    var keyCode = (window.event) ? e.which : e.keyCode;
    if (keyCode === 13) {
       \$timeout.cancel(inputTimer);
        inputTimer =\$timeout(function () {

        }, 50);
    }
# controller
snippet ctrl
    angular
        .module('app')
        .controller('HomeController', HomeController);

    HomeController.\$inject = ['\$rootScope', '\$scope', 'CommonService'];

    function HomeController(\$rootScope, \$scope, CommonService) {
        var ctrl, cleanListener1, cleanListener2;

        ctrl = {
            list: [],
            pageConfig: {type: 1, limit: 10, current_page: 1},
            condition: {},
            message: null,
            search: search
        };

        (function getInitData() {
            getData()['catch'](showErrorMsg);

            cleanListener1 = \$rootScope.\$on('pageChanged', function () {
                getData()['catch'](showErrorMsg);
            });

            cleanListener2 = \$rootScope.\$on('inputWrong', function (e, msg) {
                showErrorMsg(msg);
            });

            // remove \$rootScope.\$on() listeners
           \$scope.\$on('\$destroy', function () {
                cleanListener1();
                cleanListener2();
            });
        })();

        return ctrl;

        function getData() {
            var condition = {};

            return CommonService.getData(condition).then(function (data) {
                ctrl.pageConfig.maxentries = data.pagination.total;
                ctrl.list = data.pagination.rows;

                hideMask();

                return ctrl.list;
            });
        }

        function search() {
            ctrl.pageConfig.current_page = 1;

            showMask();

            getData()['catch'](showErrorMsg);
        }

        function showMask() {
            \$('.mask').show();
        }

        function hideMask() {
            \$('.mask').hide();
        }

        function showErrorMsg(msg) {
            hideMask();
            ctrl.message = {error: msg};
        }
    }
# Bootstrap dialog
snippet bdjs
   \$('#upload-modal')
        .on('shown.bs.modal', function () {
            ${1}
        })
        .on('hide.bs.modal', function () {
        });
# WebUploader
snippet upjs
    function initUploader() {
        var\$fileList  =\$('#file-list'),
           \$uploadBtn =\$('#ctlBtn');

        fileLoader = WebUploader.create({
            auto        : false,
            fileVal     : 'file',
            swf         : '/static/libs/webuploader/0.1.5/webuploader.swf',
            server      : '',
            pick        : {
                id      : '#file-picker',
                multiple: false
            },
            fileNumLimit: 1
        });

        fileLoader.on('fileQueued', function (file) {
           \$fileList.empty().append('<div id="' + file.id + '" class="item">' +
                '<h4 class="info">' + file.name + '</h4>' +
                '</div>');
            ctrl.hasFile = true;
           \$scope.\$digest();
        });

        fileLoader.on('beforeFileQueued', function () {
            fileLoader.reset();
        });

        fileLoader.on('uploadBeforeSend', function (block, data) {
        });

        fileLoader.on('uploadSuccess', function (file, ret) {
            ctrl.hasFile = false;
            fileLoader.reset();
           \$scope.\$digest();
        });

        fileLoader.on('uploadError', function (file, reason) {
           \$('.uploader-list .info').addClass('info-error').text(reason);
        });

       \$uploadBtn.on('click', function () {
            fileLoader.upload();
        });
    }

# bootstrap timepicker
snippet bdtp
    var d = new Date();
    d.setDate(d.getDate() - 1);

    $('.form_datetime').datetimepicker({
        format: 'yyyy-mm-dd',
        forceParse: true,
        language: 'zh-CN',
        autoclose: true,
        minView: 'month',
        endDate: d
    });

# hightcharts
snippet hightcharts
    require(['highcharts'], function() {
        Highcharts.setOptions({
            colors: colors,
            title: false,
            credits: false,
            legend: false,
            exporting: false
        });
    });

# 折线图（普通）
snippet linechart
    $('#peak-value').highcharts({
        xAxis: {
            title: {
                text: '时间'
            },
            categories: statistic.time_line
        },
        yAxis: {
            title: {
                text: '次数'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true // 开启数据标签
                },
                enableMouseTracking: false // 关闭鼠标跟踪，对应的提示框、点击事件会失效
            }
        },
        series: [
            {
                data: statistic.nums
            }
        ]
    });

# 折线图（附带信息）
snippet lineinfo
    $('#container').highcharts({
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar']
        },
        tooltip: {
            formatter: function() {
                var s = '';
                $.each(this.points, function(point) {
                    info = this.point.info;
                    $.each(info, function(idx, val) {
                        s +=
                            '<b>' +
                            val.name +
                            '</b>' +
                            ': ' +
                            val.value +
                            '<br/>';
                    });
                });
                return s;
            },
            shared: true
        },
        series: [
            {
                data: [
                    {
                        info: [
                            {
                                name: '数学',
                                value: 4
                            },
                            {
                                name: '语文',
                                value: 9
                            }
                        ],
                        y: 29.9
                    },
                    {
                        info: [
                            {
                                name: '数学',
                                value: 1
                            },
                            {
                                name: '语文',
                                value: 9
                            }
                        ],
                        y: 52
                    }
                ]
            }
        ]
    });

# 柱状图
snippet columnchart
    $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '月平均降雨量'
        },
        subtitle: {
            text: '数据来源: WorldClimate.com'
        },
        xAxis: {
            categories: [
                '一月',
                '二月',
                '三月',
                '四月',
                '五月'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '降雨量 (mm)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: '东京',
            data: [49.9, 71.5, 106.4, 129.2, 144.0]
        }, {
            name: '纽约',
            data: [83.6, 78.8, 98.5, 93.4, 106.0]
        }, {
            name: '伦敦',
            data: [48.9, 38.8, 39.3, 41.4, 47.0]
        }, {
            name: '柏林',
            data: [42.4, 33.2, 34.5, 39.7, 52.6]
        }]
    });
```
