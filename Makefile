
ifeq ($(OS),Windows_NT)
  PYDIR=c:/python36
  PATH:=$(PYDIR)/scripts:$(PYDIR):$(PATH)
  PYTHON=python
else
  PYTHON=python3.6
endif

ifeq (, $(shell which python ))
  $(error "PYTHON=$(PYTHON) not found in $(PATH)")
endif

PYTHON_VERSION_MIN=3.5
PYTHON_VERSION=$(shell $(PYTHON) -c 'import sys; print("%d.%d"% sys.version_info[0:2])' )
PYTHON_VERSION_OK=$(shell $(PYTHON) -c 'import sys;\
  print(int(float("%d.%d"% sys.version_info[0:2]) >= $(PYTHON_VERSION_MIN)))' )

ifeq ($(PYTHON_VERSION_OK),0)
  $(error "Need python $(PYTHON_VERSION) >= $(PYTHON_VERSION_MIN)")
endif

# ========================================================
help:: ; grep -Pih -- "^\w\S+:" Makefile | sort | uniq

web::
	$(PYTHON) manage.py runserver

test::
	$(PYTHON) manage.py test
