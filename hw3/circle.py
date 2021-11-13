from figure import Figure, Point
from math import pi
import random


class Circle(Figure):
    def __init__(self, color, center, radius):
        super().__init__(color)
        self.__center = center
        self.__radius = radius

    @staticmethod
    def input_figure(line):
        color = int(line[1])
        center = Point(int(line[2]), int(line[3]))
        radius = int(line[4])
        return Circle(color, center, radius)

    @staticmethod
    def random_input():
        color = random.randint(0, 6)
        center = Point(random.randint(-10000, 10000), random.randint(-10000, 10000))
        radius = int(random.randint(-10000, 10000))
        return Circle(color, center, radius)

    def area(self):
        return pi * self.__radius**2

    def __str__(self):
        return "Type: Circle;    Color: {}; Area: {}; Coordinates of center: {}; Radius: {};\n"\
            .format(super().__str__(), str(self.area()), self.__center, self.__radius)
