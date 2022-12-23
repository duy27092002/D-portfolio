<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/admin/sidebar.jsp"%>
<!-- Main Content -->
<div id="content">

	<%@include file="/WEB-INF/views/common/admin/topbar.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">
		<h1 class="text-center">${viewTitle}</h1>
		<c:if test="${mess != null}">
			<div class="alert alert-${typeAlert} alert-dismissible fade show"
				role="alert">
				<strong>${mess}</strong>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		<div class="row">
			<div class="col-12 col-sm-12 col-md-6 col-lg-6">
				<a class="btn btn-sm btn-primary mb-4"
					href="/admin/personal-project/create"><i
					class="fas fa-plus mr-2"></i>Add new</a>
			</div>
			<div class="col-12 col-sm-12 col-md-6 col-lg-6">
				<form action="/admin/personal-project" method="get"
					class="float-sm-left float-md-right float-lg-right form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input name="keyword" type="text" maxlength="20"
							class="form-control bg-light small" placeholder="Keyword..."
							value="${keyword}">
						<div class="input-group-append">
							<button class="btn btn-primary" type="submit">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="card o-hidden border-0 shadow-lg mb-5 mt-3">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="table-responsive">
					<table class="table table-striped text-center">
						<thead>
							<tr>
								<c:if test="${resultList.keyword == null}">
									<c:set var="pagingParam" value="&orderType=${orderType}"></c:set>
								</c:if>
								<c:if test="${resultList.keyword != null}">
									<c:set var="pagingParam"
										value="&keyword=${resultList.keyword}&orderType=${orderType}"></c:set>
								</c:if>
								<th scope="col"><a
									href="?page=${resultList.currentPage}&orderBy=name${pagingParam}"
									class="text-body" style="text-decoration: none;">Name <i
										class="fas fa-arrows-alt-v ml-1"></i>
								</a></th>
								<th scope="col"><a
									href="?page=${resultList.currentPage}&orderBy=startDate${pagingParam}"
									class="text-body" style="text-decoration: none;">Start date
										<i class="fas fa-arrows-alt-v ml-1"></i>
								</a></th>
								<th scope="col">End date</th>
								<th scope="col">Language(s) & Technology(s)</th>
								<th scope="col">Status</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${totalItemsFound <= 0}">
								<tr>
									<td colspan="6">No data</td>
								</tr>
							</c:if>
							<c:if test="${totalItemsFound > 0}">
								<c:forEach items="${resultList.resultList}" var="project">
									<tr>
										<td>${project.name}</td>
										<td><fmt:formatDate value="${project.startDate}"
												pattern="dd/MM/yyyy" /></td>
										<td><c:if test="${project.endDate == null}">
											Present
										</c:if> <c:if test="${project.endDate != null}">
												<fmt:formatDate value="${project.endDate}"
													pattern="dd/MM/yyyy" />
											</c:if></td>
										<td><c:forEach var="lat"
												items="${project.languagesAndTechnologies}">
												${lat.name} | 
											</c:forEach></td>
										<td><c:if test="${project.status == 1 }">
												<i class="fas fa-toggle-on text-success"
													data-toggle="tooltip" title="Active"></i>
											</c:if> <c:if test="${project.status == 0 }">
												<i class="fas fa-toggle-off text-danger"
													data-toggle="tooltip" title="Inactive"></i>
											</c:if>
										<td>
											<button class="btn btn-sm border-primary">
												<a href="/admin/personal-project/details?id=${project.id}"><i
													class="fas fa-eye" data-toggle="tooltip" title="Details"></i></a>
												| <a href="/admin/personal-project/edit?id=${project.id}"><i
													class="fas fa-edit" data-toggle="tooltip" title="Edit"></i></a>
											</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<%@include file="/WEB-INF/views/common/pagination.jsp"%>
<%@include file="/WEB-INF/views/common/admin/footer.jsp"%>