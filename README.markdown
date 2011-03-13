= shoulda-spike

The bowling kata done with what I consider to be [shoulda](https://github.com/thoughtbot/shoulda) (but I might be wrong). 
I also used this to learn / test how to build a stand alone ruby application. During this, I found [Jeweler](https://github.com/technicalpickles/jeweler) which already sets up a simple directory structure for a stand alone project with git integration, shoulda, rcov, bundler and some nice rake tasks. 

Since rcov doesn't work with ruby 1.9, I removed rcov and used [cover_me](https://github.com/markbates/cover_me). In order to use cover_me, I had to add another rake task. To execute the task run `rake coverage`. In osx, it should also open a browser with the stats. This is the code of the task

    task :coverage do
      require 'cover_me'
      Rake::Task['test'].invoke
      CoverMe.complete!
    end

The other bit needed to run cover_me, is to add `require 'cover_me'` at the very first line of the test helper, in my case in [test/helper.rb](https://github.com/augusto/shoulda_spike/blob/master/test/helper.rb)
