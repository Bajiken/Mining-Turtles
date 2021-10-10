class Note:
    padding = {0: "", 1: "0", 2: "00", 3: "000", 4: "0000"}
    def __init__(self, value):
        self.value = self.padding[5 - len(value)] + value
    def getValue(self):
        return self.value
