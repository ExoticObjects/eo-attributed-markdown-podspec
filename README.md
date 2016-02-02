# eo-attributed-markdown-podspec

###Because this...
For some reason you need to make a private pod.

###Create Local Pod
- Create a pod using` pod lib create [PodName]`

###Connect Local Pod to Github Repo
- Github will give you instructions for this after you make your repo

###Add Local Pod to Local Podspec Repository
- Add pod to local podspec repository in your `~/.cocoapods` folder
 
```ruby
pod repo add eo-attributed-markdown-podspec https://github.com/ExoticObjects/eo-attributed-markdown-podspec.git
```

###Lint Local Pod
 - Push the private pod to the local podspec repository. The `eo-attributed-markdown.podspec` arg below is the path to that file, so you should be inside that directory when you execute this command.  

```ruby
pod _1.0.0.beta.2_ repo push eo-attributed-markdown-podspec eo-attributed-markdown.podspec --allow-warnings
```
> Note: --allow-warnings is critical; <br>
> _1.0.0.beta.2_ lets you run that specific version of cooapods - you probably shouldn't do this <br>
> You can also append the --verbose argument if you want 10,000+ lines of output from xcodebuild.

- **IMPORTANT**: Any time you make a change to your private pod, you must:
     - Update the version in your podspec (else nothing will happen! If you don't do this, Cocoapods thinks it's 'clean')
     - Commit pod to github
     - invoke `pod [podVersion] repo update [podName]`
     - invoke `pod [podVersion] repo push [podName] [podspecPathFromCurrentDir] --allow-warnings`
     - This command LINTS your pod and commits it to your local podspec repo. You'd have to do the same
       thing if committing to public repo...

###Linting Does This

```ruby
# console output
 Updating the `eo-attributed-markdown-podspec' repo

 From https://github.com/ExoticObjects/eo-attributed-markdown-podspec
  * [new branch]      master     -> origin/master

 Adding the spec to the `eo-attributed-markdown-podspec' repo

  - [Add] eo-attributed-markdown (0.9.2)

 Pushing the `eo-attributed-markdown-podspec' repo

 To https://github.com/ExoticObjects/eo-attributed-markdown-podspec
    561fbff..9eba7e5  master -> master
```

 In this example, we should now be able to serve `AttributedMarkdown` from our own github repo. 

 Used this tutorial for guidance: `http://code.tutsplus.com/tutorials/managing-private-pods-with-cocoapods--cms-25137`

###If problems:

- If you get a linker error from XCode, try this: `pod cache clean`
- lpods not found error? Look through [here](http://stackoverflow.com/questions/9863836/library-not-found-for-lpods)
  - [This](http://stackoverflow.com/a/23085107/869838) fixed it
  - Cocoapods guys are not cool for not handling that. They make libPods.a obsolete, and then DON'T delete it when doing their thing...
- Do Xcode dance: clean, clean build folder, delete derived data, clear simulator, restart simulator, restart Xcode, restart Mac.
  - and then it 'Just Works!'

###MISC
- To update using a beta version of cocoapods, you must specifically SPECIFY that version, like 

 `pod _1.0.0.beta.2_ --verbose update`
