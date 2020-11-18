#include <stdio.h>
#include <stdint.h>
#import <IOKit/hidsystem/IOHIDEventSystemClient.h>
#import <IOKit/hid/IOHIDProperties.h>

int main(void)
{
    int ret = 1;
    const int32_t accelType = INT32_MIN;
    CFNumberRef accelTypeNum = NULL;
    IOHIDEventSystemClientRef client = NULL;

    accelTypeNum = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &accelType);
    if (!accelTypeNum) {
        fprintf(stderr, "CFNumberCreate failed\n");
        goto exit;
    }
    
    client = IOHIDEventSystemClientCreateSimpleClient(kCFAllocatorDefault);
    if (client == NULL) {
        fprintf(stderr, "IOHIDEventSystemClientCreateSimpleClient failed\n");
        goto exit;
    }
    
    if (!IOHIDEventSystemClientSetProperty(client, CFSTR(kIOHIDMouseAccelerationType), accelTypeNum)) {
        fprintf(stderr, "IOHIDEventSystemClientSetProperty failed\n");
        goto exit;
    }
    
    ret = 0;
    
exit:
    if (client != NULL) CFRelease(client);
    if (accelTypeNum != NULL) CFRelease(accelTypeNum);
    return ret;
}
