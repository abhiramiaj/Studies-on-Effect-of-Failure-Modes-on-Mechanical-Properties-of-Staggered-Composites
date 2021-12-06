# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 6.14-1 replay file
# Internal Version: 2014_06_05-03.41.02 134264
# Run by user on Sat Oct 06 18:20:00 2018
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...


import random
from part import *
from material import *
from section import *
from assembly import *
from step import *
from interaction import *
from load import *
from mesh import *
from job import *
from sketch import *

rho=12.00
phi=0.8
b=1.
path_name='C:/Temp/SWAR12VF80stresssw_pbcpairedeqn'
path_odb1='C:/Temp/SWAR12VF80stresssw_pbcpairedeqn.odb'

job_name1='SWAR12VF80stresssw_pbcpairedeqn'
 
#hg=vg/4 makes small width slits
Lp=rho*b
# a1=phi*4
# a2=phi*(4*Lp + b)
# a3=Lp*b*(phi-1)
# d=sqrt((a2**2)-(4*a1*a3))
# hg=round((-a2+d)/(2*a1),2)

eltype="CPS"


#b = 1.
#rho = 12.
n = 5

period=n
vg = b/phi - b
hg=0.25*vg
elsizeVert = vg/4.
elsizeHor = elsizeVert*3


w=b/2.0


lb=hg/2.0

ms=vg/2##mesh size
Ep=100e9
nup=0.22
num=0.49
Em = 4e9
nup=0.22
num=0.49

Wrve=n*(vg+b)
Lrve=hg+Lp
totalwidth=Lrve*2
totalheight=Wrve
Lp11=(Lrve/n)-lb
Lp12=Lp-Lp11
Lp21=(2.*Lrve/n)-lb
Lp22=Lp-Lp21
Lp31=Lp22
Lp32=Lp21
Lp41=Lp12
Lp42=Lp11

 
flag=1
FXX = 1.
FXY = 0.
FYX = 0.
FYY = -999

from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=121.633964538574, 
    height=118.363288879395)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from caeModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=ON)
Mdb()

s = mdb.models['Model-1'].ConstrainedSketch(name='__profile__', 
    sheetSize=5000.0)
g, v, d, c = s.geometry, s.vertices, s.dimensions, s.constraints
s.setPrimaryObject(option=STANDALONE)
s.rectangle(point1=(lb, 0.0), point2=(lb+Lp, b/2))
s.rectangle(point1=(Lrve-Lp42,  vg + b*0.5), point2=(Lrve,  vg + b*1.5))
s.rectangle(point1=(0,  vg + 0.5*b), point2=(Lp41,  vg + 1.5*b))
s.rectangle(point1=(Lrve-Lp32,  2*vg + b*1.5), point2=(Lrve,  2*vg + b*2.5))
s.rectangle(point1=(0,  2*vg + 1.5*b), point2=(Lp31,  2*vg + 2.5*b))
s.rectangle(point1=(Lrve-Lp22,  3*vg + b*2.5), point2=(Lrve,  3*vg + b*3.5))
s.rectangle(point1=(0,  3*vg + 2.5*b), point2=(Lp21,  3*vg + 3.5*b))
s.rectangle(point1=(Lrve-Lp12,  4*vg + b*3.5), point2=(Lrve,  4*vg + b*4.5))
s.rectangle(point1=(0,  4*vg + 3.5*b), point2=(Lp11,  4*vg + 4.5*b))
s.rectangle(point1=(lb,  5*vg + b*4.5), point2=(Lrve-lb,  5*vg + b*5))
session.viewports['Viewport: 1'].view.fitView()
p = mdb.models['Model-1'].Part(name='Platelet', dimensionality=TWO_D_PLANAR, 
    type=DEFORMABLE_BODY)
p.BaseShell(sketch=s)
s.unsetPrimaryObject()


s1 = mdb.models['Model-1'].ConstrainedSketch(name='__profile__', 
    sheetSize=5000.0)
