const wdio = require("webdriverio");

const opts = {
  port: 5554,
  desiredCapabilities: {
      platformName: "Android",
      platformVersion: "9.0.0.0",
      deviceName: "Nexus_5X_API_28",
      appPackage: "com.example.android.contactmanager",
      appActivity: "com.example.android.contactmanager.ContactManager",
      app: "C:\\Users\\yonad\\PycharmProjects\\yonadav_tutorials\\learn_python\\learn_appium\\sample-code-master\\sample-code\\apps\\ContactManager\\ContactManager.apk",
      automationName: "UiAutomator2"
  }
};

const client = wdio.remote(opts);
client
  .init()
  .click("~App")
  .click("~Alert Dialogs")
  .back()
  .back()
  .end();