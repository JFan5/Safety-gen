; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 241865846 --problem-name spanner-s4-n3-l4-s241865846
(define (problem spanner-s4-n3-l4-s241865846)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_04 obj_13 obj_06 obj_08 - type_3
     obj_09 obj_02 obj_10 - type_1
     obj_03 obj_12 obj_14 obj_05 - type_2
     obj_01 obj_11 - type_2
    )
 (:init 
    (pred_6 obj_07 obj_01)
    (pred_6 obj_04 obj_14)
    (pred_5 obj_04)
    (pred_6 obj_13 obj_12)
    (pred_5 obj_13)
    (pred_6 obj_06 obj_03)
    (pred_5 obj_06)
    (pred_6 obj_08 obj_03)
    (pred_5 obj_08)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_11)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_11)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_11)
    (pred_3 obj_01 obj_03)
    (pred_3 obj_05 obj_11)
    (pred_3 obj_03 obj_12)
    (pred_3 obj_12 obj_14)
    (pred_3 obj_14 obj_05)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_02)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_01)))
  )
)
)
