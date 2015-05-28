var exec = require('cordova/exec');

exports.initAppScheme = function(scheme, success, error) {
    exec(success, error, "WeChatPlugin", "initAppScheme", [scheme]);
};

exports.callWeChatPay = function(orderStr, success, error) {
    exec(success, error, "WeChatPlugin", "callWeChatPay", [orderStr]);
};
