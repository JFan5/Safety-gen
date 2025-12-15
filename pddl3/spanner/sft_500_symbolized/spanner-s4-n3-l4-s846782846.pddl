; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 846782846 --problem-name spanner-s4-n3-l4-s846782846
(define (problem spanner-s4-n3-l4-s846782846)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_04 obj_12 obj_09 obj_14 - type_1
     obj_08 obj_07 obj_11 - type_4
     obj_06 obj_02 obj_10 obj_13 - type_3
     obj_01 obj_05 - type_3
    )
 (:init 
    (pred_5 obj_03 obj_01)
    (pred_5 obj_04 obj_02)
    (pred_4 obj_04)
    (pred_5 obj_12 obj_06)
    (pred_4 obj_12)
    (pred_5 obj_09 obj_02)
    (pred_4 obj_09)
    (pred_5 obj_14 obj_10)
    (pred_4 obj_14)
    (pred_3 obj_08)
    (pred_5 obj_08 obj_05)
    (pred_3 obj_07)
    (pred_5 obj_07 obj_05)
    (pred_3 obj_11)
    (pred_5 obj_11 obj_05)
    (pred_2 obj_01 obj_06)
    (pred_2 obj_13 obj_05)
    (pred_2 obj_06 obj_02)
    (pred_2 obj_02 obj_10)
    (pred_2 obj_10 obj_13)
)
 (:goal
  (and
   (pred_6 obj_08)
   (pred_6 obj_07)
   (pred_6 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_08)) (not (pred_6 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_01)))
  )
)
)
