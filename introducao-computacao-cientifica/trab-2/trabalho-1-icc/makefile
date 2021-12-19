       PROG   = newtonSNL

           CC = gcc -Wall # -std=c11
         OBJS = entrada.o newtonSNL.o utils.o jacobiana.o gauss.o main.o

       LIKWID = /home/soft/likwid
 LIKWID_FLAGS = -I$(LIKWID)/include -DLIKWID_PERFMON # -std=c11
  LIKWID_LIBS = -L$(LIKWID)/lib -llikwid

    AVX_FLAGS = -O3 -mavx2 -march=native -fopt-info-vec # -fstrict-aliasing

       CFLAGS = $(LIKWID_FLAGS) 
       LFLAGS = $(LIKWID_LIBS) -lm -I/usr/include -L/usr/lib -lmatheval

.PHONY: all debug clean limpa purge faxina

%.o: %.c %.h
	$(CC) $(CFLAGS) -c $< -o $@ $(LFLAGS)

all: likwid

debug:            CFLAGS += -g -DDEBUG
avx:              CFLAGS += $(AVX_FLAGS)

avx likwid debug: $(PROG)

$(PROG) : % : $(OBJS) %.o
	$(CC) $(CFLAGS) -o $@ $^ $(LFLAGS)

clean limpa:
	@echo "Limpando ...."
	@rm -f *~ *.bak *.tmp

purge faxina:   clean
	@echo "Faxina ...."
	@rm -f  $(PROG) *.o $(OBJS) core a.out
	@rm -f *.png marker.out *.log
