﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace CSETWebCore.DataLayer.Model;

/// <summary>
/// A collection of REQUIRED_DOCUMENTATION_HEADERS records
/// </summary>
[Index("Requirement_Documentation_Header", Name = "IX_REQUIRED_DOCUMENTATION_HEADERS", IsUnique = true)]
public partial class REQUIRED_DOCUMENTATION_HEADERS
{
    [Key]
    public int RDH_Id { get; set; }

    [Required]
    [StringLength(250)]
    public string Requirement_Documentation_Header { get; set; }

    public int? Header_Order { get; set; }

    [InverseProperty("RDH")]
    public virtual ICollection<REQUIRED_DOCUMENTATION> REQUIRED_DOCUMENTATION { get; set; } = new List<REQUIRED_DOCUMENTATION>();
}