build:
	docker build -f Dockerfile -t mldev .

code:
	docker run \
	--network=host \
	-v $(WORKSPACE):/home/root/workspace \
	-ti mldev \
	/bin/zsh -c \
	"source activate ml \
	&& code-server /home/root/workspace/ --verbose --port $(CPORT) --host 0.0.0.0 --auth none"

jupyter:
	docker run \
	--network=host \
	-v $(WORKSPACE):/home/root/workspace \
	-ti mldev \
	/bin/zsh -c \
	"source activate ml \
	&& cd /home/root/workspace/ \
	&& SHELL=/bin/zsh jupyter-lab --ip=0.0.0.0 --no-browser --port $(JPORT) --allow-root"

code2:
	docker run \
	--network=host \
	-v $(WORKSPACE):/home/root/workspace \
	-t mldev \
	/bin/zsh -c \
	"source activate ml \
	&& TERM=xterm code-server /home/root/workspace/ --log trace --verbose --port $(CPORT) --host 0.0.0.0 --auth none"
