namespace Terrasoft.Core.Process
{

	using System;
	using System.Collections.Generic;
	using System.Collections.ObjectModel;
	using System.Drawing;
	using System.Globalization;
	using System.Text;
	using Terrasoft.Common;
	using Terrasoft.Core;
	using Terrasoft.Core.Configuration;
	using Terrasoft.Core.DB;
	using Terrasoft.Core.Entities;
	using Terrasoft.Core.Process;
	using Terrasoft.Core.Process.Configuration;

	#region Class: UsrProcess_79c30dfUsrRealty2MethodsWrapper

	/// <exclude/>
	public class UsrProcess_79c30dfUsrRealty2MethodsWrapper : ProcessModel
	{

		public UsrProcess_79c30dfUsrRealty2MethodsWrapper(Process process)
			: base(process) {
			AddScriptTaskMethod("ScriptTask1Execute", ScriptTask1Execute);
		}

		#region Methods: Private

		private bool ScriptTask1Execute(ProcessExecutingContext context) {
			// Step 1: Get input parameter
			Guid realtyId = Get<Guid>("RealtyIdParameter");
			
			// Step 2: Get the schema manager and the RealtyVisit entity
			var schema = UserConnection.EntitySchemaManager.GetInstanceByName("UsrRealtyVisit");
			
			// Step 3: Set starting visit date (next day)
			DateTime visitDate = DateTime.Now.AddDays(1);
			
			if (realtyId == Guid.Empty) {
			    throw new Exception("RealtyIdParameter is missing or invalid.");
			}
			
			
			for (int i = 0; i < 3; i++) {
			    var visitEntity = schema.CreateEntity(UserConnection);
			    visitEntity.SetDefColumnValues();
			    visitEntity.SetColumnValue("UsrRealtyParentId", realtyId);       
			    visitEntity.SetColumnValue("UsrVisitDateTime", visitDate);       
			    visitEntity.Save();
			
			    // Prepare date for next record
			    visitDate = visitDate.AddDays(1);
			}
			
			
			return true;
		}

		#endregion

	}

	#endregion

}

