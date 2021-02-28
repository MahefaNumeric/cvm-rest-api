<template>
	<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
	<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<title>Resume</title>
			<link type="text/css" rel="stylesheet" href="/templates/1/css/blue.css" />
            <link type="text/css" rel="stylesheet" href="/templates/1/css/template-1.css" />
            <link type="text/css" rel="stylesheet" href="/templates/1/css/print.css" media="print"/>
			<!--[if IE 7]>
			<link href="/templates/1/css/ie7.css" rel="stylesheet" type="text/css" />
			<![endif]-->
			<!--[if IE 6]>
			<link href="/templates/1/css/ie6.css" rel="stylesheet" type="text/css" />
			<![endif]-->
			
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

							<bodyVue 
                                :cv="cv"
                                :user="user"
                            />

						</div>
						<div class="clear"></div>
						<div class="paper-bottom"></div>
					</div>
					<!-- End Paper -->
				</div>
				<div class="wrapper-bottom"></div>
			</div>
			<div id="message">
				<a href="#top" id="top-link">Go to Top</a>
			</div>
			<!-- End Wrapper -->
		</body>
	</html>
</template>

<script>
    const bodyVue = require("./body.vue"); 
    // It's necessary for vue mecanism
    module.exports = {
        data: () => {},
        components: {
            bodyVue
        }
    }
</script>