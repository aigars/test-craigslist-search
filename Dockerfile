FROM ruby:2.6.2

ENV CHROMEDRIVER_VERSION 88.0.4324.96
ENV CHROMEDRIVER_DIR /chromedriver
RUN mkdir $CHROMEDRIVER_DIR

#install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y --no-install-recommends install google-chrome-stable

#install webdriver
RUN wget -q --continue -P $CHROMEDRIVER_DIR "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"
RUN unzip $CHROMEDRIVER_DIR/chromedriver* -d $CHROMEDRIVER_DIR
ENV PATH $CHROMEDRIVER_DIR:$PATH

#add tests to container
ENV TESTS_DIR /tests
RUN mkdir $TESTS_DIR
WORKDIR $TESTS_DIR
ADD . .

#TODO: add correct bundle dirs to PATH
#RUN gem install bundler
#RUN bundle install
RUN gem install selenium-webdriver
RUN gem install cucumber
RUN gem install rspec

CMD ["cucumber", "--format", "pretty", "--format", "html", "--out", "/output/report.html"]
