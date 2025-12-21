; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 126687500 --problem-name spanner-s4-n3-l4-s126687500
(define (problem spanner-s4-n3-l4-s126687500)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_10 obj_08 obj_03 obj_05 - type_5
     obj_06 obj_04 obj_11 - type_4
     obj_07 obj_02 obj_14 obj_09 - type_2
     obj_01 obj_13 - type_2
    )
 (:init 
    (pred_2 obj_12 obj_01)
    (pred_2 obj_10 obj_07)
    (pred_1 obj_10)
    (pred_2 obj_08 obj_07)
    (pred_1 obj_08)
    (pred_2 obj_03 obj_14)
    (pred_1 obj_03)
    (pred_2 obj_05 obj_07)
    (pred_1 obj_05)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_13)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_13)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_13)
    (pred_6 obj_01 obj_07)
    (pred_6 obj_09 obj_13)
    (pred_6 obj_07 obj_02)
    (pred_6 obj_02 obj_14)
    (pred_6 obj_14 obj_09)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_04)
   (pred_3 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_01)))
  )
)
)
