<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>글수정</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/write.css">
</head>
<body>
<section>
    <h1>게시글수정</h1>
    <hr>

    <form action="/one_board/one_reply" name="one_reply" method="post" enctype="multipart/form-data">
      <input type="hidden" name="member_id" value="${one_BoardVo.id}">
      <input type="hidden" name="id" value="${one_BoardVo.id}">
      <input type="hidden" name="bgroup" value="${one_BoardVo.bgroup}">
      <input type="hidden" name="bstep" value="${one_BoardVo.bstep}">
      <input type="hidden" name="bindent" value="${one_BoardVo.bindent}">
      <input type="hidden" name="bcategory" value="${one_BoardVo.bcategory}">
      <input type="hidden" name="old_bupload" value="${one_BoardVo.bupload}">
      <table>
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
              <tr>
			<td style="font-weight: bold;">상품명</td>
			<td>
				<div class="select1">
					<input type="radio" id="product" name="bcategory" value="product" ${one_BoardVo.bcategory == 'product' ? 'checked': '' }><label for="select1">상품</label>
					<input type="radio" id="delivery" name="bcategory" value="refund" ${one_BoardVo.bcategory == 'refund' ? 'checked': '' }><label for="select3">환불</label>
					<input type="radio" id="refund" name="bcategory" value="delivery" ${one_BoardVo.bcategory == 'delivery' ? 'checked': '' }><label for="select2">배송</label>
				</div>
			</td>
		</tr>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="bname">
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="btitle" value="<답변>">
          </td>
        </tr>
           <tr>
					<td class="article"><img src="/upload/${one_BoardVo.bupload}"
						alt="" width="80%"></td>
				</tr>
	      <tr>
        
        <tr>
          <th>내용</th>
          <td>
<textarea name="bcontent" cols="50" rows="10">${one_BoardVo.bcontent}

---------------------------
[답글]
</textarea>
          </td>
        </tr>
        <tr>
          <th>이미지 표시</th>
          <td>
            <input type="file" name="file" id="file">
          </td>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="submit" class="write">답변완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='one_list'">취소</button>
      </div>
    </form>

  </section>

</body>
</html>