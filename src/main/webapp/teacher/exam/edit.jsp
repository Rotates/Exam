<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  User: liao
  Date: 18-2-9
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="${pageContext.request.contextPath}/teacher/common/style.jsp"/>
    <style type="text/css">
        .testCon{padding: 5px 15px;}
        .tesTitle{color: #00B895;}
        .testCon h4 {margin: 10px;}
        .test-form-box{max-height: 660px;overflow: auto;}
        .assignment{margin: 30px 0 40px;text-align: center;}
        .assignment .btn{background: #00B895;width: 120px;font-size: 18px;border-color: #00B895;}
        label{font-weight: normal;}
        .jxz-title{text-align: justify;}
        .topic-answer {width: 60%}
        .testCon:hover{border:0.5px #efa030 solid;}
        .true_key {
            color: red
        }

        .choicetxt {
            height: 25px;
            padding: 2px 3px;
            font-size: 14px;
            border: solid 1px #cdcdcd;
        }

        /*.testCon:hover{width:166px;height:166px;border:2px solid #D94600;}*/
    </style>
</head>
<body class="hold-transition">
<form id="testForm">
    <div class="test-form-box">
        <c:if test="${not empty singleSelect}">
            <div class="jxz-box col-md-12">
                <h4 class="tesTitle">单项选择题</h4>
                <c:forEach var="s" items="${singleSelect}" varStatus="status">
                    <div class="testCon" data-type="1">
                        <h4 class="jxz-title">${status.index + 1}.<input class="title" value="${s.title}" type="text"></h4>
                        <c:if test="${not empty s.option_a}">
                            <div class="jxz-option radio">
                                <label>
                                    <input title="A" name="single" type="radio">
                                    A：<input class="choicetxt" value="${s.option_a}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_b}">
                            <div class="jxz-option radio">
                                <label>
                                    <input title="B" name="single" type="radio">
                                    B：<input class="choicetxt" value="${s.option_b}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_c}">
                            <div class="jxz-option radio">
                                <label>
                                    <input title="C" name="single" type="radio">
                                    C：<input class="choicetxt" value="${s.option_c}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_d}">
                            <div class="jxz-option radio">
                                <label>
                                    <input title="D" name="single" type="radio">
                                    D：<input class="choicetxt" value="${s.option_d}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_e}">
                            <div class="jxz-option radio">
                                <label>
                                    <input title="E" name="single" type="radio">
                                    E：<input class="choicetxt" value="${s.option_e}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_f}">
                            <div class="jxz-option radio">
                                <label>
                                    <input title="F" name="single" type="radio">
                                    F：<input class="choicetxt" value="${s.option_f}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_g}">
                            <div class="jxz-option radio">
                                <label>
                                    <input title="G" name="single" type="radio">
                                    G:<input class="choicetxt" value="${s.option_g}" type="text">ption_g}
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_h}">
                            <div class="jxz-option radio">
                                <label>
                                    <input title="H" name="single" type="radio">
                                    H:<input class="choicetxt" value="${s.option_h}" type="text">
                                </label>
                            </div>
                        </c:if>
                        <input name="score" value="${s.score}" type="hidden">
                        分数:<select name="score">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select><br>
                        <input name="difficulty" value="${s.exam_difficulty_id}" type="hidden">
                        难度:<select name="difficulty">
                            <c:forEach var="difficulty" items="${difficulty}">
                                <option value="${difficulty.id}">${difficulty.difficulty}</option>
                            </c:forEach>
                        </select>
                            <div class="topic-answer">
                                正确答案:<p class="true_key" title="${s.id}">${s.trueKey}</p>
                                <p>解析:</p>
                                <div class="jxz-option">
                                    <textarea id="${s.id}" rows="5" cols="80">
                                    ${s.resolution}
                                    </textarea>
                                </div>
                            </div>

                            <div class="form-group assignment">
                                <button type="button" class="btn btn-primary" onclick="updateQuestion(${s.id})">更新</button>
                            </div>
                        </div>

                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${not empty multipleSelect}">
            <div class="jxz-box col-md-12">
                <h4 class="tesTitle">多项选择题</h4>
                <c:forEach var="s" items="${multipleSelect}" varStatus="status">
                    <div class="testCon" data-type="2">
                            <h4 class="jxz-title">${status.index + 1}.<input class="title" value="${s.title}" type="text"></h4>
                        <c:if test="${not empty s.option_a}">
                            <div class="jxz-option checkbox">
                                <label>
                                    <input title="A" type="checkbox">
                                    A:<input class="choicetxt" value="${s.option_a}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_b}">
                            <div class="jxz-option checkbox">
                                <label>
                                    <input  title="B" type="checkbox">
                                    B:<input class="choicetxt" value="${s.option_b}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_c}">
                            <div class="jxz-option checkbox">
                                <label>
                                    <input  title="C" type="checkbox">
                                    C:<input class="choicetxt" value="${s.option_c}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_d}">
                            <div class="jxz-option checkbox">
                                <label>
                                    <input  title="D" type="checkbox">
                                    D:<input class="choicetxt" value="${s.option_d}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_e}">
                            <div class="jxz-option checkbox">
                                <label>
                                    <input  title="E" type="checkbox">
                                    E:<input class="choicetxt" value="${s.option_e}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_f}">
                            <div class="jxz-option checkbox">
                                <label>
                                    <input  title="F" type="checkbox">
                                    F:<input class="choicetxt" value="${s.option_f}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_g}">
                            <div class="jxz-option checkbox">
                                <label>
                                    <input  title="G" type="checkbox">
                                    G:<input class="choicetxt" value="${s.option_g}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <c:if test="${not empty s.option_h}">
                            <div class="jxz-option checkbox">
                                <label>
                                    <input  title="H" type="checkbox">
                                    H:<input class="choicetxt" value="${s.option_h}" type="text">
                                </label>
                            </div>
                        </c:if>

                        <input name="score" value="${s.score}" type="hidden">
                        分数:<select name="score">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select><br>
                        <input name="difficulty" value="${s.exam_difficulty_id}" type="hidden">
                        难度:<select name="difficulty">
                        <c:forEach var="difficulty" items="${difficulty}">
                            <option value="${difficulty.id}">${difficulty.difficulty}</option>
                        </c:forEach>
                    </select>

                        <div class="topic-answer">
                            正确答案:<p class="true_key" title="${s.id}">${s.trueKey}</p>
                            <p>解析:</p>
                            <div class="jxz-option">
                                <textarea id="${s.id}" rows="5" cols="80">
                                ${s.resolution}
                                </textarea>
                            </div>
                        </div>

                        <div class="form-group assignment">
                            <button type="button" class="btn btn-primary" onclick="updateQuestion(${s.id})">更新</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${not empty fill}">
            <div class="jxz-box col-md-12">
                <h4 class="tesTitle">填空题</h4>
                <c:forEach var="s" items="${fill}" varStatus="status">
                    <div class="testCon" data-type="3">
                        <h4 class="jxz-title">${status.index + 1}.<input class="title" value="${s.title}" type="text"></h4>
                        <input name="score" value="${s.score}" type="hidden">
                        分数:<select name="score">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select><br>
                        <input name="difficulty" value="${s.exam_difficulty_id}" type="hidden">
                        难度:<select name="difficulty">
                        <c:forEach var="difficulty" items="${difficulty}">
                            <option value="${difficulty.id}">${difficulty.difficulty}</option>
                        </c:forEach>
                    </select>

                        <div class="topic-answer">
                            正确答案:<p class="true_key" title="${s.id}"><input id="fill_text" value="${s.trueKey}" type="text"></p>
                            <p>解析:</p>
                            <div class="jxz-option">
                                <textarea id="${s.id}" rows="5" cols="80">
                                        ${s.resolution}
                                </textarea>
                            </div>
                        </div>

                        <div class="form-group assignment">
                            <button type="button" class="btn btn-primary" onclick="updateQuestion(${s.id})">更新</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${not empty judge}">
            <div class="jxz-box col-md-12">
                <h4 class="tesTitle">判断题</h4>
                <c:forEach var="s" items="${judge}" varStatus="status">
                    <div class="testCon" data-type="4">
                        <h4 class="jxz-title">${status.index + 1}.<input class="title" value="${s.title}" type="text"></h4>
                        <div class="jxz-option radio">
                            <label>
                                <input name="judge" title="1" type="radio" value="1"> 正确
                            </label>
                        </div>
                        <div class="jxz-option radio">
                            <label>
                                <input name="judge" title="0" type="radio" value="0"> 错误
                            </label>
                        </div>

                        <input name="score" value="${s.score}" type="hidden">
                        分数:<select name="score">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select><br>
                        <input name="difficulty" value="${s.exam_difficulty_id}" type="hidden">
                        难度:<select name="difficulty">
                        <c:forEach var="difficulty" items="${difficulty}">
                            <option value="${difficulty.id}">${difficulty.difficulty}</option>
                        </c:forEach>
                    </select>
                        <div class="topic-answer">
                            正确答案:<p class="true_key" title="${s.id}">${s.trueKey}</p>
                            <p>解析:</p>
                            <div class="jxz-option">
                                <textarea id="${s.id}" rows="5" cols="80">
                                        ${s.resolution}
                                </textarea>
                            </div>
                        </div>
                        <div class="form-group assignment">
                            <button type="button" class="btn btn-primary" onclick="updateQuestion(${s.id})">更新</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
</form>
<script>

    $(document).ready(function () {
        /*答案赋值*/
        var true_keys = $('p.true_key');

        for (var i=0; i<true_keys.length; i++) {
            var num = true_keys[i].title;
            var type = $("[title='"+num+"']").parent('div').parent('div').attr('data-type');

            /*单选*/
            if (type == 1) {
                var key = true_keys[i].innerHTML;
                $("[title='"+num+"']").parent('div').parent('div').find("[title='"+key+"']").attr('checked', true);
            } else if (type == 2) {
                var key = true_keys[i].innerHTML;
                var keys = key.split('');

                for (var i=0; i<keys.length; i++) {
                    $("[title='"+num+"']").parent('div').parent('div').find("[title='"+keys[i]+"']").attr('checked', true);
                }
            } else if (type == 4) {
                var key = true_keys[i].innerHTML;

                if (key == 1) {
                    $("[name='judge']").first().attr('checked', true);
                } else {
                    $("[name='judge']").last().attr('checked', true);
                }
            } else if (type == 3) {
                alert(type)
            }
            /*单选,多选,判断select初始化*/
            var score = $("[title='"+num+"']").parent('div').parent('div').find("input[name='score']").attr('value');
            $("[title='"+num+"']").parent('div').parent('div').find("select[name='score']").val(score);

            var difficulty = $("[title='"+num+"']").parent('div').parent('div').find("input[name='difficulty']").attr('value');
            $("[title='"+num+"']").parent('div').parent('div').find("select[name='difficulty']").val(difficulty);

        }

        /*填空题select初始化*/
        var score = $("#fill_text").parent('p').parent('div').parent('div').find("input[name='score']").attr('value');
        $("#fill_text").parent('p').parent('div').parent('div').find('select').val(score);

    });

    /*单选,点击选项,改变答案标签的值*/
    $("[type='radio']").click(function () {
        var key = $(this).attr('title');
        $(this).parent('label').parent('div').parent('div').find('p.true_key').html(key);
    });

    /*多选.点击选项,改变答案标签的值*/
    $("[type='checkbox']").click(function () {
        var key = $(this).attr('title');
        var keys = $(this).parent('label').parent('div').parent('div').find('p.true_key').text();

        /*如果为选中状态,点击后去除答案*/
        if (!$(this).is(":checked")) {
            keys = keys.replace(key, '');
            $(this).parent('label').parent('div').parent('div').find('p.true_key').html(keys);

        } else {
            /*如果不是选中状态,则点击后添加答案*/
            keys+=key;

            /*排序*/
            var temp = keys.split('');
            for (var y=0; y<temp.length; y++) {
                for (var j=y+1; j<temp.length; j++) {
                    if (temp[y] > temp[j]) {
                        var t = temp[y];
                        temp[y] = temp[j];
                        temp[j] = t;
                    }
                }
            }
            var v='';
            for (var i=0; i<temp.length; i++) {
                v+=temp[i];
            }

            $(this).parent('label').parent('div').parent('div').find('p.true_key').html(v);
        }
    });

    /*初始化ckeditor*/
    var textareas = $("textarea");
    for (var i=0; i < textareas.length; i++) {
        CKEDITOR.replace(textareas[i].id);
    }

    /*更新题目内容*/
    function updateQuestion(id) {
        var type = $("#"+id).parent('div').parent('div').parent('div').attr('data-type');
        var title = $("#"+id).parent('div').parent('div').parent('div').find('h4').find('input').val();/*attr('value')*/;
        var resolution = CKEDITOR.instances[id].getData();
        var score = $("#"+id).parent('div').parent('div').parent('div').find("select[name='score']").val();
        var difficulty = $("#"+id).parent('div').parent('div').parent('div').find("select[name='difficulty']").val();
        var trueKey = $("#"+id).parent('div').parent('div').find('p.true_key').text();
        /*当为选择题更新*/
        if (type == 1 || type == 2) {


            /*获取选项内容*/
            var options = $("#"+id).parent('div').parent('div').parent('div').find('input.choicetxt');
            var keys_json = {};
            for (var i=0; i<options.length; i++) {
                keys_json[i+1] = options[i].value;
            }

            $.ajax({
                url:'${pageContext.request.contextPath}/teacher/exam/optionQuestion/update/'+id,
                type:'post',
                dataType:'json',
                data:{exam_difficulty_id:difficulty, type_id:type, id:id, trueKey:trueKey, resolution:resolution, title:title, keys_json:JSON.stringify(keys_json), score:score},
                error: function () {
                    alert('error')
                },
                success: function () {
                    alert('success')
                }
            });
        } else if (type == 3) {
            trueKey = $("#fill_text").val();
            $.ajax({
                url:'${pageContext.request.contextPath}/teacher/exam/noOptionQuestion/update/'+id,
                type:'post',
                dataType:'json',
                data:{trueKey:trueKey, resolution:resolution, title:title, score:score, exam_difficulty_id:difficulty},
                error: function () {
                    alert('error')
                },
                success: function () {
                    alert('success')
                }
            })
        } else if (type == 4) {
            $.ajax({
                url:'${pageContext.request.contextPath}/teacher/exam/noOptionQuestion/update/'+id,
                type:'post',
                dataType:'json',
                data:{trueKey:trueKey, resolution:resolution, title:title, score:score, exam_difficulty_id:difficulty },
                error: function () {
                    alert('error')
                },
                success: function () {
                    alert('success')
                }
            })
        }
    }

    /*设置select的值*/
/*    function getScore(v) {
        $("select[name='"+v.name+"']").attr('name', v.value)
    }*/
</script>
</body>
</html>