g, v, d, c = s1.geometry, s1.vertices, s1.dimensions, s1.constraints
s1.setPrimaryObject(option=STANDALONE)
s1.Line(point1=(0.0, 0.0), point2=(lb, 0.0))
s1.Line(point1=(lb, 0.0), point2=(lb, b/2))
s1.Line(point1=(lb, b/2), point2=(lb+Lp, b/2))
s1.Line(point1=(lb+Lp, b/2), point2=(lb+Lp, 0.0))
s1.Line(point1=(lb+Lp, 0.0), point2=(Lrve, 0.0))
session.viewports['Viewport: 1'].view.fitView()
s1.Line(point1=(Lrve, 0.0), point2=(Lrve, vg + b*0.5))
s1.Line(point1=(Lrve, vg + b*0.5), point2=(Lrve-Lp42,  vg + b*0.5))
s1.Line(point1=(Lrve-Lp42,  vg + b*0.5), point2=(Lrve-Lp42,  vg + b*1.5))
s1.Line(point1=(Lrve-Lp42,  vg + b*1.5), point2=(Lrve,  vg + b*1.5))
s1.Line(point1=(Lrve,  vg + b*1.5), point2=(Lrve,  2*vg + b*1.5))
s1.Line(point1=(Lrve,  2*vg + b*1.5), point2=(Lrve-Lp32,  2*vg + b*1.5))
s1.Line(point1=(Lrve-Lp32,  2*vg + b*1.5), point2=(Lrve-Lp32,  2*vg + b*2.5))
s1.Line(point1=(Lrve-Lp32,  2*vg + b*2.5), point2=(Lrve,  2*vg + b*2.5))
s1.Line(point1=(Lrve,  2*vg + b*2.5), point2=(Lrve,  3*vg + b*2.5))
s1.Line(point1=(Lrve,  3*vg + b*2.5), point2=(Lrve-Lp22,  3*vg + b*2.5))
s1.Line(point1=(Lrve-Lp22,  3*vg + b*2.5), point2=(Lrve-Lp22,  3*vg + b*3.5))
s1.Line(point1=(Lrve-Lp22,  3*vg + b*3.5), point2=(Lrve,  3*vg + b*3.5))
s1.Line(point1=(Lrve,  3*vg + b*3.5), point2=(Lrve,  4*vg + b*3.5))
s1.Line(point1=(Lrve,  4*vg + b*3.5), point2=(Lrve-Lp12,  4*vg + b*3.5))
s1.Line(point1=(Lrve-Lp12,  4*vg + b*3.5), point2=(Lrve-Lp12,  4*vg + b*4.5))
s1.Line(point1=(Lrve-Lp12,  4*vg + b*4.5), point2=(Lrve,  4*vg + b*4.5))
s1.Line(point1=(Lrve,  4*vg + b*4.5), point2=(Lrve,  5*vg + b*5))
s1.Line(point1=(Lrve,  5*vg + b*5), point2=(Lrve-lb,  5*vg + b*5))
s1.Line(point1=(Lrve-lb,  5*vg + b*5), point2=(Lrve-lb,  5*vg + b*4.5))
s1.Line(point1=(Lrve-lb,  5*vg + b*4.5), point2=(lb,  5*vg + b*4.5))
s1.Line(point1=(lb,  5*vg + b*4.5), point2=(lb,  5*vg + b*5))
s1.Line(point1=(lb,  5*vg + b*5), point2=(0,  5*vg + b*5))
s1.Line(point1=(0,  5*vg + b*5), point2=(0,  4*vg + b*4.5))
s1.Line(point1=(0,  4*vg + 4.5*b), point2=(Lp11,  4*vg + b*4.5))
s1.Line(point1=(Lp11,  4*vg + 4.5*b), point2=(Lp11,  4*vg + b*3.5))
s1.Line(point1=(Lp11,  4*vg + 3.5*b), point2=(0,  4*vg + b*3.5))
s1.Line(point1=(0,  4*vg + 3.5*b), point2=(0,  3*vg + b*3.5))
s1.Line(point1=(0,  3*vg + 3.5*b), point2=(Lp21,  3*vg + b*3.5))
s1.Line(point1=(Lp21,  3*vg + 3.5*b), point2=(Lp21,  3*vg + b*2.5))
s1.Line(point1=(Lp21,  3*vg + 2.5*b), point2=(0,  3*vg + b*2.5))
s1.Line(point1=(0,  3*vg + 2.5*b), point2=(0,  2*vg + b*2.5))
s1.Line(point1=(0,  2*vg + 2.5*b), point2=(Lp31,  2*vg + b*2.5))
s1.Line(point1=(Lp31,  2*vg + 2.5*b), point2=(Lp31,  2*vg + b*1.5))
s1.Line(point1=(Lp31,  2*vg + 1.5*b), point2=(0,  2*vg + b*1.5))
s1.Line(point1=(0,  2*vg + 1.5*b), point2=(0,  vg + b*1.5))
s1.Line(point1=(0,  vg + 1.5*b), point2=(Lp41,  vg + b*1.5))
s1.Line(point1=(Lp41,  vg + 1.5*b), point2=(Lp41,  vg + b*0.5))
s1.Line(point1=(Lp41,  vg + 0.5*b), point2=(0,  vg + b*0.5))
s1.Line(point1=(0,  vg + 0.5*b), point2=(0,  0))
p = mdb.models['Model-1'].Part(name='Matrix', dimensionality=TWO_D_PLANAR,type=DEFORMABLE_BODY)
p.BaseShell(sketch=s1)
s1.unsetPrimaryObject()



