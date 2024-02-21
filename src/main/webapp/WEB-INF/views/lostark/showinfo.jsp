<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Info</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        .item-container {
            border: 1px solid #ccc;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #fff;
        }

        h2 {
            color: #333;
        }

        p {
            margin: 5px 0;
        }

        .tooltip {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 10px;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div data-v-764761c6="" data-v-448332be="" class="char-equip2 col-md-6 equip-0 col-8">
    <figure data-v-764761c6="">
        <img data-v-764761c6="" width="46" src="https://cdn-lostark.game.onstove.com/efui_iconatlas/bk_item/bk_item_01_180.png" class="img-thumbnail p-0 grade6">
        <div data-v-764761c6="" style="position: absolute; top: 1px; font-size: 10px; left: 2px;">
            <small data-v-764761c6="" style="border-style: none; color: rgb(255, 255, 255); background: rgba(0, 0, 0, 0.5); padding-right: 0.15rem !important; padding-left: 0.1rem !important; border-radius: 4px;">무기</small>
        </div>
        <div data-v-764761c6="" class="progress border border-light">
            <div data-v-764761c6="" role="progressbar" class="progress-bar" style="background: rgb(255, 0, 221); width: 96%;"></div>
        </div>
        <div data-v-764761c6="" style="position: absolute; bottom: 3px; font-size: 10px; right: 17px;">
            <small data-v-764761c6="" style="color: rgb(255, 255, 255);">96</small>
        </div>
    </figure>
    <figure data-v-764761c6="" style="padding-bottom: 0px;">
        <div data-v-764761c6="" class="name-row">
            <h4 data-v-764761c6="" align="left" style="font-size: 13px; line-height: 140%; font-weight: 700; margin-left: 4px; width: 74px;">
                <span class="text-grade6">
                    <span style="color:#A88B6D">+19 마수의 사멸 대검</span><br>일반 
                </span>
                사멸
            </h4>
        </div>
    </figure>
    <figure data-v-764761c6="" style="padding-bottom: 0px;">
        <div data-v-764761c6="" class="name-row">
            <h5 data-v-764761c6="" class="equip-part-name" style="line-height: 140%; font-size: 13px; margin-left: 8px;">
                <span data-v-764761c6="" style="letter-spacing: -1px;"></span>
            </h5>
        </div>
    </figure>
</div>

<br>
<br>

<div class="item-container" th:each="item : ${info}">
    <h2>아이템 정보</h2>
    <p>Type: <span th:text="${item.Type}"></span></p>
    <p>Name: <span th:text="${item.Name}"></span></p>
    <p>Grade: <span th:text="${item.Grade}"></span></p>
    
    <!-- Add more fields as needed -->

    <!-- Item Tooltip -->
    <div class="tooltip" th:utext="${item.Tooltip.Element_000.value}"></div>
</div>

<!-- Add more items if needed -->

</body>
</html>
