; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 743432423 --problem-name spanner-s4-n3-l4-s743432423
(define (problem spanner-s4-n3-l4-s743432423)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_06 obj_04 obj_12 obj_01 - type_5
     obj_02 obj_14 obj_08 - type_4
     obj_11 obj_05 obj_09 obj_10 - type_1
     obj_07 obj_03 - type_1
    )
 (:init 
    (pred_1 obj_13 obj_07)
    (pred_1 obj_06 obj_09)
    (pred_4 obj_06)
    (pred_1 obj_04 obj_11)
    (pred_4 obj_04)
    (pred_1 obj_12 obj_11)
    (pred_4 obj_12)
    (pred_1 obj_01 obj_09)
    (pred_4 obj_01)
    (pred_5 obj_02)
    (pred_1 obj_02 obj_03)
    (pred_5 obj_14)
    (pred_1 obj_14 obj_03)
    (pred_5 obj_08)
    (pred_1 obj_08 obj_03)
    (pred_3 obj_07 obj_11)
    (pred_3 obj_10 obj_03)
    (pred_3 obj_11 obj_05)
    (pred_3 obj_05 obj_09)
    (pred_3 obj_09 obj_10)
)
 (:goal
  (and
   (pred_6 obj_02)
   (pred_6 obj_14)
   (pred_6 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_14)) (not (pred_6 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
