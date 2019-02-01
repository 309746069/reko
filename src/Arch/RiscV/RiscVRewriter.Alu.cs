#region License
/* 
 * Copyright (C) 1999-2019 John Källén.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; see the file COPYING.  If not, write to
 * the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
 */
#endregion

using Reko.Core.Expressions;
using Reko.Core.Machine;
using Reko.Core.Types;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Reko.Arch.RiscV
{
    public partial class RiscVRewriter
    {
        private void RewriteAdd(PrimitiveType dtDst = null)
        {
            var src1 = RewriteOp(instr.op2);
            var src2 = RewriteOp(instr.op3);
            var dst = RewriteOp(instr.op1);
            RewriteAdd(dst, src1, src2, dtDst);
        }

        private void RewriteAdd(Expression dst, Expression src1, Expression src2, PrimitiveType dtDst = null)
        { 
            Expression src;
            if (src1.IsZero)
            {
               src = src2;
            }
            else if (src2.IsZero)
            {
                src = src1;
            }
            else
            {
                src = m.IAdd(src1, src2);
            }
            MaybeSignExtend(dst, src, dtDst);
        }

        private void RewriteAddi16sp()
        {
            var dst = binder.EnsureRegister(arch.StackRegister);
            var imm = ((ImmediateOperand) instr.op1).Value.ToInt32();
            m.Assign(dst, m.IAddS(dst, imm));
        }

        private void RewriteAddi4spn()
        {
            var src = binder.EnsureRegister(arch.StackRegister);
            var imm = ((ImmediateOperand) instr.op2).Value.ToInt32();
            var dst = RewriteOp(instr.op1);
            m.Assign(dst, m.IAddS(src, imm));
        }

        private void RewriteAddw()
        {
            var dst = RewriteOp(instr.op1);
            var src1 = RewriteOp(instr.op2);
            Expression src2;
            if (instr.op3 is ImmediateOperand imm2)
            {
                src2 = Constant.Int32(imm2.Value.ToInt32());
            }
            else
            {
                src2 = RewriteOp(instr.op3);
            }

            Expression src;
            if (src1.IsZero)
            {
                src = src2;
            }
            else if (src2.IsZero)
            {
                src = m.Cast(PrimitiveType.Word32, src1);
            }
            else
            {
                src = m.IAdd(m.Cast(PrimitiveType.Word32, src1), src2);
            }
            m.Assign(dst, m.Cast(PrimitiveType.Int64, src));
        }

        private void RewriteBinOp(Func<Expression,Expression, Expression> op, PrimitiveType dtDst = null)
        {
            var src1 = RewriteOp(instr.op2);
            var src2 = RewriteOp(instr.op3);
            var dst = RewriteOp(instr.op1);
            MaybeSignExtend(dst, op(src1, src2), dtDst);
        }

        private void RewriteCompressedAdd(PrimitiveType dtDst = null)
        {
            var src1 = RewriteOp(instr.op2);
            var dst = RewriteOp(instr.op1);
            RewriteAdd(dst, dst, src1, dtDst);
        }

        private void RewriteCompressedBinOp(Func<Expression, Expression, Expression> op, PrimitiveType dtDst = null)
        {
            var src1 = RewriteOp(instr.op2);
            var dst = RewriteOp(instr.op1);
            var val = op(dst, src1);
            MaybeSignExtend(dst, val, dtDst);
        }

        private void RewriteLi()
        {
            var src = RewriteOp(instr.op2);
            var dst = RewriteOp(instr.op1);
            m.Assign(dst, src);
        }

        private void RewriteLoad(DataType dt)
        {
            var dst = RewriteOp(instr.op1);
            Expression ea;
            if (instr.op2 is MemoryOperand mem)
            {
                var baseReg = binder.EnsureRegister(mem.Base);
                ea = baseReg;
                if (mem.Offset != 0)
                {
                    ea = m.IAddS(ea, mem.Offset);
                }
            }
            else
            {
                var baseReg = RewriteOp(instr.op2);
                var offset = ((ImmediateOperand) instr.op3).Value;
                ea = baseReg;
                if (!offset.IsZero)
                {
                    ea = m.IAdd(ea, offset);
                }
            }
            Expression src = m.Mem(dt, ea);
            if (dst.DataType.Size != src.DataType.Size)
            {
                src = m.Cast(arch.NaturalSignedInteger, src);
            }
            m.Assign(dst, src);
        }

        private void RewriteLxsp(DataType dt)
        {
            var dst = RewriteOp(instr.op1);
            var imm = ((ImmediateOperand) instr.op2).Value.ToInt32();
            Expression ea = binder.EnsureRegister(arch.StackRegister);
            if (imm != 0)
                ea = m.IAddS(ea, imm);
            Expression src = m.Mem(dt, ea);
            if (dt.BitSize < dst.DataType.BitSize)
            {
                src = m.Cast(arch.NaturalSignedInteger, src);
            }
            m.Assign(dst, src);
        }

        private void RewriteLui()
        {
            var dst = RewriteOp(instr.op1);
            var ui = ((ImmediateOperand)instr.op2).Value;
            m.Assign(dst, Constant.Word(dst.DataType.BitSize, ui.ToUInt32() << 12));
        }

        private void RewriteCompressedMv()
        {
            var src = RewriteOp(instr.op2);
            var dst = RewriteOp(instr.op1);
            m.Assign(dst, src);
        }

        private void RewriteOr()
        {
            var dst = RewriteOp(instr.op1);
            var left = RewriteOp(instr.op2);
            var right = RewriteOp(instr.op3);
            var src = left;
            if (!right.IsZero)
            {
                src = m.Or(src, right);
            }
            m.Assign(dst, src);
        }

        private void RewriteShift(Func<Expression, Expression, Expression> fn)
        {
            var dst = RewriteOp(instr.op1);
            var left = RewriteOp(instr.op2);
            var right = RewriteOp(instr.op3);
            m.Assign(dst, fn(left, right));
        }

        private void RewriteShiftw(Func<Expression, Expression, Expression> fn)
        {
            var dst = RewriteOp(instr.op1);
            var left = RewriteOp(instr.op2);
            var right = RewriteOp(instr.op3);
            var src = m.Cast(PrimitiveType.Word32, fn(left, right));
            m.Assign(dst, m.Cast(PrimitiveType.Int64, src));
        }

        private void RewriteSlt(bool unsigned)
        {
            var left = RewriteOp(instr.op2);
            var right = RewriteOp(instr.op3);
            var dst = RewriteOp(instr.op1);
            Expression src;
            if (unsigned)
            {
                if (left.IsZero)
                {
                    src = m.Ne0(right);
                }
                else
                {
                    src = m.Ult(left, right);
                }
            }
            else
            {
                src = m.Lt(left, right);
            }
            m.Assign(dst, m.Cast(arch.WordWidth, src));
        }

        private void RewriteSlti(bool unsigned)
        {
            var left = RewriteOp(instr.op2);
            var right = RewriteOp(instr.op3);
            var dst = RewriteOp(instr.op1);
            Expression src;
            if (unsigned)
            {
                src = m.Ult(left, right);
            }
            else
            {
                src = m.Lt(left, right);
            }
            m.Assign(dst, m.Cast(arch.WordWidth, src));
        }

        private void RewriteStore(DataType dt)
        {
            var src = RewriteOp(instr.op1);
            if (instr.op2 is MemoryOperand mem)
            {
                RewriteStore(dt, binder.EnsureRegister(mem.Base), mem.Offset, src);
            }
            else
            {
                var baseReg = RewriteOp(instr.op2);
                var offset = ((ImmediateOperand) instr.op3).Value.ToInt32();
                RewriteStore(dt, baseReg, offset, src);
            }
        }

        private void RewriteStore(DataType dt, Expression baseReg, int offset, Expression src)
        {
            Expression ea = baseReg;
            if (offset != 0)
            {
                ea = m.IAddS(ea, offset);
            }
            if (src.DataType.BitSize > dt.BitSize)
            {
                src = m.Cast(dt, src);
            }
            m.Assign(m.Mem(dt, ea), src);
        }

        private void RewriteSxsp(DataType dt)
        {
            var src = RewriteOp(instr.op1);
            var baseReg = binder.EnsureRegister(arch.StackRegister);
            var offset = ((ImmediateOperand) instr.op2).Value.ToInt32();
            RewriteStore(dt, baseReg, offset, src);
        }

        private void RewriteSub()
        {
            var dst = RewriteOp(instr.op1);
            var left = RewriteOp(instr.op2);
            var right = RewriteOp(instr.op3);
            m.Assign(dst, m.ISub(left, right));
        }

        private void RewriteSubw()
        {
            var dst = RewriteOp(instr.op1);
            var left = RewriteOp(instr.op2);
            var right = RewriteOp(instr.op3);
            var src = left;
            if (!right.IsZero)
            {
                src = m.ISub(src, right);
            }
            m.Assign(dst, m.Cast(PrimitiveType.Int64, m.Cast(PrimitiveType.Word32, src)));
        }

        private void RewriteXor()
        {
            var dst = RewriteOp(instr.op1);
            var left = RewriteOp(instr.op2);
            var right = RewriteOp(instr.op3);
            var src = left;
            if (!right.IsZero)
            {
                src = m.Xor(src, right);
            }
            m.Assign(dst, src);
        }
    }
}
