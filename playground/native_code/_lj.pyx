from playground.native_code cimport _pele

# use external c++ class
cdef extern from "lj.h" namespace "pele":
    cdef cppclass  cLJ "pele::LJ":
        cLJ(double C6, double C12) except +

cdef class LJ(_pele.Potential):
    """define the python interface to the c++ LJ implementation
    """
    def __cinit__(self, eps=1.0, sigma=1.0):
        self.thisptr = <_pele.cPotential*>new cLJ(4.*eps*sigma**6, 4.*eps*sigma**12)
