﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using GSharp.Base.Cores;
using GSharp.Graphic.Core;
using GSharp.Graphic.Holes;
using GSharp.Base.Statements;
using GSharp.Base.Methods;
using GSharp.Graphic.Objects;
using GSharp.Base.Objects;

namespace GSharp.Graphic.Statements
{
    /// <summary>
    /// ExtensionBlock.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class AddonStatementBlock : PrevStatementBlock, IAddonBlock
    {
        private List<BaseHole> holeList = new List<BaseHole>();

        public string Title
        {
            get
            {
                return _Title;
            }
            set
            {
                _Title = value;
            }
        }
        private string _Title;

        public string EXTName
        {
            get
            {
                return _EXTName;
            }
            set
            {
                _EXTName = value;
                holeList = AddonBlock.SetContent(_EXTName, Content);
            }
        }
        private string _EXTName;

        public string EXTMethod { get; set; }

        public AddonStatementBlock()
        {
            InitializeComponent();
        }

        public override NextConnectHole NextConnectHole
        {
            get
            {
                return RealNextConnectHole;
            }
        }

        public override StatementBlock GetLastBlock()
        {
            if (NextConnectHole.StatementBlock == null)
            {
                return this;
            }

            return NextConnectHole.StatementBlock.GetLastBlock();
        }

        public override List<BaseHole> GetHoleList()
        {
            List<BaseHole> baseHoleList = new List<BaseHole>();
            
            baseHoleList.Add(NextConnectHole);
            baseHoleList.AddRange(holeList);

            return baseHoleList;
        }

        public override List<GBase> ToObject()
        {
            List<GBase> baseList = new List<GBase>();

            GExtension extension = new GExtension
            {
                Name = EXTName,
                Method = EXTMethod
            };

            List<GObject> objectList = new List<GObject>();

            foreach (BaseHole hole in holeList)
            {
                if (hole.Block == null)
                {
                    throw new ToObjectException(EXTName + "블럭이 완성되지 않았습니다.", this);
                }

                if (hole is BaseObjectHole)
                {
                    objectList.Add((hole as BaseObjectHole).ObjBlock.ToObject()[0] as GObject);
                }
            }

            GCall call = new GCall(extension, objectList.ToArray());
            baseList.Add(call);

            List<GBase> nextList = NextConnectHole?.StatementBlock?.ToObject();
            if (nextList != null)
            {
                baseList.AddRange(nextList);
            }

            return baseList;
        }
    }
}