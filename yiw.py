#!//anaconda3/bin/python
import pyautogui as pag
from random import randint
from time import sleep
import argparse
def main(delay):
    naptime = 90 if delay == -1 else delay
    count = 0
    try:
        while(True):
            max_x, max_y = pag.size()
            new_x, new_y = randint(0, max_x), randint(0, max_y)
            duration = randint(1, 5)
            print("-> ({},{}) in {}s".format(new_x, new_y, duration))
            pag.moveTo(new_x, new_y, duration, pag.easeInOutQuad)
            count += 1
            sleep(naptime)
    except Exception as e:
        print("AFK for {}m".format(int(count * naptime / 60)))
    except KeyboardInterrupt:
        print("AFK for {}m".format(int(count * naptime / 60)))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Yep, I'm working. Totally not AFK.")
    parser.add_argument("-d", "--delay", type=int, default=-1, required=False, help="time between cursor movements")
    args = parser.parse_args()
    main(args.delay)
