<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Write Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root { --primary-color: #4a90e2; }
        body { background: #f4f7f6; font-family: 'Segoe UI', sans-serif; }
        .form-card { 
            max-width: 600px; margin: 60px auto; 
            background: white; border-radius: 20px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.08); 
            overflow: hidden;
        }
        .form-header { background: var(--primary-color); padding: 30px; color: white; text-align: center; }
        .form-body { padding: 40px; }
        /* 플로팅 라벨 효과 */
        .form-floating > .form-control:focus ~ label { color: var(--primary-color); }
        .btn-submit { 
            background: var(--primary-color); color: white; border: none;
            padding: 12px 30px; border-radius: 10px; font-weight: 600;
            transition: all 0.3s; width: 100%;
        }
        .btn-submit:hover { background: #357abd; transform: translateY(-2px); }
    </style>
</head>
<body>

<div class="form-card">
    <div class="form-header">
        <h3 class="m-0">자료실업로드</h3>
       
    </div>
    
    <div class="form-body">
        <form action="/item/update" method="post"  enctype="multipart/form-data">
            <!-- <input type="hidden" name="id" value="${item.id}"/>  -->
            <div class="form-floating mb-3">
                <input type="text" name="id" class="form-control shadow-none" id="id"  value="${item.id}" readonly>
                <label for="id">상품아이디</label>
            </div>
            
            <div class="form-floating mb-3">
                <input type="text" name="name" class="form-control shadow-none" id="name" value="${item.name}" required>
                <label for="name">상품이름</label>
            </div>
            
            <div class="form-floating mb-3">
                <input type="text" name="price" class="form-control shadow-none" id="price" value="${item.price}" required>
                <label for="price">가격</label>
            </div>

            <div class="form-floating mb-3">
                <img alt="상품이미지 ${item.name}" src="/item/display?id=${item.id}" width="300" id="picture1">
                <label for="picture1">상품이미지</label>
            </div>

            <div class="form-floating mb-3">
                <input type="file" name="picture" class="form-control shadow-none" id="picture">
                <label for="picture">상품파일</label>
            </div>
            <div class="form-floating mb-3">
                <textarea name="description" class="form-control shadow-none" id="description" rows="5" cols="20" required>${item.description}</textarea>
                <label for="description">상품이미지설명</label> 
            </div>


            <div class="d-flex gap-2">
                <a href="/item/itemList" class="btn btn-light w-25" style="width: 40% !important; white-space: normal;"> 상품<br>이미지<br>리스트 </a>
                <button type="submit" class="btn btn-submit">상품수정</button>
                <button type="reset" class="btn btn-submit">상품수정취소</button>
            </div>
            
        </form>
    </div>
</div>

</body>
</html>