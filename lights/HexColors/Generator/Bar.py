from Note import *

class Bar:
    def __init__(self, values):
        if(len(values) != 4):
            raise ValueError("Invalid number of notes, expected 4.")
        notes = []
        for value in values:
            notes.append(Note(value))
        self.notes = notes
    def getNotes(self):
        return self.notes

class AlternatingBar:
    def __init__(self, values):
        if(len(values) != 2):
            raise ValueError("Invalid number of notes, expected 2.")
        notes = []
        for index in range(2):
            for value in values:
                notes.append(Note(value))
        self.notes = notes
    def getNotes(self):
        return self.notes

class StaticBar:
    def __init__(self, value):
        notes = []
        for index in range(4):
            notes.append(Note(value))
        self.notes = notes
    def getNotes(self):
        return self.notes

class LightBar:
    def __init__(self, lights, bar):
        self.lights = lights
        self.bar = bar
    def getLights(self):
        return self.lights
    def getNotes(self):
        return self.bar.getNotes()
