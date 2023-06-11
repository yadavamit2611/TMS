<div class="wrapper">
  <!--Top menu -->
  <div class="section">
    <div class="top_navbar">
      <div class="hamburger">
        <a href="#">
          <i class="fa fa-magnet"></i>
        </a>
      </div>
    </div>
  </div>
  <div class="sidebar">
    <!--profile image & text-->
    <!--menu item-->
    <div class="profile">
      <img id="picture" src="../images/clint.jpg" alt="profile_picture">
      <h3>${user.name}</h3>
      <p>Designer</p>
    </div>
    <ul>
      <li>
        <a id="home" href="http://localhost:8080/TMS_war_exploded/home.jsp">
          <span class="icon"><i class="fa fa-home"></i></span>
          <span class="item">Home</span>
        </a>
      </li>
      <li>
        <a id="dashboard" href="http://localhost:8080/TMS_war_exploded/dashboard.jsp">
          <span class="icon"><i class="fa fa-desktop"></i></span>
          <span class="item">My Dashboard</span>
        </a>
      </li>
      <li>
        <a id="users" href="http://localhost:8080/TMS_war_exploded/users.jsp">
          <span class="icon"><i class="fa fa-user-plus"></i></span>
          <span class="item">Users</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon"><i class="fa fa-database"></i></span>
          <span class="item">Development</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon"><i class="fa fa-pagelines"></i></span>
          <span class="item">Reports</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon"><i class="fa fa-user-secret"></i></span>
          <span class="item">Admin</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon"><i class="fa fa-cog"></i></span>
          <span class="item">Settings</span>
        </a>
      </li>
      <li>
        <a id="logout" href="#">
          <span class="icon"><i class="fa fa-sign-out"></i></span>
          <span class="item">Log out</span>
        </a>
      </li>
    </ul>
  </div>
</div>
