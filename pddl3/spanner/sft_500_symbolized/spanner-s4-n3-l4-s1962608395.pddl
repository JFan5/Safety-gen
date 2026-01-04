; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1962608395 --problem-name spanner-s4-n3-l4-s1962608395
(define (problem spanner-s4-n3-l4-s1962608395)
 (:domain spanner)
 (:objects 
     obj_01 - type_1
     obj_08 obj_13 obj_03 obj_07 - type_3
     obj_05 obj_02 obj_11 - type_5
     obj_06 obj_09 obj_14 obj_10 - type_2
     obj_04 obj_12 - type_2
    )
 (:init 
    (pred_1 obj_01 obj_04)
    (pred_1 obj_08 obj_09)
    (pred_3 obj_08)
    (pred_1 obj_13 obj_09)
    (pred_3 obj_13)
    (pred_1 obj_03 obj_14)
    (pred_3 obj_03)
    (pred_1 obj_07 obj_09)
    (pred_3 obj_07)
    (pred_4 obj_05)
    (pred_1 obj_05 obj_12)
    (pred_4 obj_02)
    (pred_1 obj_02 obj_12)
    (pred_4 obj_11)
    (pred_1 obj_11 obj_12)
    (pred_5 obj_04 obj_06)
    (pred_5 obj_10 obj_12)
    (pred_5 obj_06 obj_09)
    (pred_5 obj_09 obj_14)
    (pred_5 obj_14 obj_10)
)
 (:goal
  (and
   (pred_6 obj_05)
   (pred_6 obj_02)
   (pred_6 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_05)) (not (pred_6 obj_02))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_04)))
  )
)
)
