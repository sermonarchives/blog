# blog

Source code for sermon archives blog.

It uses the Hugo static site templating engine. The site currently uses the "hugo_theme_robust" theme, found here: https://github.com/dim0627/hugo_theme_robust

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/sermonarchives/blog)

If running in GitPod, running the server requires a slightly different command: `hugo server --baseUrl $(gp url 1313) --appendPort=false`

Once the command is running, make sure to expose port 1313.

Deploy to Github organization page handled by: https://github.com/marketplace/actions/hugo-for-github-organization-pages