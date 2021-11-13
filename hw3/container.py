import random
from circle import Circle
from rectangle import Rectangle
from triangle import Triangle


class Container:
    def __init__(self):
        self.__figures = []

    def fill(self, data):
        for line in data:
            type = int(line[0])
            if type == 0:
                self.__figures.append(Circle.input_figure(line))
            elif type == 1:
                self.__figures.append(Rectangle.input_figure(line))
            elif type == 2:
                self.__figures.append(Triangle.input_figure(line))
            else:
                print("error while container filling")
                exit()

    def random_fill(self, size):
        for i in range(size):
            type = random.randint(0, 2)
            color = random.randint(0, 6)
            if type == 0:
                self.__figures.append(Circle.random_input())
            elif type == 1:
                self.__figures.append(Rectangle.random_input())
            elif type == 2:
                self.__figures.append(Triangle.random_input())

    def output_data(self, file):
        for figure in self.__figures:
            file.write(str(figure))

    def sort(self):
        n = len(self.__figures)
        gap = n // 2
        while gap > 0:
            for i in range(gap, n):
                temp = self.__figures[i]
                j = i
                while j >= gap and self.__figures[j - gap].area() > temp.area():
                    self.__figures[j] = self.__figures[j - gap]
                    j -= gap
                self.__figures[j] = temp
            gap //= 2
