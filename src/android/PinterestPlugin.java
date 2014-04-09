package com.realizedmobile.pinterestplugin;

import org.json.JSONException;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaArgs;
import org.apache.cordova.CordovaPlugin;

import android.content.Context;
import android.util.Log;

import com.pinterest.pinit.PinIt;
import com.pinterest.pinit.PinItButton;
import com.pinterest.pinit.PinItListener;

public class PinterestPlugin extends CordovaPlugin {
	public static final String TAG = "PinterestPlugin";
	public static final String INIT = "initPinterest";
	public static final String AVAILABLE = "canPinWithSDK";
	public static final String PIN = "pin";

	/**
	 * Gets the application context from cordova's main activity.
	 * @return the application context
	 */
	private Context getApplicationContext() {
		return this.webView.getContext();
	}
	
	@Override
    public boolean execute(String action, CordovaArgs args, 
    		final CallbackContext callbackContext) throws JSONException {
    	boolean result = false;
		final String sourceUrl, imageUrl, description;
		final PinItListener _listener = new PinItListener() {
	        @Override
	        public void onStart() {
	            super.onStart();
	            Log.i(TAG, "PinItListener.onStart");
	        }

	        @Override
	        public void onComplete(boolean completed) {
	            super.onComplete(completed);
	            Log.i(TAG, "PinItListener.onComplete");
	            if (completed) {
					callbackContext.success();
	            } else {
					callbackContext.error("Pinterest couldn't pint it.");
	            }
	        }

	        @Override
	        public void onException(Exception e) {
	            super.onException(e);
	            Log.e(TAG, e.getMessage());
				callbackContext.error(e.getMessage());
	        }

	    };
		Log.v(TAG, "execute: action=" + action);
		if (INIT.equals(action)) {
			Log.v(TAG, "Init: client ID=" + args.getString(0));
			final String id = args.getString(0);
			cordova.getThreadPool().execute(new Runnable() {
                public void run() {
        			PinItButton.setPartnerId(id);
        			PinItButton.setDebugMode(true);
                    callbackContext.success(); // Thread-safe.
                }
            });
			result = true;
		}
		else if (PIN.equals(action)) {
			sourceUrl = args.getString(0);
			imageUrl = args.getString(1);
			description = args.getString(2);
			Log.v(TAG, "PinIt: source=" + sourceUrl + ", imageUrl: " + 
					imageUrl + ", description: " + description);
			cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                	final PinIt pinIt = new PinIt();

        			pinIt.setUrl(sourceUrl);
        			pinIt.setImageUrl(imageUrl);
        			pinIt.setDescription(description);
        			pinIt.setListener(_listener);
        			pinIt.doPinIt(getApplicationContext());
                }
            });
			result = true;
		} else if (AVAILABLE.equals(action)) {
			Log.v(TAG, "Checking pinterest availability");
			callbackContext.error(action + "  is not Supported on Android");
			result = true;
		}
		return result;
		
	}


}