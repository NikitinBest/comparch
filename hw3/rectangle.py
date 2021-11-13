from figure import Figure, Point
import random


class Rectangle(Figure):
    def __init__(self, color, left_top, right_bottom):
        super().__init__(color)
        self.__left_top = left_top
        self.__right_bottom = right_bottom
        if self.__left_top.x > self.__right_bottom.x:
            self.__left_top.x, self.__right_bottom.x = self.__right_bottom.x, self.__left_top.x
        if self.__left_top.y < self.__right_bottom.y:
            self.__left_top.y, self.__right_bottom.y = self.__right_bottom.y, self.__left_top.y

    @staticmethod
    def input_figure(line):
        color = int(line[1])
        left_top = Point(int(line[2]), int(line[3]))
        right_bottom = Point(int(line[4]), int(line[5]))
        return Rectangle(color, left_top, right_bottom)

    @staticmethod
    def random_input():
        color = random.randint(0, 6)
        left_top = Point(random.randint(-10000, 10000), random.randint(-10000, 10000))
        right_bottom = Point(random.randint(-10000, 10000), random.randint(-10000, 10000))
        return Rectangle(color, left_top, right_bottom)

    def area(self):
        return abs((self.__right_bottom.x - self.__left_top.x)
                   * (self.__left_top.y - self.__right_bottom.y))

    def __str__(self):
        return "Type: Rectangle; Color: {}; Area: {}; Coordinates of left-top point: {}; Coordinates of right-bottom point: {};\n"\
            .format(super().__str__(), str(self.area()), self.__left_top, self.__right_bottom)
