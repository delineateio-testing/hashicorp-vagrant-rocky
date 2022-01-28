[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <img alt="delineate.io" src="https://github.com/delineateio/.github/blob/master/assets/logo.png?raw=true" height="75" />
  <h2 align="center">delineate.io</h2>
  <p align="center">portray or describe (something) precisely.</p>

  <h3 align="center">Hashicorp Vagrant Rocky Linux</h3>

  <p align="center">
    Provides the capability to provision a Rocky Linux VM
    <br />
    <a href="https://github.com/delineateio/oss-template">View Demo</a>
    ·
    <a href="https://github.com/delineateio/oss-template/issues">Report Bug</a>
    ·
    <a href="https://github.com/delineateio/oss-template/issues">Request Feature</a>
  </p>
</p>

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [About The Project](#about-the-project)
- [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Local Dependencies](#local-dependencies)
  - [Local Setup](#local-setup)
- [Usage](#usage)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- ABOUT THE PROJECT -->
## About The Project

This repo provisions a general purpose Rocky Linux VM using Hashicorp Vagrant configured with RedHat Ansible.

## Built With

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![Vagrant](https://img.shields.io/badge/vagrant-%231563FF.svg?style=for-the-badge&logo=vagrant&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Local Dependencies

A number of local dependencies are required.  To review the local dependencies:

* When using `MacOS` run `make requirements`
* Otherwise run `cat brewfile` to inspect the requirements

If additional dependencies are required they should be added to `Brewfile`, for more details please review the official `brew bundle` documentation [here](https://github.com/Homebrew/homebrew-bundle).

### Local Setup

This repo follows the principle of minimal manual setup of the local development environment.

 A `make` target has been provided for simplicity ```make init```, the `make` file can be inspected for more details.

 ```shell
# use the folder name as the repo name
make init

# explicitly pass in the repo name (e.g. my-service)
make repo=my-service init
 ```

If at a later date repo name needs to be changed then the `make rename` target can be called.

```shell
make repo=my-service rename
```

<!-- USAGE EXAMPLES -->
## Usage

```shell
# provisions the VM and ssh into it
make up

# destroys the VM
make destroy

# cleans up local environment
make clean
```

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/delineateio/oss-template/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

If you would like to contribute to any Capco Digital OSS projects please read:

* [Code of Conduct](https://github.com/delineateio/.github/blob/master/CODE_OF_CONDUCT.md)
* [Contributing Guidelines](https://github.com/delineateio/.github/blob/master/CONTRIBUTING.md)

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [Best README Template](https://github.com/othneildrew/Best-README-Template)
* [Markdown Badges](https://github.com/Ileriayo/markdown-badges)
* [DocToc](https://github.com/thlorenz/doctoc)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/delineateio/oss-template.svg?style=for-the-badge
[contributors-url]: https://github.com/delineateio/oss-template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/delineateio/oss-template.svg?style=for-the-badge
[forks-url]: https://github.com/delineateio/oss-template/network/members
[stars-shield]: https://img.shields.io/github/stars/delineateio/oss-template.svg?style=for-the-badge
[stars-url]: https://github.com/delineateio/oss-template/stargazers
[issues-shield]: https://img.shields.io/github/issues/delineateio/oss-template.svg?style=for-the-badge
[issues-url]: https://github.com/delineateio/oss-template/issues
[license-shield]: https://img.shields.io/github/license/delineateio/oss-template.svg?style=for-the-badge
[license-url]: https://github.com/delineateio/oss-template/blob/master/LICENSE
