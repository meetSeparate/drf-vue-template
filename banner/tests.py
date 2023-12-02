from gradio_client import Client

client = Client("https://debd13bfd490170220.gradio.live/")
result = client.predict(
				"使用python写一个红黑树",   # str in 'parameter_6' Textbox component
				"./result.json",
				8192,	# int | float (numeric value between 0 and 32768)in 'Maximum length' Slider component
				0.8,	# int | float (numeric value between 0 and 1)in 'Top P' Slider component
				0.95,	# int | float (numeric value between 0 and 1)in 'Temperature' Slider component
				fn_index=0
)
print(result)