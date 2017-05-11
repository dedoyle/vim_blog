```
snippet :f
options head
  ${1:#:method_name}: function(${2:#:attribute}) {
    ${0:TARGET}
  }

snippet function
abbr    func
options word
  function ${1:#:function_name}(${2:#:argument}) {
    ${0:TARGET}
  }

snippet function2
abbr    func2
options head
  function ${1:function_name}(${2:argument}) {
    ${0:TARGET}
  }

snippet proto
options head
  ${1:#:class_name}.prototype.${2:#:method_name} = function(${3:#:first_argument}) {
    ${0:TARGET}
  };


snippet f
options word
  function(${1}) { ${0:TARGET} };

snippet if
options head
  if (${1:true}) {
    ${0:TARGET}
  }

snippet if-else
abbr ife
options head
  if (${1:#:condition}) {
    ${2:TARGET}
  } else {
    ${3}
  }

snippet for
options head
  for (var ${1:i} = 0; $1 < ${2:#:Things}.length; ++$1) {
    ${0:TARGET}
  }

snippet forin
options head
  for (var ${1:i} in ${2:#:Things}) {
    ${0:TARGET}
  }

snippet while
options head
  while (${1:true}) {
    ${0:TARGET}
  }

snippet switch
options head
  switch (${1:#:var}) {
    case ${2:#:val}:
      ${0:TARGET}
      break;
  }

snippet try
options head
  try {
    ${1:TARGET}
  } catch (${2:e}) {
    ${3}
  }

snippet try_finally
options head
  try {
    ${1:TARGET}
  } catch (${2:e}) {
    ${3}
  } finally {
    ${4}
  }


snippet key-value
abbr :,
options word
  ${1:#:value_name}: ${0:#:value},

#snippet key
#options word
#  ${1:#:key}: "${2:#:value}"}${3:, }

snippet setTimeout-function
options head
  setTimeout(function() { ${0} }, ${1:10});

snippet debugger
alias db
options head
  debugger;

snippet console-log
alias cl
options head
  console.log(${0:TARGET});

snippet console-trace
alias ct
options head
  console.trace();

snippet console-error
alias ce
options head
  console.error(${0:TARGET});

snippet console-warn
alias cw
options head
  console.warn(${0:TARGET});

snippet console-info
alias ci
options head
  console.info(${0:TARGET});

snippet iife
options head
  (function(${1}) {
    'use strict';
    ${0:TARGET}
  })(${2});

snippet js
options head
  JSON.stringify(${1:TARGET}, ${2:null}, ${3:2});

snippet jsc
options head
  console.log(JSON.stringify(${1:TARGET}, ${2:null}, ${3:2}));

snippet     class
abbr        class {...}
options     head
  class ${1:#:NAME} {
    constructor(${2:#:ARGS}) {
      ${0:TARGET}
    }
  }

snippet     class-extends
abbr        class extends {...}
options     head
  class ${1:#:NAME} extends ${2:#:SuperClass} {
    constructor(${3:#:ARGS}) {
      ${0:TARGET}
    }
  }

snippet     static
options     head
  static ${1:#:NAME}(${2:#:ARGS}) {
    ${0:TARGET}
  }

snippet     set
options     head
  set ${1:#:NAME}(${2:#:ARGS}) {
    ${0:TARGET}
  }

snippet     get
options     head
  get ${1:#:NAME}() {
    ${0:TARGET}
  }

snippet     import
abbr        import { member, ... } from "module-name";
options     head
  import { ${1:MEMBERS} } from "${0:TARGET}";

snippet     import-default
abbr        import defaultMember from "module-name";
options     head
  import ${1:defaultMember} from "${0:TARGET}";

snippet     import-all
abbr        import * as NAME from "...";
options     head
  import * as ${1:NAME} from "${0:TARGET}";

snippet     import-default-member
abbr        import defaultMember, { member, ... } from "module-name";
options     head
  import ${1:defaultMember}, { ${2:MEMBERS} } from "${0:TARGET}";

snippet ngcontroller
options head
  (function() {
      'use strict';

      angular
          .module('${1:module}')
          .controller('${2:Controller}Ctrl', $2Ctrl);

      $2Ctrl.$inject = ['${3:dependencies}'];
      function $2Controller($3) {
        var ctrl, cleanListener1, cleanListener2;

          ctrl = {
            list      : [],
            pageConfig: {type: 1, limit: 10, current_page: 1},
            message   : null,
            search    : search
          };

          window.getInitData = function getInitData() {
            getData().then(function () {
                $('.mask').hide();
            })['catch'](function (msg) {
                $('.mask').hide();
                showErrorMsg(msg);
            });

            cleanListener1 = $rootScope.$on('pageChanged', function () {
                getData()['catch'](showErrorMsg);
            });

            cleanListener2 = $rootScope.$on('inputWrong', function (e, msg) {
                showErrorMsg(msg);
            });

            // 去除$rootScope.$on() listeners
            $scope.$on('$destroy', function () {
                cleanListener1();
                cleanListener2();
            });
        };

        window.getInitData();

        return ctrl;

        function getData() {
            return CommonService.getInitData().then(function (data) {
                ctrl.pageConfig.maxentries = data.total;
                ctrl.list = data.rows;
            });
        }

        function search() {
            ctrl.pageConfig.current_page = 1;
            getData()['catch'](showErrorMsg);
        }

        function showErrorMsg(msg) {
            ctrl.message = {error: msg};
        }
      }
  })();

snippet ngdirective
options head
  (function() {
      'use strict';

      angular
          .module('${1:module}')
          .directive('${2:directive}', $2);

      $2.$inject = ['${3:dependencies}'];
      function $2(${3:dependencies}) {
          // Usage:
          //
          // Creates:
          //
          var directive = {
              bindToController: true,
              controller: ${4:Controller},
              controllerAs: '${5:vm}',
              link: link,
              restrict: 'A',
              scope: {
              }
          };
          return directive;

          function link(scope, element, attrs) {
          }
      }

      /* @ngInject */
      function $4() {

      }
  })();

snippet ngfactory
options head
  (function() {
      'use strict';

      angular
          .module('${1:module}')
          .factory('${2:factory}', $2);

      /* @ngInject */
      function $2(${3:dependencies}) {
          var service = {
              ${4:func}: $4
          };
          return service;

          ////////////////

          function $4() {
          }
      }
  })();

snippet ngfilter
options head
  (function() {
      'use strict';

      angular
          .module('${1:module}')
          .filter('${2:filter}', $2);

      function $2() {
          return $2Filter;

          ////////////////
          function $2Filter(${3:params}) {
              return $3;
          };
      }

  })();
```
