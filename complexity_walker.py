#.__class__.__name__.lower()
from astroid.utils import ASTWalker

class ComplexityWalker(ASTWalker):
    def __init__(self, linter=None):
        ASTWalker.__init__(self, linter)

    def walk(self, child):
        type_name = child.__class__.__name__.lower()
        try:
            getattr(self, 'visit_' + type_name)(child)
        except AttributeError, e:
            print ' '.join(("WARNING:", 
                self.__class__.__name__, 
                "has no visit function for", 
                child.__class__.__name__))

        for grandchild in child.get_children():
            self.walk(grandchild)
            
        try:
            getattr(self, 'leave_' + type_name)(child)
        except AttributeError, e:
            print ' '.join(("WARNING:", 
                self.__class__.__name__, 
                "has no leave function for", 
                child.__class__.__name__))


    def get_complexity(self, f):
        for child in f.get_children():
            self.walk(child)
