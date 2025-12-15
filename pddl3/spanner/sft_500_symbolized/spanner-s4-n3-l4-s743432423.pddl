; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 743432423 --problem-name spanner-s4-n3-l4-s743432423
(define (problem spanner-s4-n3-l4-s743432423)
 (:domain spanner)
 (:objects 
     obj_08 - type_3
     obj_01 obj_02 obj_04 obj_10 - type_2
     obj_03 obj_14 obj_05 - type_4
     obj_07 obj_06 obj_11 obj_12 - type_1
     obj_09 obj_13 - type_1
    )
 (:init 
    (pred_1 obj_08 obj_09)
    (pred_1 obj_01 obj_11)
    (pred_2 obj_01)
    (pred_1 obj_02 obj_07)
    (pred_2 obj_02)
    (pred_1 obj_04 obj_07)
    (pred_2 obj_04)
    (pred_1 obj_10 obj_11)
    (pred_2 obj_10)
    (pred_4 obj_03)
    (pred_1 obj_03 obj_13)
    (pred_4 obj_14)
    (pred_1 obj_14 obj_13)
    (pred_4 obj_05)
    (pred_1 obj_05 obj_13)
    (pred_3 obj_09 obj_07)
    (pred_3 obj_12 obj_13)
    (pred_3 obj_07 obj_06)
    (pred_3 obj_06 obj_11)
    (pred_3 obj_11 obj_12)
)
 (:goal
  (and
   (pred_6 obj_03)
   (pred_6 obj_14)
   (pred_6 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_14)) (not (pred_6 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
