<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
 		<link href="/resources/css/mainstyles.css" rel="stylesheet"/> 	
     </head>
    <body>
    <%@ include file="../includes/header.jsp" %>
        <!-- Responsive navbar-->
        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">Welcome to Blog Home!</h1>
                    <p class="lead mb-0">A Bootstrap 5 starter layout for your next blog homepage</p>
                </div>
            </div>
        </header>
        <!-- Page content-->
        <div class="container">
            <div class="col-lg-100">
                    <!-- Nested row for non-featured blog posts-->
                    <div class="row">
                    	<div class="col-lg-4" >
                            <!-- Blog post-->
							<div class="card mb-4" >
							    <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..."></a>
							    <div class="card-body"  style="min-height:200px; max-height: 200px; overflow: hidden;">
							        <div class="small text-muted">January 1, 2023</div>
							        <div class="row">
							            <div class="col-8">
							                <h2 class="card-title h4">Post Title</h2>
							            </div>
							            <div class="col-4">
							                <a class="btn btn-primary" href="#!">Read more</a>
							            </div>
							        </div>
							        <br>
							        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
							    </div>
							</div>
                            <!-- Blog post-->
                            <div class="card mb-4" >
							    <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..."></a>
							    <div class="card-body"  style="min-height:200px; max-height: 200px; overflow: hidden;">
							        <div class="small text-muted">January 1, 2023</div>
							        <div class="row">
							            <div class="col-8">
							                <h2 class="card-title h4">Post Title</h2>
							            </div>
							            <div class="col-4">
							                <a class="btn btn-primary" href="#!">Read more</a>
							            </div>
							        </div>
							        <br>
							        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
							    </div>
							</div>
                        </div>
                        <div class="col-lg-4">
                            <!-- Blog post-->
                            <div class="card mb-4" >
							    <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..."></a>
							    <div class="card-body"  style="min-height:200px; max-height: 200px; overflow: hidden;">
							        <div class="small text-muted">January 1, 2023</div>
							        <div class="row">
							            <div class="col-8">
							                <h2 class="card-title h4">Post Title</h2>
							            </div>
							            <div class="col-4">
							                <a class="btn btn-primary" href="#!">Read more</a>
							            </div>
							        </div>
							        <br>
							        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
							    </div>
							</div>
                            <!-- Blog post-->
                            <div class="card mb-4" >
							    <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..."></a>
							    <div class="card-body"  style="min-height:200px; max-height: 200px; overflow: hidden;">
							        <div class="small text-muted">January 1, 2023</div>
							        <div class="row">
							            <div class="col-8">
							                <h2 class="card-title h4">Post Title</h2>
							            </div>
							            <div class="col-4">
							                <a class="btn btn-primary" href="#!">Read more</a>
							            </div>
							        </div>
							        <br>
							        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
							    </div>
							</div>
                        </div>
                        <div class="col-lg-4">
                            <!-- Blog post-->
                            <div class="card mb-4" >
							    <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..."></a>
							    <div class="card-body"  style="min-height:200px; max-height: 200px; overflow: hidden;">
							        <div class="small text-muted">January 1, 2023</div>
							        <div class="row">
							            <div class="col-8">
							                <h2 class="card-title h4">Post Title</h2>
							            </div>
							            <div class="col-4">
							                <a class="btn btn-primary" href="#!">Read more</a>
							            </div>
							        </div>
							        <br>
							        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
							    </div>
							</div>
                            <!-- Blog post-->
                            <div class="card mb-4" >
							    <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..."></a>
							    <div class="card-body"  style="min-height:200px; max-height: 200px; overflow: hidden;">
							        <div class="small text-muted">January 1, 2023</div>
							        <div class="row">
							            <div class="col-8">
							                <h2 class="card-title h4">Post Title</h2>
							            </div>
							            <div class="col-4">
							                <a class="btn btn-primary" href="#!">Read more</a>
							            </div>
							        </div>
							        <br>
							        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
							    </div>
							</div>
                        </div>
                    </div>
                    <!-- Pagination-->
                    <nav aria-label="Pagination">
                        <hr class="my-0" />
                        <ul class="pagination justify-content-center my-4">
                            <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
                            <li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
                            <li class="page-item"><a class="page-link" href="#!">2</a></li>
                            <li class="page-item"><a class="page-link" href="#!">3</a></li>
                            <li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
                            <li class="page-item"><a class="page-link" href="#!">15</a></li>
                            <li class="page-item"><a class="page-link" href="#!">Older</a></li>
                        </ul>
                    </nav>
                </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>