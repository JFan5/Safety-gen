; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1183039744 --problem-name spanner-s4-n3-l4-s1183039744
(define (problem spanner-s4-n3-l4-s1183039744)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_01 obj_03 obj_09 obj_07 - type_5
     obj_02 obj_14 obj_04 - type_1
     obj_13 obj_10 obj_05 obj_08 - type_4
     obj_11 obj_12 - type_4
    )
 (:init 
    (pred_2 obj_06 obj_11)
    (pred_2 obj_01 obj_05)
    (pred_6 obj_01)
    (pred_2 obj_03 obj_08)
    (pred_6 obj_03)
    (pred_2 obj_09 obj_10)
    (pred_6 obj_09)
    (pred_2 obj_07 obj_10)
    (pred_6 obj_07)
    (pred_3 obj_02)
    (pred_2 obj_02 obj_12)
    (pred_3 obj_14)
    (pred_2 obj_14 obj_12)
    (pred_3 obj_04)
    (pred_2 obj_04 obj_12)
    (pred_4 obj_11 obj_13)
    (pred_4 obj_08 obj_12)
    (pred_4 obj_13 obj_10)
    (pred_4 obj_10 obj_05)
    (pred_4 obj_05 obj_08)
)
 (:goal
  (and
   (pred_5 obj_02)
   (pred_5 obj_14)
   (pred_5 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_14)) (not (pred_5 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_11)))
  )
)
)
