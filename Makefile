# Makefile

INSTALL_PATH = /usr/local
CUR_DIR = $(shell pwd)

all: install

install:
	@echo '***	Installing compile-run and setup-files on '$(INSTALL_PATH)
	@echo '***	Do you want to continue? '; read ANS; case "$$ANS" in y|Y|yes|Yes|YES) ;; *) exit 1;; esac;
	@install -c -m 755 compile_and_run.sh $(INSTALL_PATH)/bin/compile-run
	@install -c -m 755 setup_files.sh $(INSTALL_PATH)/bin/setup-files

uninstall:
	@echo '***	Uninstalling compile-run and setup-files'
	@rm -f $(INSTALL_PATH)/bin/compile-run
	@rm -f $(INSTALL_PATH)/bin/setup-files

clean_all:
	@echo Removing ${CUR_DIR} ...
	@sudo rm -rf ${CUR_DIR}