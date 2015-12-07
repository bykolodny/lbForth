TARGET = c
TFORTH = b-forth
TDIR = targets/c
NUCLEUS = $(TDIR)/nucleus.fth
FORTH = $(TDIR)/run.sh ./forth
DEPS = kernel.fth dictionary.fth $(TDIR)/nucleus.fth
PARAMS = params.lisp jump.fth threading.fth

GREP = grep -a

RUN = $(TDIR)/run.sh
LISP = ./lisp/lisp.sh
META = lisp/meta.lisp


# Bootstrap metacompiler, written in Lisp.
METACOMPILE = $(LISP) '(load "$(META)") (compile-forth "$(NUCLEUS)" "$<")'

all: b-forth
	rm -f $(PARAMS)

$(META):
	git submodule update --init

params.lisp: params
	$(RUN) ./$< -lisp > $@

include targets/c/forth.mk
