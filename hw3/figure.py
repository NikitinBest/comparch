import enum
from abc import ABC, abstractmethod
from enum import Enum


class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __str__(self):
        return "{} {}".format(self.x, self.y)


class Colors(Enum):
    COLOR_RED = 0
    COLOR_ORANGE = 1
    COLOR_YELLOW = 2
    COLOR_GREEN = 3
    COLOR_BLUE = 4
    COLOR_INDIGO = 5
    COLOR_PURPLE = 6

    def __str__(self):
        name = {}
        name[Colors.COLOR_RED] = "RED   "
        name[Colors.COLOR_ORANGE] = "ORANGE"
        name[Colors.COLOR_YELLOW] = "YELLOW"
        name[Colors.COLOR_GREEN] = "GREEN "
        name[Colors.COLOR_BLUE] = "BLUE  "
        name[Colors.COLOR_INDIGO] = "INDIGO"
        name[Colors.COLOR_PURPLE] = "PURPLE"
        return name[self]


class Figure(ABC):

    def __init__(self, color):
        self.__color = Colors(color)

    @staticmethod
    @abstractmethod
    def input_figure(line):
        pass

    @staticmethod
    @abstractmethod
    def random_input():
        pass

    def __str__(self):
        return str(self.__color.__str__())
