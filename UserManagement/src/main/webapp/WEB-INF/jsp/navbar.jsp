<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
          <a class="nav-link active" href="/user">Users</a>
      </li>
    </ul>
    <sec:authorize access="isAuthenticated()">
	    <a class="btn btn-info" href="/logout">Logout</a>
    </sec:authorize>
    <sec:authorize access="!isAuthenticated()">
	    <a class="btn btn-info mr-3" href="/user">Login</a>
	    <a class="btn btn-info mr-3" href="/user/signUp">Register</a>
    </sec:authorize>
  </div>
</nav>