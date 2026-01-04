; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 241865846 --problem-name spanner-s4-n3-l4-s241865846
(define (problem spanner-s4-n3-l4-s241865846)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_12 obj_13 obj_06 obj_04 - type_2
     obj_05 obj_08 obj_03 - type_3
     obj_11 obj_14 obj_01 obj_07 - type_4
     obj_10 obj_02 - type_4
    )
 (:init 
    (pred_4 obj_09 obj_10)
    (pred_4 obj_12 obj_01)
    (pred_3 obj_12)
    (pred_4 obj_13 obj_14)
    (pred_3 obj_13)
    (pred_4 obj_06 obj_11)
    (pred_3 obj_06)
    (pred_4 obj_04 obj_11)
    (pred_3 obj_04)
    (pred_6 obj_05)
    (pred_4 obj_05 obj_02)
    (pred_6 obj_08)
    (pred_4 obj_08 obj_02)
    (pred_6 obj_03)
    (pred_4 obj_03 obj_02)
    (pred_1 obj_10 obj_11)
    (pred_1 obj_07 obj_02)
    (pred_1 obj_11 obj_14)
    (pred_1 obj_14 obj_01)
    (pred_1 obj_01 obj_07)
)
 (:goal
  (and
   (pred_2 obj_05)
   (pred_2 obj_08)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_08)) (not (pred_2 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_10)))
  )
)
)
