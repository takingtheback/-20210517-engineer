"""empty message

Revision ID: 01b21d8cb11e
Revises: ccd831868f73
Create Date: 2021-09-09 19:34:34.109119

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '01b21d8cb11e'
down_revision = 'ccd831868f73'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('response',
    sa.Column('resnum', sa.Integer(), nullable=False),
    sa.Column('write', sa.String(length=20), nullable=False),
    sa.PrimaryKeyConstraint('resnum')
    )
    op.create_table('board',
    sa.Column('num', sa.Integer(), nullable=False),
    sa.Column('writer', sa.String(length=20), nullable=True),
    sa.Column('w_date', sa.DateTime(), nullable=False),
    sa.Column('title', sa.String(length=50), nullable=False),
    sa.Column('content', sa.String(length=200), nullable=False),
    sa.ForeignKeyConstraint(['writer'], ['member.id'], ondelete='CASCADE'),
    sa.PrimaryKeyConstraint('num')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('board')
    op.drop_table('response')
    # ### end Alembic commands ###
