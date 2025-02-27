﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace CSETWebCore.DataLayer.Model;

public partial class MATURITY_EXTRA
{
    [Key]
    public int Maturity_Question_Id { get; set; }

    [StringLength(255)]
    public string NIST171_Title { get; set; }

    [StringLength(500)]
    public string Question_text { get; set; }

    public int? SPRSValue { get; set; }

    [Column("Comment for Guidance Field")]
    [StringLength(255)]
    public string Comment_for_Guidance_Field { get; set; }

    [StringLength(255)]
    public string CMMC1_Title { get; set; }

    [StringLength(100)]
    public string CMMC2_Title { get; set; }
}