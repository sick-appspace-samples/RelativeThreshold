## RelativeThreshold

Threshold image relative to background to segment objects in uneven illumination.

### Description

This Samples uses the thresholdCompare function for segmenting objects with a threshold relative to the background. This leads to more meaningful results in uneven illumination scenarios compared to thresholding with fixed pixel values. An image has been taken without any object, and the threshold is given in relation to each corresponding pixel. A region found by regular thresholding is shown for comparison.

### How to Run

Starting this sample is possible either by running the App (F5) or debugging (F7+F10). Setting breakpoint on the first row inside the 'main' function allows debugging step-by-step after 'Engine.OnStarted' event. Results can be seen in the image viewer on the DevicePage. Restarting the Sample may be necessary to show images after loading the web-page.
To run this sample a device with SICK Algorithm API is necessary. For example InspectorP or SIM4000 with latest firmware. Alternatively the Emulator on AppStudio 2.3 or higher can be used.

### Topics

algorithm, image-2d, fitting, measurement, sample, sick-appspace
