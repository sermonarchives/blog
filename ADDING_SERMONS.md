# Adding sermons to the archive.

Here's the typical process for adding a sermon to the archive.

## Starting off
To start, open four websites in separate tabs:
* Vanderbilt's [Revised Common Lectionary Library](https://lectionary.library.vanderbilt.edu/)
* The Google Drive folder corresponding to scanned but unposted sermons
* The Google Drive Folder corresponding to the "Sermons from the Sermon Archive Site"
* The [deployed sermon archives site](https://sermonarchives.github.io/).

## Search for relevant sermons
* Now that the sites above are accessible, you should know what the current season and readings are for the upcoming week. That is often a good place to start when looking to post new sermons.
* Use the search function to find related sermons.  Many have file names that correspond to the season and year of the Revised Common Lectionary.

## Select A Sermon
* Pick a sermon that is relevant to the current season, or just one that seems cool and is not already in the archive.
* Make sure that the sermon you have chosen is not already in the "Sermons from the Sermon Archive Site" portion of Google Drive.
* Download the available files and information about that sermon. Put it into a temporary directory.

## Prepare a sermon for posting.
Now that you've selected a sermon, get ready to prepare information for it to be posted.  Read the sermon.  Are there any interesting references? Does it reference any current events of the time, politicians, or celebrities? Note them, as there is a "tags" section for posting.

## Creating the page for the sermon.
* Open the site in [Gitpod](https://gitpod.io/).
* Go to /static/images/sermons/ and scroll down to the highest numbered directory.  That's the most recent sermon.  
* This new sermon will be the next highest number. At the time of writing, we'll preten that the highest number is 0089, so the next sermon would be 0090.
* In the terminal, create the new sermon by typing `hugo new sermons/sermon-name-and-sermon-number.md`
* That command should create a new page representing the new sermon, with some information set to its default values.
* If you want, you can verify that this new sermon page exists by going to the site preview window and looking at the top sermon, which should have your title and a default thumbnail image.
* If you see the page, you're doing great.  If you don't see the page, you've probably done something wrong, and you should try to fix that.

## Upload the sermon content to the static portion of the Hugo site.
* If you want to be able to see the media in the site, you're going to need to upload it somewhere.
* Go to /static/images/sermons/ and scroll down to the highest numbered directory.  That's the most recent sermon.
* Create a new folder with the next higher number.  This is going to be where you will upload the new sermon files.
* Don't upload the highest quality scan that you have.  If the file size is bigger than 1MB, resize the image to have a maximum width of 1080 pixels to make it easier to show up on the page without using too much storage space or bandwidth.

## Filling out the front matter
The following items are in the [Hugo front matter](https://gohugo.io/content-management/front-matter/) for each sermon. Fill out as much of the information as you can.

* title: The title of the sermon. Example: "A Camel on the Roof"
* date: The date that you are posting the sermon. This is created automatically when you create the new sermon page.  Example: 2023-01-19T01:02:53Z
* categories: If it's a sermon, this shouldn't change. Example: ["sermons"]
* tags: A list of subjects that make this sermon unique. 
 Example: ["Ibrahim-Bin-Adham", "Herod", "Sadaam-Hussein", "Epiphany", "Camel"]
* rcl_year: The year of the Revised Common Lectionary that this sermon was in. Example: "A"
* rcl_season: The season of the Revised Common Lectionary that this sermon was in. "Epiphany"
* sermon_date: The actual date of the sermon, as close as you can determine.  Format is usually YYYY-MM-DD. Example: 1990-01-06
* sermon_scan: Is there a scanned image of this sermon?Example: true
* sermon_text: Is the actual text of the sermon available, either via OCR or digital backup? Example: true
* sermon_audio: Is the actual audio of this sermon available? Example: false
* thumbnail: What is the image that should be used for the thumbnail for this sermon? Often, it's one of the images that you just uploaded. Example: "/images/sermons/0090/Epiphany-Matthew2-1-6-1990-1080-1.jpg"
* sermon_number: What is the number representing this sermon? I started at 0001 and increase the number after every sermon. Example: "0090"

## Part 1: The sermon introduction
Once you've finished the front matter, you still need to post the actual sermon.

* Start by introducing the sermon.  It's often useful to state the year of the sermon and the season, and whether it is typed or handwritten.  If anything is interesting, put that information here. Don't put any links in this part of the summary.
* _I usually write the intro in italics to differentiate it from the sermon text._
* There should be a `<!--more-->` link after a sentence or two.  Anything before the `<!--more-->` link will be text below the thumbnail image.
* After the `<!--more-->` separator, you can put any informational links that you've found.  _These parts are still in italics, usually._

## Part 2: The actual sermon.
Here is where the actual sermon content goes.
* Typically, the sermon section starts with `**Sermon Title - Season - Date**`
* After that, if the sermon has any scanned images available, I post them using the Hugo figure [shortcode](https://gohugo.io/content-management/shortcodes/).
* The default image link shows the image with a maximum width of 1080 pixels.
* The default page includes one link as an example.  It looks like this: `{{< figure src="/images/sermons/0002/2epiphc-theabundantlife-19xx-scaled.jpg" width="1080" >}}`
* If the sermon text is available, put it below the image or images.

## Part 3: Related video content.
* If there is video or other related content (usually from Youtube), post an image to the video using the youtube shortcode.  Example: `{{< youtube WU4eLz4mPqw >}}`

## Preview the content you've created
* Hugo has a site preview feature, so you can view a preview of the sermon in your Gitpod site preview window.
* If you want to view a bigger version of the sermon, copy the address that is listed in the address bar of the site preview and paste it in a new browser tab.  That should preview the site in a full browser window.
* Make any needed changes.
* If everything looks good, you're ready to commit your changes.

## Committing your changes.
* The editor should have a version control tab.
* Click the version control tab to see the newly changed content.
* Stage the newly created content and create a commit message.
* If you've added a sermon, the commit message is often something like "Added sermon 0090 - A Camel on the Roof"
* Commit and push your changes.

## Create a pull request and merge to deploy
* If you've pushed your changes from Gitpod, everything should now be on your local fork.
* Create a pull request to the sermon archives organization with your updated content.
* After that pull request is merged, there is a github action that will deploy the changes to the sermon archive site.
* Open the [sermon archives site](https://sermonarchives.github.io/). Verify that the new content is there.  Refresh the page if necessary.
* If you see the new sermon, great!

## Move your sermon content from the unsorted archive
* Find the original content that is in the sermon archive in Google Drive
* Right click the file(s) and select move.
* The files should be moved to: My Drive/Sermon Archives/Sermons From Sermon Archive Site/(Your sermon number here)/
* Once you've moved over the files, you're done!

## Lather, Rise Repeat!
* Do this process for as many sermons as you would like.