mdb.models['Model-1'].Material(name='Platelet')
mdb.models['Model-1'].materials['Platelet'].Elastic(table=((Ep, nup), ))
mdb.models['Model-1'].Material(name='Matrix')
mdb.models['Model-1'].materials['Matrix'].Elastic(table=((Em, num), ))
mdb.models['Model-1'].HomogeneousSolidSection(name='Platelet', 
    material='Platelet', thickness=None)
mdb.models['Model-1'].HomogeneousSolidSection(name='Matrix', 
    material='Matrix', thickness=None)
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    optimizationTasks=OFF, geometricRestrictions=OFF, stopConditions=OFF)
a = mdb.models['Model-1'].rootAssembly
a.DatumCsysByDefault(CARTESIAN)
p = mdb.models['Model-1'].parts['Platelet']
a.Instance(name='Part-1-1', part=p, dependent=OFF)
p = mdb.models['Model-1'].parts['Matrix']
a.Instance(name='Part-2-1', part=p, dependent=OFF)
a = mdb.models['Model-1'].rootAssembly
a.InstanceFromBooleanMerge(name='Compositee', instances=(a.instances['Part-1-1'], 
    a.instances['Part-2-1'], ), keepIntersections=ON, 
    originalInstances=SUPPRESS, domain=GEOMETRY)



a = mdb.models['Model-1'].rootAssembly
a.makeIndependent(instances=(a.instances['Compositee-1'], ))
session.viewports['Viewport: 1'].setValues(displayedObject=a)
a = mdb.models['Model-1'].rootAssembly

p = mdb.models['Model-1'].parts['Compositee']
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=OFF)

platelet_face_point_1 = ((Lrve/2),b/4,0.0)
platelet_face_point_2 = ((Lrve - Lp42*0.5),(b+vg),0.0)
platelet_face_point_3 = ((Lp41/2),(b+vg),0.0)
platelet_face_point_4 = ((Lrve - Lp32*0.5), 2*b + 2*vg,0.0)
platelet_face_point_5 = ((Lp31/2),(2*(b+vg)),0.0)
platelet_face_point_6= ((Lrve - Lp22*0.5), 3*b + 3*vg,0.0)
platelet_face_point_7 = ((Lp21/2),3*(b+vg),0.0)
platelet_face_point_8 = ((Lrve - Lp12*0.5), 4*b + 4*vg,0.0)
platelet_face_point_9 = ((Lp11/2),4*(b+vg),0.0)
platelet_face_point_10 = ((Lrve/2), 4.75*b + 5*vg,0.0)
platelet_face_1 = p.faces.findAt((platelet_face_point_1,))
platelet_face_2 = p.faces.findAt((platelet_face_point_2,))
platelet_face_3 = p.faces.findAt((platelet_face_point_3,))
platelet_face_4 = p.faces.findAt((platelet_face_point_4,))
platelet_face_5 = p.faces.findAt((platelet_face_point_5,))
platelet_face_6 = p.faces.findAt((platelet_face_point_6,))
platelet_face_7 = p.faces.findAt((platelet_face_point_7,))
platelet_face_8 = p.faces.findAt((platelet_face_point_8,))
platelet_face_9 = p.faces.findAt((platelet_face_point_9,))
platelet_face_10 = p.faces.findAt((platelet_face_point_10,))
platelet_region=(platelet_face_1, platelet_face_2, platelet_face_3, platelet_face_4,platelet_face_5,platelet_face_6,platelet_face_7,platelet_face_8,platelet_face_9,platelet_face_10,)
p = mdb.models['Model-1'].parts['Compositee']
p.SectionAssignment(region=platelet_region, sectionName='Platelet', offset=0.0, 
    offsetType=MIDDLE_SURFACE, offsetField='', 
    thicknessAssignment=FROM_SECTION)


