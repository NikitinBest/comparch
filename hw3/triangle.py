from math import fabs
from figure import Figure, Point
import random


class Triangle(Figure):
    def __init__(self, color, p1, p2, p3):
        super().__init__(color)
        self.__p1 = p1
        self.__p2 = p2
        self.__p3 = p3

    @staticmethod
    def input_figure(line):
        color = int(line[1])
        p1 = Point(int(line[2]), int(line[3]))
        p2 = Point(int(line[4]), int(line[5]))
        p3 = Point(int(line[6]), int(line[7]))
        return Triangle(color, p1, p2, p3)

    @staticmethod
    def random_input():
        color = random.randint(0, 6)
        p1 = Point(random.randint(-10000, 10000), random.randint(-10000, 10000))
        p2 = Point(random.randint(-10000, 10000), random.randint(-10000, 10000))
        p3 = Point(random.randint(-10000, 10000), random.randint(-10000, 10000))
        return Triangle(color, p1, p2, p3)

    def area(self):
        return fabs(0.5 * ((self.__p1.x - self.__p3.x) * (self.__p2.y - self.__p3.y)
                           - (self.__p1.y - self.__p3.y) * (self.__p2.x - self.__p3.x)))

    def __str__(self):
        return "Type: Triangle;  Color: {}; Area: {}; Coordinates of first point: {}; Coordinates of second point: {}; Coordinates of third point: {};\n"\
            .format(super().__str__(), str(self.area()), self.__p1, self.__p2, self.__p3)
