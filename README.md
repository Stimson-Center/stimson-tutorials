stimson-tutorials
================

Table of Contents
=================

   * [Machine Learning Basics](#machine-learning-basics)
   * [Getting Started on Mac OS](#getting-started-on-mac-os)
   * [get project files](#get-project-files)
   * [Optionally Run Locally](#optionally-run-locally)
   * [Optionally Run in a Docker Container](#optionally-run-in-a-docker-container)
   * [Debugging](#debugging)
      * [Debugging ipython file](#debugging-ipython-file)
      * [Debugging Docker Virtual Machine](#debugging-docker-virtual-machine)

# Machine Learning Basics

Projects derived from Priya Dwivedi, Data Scientist:
 
* [Homepage](http://deeplearninganalytics.org/)
* [White Paper](https://towardsdatascience.com/nlp-extracting-the-main-topics-from-your-dataset-using-lda-in-minutes-21486f5aa925)
* [GitHub projects](https://raw.githubusercontent.com/priya-dwivedi/Deep-Learning/master/topic_modeling/LDA_Newsgroup.ipynb)
* [Newsgroup Data](http://qwone.com/~jason/20Newsgroups/)
* [Additional Articles](https://medium.com/@priya.dwivedi)
* Contact: info@deeplearninganalytics.org

# Getting Started on Mac OS

```bash
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    xcode-select --install
    brew update
    brew upgrade

    brew install git
    git --version
	git version 2.21.1 (Apple Git-122.3)
    open https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

    brew install python3
    python3 --version 
        Python 3.7.7
        
    pip3 install -U pytest
    py.test --version
        This is pytest version 5.0.1, imported from /usr/local/lib/python3.7/site-packages/pytest.py

    Get tokens from vendors and add the following environment variables
	export GOOGLE_SECRET_API_KEY="38AlphaNumericalCharacters"
	export GOOGLE_SECRET_CUSTOM_SEARCH_ID="21Numerals:11AlphaNumericCharacters"
        export GOOGLE_APPLICATION_CREDENTIALS=~/your_google_application_credential_files.json
        # https://account.mapbox.com/auth/signup/?route-to=%22https://account.mapbox.com/access-tokens/%22
	export MAPBOX_ACCESS_TOKEN="pk.86AlphaNumericCharacters"
```
# get project files

```bash
    cd ~
    git clone https://github.com/praktikos/stimson-tutorials.git
```

# Optionally Run Locally in a Terminal or Command Window

```bash
    cd ~/stimson-tutorials
    pip3 install -r requirements.txt
    python3 -m spacy download en
    ./run_jupyter
```
Your browser will automatically open to the notebooks folder, click on any iPython tutorial i.e.: LDA_Newsgroup.ipynb

# Optionally Run in a Docker Container


```bash
    brew install docker
    docker --version

    cd ~/stimson-tutorials
    docker build -t stimson-tutorials .
    docker run --user $(id -u):$(id -g) -p 8888:8888 -v $(PWD):/tf -it stimson-tutorials
```

```text
You will see:

You are running this container as user with ID 502 and group 20,
which should map to the ID and group for your user on the Docker host. Great!

[I 19:20:00.541 NotebookApp] Writing notebook server cookie secret to /.local/share/jupyter/runtime/notebook_cookie_secret
/usr/local/lib/python3.6/dist-packages/IPython/paths.py:67: UserWarning: IPython parent '/' is not a writable location, using a temp directory.
  " using a temp directory.".format(parent))
[I 19:20:00.733 NotebookApp] Serving notebooks from local directory: /tf
[I 19:20:00.733 NotebookApp] The Jupyter Notebook is running at:
[I 19:20:00.733 NotebookApp] http://5af6308a0461:8888/?token=cc20f287a0db34a4e8303111de9b63d0ad169d1ae2e3fc41
[I 19:20:00.733 NotebookApp]  or http://127.0.0.1:8888/?token=cc20f287a0db34a4e8303111de9b63d0ad169d1ae2e3fc41
[I 19:20:00.733 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 19:20:00.736 NotebookApp] 
    
    To access the notebook, open this file in a browser:
        file:///.local/share/jupyter/runtime/nbserver-1-open.html
    Or copy and paste one of these URLs:
        http://5af6308a0461:8888/?token=cc20f287a0db34a4e8303111de9b63d0ad169d1ae2e3fc41
     or http://127.0.0.1:8888/?token=cc20f287a0db34a4e8303111de9b63d0ad169d1ae2e3fc41     
```

Open your browser to http://127.0.0.1:8888/?token=..., navigate to notebooks -> tutorials and click LDA_Newsgroup.ipynb

# Debugging 

## Debugging ipython file

```bash
  pip3 install -U pytest
  pip3 install -U nbval
  py.test --nbval notebooks/analyze_surveymonkey_results.ipynb
```

## Debugging Docker Virtual Machine

```bash
docker run -u $(id -u):$(id -g) -it -v `pwd`:/mnt --entrypoint=/bin/bash  stimson-tutorials
    (you are automatically put into: /mnt )
```

