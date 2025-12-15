; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1183039744 --problem-name spanner-s4-n3-l4-s1183039744
(define (problem spanner-s4-n3-l4-s1183039744)
 (:domain spanner)
 (:objects 
     obj_01 - type_5
     obj_03 obj_04 obj_11 obj_09 - type_3
     obj_07 obj_12 obj_10 - type_2
     obj_14 obj_02 obj_06 obj_05 - type_4
     obj_08 obj_13 - type_4
    )
 (:init 
    (pred_2 obj_01 obj_08)
    (pred_2 obj_03 obj_06)
    (pred_5 obj_03)
    (pred_2 obj_04 obj_05)
    (pred_5 obj_04)
    (pred_2 obj_11 obj_02)
    (pred_5 obj_11)
    (pred_2 obj_09 obj_02)
    (pred_5 obj_09)
    (pred_3 obj_07)
    (pred_2 obj_07 obj_13)
    (pred_3 obj_12)
    (pred_2 obj_12 obj_13)
    (pred_3 obj_10)
    (pred_2 obj_10 obj_13)
    (pred_4 obj_08 obj_14)
    (pred_4 obj_05 obj_13)
    (pred_4 obj_14 obj_02)
    (pred_4 obj_02 obj_06)
    (pred_4 obj_06 obj_05)
)
 (:goal
  (and
   (pred_1 obj_07)
   (pred_1 obj_12)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_12)) (not (pred_1 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
