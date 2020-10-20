<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
    <head>
    
    <% request.setAttribute("root", request.getContextPath()); %>
    
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>backpackers</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/img/favicon.ico" />
       
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- Third party plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
    </head>
    
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="${root }">backpackers</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-right my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/backpackers/gear">백패킹</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/backpackers/sights/map">명소</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/backpackers/board/">게시판</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">쇼핑</a></li>
                    </ul>    
			                                           
			      <ul class="navbar-nav ml-auto my-2 my-lg-0">
			        <c:if test="${user != null}">
			        	<c:if test="${user.grade == 1}">
					 ${user.userId }님 입장을 환영합니다
			 		<button type="submit" class="btn btn-default"><a href="${root }/admin/adminPage">관리자 페이지</a></button>
					</c:if>
			        	<c:if test="${user.grade == 0}">
					 		${user.userId }님 입장을 환영합니다
			 		<button type="submit" class="btn btn-default"><a href="${root }/user/myPage">마이 페이지</a></button> 
					</c:if>	
			        <button type="submit" class="btn btn-default"><a href="${root }/user/logout">로그아웃</a></button>
			        </c:if>
					<c:if test="${user == null}"> 	  
					<button type="submit" class="btn btn-default"><a href="${root }/user/login">로그인</a></button>
			        <button type="submit" class="btn btn-default"><a href="${root }/user/register">회원가입</a></button>	 	  
					</c:if>
			        </ul>                               
                             
                </div>
            </div>
        </nav>

<!-- Masthead-->
        <header class="masthead">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end">
                        <h1 class="text-uppercase text-white font-weight-bold">TO GET READY FOR YOUR FIRST BACKPACKING TRIP, VISIT OUR WEBSITE</h1>
                        <hr class="divider my-4" />
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                        <p class="text-white-75 font-weight-light mb-5">Communicate other backpackers and get some gears can help you enjoy backpacking! Just look around and start communicating!</p>
                        <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Find Out More</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- About-->
        <section class="page-section bg-primary" id="about">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="text-white mt-0">We've got what you need!</h2>
                        <hr class="divider light my-4" />
                        <p class="text-white-50 mb-4">There is no need to worry about your fist backpacking trip! We have some tips and gears for you!</p>
                        <a class="btn btn-light btn-xl js-scroll-trigger" href="#services">Get Started!</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <h2 class="text-center mt-0">At Your Service</h2>
                
                <hr class="divider my-4" />
                <div class="row">
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <img class="img-fluid" src="resources/assets/img/portfolio/logo/icon1.jpg" style="width: 100px; height: 70px;"/>
                            <h3 class="h4 mb-2">Choose an easy destination</h3>
                            <p class="text-muted mb-0">Short overnight hikes close to home are best!</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                             <img class="img-fluid" src="resources/assets/img/portfolio/logo/icon3.jpg" style="width: 100px; height: 70px;"/>
                            <h3 class="h4 mb-2">Need some gears</h3>
                            <p class="text-muted mb-0">Get essential gear and clothing</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                             <img class="img-fluid" src="resources/assets/img/portfolio/logo/icon2.jpg" style="width: 100px; height: 70px;"/>
                            <h3 class="h4 mb-2">Communicate Other Backpackers</h3>
                            <p class="text-muted mb-0">You can get some information and discuss others how to do backpacking</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                                           <img class="img-fluid" src="resources/assets/img/portfolio/logo/icon4.jpg" style="width: 100px; height: 70px;"/>
                            <h3 class="h4 mb-2">Get ready for your trip</h3>
                            <p class="text-muted mb-0">Condition yourself to do the planned hike with a fully loaded pack</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio-->
        <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row no-gutters">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/assets/img/portfolio/fullsize/index1.jpg">
                            <img class="img-fluid" src="resources/assets/img/portfolio/thumbnails/index1.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50"></div>
                                <div class="project-name"></div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/assets/img/portfolio/fullsize/index2.jpg">
                            <img class="img-fluid" src="resources/assets/img/portfolio/thumbnails/index2.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50"></div>
                                <div class="project-name"></div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/assets/img/portfolio/fullsize/3.jpg">
                            <img class="img-fluid" src="resources/assets/img/portfolio/thumbnails/3.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50"></div>
                                <div class="project-name"></div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/assets/img/portfolio/fullsize/index4.jpg">
                            <img class="img-fluid" src="resources/assets/img/portfolio/thumbnails/index4.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50"></div>
                                <div class="project-name"></div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/assets/img/portfolio/fullsize/6.jpg">
                            <img class="img-fluid" src="resources/assets/img/portfolio/thumbnails/6.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50"></div>
                                <div class="project-name"></div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/assets/img/portfolio/fullsize/index3.jpg">
                            <img class="img-fluid" src="resources/assets/img/portfolio/thumbnails/index3.jpg" alt="" />

                            <div class="portfolio-box-caption p-3">
                                <div class="project-category text-white-50"></div>
                                <div class="project-name"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Call to action-->
        <section class="page-section bg-dark text-white">
            <div class="container text-center">
                <h2 class="mb-4">If you want to have an experienced backpacking friends, read here!</h2>
                <a class="btn btn-light btn-xl" href="${root }/board/">Read and Write Now!</a>
            </div>
        </section>
        <!-- Contact-->
        <section class="page-section" id="contact">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="mt-0">Let's Shop and Get In Touch!</h2>
                        <hr class="divider my-4" />
                        <p class="text-muted mb-5">Do you have any questions for your next backpacking trip? Give us a call or send us an email and we will get back to you ASAP!</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
                        <i class="fas fa-phone fa-3x mb-3 text-muted"></i>
                        <div>+82 (02) 123-4567</div>
                    </div>
                    <div class="col-lg-4 mr-auto text-center">
                        <i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
                        <!-- Make sure to change the email address in BOTH the anchor text and the link target below!-->
                        <a class="d-block" href="mailto:contact@yourwebsite.com">contact@backpackers.com</a>
                    </div>
                </div>
            </div>
        </section>

<!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container"><div class="small text-center text-muted">Copyright © 2020 - Backpackers</div></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
        <!-- Core theme JS-->
        <script src="/backpackers/resources/js/scripts.js"></script>



</body>
</html>
