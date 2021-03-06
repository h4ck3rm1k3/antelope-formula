#
# Copy to a salt base
#
SALTBASE = /srv/salt
SALTUSER = root
SALTMASTER = salt

.PHONY : install

TARBALL=/tmp/salt-antelope-formula.tar.gz
tar : $(TARBALL)	
	tar cvzf antelope _modules $(TARBALL)

install : 
	cp -r antelope $(SALTBASE)
	mkdir -p $(SALTBASE)/_modules
	cp -r _modules/* $(SALTBASE)/_modules

deploy :
	rsync --exclude=.git -rv antelope _modules $(SALTUSER)@$(SALTMASTER):$(SALTBASE)

