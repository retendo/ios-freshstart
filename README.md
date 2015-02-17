Some thoughts about starting an iOS Project.
Partly unfiltered/unsorted.
Note to self: Maybe I could put that into real sentences and make a blog post for iOS beginners.

Clean start:
[http://stackoverflow.com/questions/25783282/how-to-create-an-empty-application-in-xcode-6-without-storyboard](http://stackoverflow.com/questions/25783282/how-to-create-an-empty-application-in-xcode-6-without-storyboard)
* New Single Page Application 
* init git 
* init/clean install cocoapods 
* install xcproj, so cocoa pods doesn't mess up your project file (or clean it yourself after installing pods with xcproj touch) 
* add gitignore 
* * .ignore plugin for appcode works fine

* delete storyboard &amp; launchimage.xib 
* * delete references in info.plist as well

* Add launch image &amp; dashboard icon asset bundle 
* * create dummy logo 
* use Asset Catalog Creator to create launch images and icons 
* put asset bundle in images.xcassets

* Add window creation code in appDidFinishLaunching 
* * init with screen bounds 
* make key and visible 
* set on app delegate property 
* set root view controller of window

* Add Classes directory 
* * Put AppDelegate and view controller in there

* Setup basic MVVM app structure in Classes folder 
* * View (incl. view controllers) 
* Model 
* ViewModel 
* Service (* that communicates with external stuff. API, GPS...) 
* Util (single purpose computing stuff, categories on non-views...)

ViewController:
* custom mandatory initWithViewModel 
* * override designated superclass initializer initWithNibName... 
* return self initWithViewModel:nil in it 
* in custom initializer 
* * call super designated initializer 
* NSParameterAssert(viewModel != nil) to make sure the view model is set 
* set viewModel parameter on private property 
* would not crash with nil view model but MVVM view controller is useless without it

* With ReactiveCocoa 
* * Subscribe to signal properties from viewmodel

ViewModel:
* Expose signals instead of value properties -&gt; composition takes place in view model instead of view -&gt; good

Databinding:
* No Databinding 
* * view controller passes one update block to view model that gets called, when anything changes 
* in the block every view gets re-rendered only based on view model state (react style) 
* should have some kind of diff algorithm for determining what changed in the view model (virtual dom style) 
* maybe with react native or the other components lib from facebook if it ever gets open sourced

* Self implemented block based "data binding" without KVO seems to be too much to implement 
* * ViewModel 
* * exposing public subscribeToXXX methods which take update blocks 
* declaring update blocks as private properties 
* override setters of private value properties to always call the appropriate update blocks 
* could use KVO internally instead of overriding setter - still too much to implement

* View 
* * could become difficult if it is just block based and there is a combination of value changes that should make certain changes in the UI

* ReactiveCocoa 
* * Let’s try that tomorrow, seems to be a good match ;) 
* Less code required 
* Logic more centralized in init 
* Less private methods -&gt; less code navigation 
* But: -&gt; Readability is something you have to get use to, depends on how familiar you are with FRP and stuff like that

Model:
* Depends on the amount of persistence you need.
* Options to consider:
* * JSONModel
* Mantle
* Realm.io
* Some SQLLite wrapper
* CoreData / RestKit

Service:
* Similar to ViewModel in that it exposes Signals as properties or return values of methods
* If you implement a mock service first, use a protocol that declares all public methods. Use mock service as id<Prototol> type so you can easily switch it out later