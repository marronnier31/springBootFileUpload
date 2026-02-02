<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <form action="/item/create" method="post"  enctype="multipart/form-data">
            
            <div class="form-floating mb-3">
                <input type="text" name="name" class="form-control shadow-none" id="name" placeholder="상품이름을 입력하세요" required>
                <label for="name">상품이름</label>
            </div>
            
            <div class="form-floating mb-3">
                <input type="text" name="price" class="form-control shadow-none" id="price" placeholder="가격을 입력하세요" required>
                <label for="price">가격</label>
            </div>

            <div class="form-floating mb-3">
                <input type="file" name="picture" class="form-control shadow-none" id="picture"  required>
                <label for="picture">상품파일</label>
            </div>
            <div class="form-floating mb-3">
                <textarea name="description" class="form-control shadow-none" id="description" rows="5" cols="20" placeholder="내용을 입력하세요" required></textarea>
                <label for="description">상품이미지설명</label> 
            </div>


            <div class="d-flex gap-2">
                <a href="/item/itemList" class="btn btn-light w-25" style="width: 40% !important; white-space: normal;"> 상품<br>이미지<br>리스트 </a>
                <button type="submit" class="btn btn-submit">상품등록</button>
                <button type="reset" class="btn btn-submit">상품등록취소</button>
            </div>
            
        </form>
    </div>
</div>

</body>
</html>