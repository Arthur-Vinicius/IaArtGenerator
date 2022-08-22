from chatterbot import ChatBot
from chatterbot.trainers import ListTrainer

# isso aqui só precisa para corrigir o bug
from spacy.cli import download

download("en_core_web_sm")

class ENGSM:
    ISO_639_1 = 'en_core_web_sm'


chatbot = ChatBot("BotLira", tagger_language=ENGSM)

conversa = [
    
]

trainer = ListTrainer(chatbot)
trainer.train(conversa)

while True:
    mensagem = input("Mande uma mensagem para o chatbot:")
    if mensagem == "parar":
        break
    resposta = chatbot.get_response(mensagem)
    print(resposta)