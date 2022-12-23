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
		<div class="card o-hidden border-0 shadow-lg mb-5 mt-3">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-12">
						<div class="p-5">
							<f:form cssClass="user">
								<div class="form-group">
									<label>Name</label> <input
										class="form-control form-control-user bg-white"
										value="${websiteInfo.name}" disabled="disabled" />
								</div>
								<div class="form-group row">
									<div class="col-12 col-sm-12 col-md-6 col-lg-6 mb-3 mb-sm-0">
										<label>Favicon</label>
										<p>
											<img src="/image-file/${websiteInfo.favicon}"
												class="img-fluid rounded-circle" style="width: 100px;" />
										</p>
									</div>
									<div class="col-12 col-sm-12 col-md-6 col-lg-6">
										<label>Logo</label>
										<p>
											<img src="/image-file/${websiteInfo.logo}"
												class="img-fluid rounded-circle" style="width: 100px;" />
										</p>
									</div>
								</div>
								<a href="/admin/website/edit"
									class="btn btn-primary btn-user btn-block mt-4">Edit</a>
							</f:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

<%@include file="/WEB-INF/views/common/admin/footer.jsp"%>