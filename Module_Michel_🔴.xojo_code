#tag Module
Protected Module Module_Michel_🔴
	#tag Method, Flags = &h0
		Sub MonDebugLog(aStr As String)
		  //An alternative (and better) technique is to write messages to the Message Log,
		  // which is a panel that is displayed at the bottom of the Xojo Workspace. 
		  
		  // ⚠️ On macOS, it logs to the Console qui est l'icone en bas du débugger à droite (comme un petit radar)
		  
		  System.DebugLog(aStr) 
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MonMemoryBlock()
		  // 2023 0320  Code de test à ce stade 
		  // A MemoryBlock object allocates a sequence of bytes in memory and manipulates those bytes directly. A MemoryBlock can be passed in place of a Ptr when used in a Declare call. For times when you need to directly manage a block of data in its raw (byte) form, you will need to use a MemoryBlock. When reviewing the API for creating Declare statements, you will find that some parameters require a pointer to a chuck of data. You can set up a memory block as the location for this data.
		  
		  Var s As String = "Hello!"
		  Var mb As MemoryBlock
		  mb = s
		  System.DebugLog (mb.StringValue (0, mb.Size) )
		  
		End Sub
	#tag EndMethod


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
End Module
#tag EndModule
