# test-craigslist-search

### Prerequisites

[Git](https://git-scm.com/)

[Docker](https://www.docker.com/products/docker-desktop)

### Installing

Download source

```
git clone https://github.com/aigars/test-craigslist-search.git
```

Build docker container for tests

```
docker build -t ruby-cucumber .
```

### Running the tests

Run tests by starting docker container from project folder

```
docker run --rm -v${PWD}:/output ruby-cucumber
```

* This will mount project folder and allow cucumber to save results file outside of container
* Tests will be run in headless mode

### Viewing results

After test run is finished, open results from project folder

```
report.html
```
