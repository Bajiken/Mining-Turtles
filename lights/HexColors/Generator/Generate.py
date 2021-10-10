from Bar import *

def generateFile(bars, fileLocation, numFiles):
    for index in range(1, numFiles + 1):
        file = open(fileLocation + str(index), "w")
        file.close()
    for bar in bars:
        barSet = set()
        barMap = dict()
        for lights in bar:
            lightNums = lights.getLights()
            barSet = barSet.union(lightNums)
            notes = lights.getNotes()
            values = map(lambda x: x.getValue(), notes)
            fileValue = " ".join(values) + "\n"
            for num in lightNums:
                file = open(fileLocation + str(num), "a")
                file.write(fileValue)
                file.close()
        for index in range(1, numFiles + 1):
            if not index in barSet:
                print(index)
                file = open(fileLocation + str(index), "a")
                notes = StaticBar("0").getNotes()
                values = map(lambda x: x.getValue(), notes)
                file.write(" ".join(values) + "\n")
                file.close()