p = mdb.models['Model-1'].parts['Compositee']
f = p.faces
matrix_face_point = (0.5*lb,b/2,0.0)
matrix_face = p.faces.findAt((matrix_face_point,))
matrix_region=(matrix_face,)
p = mdb.models['Model-1'].parts['Compositee']
p.SectionAssignment(region=matrix_region, sectionName='Matrix', offset=0.0, 
    offsetType=MIDDLE_SURFACE, offsetField='', 
    thicknessAssignment=FROM_SECTION)

a = mdb.models['Model-1'].rootAssembly
a.LinearInstancePattern(instanceList=('Compositee-1', ), direction1=(1.0, 0.0, 
    0.0), direction2=(0.0, 1.0, 0.0), number1=2, number2=1, 
    spacing1=Lrve, spacing2=Wrve)
a = mdb.models['Model-1'].rootAssembly
a.InstanceFromBooleanMerge(name='Composite', instances=(
    a.instances['Compositee-1'], a.instances['Compositee-1-lin-2-1'], ), 
    originalInstances=SUPPRESS, domain=GEOMETRY)


finalInstance=mdb.models['Model-1'].rootAssembly.instances['Composite-1']
finalPart= mdb.models['Model-1'].parts['Composite']



p = mdb.models['Model-1'].parts['Composite']
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=OFF)

platelet_face_point_1 = ((Lrve/2),b/4,0.0)
platelet_face_point_2 = ((Lrve - Lp42*0.5),(b+vg),0.0)
platelet_face_point_3 = ((Lp41/2),(b+vg),0.0)
platelet_face_point_4 = ((Lrve - Lp32*0.5), 2*b + 2*vg,0.0)
platelet_face_point_5 = ((Lp31/2),(2*(b+vg)),0.0)
platelet_face_point_6= ((Lrve - Lp22*0.5), 3*b + 3*vg,0.0)
platelet_face_point_7 = ((Lp21/2),3*(b+vg),0.0)
platelet_face_point_8 = ((Lrve - Lp12*0.5), 4*b + 4*vg,0.0)
platelet_face_point_9 = ((Lp11/2),4*(b+vg),0.0)
platelet_face_point_10 = ((Lrve/2), 4.75*b + 5*vg,0.0)

platelet_face_point_11 = ((Lrve+ 4*hg),b/4,0.0)
platelet_face_point_12 = ((2*Lrve- 2*vg),(b+vg),0.0)
platelet_face_point_13 = ((2*Lrve- 2*vg),2*b + 2*vg,0.0)
platelet_face_point_14 = ((2*Lrve- 2*vg),3*b + 3*vg,0.0)
platelet_face_point_15 = ((2*Lrve- 2*vg),4*b + 4*vg,0.0)
platelet_face_point_16 = ((2*Lrve- 2*vg),5*b + 5*vg,0.0)



platelet_face_1 = p.faces.findAt((platelet_face_point_1,))
platelet_face_2 = p.faces.findAt((platelet_face_point_2,))
platelet_face_3 = p.faces.findAt((platelet_face_point_3,))
platelet_face_4 = p.faces.findAt((platelet_face_point_4,))
platelet_face_5 = p.faces.findAt((platelet_face_point_5,))
platelet_face_6 = p.faces.findAt((platelet_face_point_6,))
platelet_face_7 = p.faces.findAt((platelet_face_point_7,))
platelet_face_8 = p.faces.findAt((platelet_face_point_8,))
platelet_face_9 = p.faces.findAt((platelet_face_point_9,))
platelet_face_10 = p.faces.findAt((platelet_face_point_10,))
platelet_face_11 = p.faces.findAt((platelet_face_point_11,))
platelet_face_12 = p.faces.findAt((platelet_face_point_12,))
platelet_face_13 = p.faces.findAt((platelet_face_point_13,))
platelet_face_14 = p.faces.findAt((platelet_face_point_14,))
platelet_face_15 = p.faces.findAt((platelet_face_point_15,))
platelet_face_16 = p.faces.findAt((platelet_face_point_16,))

