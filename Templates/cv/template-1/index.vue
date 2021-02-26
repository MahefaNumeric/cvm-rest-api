<template>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Resume</title>
<link type="text/css" rel="stylesheet" href="/templates/1/css/blue.css" />
<link type="text/css" rel="stylesheet" href="/templates/1/css/print.css" media="print"/>
<!--[if IE 7]>
<link href="/templates/1/css/ie7.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--[if IE 6]>
<link href="/templates/1/css/ie6.css" rel="stylesheet" type="text/css" />
<![endif]--> 
<script type="text/javascript" src="/templates/1/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="/templates/1/js/jquery.tipsy.js"></script>
<script type="text/javascript" src="/templates/1/js/cufon.yui.js"></script>
<script type="text/javascript" src="/templates/1/js/scrollTo.js"></script>
<script type="text/javascript" src="/templates/1/js/myriad.js"></script>
<script type="text/javascript" src="/templates/1/js/jquery.colorbox.js"></script>
<script type="text/javascript" src="/templates/1/js/custom.js"></script>
<script type="text/javascript">
		Cufon.replace('h1,h2');
</script>
</head>
<body>
<!-- Begin Wrapper -->
<div id="wrapper">
  <div class="wrapper-top"></div>
  <div class="wrapper-mid">
    <!-- Begin Paper -->
    <div id="paper">
      <div class="paper-top"></div>
      <div id="paper-mid">
        <div class="entry">
          <!-- Begin Image -->
          <img class="portrait" src="/templates/1/images/image.jpg" alt="John Smith" />
          <!-- End Image -->
          <!-- Begin Personal Information -->
          <div class="self">
            <h1 class="name">
              {{ user.lastname }} <br />
              <span>{{cv.title_frontend}}</span>
            </h1>
            <ul>
              <li class="ad">{{ cv.address.value }}</li>
              <li class="mail">{{ user.email }}</li>
              <li class="tel">{{ user.phone }}</li>
              <li class="web">{{ user.socialLink.website_url }}</li>
            </ul>
          </div>
          <!-- End Personal Information -->
          <!-- Begin Social -->
          <div class="social">
            <ul>
              <li><a class='north' href="#" title="Download .pdf"><img src="/templates/1/images/icn-save.jpg" alt="Download the pdf version" /></a></li>
              <li><a class='north' href="javascript:window.print()" title="Print"><img src="/templates/1/images/icn-print.jpg" alt="" /></a></li>
              <li><a class='north' id="contact" href="contact/index.html" title="Contact Me"><img src="/templates/1/images/icn-contact.jpg" alt="" /></a></li>
              <li><a class='north' href="#" title="Follow me on Twitter"><img src="/templates/1/images/icn-twitter.jpg" alt="" /></a></li>
              <li><a class='north' href="#" title="My Facebook Profile"><img src="/templates/1/images/icn-facebook.jpg" alt="" /></a></li>
            </ul>
          </div>
          <!-- End Social -->
        </div>
        <!-- Begin 1st Row -->
        <div class="entry">
          <h2>OBJECTIVE</h2>
          <p>
            {{ cv.auto_biography }}
          </p>
        </div>
        <!-- End 1st Row -->
        <!-- Begin 2nd Row -->
        <div class="entry">
          <h2>EDUCATION</h2>
          <div class="content" v-for="education in cv.educations" :key="education.id">
            <h3>{{ education.date_begin_friendly }} - {{ education.date_end_friendly }}</h3>
            <p> {{ education.title }} <br />
              <em>{{ education.description }}</em></p>
          </div>
          <div class="content content-no-item" v-if="Object.keys(cv.educations).length == 0">
            {No item in educations}
          </div>
        </div>
        <!-- End 2nd Row -->

        <!-- Begin 3rd Row -->
        <div class="entry">
          <h2>EXPERIENCE</h2>
          <div class="content">
            <h3>May 2009 - Feb 2010</h3>
            <p>Agency Creative, London <br />
              <em>Senior Web Designer</em></p>
            <ul class="info">
              <li>Vestibulum eu ante massa, sed rhoncus velit.</li>
              <li>Pellentesque at lectus in libero dapibus cursus. Sed arcu ipsum, varius at ultricies acuro, tincidunt iaculis diam.</li>
            </ul>
          </div>
          <div class="content">
            <h3>Jun 2007 - May 2009</h3>
            <p>Junior Web Designer <br />
              <em>Bachelor of Science in Graphic Design</em></p>
            <ul class="info">
              <li>Sed fermentum sollicitudin interdum. Etiam imperdiet sapien in dolor rhoncus a semper tortor posuere. </li>
              <li>Pellentesque at lectus in libero dapibus cursus. Sed arcu ipsum, varius at ultricies acuro, tincidunt iaculis diam.</li>
            </ul>
          </div>
          <hr/>
          <template v-for="itemCompany in cv.experiences.companies">
            <div class="content" v-for="itemPosition in itemCompany.positions" :key="itemPosition.id">
              <h3>{{ itemPosition.experienceDateBegin}} - {{itemPosition.experienceDateEnd }}</h3>
              <p>{{ itemCompany.name }} <br />
                <em>{{ itemPosition.title }}</em></p>
              <div class="description-content">
                <p>{{ itemPosition.description }}</p>
                <ul class="info">
                  <li>{{ itemPosition.description }}</li>
                  <li>{{ itemPosition.description }}</li>
                </ul>
              </div>
            </div>
          </template>
          
          <div class="content content-no-item" v-if="Object.keys(cv.experiences.companies).length == 0">
            {No item in companies}
          </div>

        </div>
        <!-- End 3rd Row -->

        <!-- Begin 4th Row -->
        <div class="entry">
          <h2>SKILLS</h2>
          <div class="content">
            <h3>Software Knowledge</h3>
            <ul class="skills">
              <li>Photoshop</li>
              <li>Illustrator</li>
              <li>InDesign</li>
              <li>Flash</li>
              <li>Fireworks</li>
              <li>Dreamweaver</li>
              <li>After Effects</li>
              <li>Cinema 4D</li>
              <li>Maya</li>
            </ul>
          </div>
          <div class="content">
            <h3>Languages</h3>
            <ul class="skills">
              <li>CSS/XHTML</li>
              <li>PHP</li>
              <li>JavaScript</li>
              <li>Ruby on Rails</li>
              <li>ActionScript</li>
              <li>C++</li>
            </ul>
          </div>
          <hr/>
          <div class="content" v-for="itemSkillGroup in cv.skillsGroup" :key="itemSkillGroup.id">
            <h3>{{ itemSkillGroup.title }}</h3>
            <ul class="skills">
              <template v-for="itemSkill in cv.skills">
                <li v-if="itemSkill.id_skills_group === itemSkillGroup.id" :key="itemSkill.id">
                  {{ itemSkill.title }}
                </li>
              </template>
            </ul>
          </div>

          <div class="content content-no-item" v-if="Object.keys(cv.skillsGroup).length == 0">
            {No item in skills}
          </div>

        </div>
        <!-- End 4th Row -->

        <!-- Begin 5th Row -->
        <div class="entry">
        <h2>WORKS</h2>
        	<ul class="works">
        		<li><a href="/templates/1/images/1.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><img src="/templates/1/images/image.jpg" alt="" /></a></li>
        		<li><a href="/templates/1/images/2.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><img src="/templates/1/images/image.jpg" alt="" /></a></li>
        		<li><a href="/templates/1/images/3.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><img src="/templates/1/images/image.jpg" alt="" /></a></li>
        		<li><a href="/templates/1/images/1.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><img src="/templates/1/images/image.jpg" alt="" /></a></li>
        		<li><a href="/templates/1/images/2.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><img src="/templates/1/images/image.jpg" alt="" /></a></li>
        		<li><a href="/templates/1/images/3.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><img src="/templates/1/images/image.jpg" alt="" /></a></li>
        		<li><a href="/templates/1/images/1.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><img src="/templates/1/images/image.jpg" alt="" /></a></li>
        		<li><a href="/templates/1/images/1.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><img src="/templates/1/images/image.jpg" alt="" /></a></li>
        	</ul>
        </div>
        <!-- Begin 5th Row -->
      </div>
      <div class="clear"></div>
      <div class="paper-bottom"></div>
    </div>
    <!-- End Paper -->
  </div>
  <div class="wrapper-bottom"></div>
</div>
<div id="message"><a href="#top" id="top-link">Go to Top</a></div>
<!-- End Wrapper -->
</body>
</html>
</template>


<script>
  // It's necessary for vue mecanism
  module.exports = {
      data: () => {}
  }
</script>