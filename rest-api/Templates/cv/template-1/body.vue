<template>
    <div>
        <div class="entry">
            <!-- Begin Image -->
            <img class="portrait" :src="user.url_profile" :alt="user.lastname" />
            <!-- End Image -->
            <!-- Begin Personal Information -->
            <div class="self">
                <div class="lastname-title">
                    <h1 class="name">{{ user.lastname }}</h1>
                    <h2 class="title">{{ cv.title_frontend || "{No cv title frontend}" }}</h2>
                </div>
                <ul class="detail-top">
                    <li class="ad">{{ cv.address.value }}</li>
                    <li class="mail">{{ user.email }}</li>
                    <li class="tel">{{ user.phone }}</li>
                    <li class="skype">Skype : {{ user.socialLink.skype_id }}</li>
                    <li class="website">Site web : <a target="_blank" :href="user.socialLink.website_url">{{ user.socialLink.website_url.replace('https://','') }}</a></li>
                    <li class="linkedin">LinkedIn : <a target="_blank" :href="user.socialLink.linkedin_url">{{ user.socialLink.linkedin_url.replace('https://','') }}</a></li>
                    <li class="github">Github : <a target="_blank" :href="user.socialLink.github_url">{{ user.socialLink.github_url.replace('https://','') }}</a></li>
                </ul>
            </div>
            <!-- End Personal Information -->
        </div>
        <!-- Begin 1st Row -->
        <div class="entry">
            <div>
                <h2> {{ wordList.professsional_summary.toUpperCase() }} </h2>
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
            <h2> {{ wordList.education.toUpperCase() }} </h2>
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
            <h2>{{ wordList.experience.toUpperCase() }}</h2>
            
            <div 
                class="content experience-content" 
                v-for="itemCompany in cv.experiences.companies" 
                :key="itemCompany.id"
                :class="itemCompany.hasManyPosition ? 'company-with-many-position' : '' "
            >
                <div class="column-timeline company">
                    <h3>{{ itemCompany.dateStartFriendly }} - {{itemCompany.dateEndFriendly }}</h3>
                    <div class="company-duration">{{ itemCompany.durationInDayOnTheCompanyFriendly }}</div>
                </div>
                <div class="column-detail">
                    <div class="company-name">{{ itemCompany.name }}</div>
                    <div>
                        <div 
                            class="position-content"
                            v-for="itemPosition in itemCompany.positionsValue" 
                            :key="itemPosition.id"
                        >
                            <div class="timeline-container" v-if="itemCompany.hasManyPosition == true">
                                <div class="timeline-container-child">
                                    <div class="timeline-point"></div>
                                    <div class="timeline-content"
                                        v-if="itemCompany.positionsValue[itemCompany.positionsValue.length-1].id != itemPosition.id"
                                    ></div>
                                </div>
                            </div>
                            <div class="position-header">
                                <div class="position-title">{{ itemPosition.title }}</div>
                                <div class="position-duration" v-if="itemCompany.hasManyPosition == true">
                                    <span class="position-duration-1">{{ itemPosition.experienceDateBegin_Friendly}} - {{itemPosition.experienceDateEnd_Friendly }}</span>
                                    <span class="position-duration-2"> - {{ itemPosition.durationInDayOnThePositionFriendly }}</span>
                                </div>
                            </div>
                            <div class="position-body">
                                <!-- <p>{{ itemPosition.description }}</p> -->
                                <div 
                                    class="description-experience-position" 
                                    v-html="itemPosition.descriptionExperiencePosition">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="company-separator" 
                        v-if="cv.experiences.companies[cv.experiences.companies.length-1].id != itemCompany.id"
                    >
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
            <h2>{{ wordList.skills.toUpperCase() }}</h2>

            <div class="content skills-content cv-skill_description">
                <div class="column-skill-group">
                    <h3>Description</h3>
                </div>
                <div class="column-detail"
                    v-html="cv.skill_description"></div>
            
            </div>

            <div class="content skills-content" 
                v-for="itemSkillGroup in cv.skillsGroup" 
                :key="itemSkillGroup.id"
            >
                <div class="column-skill-group">
                    <h3>{{ itemSkillGroup.title }}</h3>
                </div>
                <div class="column-detail">
                    <ul class="skills">
                        <template v-for="itemSkill in cv.skills">
                            <li v-if="itemSkill.id_skills_group === itemSkillGroup.id" :key="itemSkill.id">
                                {{ itemSkill.title }}
                            </li>
                        </template>
                    </ul>
                </div>
            </div>

            <div class="content content-no-item cvm-error" v-if="Object.keys(cv.skillsGroup).length == 0">
                {No item in skills}
            </div>
        </div>
        <!-- End 4th Row -->
        <!-- Begin 5th Row -->
        <div class="entry">
            <h2>{{ wordList.works.toUpperCase() }}</h2>

            <ul class="works">
                <li class="content project-content" 
                    v-for="itemProject in cv.projects" 
                    :key="itemProject.id"
                >
                    <div class="column-timeline project">
                        <!-- href="/templates/1/images/1.jpg"  -->
                        <a class="link-image" 
                            rel="gallery" 
                            title="Lorem ipsum dolor sit amet.">
                            <img src="/templates/1/images/image.jpg" alt="" />
                        </a>
                    </div>
                    <div class="column-detail">
                        <div class="project-head">
                            <div v-html="itemProject.title" class="project-title"></div>
                            <!-- <div class="project-title-date">
                                {{ itemProject.dateBegin_Friendly }} - {{ itemProject.dateEnd_Friendly }}
                            </div> -->
                        </div>
                        <div v-html="itemProject.description" class="project-content"></div>
                    </div>
                </li>
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
        props: ['cv', 'user', 'wordList']
    }
</script>