from complexity_walker import ComplexityWalker

class UpperBoundTimeComplexityDecider(ComplexityWalker):
    def get_complexity(self, f):
        ComplexityWalker.get_complexity(self, f)
        raise Exception("fix this; should return a complexity")
