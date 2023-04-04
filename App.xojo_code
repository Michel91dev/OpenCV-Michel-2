#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Note, Name = A FAIRE
		https://forum.xojo.com/t/opencv-and-xojo-or-alternatives/58077/38
		En avril 2021 (faire défiler), Perry Paolantonio explique comment il a compilé OpenCV pour Xojo
		
		
		2023 0319 Faire une fenêtre (ou une class) qui montre un frame
		Mais regarder dans OpenCV si cela n'existe pas déjà !!
		
		
		--
		
		https://forum.xojo.com/t/ptr-value/29923
		It is possible to know the value of a Ptr. “A 4-byte pointer to a chunk of memory.”
		  🧑🏼‍💻 V = ptr.int32(0) is enough.  ⚠️ Voir commentaire ci-dessous pour 64 bits
		Thanks Christian. I thought I needed the value, but you are right: I need the address value.
		
		⚠️‼️ Also it’s worth noting that on 64-Bit a Ptr is 8-bytes.
		Double check and make sure that the value stored at the location is actually a int32, quite often it’s a integer and when you compile for 64-Bit you’ll get the wrong result. Also watch out for a Int32 and Uint32, two different results.
		
		@Sam : You’re right value depends on 32-or 64 bit. This is just a suggestion how to access data pointed by Ptr or MemoryBlock.
		▶️ Here is an example to access OpenCV IplImage values (32-bit version) via a pointed structure
		
		// ipl is a Ptr to an opecv Image
		//MemoryBlock can also used
		dim opencvImage as IplImage
		opencvImage.nSize=ipl.int32(0)
		opencvImage.ID=ipl.int32(4)
		opencvImage.nChannels=ipl.Int32(8)
		opencvImage.alphaChannel=ipl.int32(12)
		opencvImage.depth=ipl.int32(16)
		opencvImage.colorModel=chr(ipl.int8(20)) + chr(ipl.int8(21)) + chr(ipl.int8(22)) + chr(ipl.int8(23))
		opencvImage.channelSeq=chr(ipl.int8(24)) + chr(ipl.int8(25)) + chr(ipl.int8(26)) + chr(ipl.int8(27))
		opencvImage.dataOrder=ipl.int32(28)
		opencvImage.origin=ipl.int32(32)
		opencvImage.align=ipl.int32(36)
		opencvImage.width=ipl.int32(40)
		opencvImage.height=ipl.int32(44)
		opencvImage.roi=Ipl.Ptr(48)
		opencvImage.maskRoi=ipl.ptr(52)
		opencvImage.imageId=ipl.ptr(56)
		opencvImage.tileInfo=ipl.ptr(60)
		opencvImage.imageSize=ipl.Int32(64)
		opencvImage.imageData=ipl.ptr(68)
		opencvImage.widthStep=ipl.Int32(72)
		opencvImage.bm0=ipl.Int32(76)
		opencvImage.bm1=ipl.int32(80)
		opencvImage.bm2=ipl.int32(84)
		opencvImage.bm3=ipl.int32(88)
		opencvImage.cm0=ipl.int32(92)
		opencvImage.cm1=ipl.int32(96)
		opencvImage.cm2=ipl.int32(100)
		opencvImage.cm3=ipl.int32(104)
		opencvImage.imageDataOrigin=ipl.Ptr(108)
		return opencvimage
		
		Best regards
		
		
		
		--
		
		
		
		Perry Paolantonio
		Pro
		Apr 2021
		It sounds like our needs are pretty similar. We’re doing some pattern matching and then alignment of frames based on that pattern, some color space conversions,
		channel merging into RGB images, scaling, and possibly some stuff like generating histograms. Some of this could be done in Xojo or various plugins, but I’d like to try
		to do as much as possible in OpenCV, as it makes testing (with simple python scripts outside of Xojo) much easier, and makes things a bit more portable later
		on should we need to re-use it in something non-xojo.
		
		
		--
	#tag EndNote

	#tag Note, Name = A LIRE GENERAL
		REGLES :
		🚧 va être utiliser pour ne pas oublier de nettoyer ou regarder ou corriger (je peux aussi mettre un Bookmark
		
		
		2023 0306 ⚠️ il faut préciser  dans les options de Build Settings que "This Computer" est
		x86 64bits (donc INTEL) car la Bibliothèque "libOpenCVC.dylib" telle que téléchargée en ce moment
		ne semble pas être pompilée pour du ARM M1/M2 ⚠️
		
		Je change donc les options de build tant que la bibliothèque "libOpenCVC.dylib"
		 n'existera pas en version M2 (donc ARM)
		
		
		▶️ Dans iGen il est raconté que Microsoft a licencié de nombreux developpeurs de Visual Studio sur
		Mac. Ceci n'aurgure rien de bon pour cet environnement qui est pourtant très bien et rapide.◀️
		
		
		2023 0305
		Je prends conscience que le code figure dans les codes externe, ce que je trouve bien
		A l'avenir je continuera à programmer de la sorte car le code est tout ensemble dans un même fichier
		
		Pour cela, IL FAUT SAUVER LE PROJET EN "XOJO PROJECT" et non pas en Binary Project
		
		Oui,  ce jour je découvre que je peux avoir mon code XOJO en externe plutôt que dans le projet.
		 C'est-à-dire que c'est un fichier externe qui contient le code que je te tape.
		Dans le cas de OpenCV, c'est ce qui était proposé et que je vais continuer à utiliser.
		
		Pour les identifier, je mets deux pastilles de couleur orange et bleu en même temps.
		
		En pratique cela veut dire que quand je vais fait un backup de ma version des fichiers,
		 ce n'est pas le projet Xojo que je dois zipper et renommer avec des versions qui évoluent,
		  mais les codes. J'ai aussi changé le l'éditeur par défaut,
		   en prenant Microsoft Visual Studio. Visual Studio, un moyen de présenter le code en BASIC,
		    et les mots-clés sont mieux mis en évidence, même si ce n'est pas tout à fait Xojo.
		Cela permet à GitHub de fonctionner et de montrer les différentes évolutions du code pour
		 chaque "Comit" de GitHub.
		
		Le problème quand même reste que si je fais des modifications de code dans Visual Studio alors
		que Xojo est ouvert, le code dans Xojo ne se met pas à jour (sauf à recharge le projet)
		 et CA C'EST UN GROS PB - CA C'EST UN GROS PB - CA C'EST UN GROS PB - CA C'EST UN GROS PB
		Qui fait que je vais pas modifier le code dans Visual Studio comme je l'avais initialement
		envisagé.
		
		J'ai fait un README "A LIRE MICHEL XOJO"
		
		2023 0305 Je créer un Repository (privé) sur GitHub ce jour. J'avais déjà un compte toutefois.
		J'élimine les modifications de .DStore dans GitHub
		
		___
		
		
		
	#tag EndNote

	#tag Note, Name = FONCTIONS OpenCV (la version C++ originale)
		https://docs.opencv.org/4.x/d8/dfe/classcv_1_1VideoCapture.html#a57c0e81e83e60f36c83027dc2a188e80
		
		
		
		⚠️ ATTENTION il ne s'agit pas de la bibliothèque compilée pour XOJO mais de la version en C++ originale, mais je trouve intérerssant
		de savoir ce qui est possible car les paramètres ne passent pas dans la version originale de Terry pour XOJO
		Or si je modifie l'API dans xCODE je peux (en principe) étendre les capacité
		
		Opens a video file or a capturing device or an IP video stream for video capturing with API Preference.
		
		This is an overloaded member function, provided for convenience. It differs from the above function only in what argument(s) it accepts.
		
		Parameters
		    filename    it can be:
		
		        name of video file (eg. video.avi)
		    ⚠️    or image sequence (eg. img_%02d.jpg, which will read samples like img_00.jpg, img_01.jpg, img_02.jpg, ...)
		    ⚠️    or URL of video stream (eg. protocol://host:port/script_name?script_params|auth)
		             or GStreamer pipeline string in gst-launch tool format in case if GStreamer is used as backend Note that each video stream
		    ⚠️   or IP camera feed has its own URL scheme. Please refer to the documentation of source stream to know the right URL.
		
		    apiPreference    preferred Capture API backends to use. Can be used to enforce a specific reader implementation if multiple are available: e.g. cv::CAP_FFMPEG or cv::CAP_IMAGES or cv::CAP_DSHOW.
		
		
		▶️ chercher "External methods" dans la doc (aide) de Xojo pour comprendre les paramètres, si besoin
	#tag EndNote

	#tag Note, Name = Modifs de Code
		2023 0402 Aujourd'hui j'ai pu recompiler la libOpenCVC.dylib sur xCODE !
		J'ai ajouter le paramètre de caméra dedans mais aussi dans xCODE mais à ce stade
		cela ne marcher pas encore :(
		
		
		2023 0311 Après avoir implémenté les raccourcis clavier, je note sans vouloir le corriger qu'il y a un petit
		Artefact avec le + et - (et le slide zoom) qui repassent obligatoirement par l'image initiale.
		En clair les effets ne se cumulent pas mais dans le cas du egde le déplacement déplace bien l'image avec Edge
		car en fait les effet sont tous "refait" dans la Method m_Contours (Canny Hedge Detection)
		
		2023 0309
		Je revois les bouton un par un car ils sont difficles à comprendre et sans aucun effort du dev pour aider à comprendre le code
		C'est incroyable le peu d'effort de documentation. En fait inexistant et décourageant.
		
		Je split le Bouton Canny ( https://docs.opencv.org/4.x/da/d22/tutorial_py_canny.html ) en  2 boutons "Gris" et "Edge Detect" avec un petit code simple
		et plus didactique
		
		▶️ Il faudra que je crée la Globale reference2 au lieu de la créer dans chaque bouton, le code serait plus lisible
		▶️ Faire en sorte qu'on puisse choisir l'image au lieu que ce soit l'image hard-codée
		
		2023 0305
		J'ai éliminé le code long à executer dont je ne voyais pas l'intérêt qui parse tout le dossier "images" et qui en fait une liste
		dans un Dictionnary.
		J'ai mis ce code pour ne pas le perdre dans une méthode de Window1 qui j'ai nommée "faitListeDeFichiers"
		▶️ Je verrai si elle m'est utile pour la suite ou pas car elle est très optimisée et interessante à analyser !
		
		2023 0306 je renomme l'appli en enlevant la notion de version dans le nom, qui n'a pas de
		sens avec l'usage de GitHub
	#tag EndNote


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoQuit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowHiDPI"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Copyright"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastWindowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NonReleaseVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_CurrentEventTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