platelet_region=(platelet_face_1, platelet_face_2, platelet_face_3, platelet_face_4,platelet_face_5,platelet_face_6,platelet_face_7,
    platelet_face_8,platelet_face_9,platelet_face_10,platelet_face_11,platelet_face_12,platelet_face_13,platelet_face_14,platelet_face_15,
    platelet_face_16,)
p = mdb.models['Model-1'].parts['Composite']
p.SectionAssignment(region=platelet_region, sectionName='Platelet', offset=0.0, 
    offsetType=MIDDLE_SURFACE, offsetField='', 
    thicknessAssignment=FROM_SECTION)


p = mdb.models['Model-1'].parts['Composite']
f = p.faces
matrix_face_point = (0.5*lb,b/2,0.0)
matrix_face = p.faces.findAt((matrix_face_point,))
matrix_region=(matrix_face,)
p = mdb.models['Model-1'].parts['Composite']
p.SectionAssignment(region=matrix_region, sectionName='Matrix', offset=0.0, 
    offsetType=MIDDLE_SURFACE, offsetField='', 
    thicknessAssignment=FROM_SECTION)





softlayerSet = finalPart.Set(faces=matrix_region,name='Softlayer')
plateletSet = finalPart.Set(faces=platelet_region,name='Platelet')



a = mdb.models['Model-1'].rootAssembly
a.makeIndependent(instances=(a.instances['Composite-1'], ))
a = mdb.models['Model-1'].rootAssembly


partInstances =(a.instances['Composite-1'], )
a.seedPartInstance(regions=partInstances, size=ms, deviationFactor=0.1, 
    minSizeFactor=0.1)
a = mdb.models['Model-1'].rootAssembly
partInstances =(a.instances['Composite-1'], )
a.generateMesh(regions=partInstances)

#
mdb.models['Model-1'].StaticStep(name='Step-1', previous='Initial')
finalInstance=mdb.models['Model-1'].rootAssembly.instances['Composite-1']
finalPart= mdb.models['Model-1'].parts['Composite']



e1 = a.instances['Composite-1'].edges
edges1 = e1.getSequenceFromMask(mask=('[#400000 #0 #2000000 ]', ), )
a.Set(edges=edges1, name='top')
#a.Set(edges=finalInstance.edges.findAt(((Lrve/2., Wrve, 0.0),), ), name="top")
#a.Set(edges=finalInstance.edges.getByBoundingBox(yMin=Wrve- vg/2.), name="top")
a.Set(edges=finalInstance.edges.getByBoundingBox(xMin=2*Lrve -hg/5.), name="right")
a.Set(edges=finalInstance.edges.getByBoundingBox(xMax=hg/5.), name="left")
a.Set(edges=finalInstance.edges.getByBoundingBox(yMax=vg), name="bottom")


# fixnode=mdb.models['Model-1'].rootAssembly.instances['Composite-1'].nodes.getClosest(coordinates=((Lrve/2., Wrve/2., 0.0),))[0].label
# a.Set(nodes=mdb.models['Model-1'].rootAssembly.instances['Composite-1'].nodes[fixnode-1:fixnode], name="fixNode")


# mdb.models['Model-1'].PinnedBC(createStepName='Step-1', localCsys=None, name='allfix',region=a.sets["fixNode"])
# generate the equations manually

nodesets = {}
for set,i in zip(["top","bottom","right","left"],[1,1,2,2]):
    nodesets[set]=[]
    for node in a.sets[set].nodes:
        nodesets[set].append((node.label,node.coordinates[0],node.coordinates[1]))
    nodesets[set].sort(key=lambda value: value[i])
mdb.models['Model-1'].keywordBlock.synchVersions(True)
keywordblock = mdb.models['Model-1'].keywordBlock
for i,kw in enumerate(keywordblock.sieBlocks):
    if kw.startswith("*End Part"):
        endpart = i
    elif kw.startswith("*End Instance"):
        endinstance = i
    elif kw.startswith("*Elset"):
        endassembly = i
    elif kw.startswith("*Static"):
        static = i
    elif kw.startswith("*Output, history"):
        history = i
        break


