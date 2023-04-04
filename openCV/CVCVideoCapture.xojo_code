#tag Class
Protected Class CVCVideoCapture
	#tag Method, Flags = &h0
		Sub Constructor(h as Ptr)
		  // 🔴 était privée et je l'ai mis en Public - il faudrait peut-être que je remette en privé ...
		  
		  mHandle=h // Affecte le prt à mHandle (properties de l'objet)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create(camNo As Integer) As CVCVideoCapture
		  Var h As Ptr = CVCVideoCaptureCreate(camNo) // ⚠️ numCam ajouté par Michel 2023 0402 
		  If h<>Nil Then
		    // donc si le pointeur actuel de CVCVideoCaptureCreate n'est pas nul on créer un nouveau CVCVideoCapture avec le ptr en paramètre
		    Return New CVCVideoCapture(h) 
		  End If
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function CVCVideoCaptureCreate Lib LibOpenCVC (webcamNumber As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Sub CVCVideoCaptureFree Lib LibOpenCVC (h as Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function CVCVideoCaptureIsOpened Lib LibOpenCVC (h as Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function CVCVideoCaptureRead Lib LibOpenCVC (h as Ptr, mat as Ptr) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  CVCVideoCaptureFree(mHandle) // pour détruire 
		  mHandle=Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isOpened() As Boolean
		  Return CVCVideoCaptureIsOpened(mHandle)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function read(mat as CVCMat) As Boolean
		  Return CVCVideoCaptureRead(mHandle, mat.handle)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		mHandle As Ptr
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
