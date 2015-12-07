CXX = g++

TARGET_BIN = bin/phil
TARGET_LIB = lib/libphil.a

SRCS_BIN = $(shell find src -name *.cpp)
SRCS_LIB = $(shell find src -name *.cpp -and ! -name main.cpp)
HEDDER = $(shell find src -name *.h)
OBJS_BIN = $(SRCS_BIN:.cpp=.o)
OBJS_LIB = $(SRCS_LIB:.cpp=.lo)

OPTS = -O2 -std=c++11 -DNDEBUG
IDFLAGS =
LDFLAGS =
LDFLAGS+=-L/home/ps/_setup/lp_solve_5.5/lpsolve55/bin/ux64/
IDFLAGS += -I/usr/include/python2.7 -I/home/ps/_setup/lp_solve_5.5

# USE-LP-SOLVE
OPTS += -DUSE_LP_SOLVE
LDFLAGS += -llpsolve55

# USE-GUROBI
# OPTS += -DUSE_GUROBI
# LDFLAGS += -lgurobi_c++ -lgurobi60 -lpthread

all: $(OBJS_BIN)
	mkdir -p bin
	$(CXX) $(OPTS) $(OBJS_BIN) $(IDFLAGS) $(LDFLAGS) -o $(TARGET_BIN)

.cpp.o:
	$(CXX) $(OPTS) $(IDFLAGS) -c -o $(<:.cpp=.o) $<

lib: $(OBJS_LIB)
	mkdir -p lib
	ar rcs $(TARGET_LIB) $(OBJS_LIB)

%.lo:%.cpp
	$(CXX) $(OPTS) $(IDFLAGS) -fPIC -c -o $(<:.cpp=.lo) $<

clean:
	rm -f $(TARGET_BIN)
	rm -f $(TARGET_LIB)
	rm -f $(OBJS_BIN)
	rm -f $(OBJS_LIB)

test:
	$(TARGET_BIN) -m infer -k data/compiled/kb -c dist=basic -c tab=basic -c lhs=a* -c ilp=weighted -c sol=gurobi -p kb_max_distance=4 -p max_distance=4.0 -f do_compile_kb -v 5 data/toy.lisp