partstring="*Part, name=dummy-LR\n"
partstring+="*End Part\n"
partstring+="**\n"
partstring+="*Part, name=dummy-TB\n"
partstring+="*End Part\n"
partstring+="**\n"
keywordblock.insert(position=endpart+1,text=partstring)
endinstancestring="*Instance, name=dummy-LR-1, part=dummy-LR\n"
endinstancestring+="*Node\n"
endinstancestring+="100000, -10., 10., 0.\n"
endinstancestring+="**This dummy node can be arbitrary\n"
endinstancestring+="*Nset, nset=dummy-LR-1-RefPt_, internal\n"
endinstancestring+="100000,\n"
endinstancestring+="*End Instance\n"
endinstancestring+="*Instance, name=dummy-TB-1, part=dummy-TB\n"
endinstancestring+="*Node\n"
endinstancestring+="200000, 10., 0., 0.\n"
endinstancestring+="**This dummy node can be arbitrary\n"
endinstancestring+="*Nset, nset=dummy-TB-1-RefPt_, internal\n"
endinstancestring+="200000,\n"
endinstancestring+="*End Instance\n"
endinstancestring+="** Define nset Set-dummy-LR and Set-dummy-TB for the two dummy nodes\n"
endinstancestring+="**\n"
endinstancestring+="*Nset, nset=Set-dummy-LR, instance=dummy-LR-1\n"
endinstancestring+="100000,\n"
endinstancestring+="*Nset, nset=Set-dummy-TB, instance=dummy-TB-1\n"
endinstancestring+="200000,\n"
keywordblock.insert(position=endinstance+1,text=endinstancestring)

equationstring = "*Equation\n"
for ntop,nbot in zip(nodesets["top"],nodesets["bottom"]):
    equationstring += "3\n"
    equationstring += "Composite-1.%d, 1, 1.0, Composite-1.%d, 1, -1.0, %s, 1, -1.0\n" % (ntop[0],nbot[0],'Set-dummy-TB')
    equationstring += "3\n"
    equationstring += "Composite-1.%d, 2, 1.0, Composite-1.%d, 2, -1.0, %s, 2, -1.0\n" % (ntop[0],nbot[0],'Set-dummy-TB')
for nright,nleft in zip(nodesets["right"],nodesets["left"]):
    equationstring += "3\n"
    equationstring += "Composite-1.%d, 1, 1.0, Composite-1.%d, 1, -1.0, %s, 1, -1.0\n" % (nright[0],nleft[0],'Set-dummy-LR')
    equationstring += "3\n"
    equationstring += "Composite-1.%d, 2, 1.0, Composite-1.%d, 2, -1.0, %s, 2, -1.0\n" % (nright[0],nleft[0],'Set-dummy-LR')
keywordblock.insert(position=endassembly,text=equationstring)
bcstring = "**\n*Boundary\n"
bcstring += "Set-dummy-TB,1,1, 0.0\n" 
bcstring += "**\n*Boundary\n"
bcstring += "Set-dummy-LR,1,1, 0.01\n"
bcstring += "**\n*Boundary\n"
bcstring += "Set-dummy-LR,2,2, 0.0\n" 
bcstring += "**\n*Boundary\n"
bcstring += "Set-dummy-TB,2,2, 0.0\n"
keywordblock.insert(position=static+3,text=bcstring)
# ###################'Set-dummy-TB'##########################

job=mdb.Job(atTime=None, contactPrint=OFF, description='', echoPrint=OFF, 
    explicitPrecision=SINGLE, getMemoryFromAnalysis=True, historyPrint=OFF, 
    memory=90, memoryUnits=PERCENTAGE, model='Model-1', modelPrint=OFF, 
    multiprocessingMode=DEFAULT, name=job_name1, nodalOutputPrecision=SINGLE, 
    numCpus=1, numGPUs=0, queue=None, resultsFormat=ODB,parallelizationMethodExplicit=DOMAIN, 
    numDomains=1,scratch='', type=ANALYSIS, userSubroutine='', waitHours=0, waitMinutes=0)

