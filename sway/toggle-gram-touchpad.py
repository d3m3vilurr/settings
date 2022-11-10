import os
import sys
import i3ipc

TP_DEVICE_ID = '1226:160:04CA00A0:00_04CA:00A0_Touchpad'
LED_DEVICE_PATH = '/sys/class/leds/tpad_led'
LED_BRIGHTNESS = os.path.join(LED_DEVICE_PATH, 'brightness')

i3 = i3ipc.Connection()

i3.command('input {} events toggle enabled disabled'.format(TP_DEVICE_ID))

inputs = i3.get_inputs()
gram_touch_device = next((x for x in inputs if x.identifier == TP_DEVICE_ID))
tp_disabled = getattr(gram_touch_device, 'libinput', {}).get('send_events') == 'disabled'
if not gram_touch_device:
    sys.exit(0)

if not os.path.exists(LED_BRIGHTNESS):
    sys.exit(0)

try:
    with open(LED_BRIGHTNESS, 'w') as f:
        f.write('{}'.format(0 if tp_disabled else 1))
except PermissionError:
    print('permission error: need to add the gid into account')
    sys.exit(1)
