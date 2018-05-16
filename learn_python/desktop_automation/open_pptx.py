import os
import keyboard
import mouse
import time


class PPTX:
    def __init__(self):
        self.current_slide = 0

    @staticmethod
    def open_pptx(file='slide2.pptx'):
        os.startfile(file)
        time.sleep(10)

    @staticmethod
    def start_presentation_mode():
        keyboard.press_and_release('f5')
        time.sleep(1)

    @staticmethod
    def exit_presentation_mode():
        keyboard.press_and_release('esc')
        time.sleep(1)

    def next_slide(self, wait=0):
        keyboard.press_and_release('page down')
        self.current_slide += 1
        time.sleep(wait)

    def previous_slide(self, wait=0):
        keyboard.press_and_release('page up')
        self.current_slide -= 1
        time.sleep(wait)


if __name__ == "__main__":
    pptx = PPTX()
    pptx.open_pptx()
    pptx.start_presentation_mode()
    pptx.next_slide(wait=2)
    pptx.next_slide(wait=2)
    pptx.next_slide(wait=2)
    pptx.previous_slide(wait=2)
    pptx.previous_slide(wait=2)
    pptx.previous_slide(wait=2)
    pptx.exit_presentation_mode()