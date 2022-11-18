# Лабораторна робота **№4** (Операційні системи)
<br>

## Виконав студент **3** курсу **ІПЗ 1.2** - **Костюк Д.В**
<br>

## **Тема:** Terraform.
<br>

### **Завдання:**
![screenshot](/assets/Screenshot_0.png)

### **Хід роботи:**
1) Установив Terraform на комп'ютер. Зареєструвався на AWS, де створив користувача, отримавши `access_key` i `secret_key` для того, щоб зв'язати **AWS** із **Terraform**.

<br>

![screenshot](/assets/Screenshot_1.png)

<br>

Після чого, створюю файл `config.tf`, де прописую провайдера (зв'язую **Terraform** з **AWS**) та створюю ресурс на основі образу Linux, який за допомогою **Terraform** буде розміщено та запущено на **AWS**.

![screenshot](/assets/Screenshot_2.png)

<br>

Далі прописую команду `terraform init` для деплоя ресурсу на **AWS**.

![screenshot](/assets/Screenshot_3.png)

<br>

Продивляюсь через команду `terraform plan`, те що буде зроблено під час виконання команди `terraform apply`.

![screenshot](/assets/Screenshot_4.png)

<br>

Запускаю команду `terraform apply`, щоб розмістити та запустити ресурс на **AWS**.

![screenshot](/assets/Screenshot_5.png)

<br>

Результат:


![screenshot](/assets/Screenshot_7.png)

<br>

2) Налаштував мережевий інтерфейс за допомогою `aws_security_group`, де встановив вхідний трафік через **http** та **https**.

![screenshot](/assets/Screenshot_8.png)

<br>

Результат:

![screenshot](/assets/Screenshot_9.png)

<br>

3) Генерую SSH-ключ (публічний і приватний) для ресурсу командою ```ssh-keygen```


Після чого, створив ресурс, який міститиме ключ для головного інстенса.

![screenshot](/assets/Screenshot_11.png)

Повертаюся до головного інстенса і вказую щойно створений публічний SSH ключ.

![screenshot](/assets/Screenshot_12.png)


Увійшов до віддаленої системи за допомогою приватного SSH-ключа за командою: `ssh -i "my_key.pem" ubuntu@ec2-3-126-103-52.eu-central-1.compute.amazonaws.com`

![screenshot](/assets/Screenshot_13.png)

<br>

Далі на віртуальній машині прописую наступні команди (оновлюю Firewall та встановлюю Apache HTTP Server).

`sudo apt-get update`<br>
`sudo apt-get install -y apache2`<br>
`sudo systemctl start apache2`<br>
`sudo systemctl enable apache2`<br>
`echo "<h1>AWS Virtual Machine deployed with Terraform</h1></br><h2>Artem Mahey IPZ 2-1</h2>" | sudo tee /var/www/html/index.html`<br>

Переходжу за посиланням: `http://3.126.103.52/`

![screenshot](/assets/Screenshot_14.png)



<br>

**Висновки:**
Ознайомився з **Terraform** та **AWS**. Навчився створювати та розміщувати ресурси на AWS.
