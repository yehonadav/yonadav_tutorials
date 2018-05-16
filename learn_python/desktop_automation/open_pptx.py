import os
import keyboard
import mouse
import time


class Desktop:

    @staticmethod
    def switch_window(times=1):
        keyboard.press('alt')
        for _ in range(times):
            keyboard.press_and_release('tab')
        keyboard.release('alt')

    class PPTX:
        def __init__(self):
            self.current_slide = 0

        def open(self, file='slide2.pptx', wait=10):
            os.startfile(file)
            self.current_slide = 1
            time.sleep(wait)

        @staticmethod
        def start_presentation_mode():
            keyboard.press_and_release('shift+f5')
            time.sleep(1)

        @staticmethod
        def exit_presentation_mode():
            keyboard.press_and_release('esc')
            time.sleep(1)

        def go_to_slide(self, number):
            keyboard.press_and_release('{}+enter'.format(number))
            self.current_slide = number

        def next_slide(self, wait=0):
            keyboard.press_and_release('page down')
            self.current_slide += 1
            time.sleep(wait)

        def previous_slide(self, wait=0):
            keyboard.press_and_release('page up')
            self.current_slide -= 1
            time.sleep(wait)

        def close(self):
            keyboard.press_and_release('alt+f4')
            self.current_slide = 0
            time.sleep(1)


if __name__ == "__main__":
    pptx = Desktop.PPTX()
    pptx.open()
    pptx.start_presentation_mode()
    # pptx.next_slide(wait=2)
    # pptx.next_slide(wait=2)
    # pptx.next_slide(wait=2)
    # pptx.previous_slide(wait=2)
    # pptx.previous_slide(wait=2)
    # pptx.previous_slide(wait=2)
    pptx.go_to_slide(2)
    pptx.exit_presentation_mode()
    pptx.close()
    # Desktop.switch_window(5)
