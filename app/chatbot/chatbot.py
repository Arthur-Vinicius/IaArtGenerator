from chatterbot import ChatBot
from chatterbot.trainers import ListTrainer

chatbot = ChatBot("Bob")

conversa=[
    "Olá",
    "Oi, tudo bem?",
    "Tudo sim e com voce?",
    "Estou sim",
    "Que bom",
    "O que está fazendo?",
    "Estudando e voce?",
    "Estou de bobeira",
    "Legal!",
    "Oi",    
]

trainer = ListTrainer
trainer.train(conversa)