historystring = "*Output, history\n*Node Output, Nset=Set-dummy-LR\n RF\n" 
historystring += "*Node Output, Nset=Set-dummy-TB\n RF\n" 
keywordblock.replace(position=history+4,text=historystring)
mdb.jobs[job_name1].submit(consistencyChecking=OFF)
mdb.jobs[job_name1].waitForCompletion()
#################create three paths along a full platelet and extract S11 along the length of platelet############
session.viewports['Viewport: 1'].view.setValues(nearPlane=73.5342, 
    farPlane=127.624, width=55.7634, height=25.8937, viewOffsetX=7.36352, 
    viewOffsetY=-0.631719)
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
o3 = session.openOdb(name='C:/Temp/SWAR12VF80stresssw_pbcpairedeqn.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.mdbData.summary()
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'S11'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
odb = session.odbs['C:/Temp/SWAR12VF80stresssw_pbcpairedeqn.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=odb)
session.viewports['Viewport: 1'].view.setValues(nearPlane=82.5235, 
    farPlane=118.634, width=5.73301, height=2.66212, viewOffsetX=8.0664, 
    viewOffsetY=0.887021)
session.Path(name='Path-1', type=NODE_LIST, expression=(('COMPOSITE-1', (1993, 
    1896, )), ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=79.7488, 
    farPlane=121.409, width=28.5694, height=13.2662, viewOffsetX=3.84439, 
    viewOffsetY=1.389)
session.Path(name='Path-2', type=NODE_LIST, expression=(('COMPOSITE-1', (1995, 
    1894, )), ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=82.3162, 
    farPlane=118.842, width=6.84494, height=3.17844, viewOffsetX=8.27808, 
    viewOffsetY=0.681338)
session.Path(name='Path-3', type=NODE_LIST, expression=(('COMPOSITE-1', (1997, 
    1892, )), ))
xyp = session.XYPlot('XYPlot-1')
chartName = xyp.charts.keys()[0]
chart = xyp.charts[chartName]
pth = session.paths['Path-1']
xy1 = xyPlot.XYDataFromPath(path=pth, includeIntersections=False, 
    projectOntoMesh=False, pathStyle=UNIFORM_SPACING, numIntervals=100, 
    projectionTolerance=0, shape=UNDEFORMED, labelType=TRUE_DISTANCE)
c1 = session.Curve(xyData=xy1)
chart.setValues(curvesToPlot=(c1, ), )
session.viewports['Viewport: 1'].setValues(displayedObject=xyp)
pth = session.paths['Path-1']
session.XYDataFromPath(name='XYData-1', path=pth, includeIntersections=False, 
    projectOntoMesh=False, pathStyle=UNIFORM_SPACING, numIntervals=100, 
    projectionTolerance=0, shape=UNDEFORMED, labelType=TRUE_DISTANCE)
xyp = session.xyPlots['XYPlot-1']
chartName = xyp.charts.keys()[0]
chart = xyp.charts[chartName]
pth = session.paths['Path-2']
xy1 = xyPlot.XYDataFromPath(path=pth, includeIntersections=False, 
    projectOntoMesh=False, pathStyle=UNIFORM_SPACING, numIntervals=100, 
    projectionTolerance=0, shape=UNDEFORMED, labelType=TRUE_DISTANCE)
c1 = session.Curve(xyData=xy1)
chart.setValues(curvesToPlot=(c1, ), )
pth = session.paths['Path-2']
session.XYDataFromPath(name='XYData-2', path=pth, includeIntersections=False, 
    projectOntoMesh=False, pathStyle=UNIFORM_SPACING, numIntervals=100, 
    projectionTolerance=0, shape=UNDEFORMED, labelType=TRUE_DISTANCE)
xyp = session.xyPlots['XYPlot-1']
chartName = xyp.charts.keys()[0]
chart = xyp.charts[chartName]
pth = session.paths['Path-3']
xy1 = xyPlot.XYDataFromPath(path=pth, includeIntersections=False, 
    projectOntoMesh=False, pathStyle=UNIFORM_SPACING, numIntervals=100, 
    projectionTolerance=0, shape=UNDEFORMED, labelType=TRUE_DISTANCE)
c1 = session.Curve(xyData=xy1)
chart.setValues(curvesToPlot=(c1, ), )
pth = session.paths['Path-3']
session.XYDataFromPath(name='XYData-3', path=pth, includeIntersections=False, 
    projectOntoMesh=False, pathStyle=UNIFORM_SPACING, numIntervals=100, 
    projectionTolerance=0, shape=UNDEFORMED, labelType=TRUE_DISTANCE)
import sys
sys.path.insert(9, 
    r'c:/SIMULIA/Abaqus/6.14-5/code/python2.7/lib/abaqus_plugins/excelUtilities')
import abq_ExcelUtilities.excelUtilities
abq_ExcelUtilities.excelUtilities.XYtoExcel(
    xyDataNames='XYData-1,XYData-2,XYData-3', 
    trueName='From Current XY Plot')



