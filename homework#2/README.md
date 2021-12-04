### Подготовка к выполнению задания 

- Добавил дополнительный диск размером 10 Гб, с динамическим размером памяти

<img src="https://user-images.githubusercontent.com/44056222/144691388-8f55111c-3374-41a3-a739-e7f88dab3800.png" width="600" />

### Файловые системы:

- Проверяем файл-устройство, которое соответствует добавленному диску:

<img src="https://sun9-57.userapi.com/impg/T-gsPfcekdX4ZvPdJ8bc2_K-CUHM66zLoY_oMA/TCFtAhjBi5o.jpg?size=835x220&quality=96&sign=ee10874a7cc8dae6f0f7f5285415fe18&type=album" width="600" />

- С помощью команды `fdisk -l` просмотрел все диски, нашел нужный

<img src="https://sun9-37.userapi.com/impg/OZGf1oiDoovyXC2a9nT8jfM9ldCiVoJ1-goPGw/9Is8SLS2Iig.jpg?size=529x102&quality=96&sign=1072c655f4e23da4d6758d0c85fa2b86&type=album" width="600" />

- C помощью команды `fdisk` разобьем диск на разделы:

```
- fdisk /dev/sdb
- n - создаем новый раздел
- p - выбираем основной тип разделения, выбираем Linux (1)
- Указываем начальные сектора
- +7G и +3G - конечные сектора
```

<img src="https://sun9-9.userapi.com/impg/mjlGY5i4P1GUpn01R_9q4PQ6WC5LVg_UxsJFYw/PmFwnTIUT_Y.jpg?size=795x437&quality=96&sign=9708457c086209e906fa69019c0e35f5&type=album" width="600" />

- Проверка

<img src="https://sun9-74.userapi.com/impg/qq4Kjg_TB8BO_PVjdXJLrM5rl37oyctNl-o5iQ/fYhVY7hR2n4.jpg?size=472x96&quality=96&sign=711459939de50e385fb6453df11d6103&type=album" width="600" />

- Создадим файловую систему с помощью утилиты `mkfs`

<img src="https://sun9-17.userapi.com/impg/vTGRtRHlpUpSpGdysYoDHD1O12JYjHsjjVzD0w/9OWtXWWrp1w.jpg?size=571x425&quality=96&sign=41763ac71ca0f7c899b13c591e2dac1d&type=album" width="600" />

- Создадим точку монтирования для каждого раздела

```
mkdir /srv/docs
mkdir /media/work
```

Изменим права доступа к разделам:

```
chmod -R 660 /srv/docs
chmod -R 660 /media/work
```

Для автоматического монтирования разделов после перезагрузки сервера обновим `/etc/fstab`

<img src="https://sun9-52.userapi.com/impg/6rQyk8pXmpKikmh1nHOIESW2hGiLs44LVnRPrw/yNSAy7Cm4J0.jpg?size=618x267&quality=96&sign=8f713a688bddb73544cd1866c69e3f2b&type=album" width="600" />

- С помощью команды `mount` монтируем разделы

<img src="https://sun9-41.userapi.com/impg/Ld_n0lFwDTfYTuHuoyicOl8iXS_bX5UrLnEG7Q/C-zyNh0uvjQ.jpg?size=770x73&quality=96&sign=2d1c9e461b5247dc59e1500ae3fc94cd&type=album" width="600" />

### Пользователи и группы:

- Добавим три группы с помощью `addgroup`

<img src="https://sun9-75.userapi.com/impg/sd2d4dS9K_g1_6ctHGURy4De8r9ajGKmSsEDMg/9FG4405s5iM.jpg?size=416x250&quality=96&sign=4b2c08942666fa003520db632b419540&type=album" width="600" />

- Создадим пользователей с помощью команды `adduser -gid GROUP_ID USERNAME`

<img src="https://sun9-27.userapi.com/impg/8ThGrNy1JENpQan_cBPCOZL2RW7EE5MnivdG2Q/c41IX_gsDmg.jpg?size=443x267&quality=96&sign=782abc4f5fe49a6b8d129481f99699cb&type=album" width="600" />

### Директории и файлы

- Cоздадим поддиректории в `srv/docs`

<img src="https://sun9-65.userapi.com/impg/CdXrtfhlWR9fTJ_wPEIQYiTBjA6hbIvlG6KC-Q/TvrN56CFuzo.jpg?size=419x99&quality=96&sign=9c1216cc9623bccbabc747fd2c05e7ae&type=album" width="600" />

- Сменим владельцев и группу у поддиректорий c помощью команды `sudo chown NAME:GROUP_NAME FOLDER_NAME`

<img src="https://sun9-87.userapi.com/impg/NuYNj-GOXNbMiPcdTNumSQVdoLvVXGa_JNCXgw/xJ9bGn4yA5U.jpg?size=540x67&quality=96&sign=8c1bce0a8bd9e80fdab8d01a28e13b80&type=album" width="600" />

- Установим права доступа к поддиректориям

```
sudo chmod 775 manuals
sudo chmod g+s manuals
sudo chmod 770 reports
sudo chmod g+s reports
sudo chmod 755 todo
```

- В результате

<img src="https://sun9-79.userapi.com/impg/CCvhZrWMg2oRhwp8ZI5C594UwN5zqAVKvLXR7w/683Ta2z_tKw.jpg?size=492x114&quality=96&sign=b3c40c34a7ad8459bb1a379a0fa73ff7&type=album" width="600" />

- Повторим в директории `/media/work`

<img src="https://sun9-72.userapi.com/impg/IqaUbRsnWZH2ejJhni0x8cNBZ4FCEoz168Z6eA/Mh_nN4bzndQ.jpg?size=547x364&quality=96&sign=61dda0f4fb5e090c858de5b45d181156&type=album" width="600" />

- Создадим мягкие ссылки

<img src="https://sun9-73.userapi.com/impg/2STkf3kl5Hbw5T5fgHdK7lGnAaw1jOvKhEq4kg/LTWRz8Iu8fk.jpg?size=633x85&quality=96&sign=e7206a14dc0e94a23684c54b810a3632&type=album" width="600" />
