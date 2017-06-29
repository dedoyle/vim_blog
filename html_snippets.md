```
// vim-snippets

# Width pagination
snippet tpl
    <div ng-controller="${1}Controller as ctrl">
        <div dt-message msg="ctrl.message"></div>
        <div id="wrapper" class="content-padding">
            <table class="pure-table pub-table" ng-if="ctrl.list.length > 0">
                <thead>
                    <tr>
                        <th class="tl" ng-repeat="column in ctrl.column_name track
                            by $index" ng-bind="column"></th>
                        <th class="tr">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="item in ctrl.list">
                        <td></td>
                        <td class="tr">
                            <a ng-click="ctrl.viewItem()">查看</a>
                        </td>
                    </tr>
                </tbody>
            </table>
            <p ng-if="ctrl.list.length <= 0"
               style="margin-top: 150px;text-align: center;font-size: 20px;color: #6a7173;">没有找到相关资源</p>
        </div>
        <div dt-rp-pagination config="ctrl.pageConfig"></div>
    </div>

# Bootstrap dialog
snippet bdtpl
    <div class="modal fade" id="${1}">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">${2}</h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button class="pub-btn pub-btn-default"
                        data-dismiss="modal">确定</button>
                    <button class="pub-btn pub-btn-alert"
                    data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

# WebUploader
snippet uptpl
    <div class="uploader">
        <div id="file-picker">选择文件</div>
        <div id="file-list" class="uploader-list">
            <div class="item">
                <h4 class="info">请选择文件上传</h4>
            </div>
        </div>
    </div>
    <div class="mt text-center">
        <button id="ctlBtn" class="pub-btn" ng-disabled="!ctrl.hasFile"></button>
    </div>

# ngDialog
snippet ndtpl
    <script type="text/ng-template" id="${1}">
            <div class="pub-dialog-head">
                <h3>${2}</h3>
            </div>
            <div class="pub-dialog-content">
                <div class="tc">
                    <button class="pub-btn pub-btn-default" ng-click="closeThisDialog()">确定</button>
                    <button class="pub-btn pub-btn-default" ng-click="closeThisDialog()">取消</button>
                </div>
            </div>
        </script>

# radio
snippet radio
    <div class="inline-block vertical-align-middle">
        <label>
            <input class="inline-block vertical-align-middle pub-form-check"
                type="radio" ng-model="${1}" value="${2}">
            <span class="inline-block vertical-align-middle">${3}</span>
        </label>
    </div>

# checkbox
snippet checkbox
    <div class="inline-block vertical-align-middle">
        <label>
            <input class="inline-block vertical-align-middle pub-form-check"
                type="checkbox" ng-model="${1}"
                ng-true-value="${2}" ng-false-value="${2}">
            <span class="inline-block vertical-align-middle">${4}</span>
        </label>
    </div>
```
