brewfile:=Brewfile
python_version:=3.9.1
current:=$(shell cat .python-version)
repo:=$(shell basename $(CURDIR))

requirements:
	@echo
	@brew bundle list --file=$(brewfile)

--install:
	@echo
	@brew bundle install --file=$(brewfile)

--venv:
	@echo
	@pyenv install $(python_version) -s
	@pyenv virtualenv -f -q $(python_version) $(repo) 1> /dev/null
	@pyenv local $(repo)
	@pip install -q --upgrade pip
	@pip install -Uqr requirements.txt

--hooks:
	@git add .
	@pre-commit autoupdate
	@pre-commit install
	@echo
	@-pre-commit

--references:
	@sed -i '' s/$(current)/$(repo)/g README.md
	@sed -i '' s/$(current)/$(repo)/g .python-version

init: --install rename --hooks up ssh

rename: --venv --references

up:
	@vagrant up --provision --provider vm_ware
	@vagrant ssh

destroy:
	@vagrant destroy -g -f

clean:
	@vagrant destroy -g -f
	@rm -rf ./vagrant
