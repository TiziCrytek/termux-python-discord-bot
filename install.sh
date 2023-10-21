clear
echo -e "[>] \033[32mInstall Python..\033[0m"
sleep 1
pkg install python -y

clear
echo -e "[>] \033[32mInstall Libraries..\033[0m"
sleep 1
pip install nextcord
pip install setuptools

clear
echo -e "[>] \033[32mCreating a Bot folder..\033[0m"
mkdir ~/storage/shared/Bot

sleep 1
clear
BOT_TOKEN=$1
if [ -n "$BOT_TOKEN" ]; then
    echo "Skip"
else
    read -p "Enter your bot token: " BOT_TOKEN
fi

echo -e "[>] \033[32mCreating a file main.py..\033[0m"
sleep 1

echo "import nextcord
from nextcord.ext import commands

intents = nextcord.Intents.default()
intents.message_content = True  # Включаем интент для message_content

bot = commands.Bot(command_prefix='!', intents=intents)

@bot.event
async def on_ready():
    print(f'Бот {bot.user.name} подключен к Discord!')

@bot.command()
async def hi(ctx):
    await ctx.send(f'Привет, {ctx.author.mention}!')

bot.run('$BOT_TOKEN')" > ~/storage/shared/Bot/main.py
clear
echo -e "[>] \033[32mFile created\033[0m"
echo -e "[>] \033[32mLaunching the bot..\033[0m"

echo -e "\033[32mПроверка бота:\033[0m"
echo -e "Пригласите бота на ваш сервер, после чего пропишите команду \033[35m!hi\033[0m"

python ~/storage/shared/Bot/main.py


