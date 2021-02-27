<template>
    <div>
        <div class="entry">
            <!-- Begin Image -->
            <img class="portrait" src="/public/Images/Users/1-mahefa-abel.jpeg" alt="John Smith" />
            <!-- End Image -->
            <!-- Begin Personal Information -->
            <div class="self">
                <h1 class="name">
                    {{ user.lastname }} 
                    <br />
                    <span>{{cv.title_frontend || "{No cv title frontend}"}}</span>
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
                    <li>
                        <a class='north' href="#" title="Download .pdf">
                            <img src="/templates/1/images/icn-save.jpg" alt="Download the pdf version" />
                        </a>
                    </li>
                    <li>
                        <a class='north' href="javascript:window.print()" title="Print">
                            <img src="/templates/1/images/icn-print.jpg" alt="" />
                        </a>
                    </li>
                    <li>
                        <a class='north' id="contact" href="contact/index.html" title="Contact Me">
                            <img src="/templates/1/images/icn-contact.jpg" alt="" />
                        </a>
                    </li>
                    <li>
                        <a class='north' href="#" title="Follow me on Twitter">
                            <img src="/templates/1/images/icn-twitter.jpg" alt="" />
                        </a>
                    </li>
                    <li>
                        <a class='north' href="#" title="My Facebook Profile">
                            <img src="/templates/1/images/icn-facebook.jpg" alt="" />
                        </a>
                    </li>
                </ul>
            </div>
            <!-- End Social -->
        </div>
        <!-- Begin 1st Row -->
        <div class="entry">
            <div>
                <h2>OBJECTIVE</h2>
            </div>
            <div class="objective-column-detail">
                <div>
                    {{ cv.auto_biography }}
                </div>
            </div>
        </div>
        <!-- End 1st Row -->
        <!-- Begin 2nd Row -->
        <div class="entry">
            <h2>EDUCATION</h2>
            <div class="content education-content" v-for="education in cv.educations" :key="education.id">
                <div class="column-timeline">
                    <h3>{{ education.date_begin_friendly }} - {{ education.date_end_friendly }}</h3>
                </div>
                <div class="column-detail"> 
                    <div>{{ education.title }}</div>
                    <em>{{ education.description }}</em>
                </div>
            </div>
            <div class="content content-no-item cvm-error" v-if="Object.keys(cv.educations).length == 0">
                {No item in educations}
            </div>
        </div>
        <!-- End 2nd Row -->
        <!-- Begin 3rd Row -->
        <div class="entry">
            <h2>EXPERIENCE</h2>
            
            <div 
                class="content experience-content" 
                v-for="itemCompany in cv.experiences.companies" 
                :key="itemCompany.id"
            >
                <!-- :class="itemCompany.hasManyPosition ? 'many-position-on-company' : 'single-position-on-company' " -->
                <div class="column-timeline company">
                    <h3>{{ itemCompany.dateStart}} - {{itemCompany.dateEnd }}</h3>
                    <div class="company-duration">7 ans et 3 mois</div>
                </div>
                <div class="column-detail">
                    <div class="company-name">{{ itemCompany.name }}</div>
                    <div 
                        class="position-content" 
                        v-for="itemPosition in itemCompany.positionsValue" 
                        :key="itemPosition.id"
                    >
                        <div class="position-header">
                            <div class="position-title">{{ itemPosition.title }}</div>
                            <div class="position-duration" v-if="itemCompany.hasManyPosition == true">
                                <span class="position-duration-1">{{ itemPosition.experienceDateBegin}} - {{itemPosition.experienceDateEnd }}</span>
                                <span class="position-duration-2"> - 2 ans</span>
                            </div>
                        </div>
                        <div class="position-body">
                            <p>{{ itemPosition.description }}</p>
                            <div>{{ itemPosition.descriptionExperiencePosition }}</div>
                        </div>
                    </div>

                    <div class="company-separator">
                        <hr/>
                        <!-- It's not really the place to this -->
                    </div>

                </div>

            </div>

            <div class="content content-no-item cvm-error" v-if="Object.keys(cv.experiences.companies).length == 0">
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
            <div class="content content-no-item cvm-error" v-if="Object.keys(cv.skillsGroup).length == 0">
                {No item in skills}
            </div>
        </div>
        <!-- End 4th Row -->
        <!-- Begin 5th Row -->
        <div class="entry">
            <h2>WORKS</h2>
            <ul class="works">
                <li>
                    <a href="/templates/1/images/1.jpg" rel="gallery" title="Lorem ipsum dolor sit amet.">
                        <img src="/templates/1/images/image.jpg" alt="" />
                    </a>
                </li>
                <li>
                    <a href="/templates/1/images/2.jpg" rel="gallery" title="Lorem ipsum dolor sit amet.">
                        <img src="/templates/1/images/image.jpg" alt="" />
                    </a>
                </li>
                <li>
                    <a href="/templates/1/images/3.jpg" rel="gallery" title="Lorem ipsum dolor sit amet.">
                        <img src="/templates/1/images/image.jpg" alt="" />
                    </a>
                </li>
                <li>
                    <a href="/templates/1/images/1.jpg" rel="gallery" title="Lorem ipsum dolor sit amet.">
                        <img src="/templates/1/images/image.jpg" alt="" />
                    </a>
                </li>
                <li>
                    <a href="/templates/1/images/2.jpg" rel="gallery" title="Lorem ipsum dolor sit amet.">
                        <img src="/templates/1/images/image.jpg" alt="" />
                    </a>
                </li>
                <li>
                    <a href="/templates/1/images/3.jpg" rel="gallery" title="Lorem ipsum dolor sit amet.">
                        <img src="/templates/1/images/image.jpg" alt="" />
                    </a>
                </li>
                <li>
                    <a href="/templates/1/images/1.jpg" rel="gallery" title="Lorem ipsum dolor sit amet.">
                        <img src="/templates/1/images/image.jpg" alt="" />
                    </a>
                </li>
                <li>
                    <a href="/templates/1/images/1.jpg" rel="gallery" title="Lorem ipsum dolor sit amet.">
                        <img src="/templates/1/images/image.jpg" alt="" />
                    </a>
                </li>
                <hr/>
            </ul>
            <div class="content content-no-item cvm-error" v-if="Object.keys(cv.projects).length == 0">
                {No item in projects/works}
            </div>
        </div>
        <!-- Begin 5th Row -->
    </div>
</template>

<script>
    // It's necessary for vue mecanism
    module.exports = {
        data: () => {},
        props: ['cv', 'user']
    }
</script>