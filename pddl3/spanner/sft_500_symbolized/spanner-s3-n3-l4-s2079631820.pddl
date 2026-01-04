; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2079631820 --problem-name spanner-s3-n3-l4-s2079631820
(define (problem spanner-s3-n3-l4-s2079631820)
 (:domain spanner)
 (:objects 
     obj_13 - type_2
     obj_05 obj_07 obj_10 - type_1
     obj_12 obj_03 obj_08 - type_4
     obj_11 obj_06 obj_01 obj_04 - type_3
     obj_09 obj_02 - type_3
    )
 (:init 
    (pred_3 obj_13 obj_09)
    (pred_3 obj_05 obj_06)
    (pred_6 obj_05)
    (pred_3 obj_07 obj_04)
    (pred_6 obj_07)
    (pred_3 obj_10 obj_01)
    (pred_6 obj_10)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_02)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_02)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_02)
    (pred_2 obj_09 obj_11)
    (pred_2 obj_04 obj_02)
    (pred_2 obj_11 obj_06)
    (pred_2 obj_06 obj_01)
    (pred_2 obj_01 obj_04)
)
 (:goal
  (and
   (pred_4 obj_12)
   (pred_4 obj_03)
   (pred_4 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_12)) (not (pred_4 obj_03))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
