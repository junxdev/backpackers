<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/template/head.jspf" %>
	<%@ include file="/WEB-INF/views/template/nav.jspf" %>
	<%@ include file="/WEB-INF/views/template/header.jspf" %>

  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="./assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="./assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="index-page sidebar-collapse">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg fixed-top navbar-transparent " color-on-scroll="300">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="https://demos.creative-tim.com/paper-kit/index.html" rel="tooltip" title="Coded by Creative Tim" data-placement="bottom" target="_blank">
          Paper Kit 2
        </a>
        <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-bar bar1"></span>
          <span class="navbar-toggler-bar bar2"></span>
          <span class="navbar-toggler-bar bar3"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse justify-content-end" id="navigation">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" rel="tooltip" title="Follow us on Twitter" data-placement="bottom" href="https://twitter.com/CreativeTim" target="_blank">
              <i class="fa fa-twitter"></i>
              <p class="d-lg-none">Twitter</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" rel="tooltip" title="Like us on Facebook" data-placement="bottom" href="https://www.facebook.com/CreativeTim" target="_blank">
              <i class="fa fa-facebook-square"></i>
              <p class="d-lg-none">Facebook</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" rel="tooltip" title="Follow us on Instagram" data-placement="bottom" href="https://www.instagram.com/CreativeTimOfficial" target="_blank">
              <i class="fa fa-instagram"></i>
              <p class="d-lg-none">Instagram</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" rel="tooltip" title="Star on GitHub" data-placement="bottom" href="https://www.github.com/CreativeTimOfficial/paper-kit" target="_blank">
              <i class="fa fa-github"></i>
              <p class="d-lg-none">GitHub</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="https://demos.creative-tim.com/paper-kit-2/docs/1.0/getting-started/introduction.html" target="_blank" class="nav-link"><i class="nc-icon nc-book-bookmark"></i> Documentation</a>
          </li>
          <li class="nav-item">
            <a href="https://www.creative-tim.com/product/paper-kit-2-pro?ref=pk2-free-local" target="_blank" class="btn btn-danger btn-round">Upgrade to Pro</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- End Navbar -->
  <div class="page-header section-dark" style="background-image: url('./assets/img/antoine-barres.jpg')">
    <div class="filter"></div>
    <div class="content-center">
      <div class="container">
        <div class="title-brand">
          <h1 class="presentation-title">Paper Kit 2</h1>
          <div class="fog-low">
            <img src="./assets/img/fog-low.png" alt="">
          </div>
          <div class="fog-low right">
            <img src="./assets/img/fog-low.png" alt="">
          </div>
        </div>
        <h2 class="presentation-subtitle text-center">Make your mark with a Free Bootstrap 4 UI Kit! </h2>
      </div>
    </div>
    <div class="moving-clouds" style="background-image: url('./assets/img/clouds.png'); "></div>
    <h6 class="category category-absolute">Designed and coded by
      <a href="https://www.creative-tim.com" target="_blank">
        <img src="./assets/img/creative-tim-white-slim2.png" class="creative-tim-logo">
      </a>
    </h6>
  </div>
  <div class="main">
    <div class="section section-buttons">
      <div class="container">
        <div class="title">
          <h2>Basic Elements</h2>
        </div>
        <div id="buttons">
          <div class="title">
            <h3>Buttons
              <br/>
              <small>Pick your style</small>
            </h3>
          </div>
          <div class="row">
            <div class="col-md-8">
              <button type="button" class="btn btn-info">Default</button>
              <button type="button" class="btn btn-info btn-round">Round</button>
              <button type="button" class="btn btn-info btn-round"><i class="fa fa-heart"></i> With Icon</button>
              <button type="button" class="btn btn-info btn-just-icon"><i class="fa fa-heart"></i></button>
              <button type="button" class="btn btn-info btn-link">Simple</button>
            </div>
          </div>
          <div class="title">
            <h3>
              <small>Pick your size</small>
            </h3>
          </div>
          <div class="row">
            <div class="col-md-8">
              <button type="button" class="btn btn-outline-danger btn-sm">Small</button>
              <button type="button" class="btn btn-outline-danger">Regular</button>
              <button type="button" class="btn btn-outline-danger btn-lg">Large</button>
            </div>
          </div>
          <div class="title">
            <h3>
              <small>Pick your color</small>
            </h3>
          </div>
          <div class="row">
            <div class="col-md-8">
              <button type="button" class="btn btn-outline-default btn-round">Default</button>
              <button type="button" class="btn btn-outline-primary btn-round">Primary</button>
              <button type="button" class="btn btn-outline-info btn-round">Info</button>
              <button type="button" class="btn btn-outline-success btn-round">Success</button>
              <button type="button" class="btn btn-outline-warning btn-round">Warning</button>
              <button type="button" class="btn btn-outline-danger btn-round">Danger</button>
              <button type="button" class="btn btn-outline-neutral btn-round">Neutral</button>
            </div>
          </div>
          <br/>
          <div class="row">
            <div class="col-md-8">
              <button type="button" class="btn btn-default btn-round">Default</button>
              <button type="button" class="btn btn-primary btn-round">Primary</button>
              <button type="button" class="btn btn-info btn-round">Info</button>
              <button type="button" class="btn btn-success btn-round">Success</button>
              <button type="button" class="btn btn-warning btn-round">Warning</button>
              <button type="button" class="btn btn-danger btn-round">Danger</button>
              <button type="button" class="btn btn-neutral btn-round">Neutral</button>
            </div>
          </div>
        </div>
        <div class="title">
          <h3>Links</h3>
        </div>
        <div class="row">
          <div class="col-md-8">
            <a href="#0" class="btn btn-link btn-default">Default</a>
            <a href="#0" class="btn btn-link btn-primary">Primary</a>
            <a href="#0" class="btn btn-link btn-success">Success</a>
            <a href="#0" class="btn btn-link btn-info">Info</a>
            <a href="#0" class="btn btn-link btn-warning">Warning</a>
            <a href="#0" class="btn btn-link btn-danger">Danger</a>
            <a href="#0" class="btn btn-link btn-neutral">Neutral</a>
          </div>
        </div>
        <div class="title">
          <h3>Inputs</h3>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Default">
            </div>
          </div>
          <div class="col-sm-3">
            <div class="form-group has-success">
              <input type="text" class="form-control form-control-success" id="inputSuccess1" value="Success">
            </div>
          </div>
          <div class="col-sm-3">
            <div class="form-group has-danger">
              <input type="text" class="form-control form-control-danger" id="inputDanger1" value="Error">
              <div class="form-control-feedback">Sorry, that username's taken. Try another?</div>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Username">
              <div class="input-group-append">
                <span class="input-group-text"><i class="fa fa-group" aria-hidden="true"></i></span>
              </div>
            </div>
          </div>
        </div>
        <br/>
        <div class="row">
          <div class="col-sm-6 col-lg-3">
            <div class="title">
              <h3>Checkboxes</h3>
            </div>
            <div class="form-check">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" value=""> Unchecked
                <span class="form-check-sign"></span>
              </label>
            </div>
            <div class="form-check">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" value="" checked> Checked
                <span class="form-check-sign"></span>
              </label>
            </div>
            <div class="form-check disabled">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" value="" disabled> Disabled unchecked
                <span class="form-check-sign"></span>
              </label>
            </div>
            <div class="form-check disabled">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" value="" disabled checked> Disabled checked
                <span class="form-check-sign"></span>
              </label>
            </div>
          </div>
          <div class="col-sm-6 col-lg-3">
            <div class="title">
              <h3>Radio Buttons</h3>
            </div>
            <div class="form-check-radio">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1"> Radio is off
                <span class="form-check-sign"></span>
              </label>
            </div>
            <div class="form-check-radio">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2" checked> Radio is on
                <span class="form-check-sign"></span>
              </label>
            </div>
            <div class="form-check-radio disabled">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3" disabled> Disabled radio is off
                <span class="form-check-sign"></span>
              </label>
            </div>
            <div class="form-check-radio disabled">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="exampleRadioz" id="exampleRadios4" value="option4" checked disabled> Disabled radio is on
                <span class="form-check-sign"></span>
              </label>
            </div>
          </div>
          <div class="col-sm-6 col-lg-3">
            <div class="title">
              <h3>Toggle Buttons</h3>
            </div>
            <div id="switches">
              <label>
                <input type="checkbox" data-toggle="switch" checked="" data-on-color="primary" data-off-color="primary">
                <span class="toggle"></span>
              </label>
              <br/>
              <label>
                <input type="checkbox" data-toggle="switch" data-off-color="primary" data-on-color="primary">
                <span class="toggle"></span>
              </label>
            </div>
          </div>
          <div class="col-sm-6 col-lg-3">
            <div class="title">
              <h3>Sliders</h3>
            </div>
            <div id="sliderRegular" class="slider"></div>
            <br>
            <div id="sliderDouble" class="slider slider-primary"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="section section-navbars">
      <div class="container" id="menu-dropdown">
        <div class="title">
          <h3>Menu</h3>
        </div>
        <br/>
        <div class="row">
          <div class="col-md-6">
            <nav class="navbar navbar-expand-lg bg-primary">
              <a class="navbar-brand" href="#">Menu</a>
              <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="#pk">Link</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#pk">Link</a>
                  </li>
                  <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" id="dropdownMenuButton" href="#pk" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                    <ul class="dropdown-menu dropdown-info" aria-labelledby="dropdownMenuButton">
                      <li class="dropdown-header">Dropdown header</li>
                      <a class="dropdown-item" href="#pk">Action</a>
                      <a class="dropdown-item" href="#pk">Another action</a>
                      <a class="dropdown-item" href="#pk">Something else here</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#pk">Separated link</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#pk">Another separated link</a>
                    </ul>
                  </div>
                </ul>
              </div>
            </nav>
          </div>
          <div class="col-md-6">
            <nav class="navbar navbar-expand-lg bg-danger">
              <a class="navbar-brand" href="#">Icons</a>
              <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar-menu-icon" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbar-menu-icon">
                <ul class="navbar-nav ml-auto">
                  <li class="nav-item active">
                    <a class="nav-link" href="#pk"><i class="nc-icon nc-email-85" aria-hidden="true"></i></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#pk"><i class="nc-icon nc-single-02" aria-hidden="true"></i></a>
                  </li>
                  <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#pk" role="button" aria-haspopup="true" aria-expanded="false"><i class="nc-icon nc-settings-gear-65" aria-hidden="true"></i></a>
                    <ul class="dropdown-menu dropdown-menu-right dropdown-danger">
                      <li class="dropdown-header" href="#pk">Dropdown header</li>
                      <a class="dropdown-item" href="#pk">Another action</a>
                      <a class="dropdown-item" href="#pk">Something else here</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#pk">Separated link</a>
                    </ul>
                  </div>
                </ul>
              </div>
            </nav>
          </div>
        </div>
      </div>
    </div>
    <div class="section section-navigation">
      <div class="container tim-container">
        <div class="title">
          <h3>Navigation Areas</h3>
        </div>
      </div>
      <div id="navbar">
        <div class="navigation-example" style="background-image: url('./assets/img/ilya-yakover.jpg');">
          <nav class="navbar navbar-expand-lg bg-primary">
            <div class="container">
              <a class="navbar-brand" href="#">Primary Color</a>
              <button class="navbar-toggler navbar-toggler-right burger-menu" type="button" data-toggle="collapse" data-target="#navbar-primary" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbar-primary">
                <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="nc-icon nc-compass-05" aria-hidden="true"></i>&nbsp;Discover</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="nc-icon nc-single-02" aria-hidden="true"></i>&nbsp;Profile</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="nc-icon nc-settings-gear-65" aria-hidden="true"></i>&nbsp;Settings</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
          <nav class="navbar navbar-expand-lg bg-info">
            <div class="container">
              <a class="navbar-brand" href="#">Info Color</a>
              <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar-info" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbar-info">
                <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="#">Discover</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Profile</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Settings</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
          <nav class="navbar navbar-expand-lg bg-success">
            <div class="container">
              <a class="navbar-brand" href="#">Success Color</a>
              <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar-success" aria-controls="navbarNav" aria-expanded="true" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
              </button>
              <div class="navbar-collapse collapse show" id="navbar-success" style="">
                <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="nc-icon nc-compass-05" aria-hidden="true"></i></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="nc-icon nc-single-02" aria-hidden="true"></i> </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="nc-icon nc-settings-gear-65" aria-hidden="true"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
          <nav class="navbar navbar-expand-lg bg-warning">
            <div class="container">
              <a class="navbar-brand" href="#">Warning Color</a>
              <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar-warning" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbar-warning">
                <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-facebook-official" aria-hidden="true"></i></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
          <nav class="navbar navbar-expand-lg bg-danger">
            <div class="container">
              <a class="navbar-brand" href="#">Danger Color</a>
              <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar-danger" aria-controls="navbarNav" aria-expanded="true" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
              </button>
              <div class="navbar-collapse collapse show" id="navbar-danger" style="">
                <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-facebook-official" aria-hidden="true"></i> Share</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-twitter" aria-hidden="true"></i> Tweet</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-pinterest" aria-hidden="true"></i> Pin</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
          <nav class="navbar navbar-expand-lg navbar-transparent pt-0">
            <div class="container">
              <a class="navbar-brand" href="#">Transparent</a>
              <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar-transparent" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
                <span class="navbar-toggler-bar"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbar-transparent">
                <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-facebook-official" aria-hidden="true"></i> Facebook</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-instagram" aria-hidden="true"></i> Instagram</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="title">
              <h3>Progress Bar</h3>
              <br>
            </div>
            <div class="progress">
              <div class="progress-bar progress-bar-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <br>
            <div class="progress">
              <div class="progress-bar progress-bar-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <br>
            <div class="progress">
              <div class="progress-bar progress-bar-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <br>
            <div class="progress">
              <div class="progress-bar" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
              <div class="progress-bar progress-bar-success" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
              <div class="progress-bar progress-bar-warning" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="title">
              <h3>Pagination</h3>
              <br>
            </div>
            <nav aria-label="Page navigation example">
              <ul class="pagination">
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                    <i class="fa fa-angle-left" aria-hidden="true"></i>
                    <span class="sr-only">Previous</span>
                  </a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">5</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                    <span class="sr-only">Next</span>
                  </a>
                </li>
              </ul>
            </nav>
            <br>
            <nav aria-label="...">
              <ul class="pagination">
                <li class="page-item">
                  <a class="page-link" href="#" tabindex="-1">Previous</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item active">
                  <a class="page-link" href="#">3
                    <span class="sr-only">(current)</span>
                  </a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">5</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">Next</a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <br>
        <div class="row">
          <div class="col-md-6">
            <div class="title">
              <h3>Navigation Tabs</h3>
            </div>
            <div class="nav-tabs-navigation">
              <div class="nav-tabs-wrapper">
                <ul id="tabs" class="nav nav-tabs" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#home" role="tab">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#profile" role="tab">Profile</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#messages" role="tab">Messages</a>
                  </li>
                </ul>
              </div>
            </div>
            <div id="my-tab-content" class="tab-content text-center">
              <div class="tab-pane active" id="home" role="tabpanel">
                <p>Larger, yet dramatically thinner. More powerful, but remarkably power efficient. With a smooth metal surface that seamlessly meets the new Retina HD display.</p>
              </div>
              <div class="tab-pane" id="profile" role="tabpanel">
                <p>Here is your profile.</p>
              </div>
              <div class="tab-pane" id="messages" role="tabpanel">
                <p>Here are your messages.</p>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="title">
              <h3>Labels</h3>
            </div>
            <span class="label label-default">Default</span>
            <span class="label label-primary">Primary</span>
            <span class="label label-info">Info</span>
            <span class="label label-success">Success</span>
            <span class="label label-warning">Warning</span>
            <span class="label label-danger">Danger</span>
          </div>
        </div>
      </div>
    </div>
    <div class="container tim-container">
      <div class="title">
        <h3>Notifications</h3>
      </div>
    </div>
    <div id="notifications">
      <div class="alert alert-info">
        <div class="container">
          <span>This is a plain notification! </span>
        </div>
      </div>
      <div class="alert alert-success">
        <div class="container">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <i class="nc-icon nc-simple-remove"></i>
          </button>
          <span>This is a notification with close button. </span>
        </div>
      </div>
      <div class="alert alert-warning alert-with-icon" data-notify="container">
        <div class="container">
          <div class="alert-wrapper">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <i class="nc-icon nc-simple-remove"></i>
            </button>
            <div class="message"><i class="nc-icon nc-bell-55"></i> This is a notification with close button and icon.</div>
          </div>
        </div>
      </div>
      <div class="alert alert-danger alert-with-icon" data-notify="container">
        <div class="container">
          <div class="alert-wrapper">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <i class="nc-icon nc-simple-remove"></i>
            </button>
            <div class="message"><i class="nc-icon nc-bell-55"></i> This is a notification with close button and icon and have many lines. You can see that the icon and the close button are always vertically aligned. This is a beautiful notification. So you don't have to worry about the style.</div>
          </div>
        </div>
      </div>
    </div>
    <!--  end notifications -->
    <div class="container tim-container">
      <div class="title">
        <h3>Typography</h3>
      </div>
      <div id="typography">
        <div class="row">
          <div class="typography-line">
            <h1>
              <span class="note">Header 1</span> Thinking in textures
            </h1>
          </div>
          <div class="typography-line">
            <h2>
              <span class="note">Header 2</span> Thinking in textures
            </h2>
          </div>
          <div class="typography-line">
            <h3>
              <span class="note">Header 3</span> Thinking in textures
            </h3>
          </div>
          <div class="typography-line">
            <h4>
              <span class="note">Header 4</span> Thinking in textures
            </h4>
          </div>
          <div class="typography-line">
            <h5>
              <span class="note">Header 5</span> Thinking in textures
            </h5>
          </div>
          <div class="typography-line">
            <h6>
              <span class="note">Header 6</span> Thinking in textures
            </h6>
          </div>
          <div class="typography-line">
            <p>
              <span class="note">Paragraph</span> Thinking in textures
            </p>
          </div>
          <div class="typography-line">
            <span class="note">Quote</span>
            <blockquote class="blockquote">
              <p class="mb-0">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam.</p>
              <br/>
              <footer class="blockquote-footer">Someone famous in
                <cite title="source Title">Source Title</cite>
              </footer>
            </blockquote>
       
          </head>
<body>

	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>