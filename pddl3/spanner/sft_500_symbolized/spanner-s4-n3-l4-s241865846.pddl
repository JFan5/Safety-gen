; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 241865846 --problem-name spanner-s4-n3-l4-s241865846
(define (problem spanner-s4-n3-l4-s241865846)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_09 obj_08 obj_14 obj_04 - type_1
     obj_01 obj_12 obj_11 - type_4
     obj_10 obj_03 obj_07 obj_06 - type_3
     obj_05 obj_13 - type_3
    )
 (:init 
    (pred_2 obj_02 obj_05)
    (pred_2 obj_09 obj_07)
    (pred_6 obj_09)
    (pred_2 obj_08 obj_03)
    (pred_6 obj_08)
    (pred_2 obj_14 obj_10)
    (pred_6 obj_14)
    (pred_2 obj_04 obj_10)
    (pred_6 obj_04)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_13)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_13)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_13)
    (pred_4 obj_05 obj_10)
    (pred_4 obj_06 obj_13)
    (pred_4 obj_10 obj_03)
    (pred_4 obj_03 obj_07)
    (pred_4 obj_07 obj_06)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_12)
   (pred_1 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_12)) (not (pred_1 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_05)))
  )
)
)
