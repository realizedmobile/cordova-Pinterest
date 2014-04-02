package com.realizedmobile.pinterestplugin;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;

import com.pinterest.pinit.PinItButton;
import com.pinterest.pinit.PinItListener;

public class PinterestPlugin extends CordovaPlugin {
	public static final String TAG = "PinterestPlugin";
	public static final String INIT = "initPinterest";
	public static final String PIN = "pint";
	/**
	 * Gets the application context from cordova's main activity.
	 * @return the application context
	 */
	private Context getApplicationContext() {
		return this.cordova.getActivity().getApplicationContext();
	}
	
	@Override
    public boolean execute(String action, CordovaArgs args, final CallbackContext callbackContext) throws JSONException {
		//     	boolean result = false;
		// Log.v(TAG, "execute: action=" + action);
		// if (INIT.equals(action)) {
		// 	Log.v(TAG, "execute: data=" + data.toString());
		// 	try {
		// 		JSONObject jo = data.getJSONObject(0);
		// 		PinItButton.setPartnerId("YOUR_PARTNER_ID");
		// 		result = true;
		// 		callbackContext.success();
		// 	}
		// 	catch(JSONException e) {
		// 		
		// 	}
		// }
		// else if (PIN.equals(action)) {
		// 	
		// }
		
	}
	PinItListener _listener = new PinItListener() {

        @Override
        public void onStart() {
            super.onStart();
            Log.i(TAG, "PinItListener.onStart");
        }

        @Override
        public void onComplete(boolean completed) {
            super.onComplete(completed);
            Log.i(TAG, "PinItListener.onComplete");
        }

        @Override
        public void onException(Exception e) {
            super.onException(e);
            Log.i(TAG, "PinItListener.onException");
        }

    };

}