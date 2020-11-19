#include <stdio.h>
#include <stdint.h>
#import <IOKit/hidsystem/IOHIDEventSystemClient.h>
#import <IOKit/hid/IOHIDProperties.h>

int main(void)
{
    int ret = 1;
    const int32_t accel = -1;
    CFNumberRef accelNum = NULL;
    IOHIDEventSystemClientRef client = NULL;

    accelNum = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &accel);
    if (accelNum == NULL) {
        fprintf(stderr, "CFNumberCreate failed\n");
        goto exit;
    }

    client = IOHIDEventSystemClientCreateSimpleClient(kCFAllocatorDefault);
    if (client == NULL) {
        fprintf(stderr, "IOHIDEventSystemClientCreateSimpleClient failed\n");
        goto exit;
    }

    if (!IOHIDEventSystemClientSetProperty(client, CFSTR(kIOHIDMouseAccelerationType), accelNum)) {
        fprintf(stderr, "IOHIDEventSystemClientSetProperty failed\n");
        goto exit;
    }

    ret = 0;

exit:
    if (client != NULL) CFRelease(client);
    if (accelNum != NULL) CFRelease(accelNum);
    return ret;
}
