CXX      = em++
CXXFLAGS = -Wall --bind -ansi -g -O3 --emrun -s DEMANGLE_SUPPORT=1
CC       = emcc
CCFLAGS  = -g --emrun --bind -O3
OBJS     = src/main.o src/processInWindows.o src/DecisionTreeClass.o src/aweighting.o src/featureExtraction.o src/kiss_fft130/kiss_fft.o

windDet.html : $(OBJS)
	$(CXX) --bind -s DEMANGLE_SUPPORT=1 -s NO_EXIT_RUNTIME=1 --embed-file trees/dectrees_10_5000 -o $@ $(OBJS)

OBJ/%.o : %.cpp
	$(CXX) -c $(CXXFLAGS) $<

OBJ/%.o : %.c
	$(CC) -c $(CCFLAGS) $<


clean:
	\rm $(OBJS)
