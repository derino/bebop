# Set JAVA_HOME to point to the bin folder that contains java executable
JAVA_HOME=/usr/java/latest/bin

# Set BIB2XML_JAR to point to the bib2xml.jar file
BIB2XML_JAR=bib2xml/bib2xml.jar

all: setup

setup: bootstrap
	chmod 777 bibtex.xml
	chmod 777 bibtex.bib
	touch newpub.bib
	chmod 777 newpub.bib
	mkdir -p abstracts
	chmod 777 -R abstracts/
	chmod 777 abstracts
	chmod 777 -R upload/

bootstrap:
	$(JAVA_HOME)/java -DVERBOSE=yes -jar $(BIB2XML_JAR) bibtex.bib

incremental:
	$(JAVA_HOME)/java -DVERBOSE=yes -jar $(BIB2XML_JAR) -i newpub.bib bibtex.xml

clean:
	rm -Rf abstracts/*.xml bibtex.xml newpub.bib
