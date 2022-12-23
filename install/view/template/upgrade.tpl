<?php echo $header; ?>
<div class="container">
  <header>
    <div class="row">
      <div class="col-sm-12"><img src="view/image/logo.png" alt="OpenCart" title="OpenCart" /></div>
    </div>
  </header>
  <h1>Обновление</h1>
  <div class="row">
    <div class="col-sm-9">
      <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <fieldset>
          <p><b>Внимательно следуйте пошаговой инструкции!</b></p>
          <ol>
			<li>О любых ошибках и проблемах при обновлении сообщите на форуме</li>
			<li>После обновления, удалите все куки в своем браузере, чтобы избежать ошибок с токенами.</li>
			<li>Перейдите в Административную часть и дважды нажмите на клавиатуре Ctrl+F5 для обновления закешированных CSS стилей.</li>
			<li>Перейдите в разделе Меню -> Система -> Пользователи -> Группы пользователей и для Главный администратор отметьте все чекбоксы.</li>
			<li>Перейдите в разделе Меню -> Система-> Настройки. Проверьте все значения настроек магазина и нажмите кнопку Сохранить даже если ничего не меняли.</li>
			<li>Перейдите в Витрину магазина и дважды нажмите Ctrl+F5 для обновления кешированных CSS стилей.</li>
          </ol>
        </fieldset>
        <div class="buttons">
          <div class="text-right">
            <input type="submit" value="Продолжить" class="button" />
          </div>
        </div>
      </form>
    </div>
    <div class="col-sm-3">
      <ul class="list-group">
        <li class="list-group-item"><b>Обновление</b></li>
        <li class="list-group-item">Завершено</li>
      </ul>
    </div>
  </div>
</div>
<?php echo $footer; ?>