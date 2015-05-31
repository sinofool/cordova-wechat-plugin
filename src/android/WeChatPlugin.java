package com.sinofool.cordova.plugins.wechat;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import com.tencent.mm.sdk.modelpay.PayReq;
import com.tencent.mm.sdk.openapi.IWXAPI;
import com.tencent.mm.sdk.openapi.WXAPIFactory;

public class WeChatPlugin extends CordovaPlugin {

    private IWXAPI msgApi;
    private String appid;

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("initAppScheme")) {
            this.msgApi = WXAPIFactory.createWXAPI(this.cordova.getActivity(), null);
            this.appid = args.getString(0);
        } else if (action.equals("callWeChatPay")) {
            PayReq req = new PayReq();
            req.appId = this.appid;
            req.partnerId = args.getString(1);
            req.prepayId = args.getString(0);
            req.packageValue = "Sign=WXPay";
            req.nonceStr = args.getString(2);
            req.timeStamp = args.getString(3);
            req.sign = args.getString(4);
            this.msgApi.sendReq(req);
        }
        callbackContext.error("Unknown action " + action);
        return false;
    }
}
