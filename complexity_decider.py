import os.path
from astroid import MANAGER

class ComplexityDecider():
    def __init__(self, filepath, function_name):
        self.filepath = filepath
        self.modname = os.path.splitext(os.path.basename(filepath))[0]
        self.function_name = function_name
        self.visit_events = {}
        self.leave_events = {}
        self.linter = self
        try:
            self.ast = MANAGER.ast_from_file(
                self.filepath,
                self.modname,
                source=True
            )
        except Exception, ex:
            print "Failed to parse the given source file."
            import traceback
            traceback.print_exc()
            exit(-1)

    def get_ast(self):
        return self.ast


    def get_complexity(self, checkers):
        for child in self.ast.get_children():
            if child.is_function and child.name == self.function_name:
                for checker in checkers:
                    checker.get_complexity(child)
         
        checkers = [checker() for checker in self.checkers]
        self.get_complexity(ast, checkers)

def test_function(x):
    function2(0)
    return 0

def function2(x):
    return 0

if __name__ == "__main__":
    from ub_time_complexity import UpperBoundTimeComplexityDecider 
    b = ComplexityDecider("complexity_decider.py", "test_function")
    print b.get_complexity([UpperBoundTimeComplexityDecider()])
