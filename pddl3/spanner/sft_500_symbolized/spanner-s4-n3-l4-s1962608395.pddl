; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1962608395 --problem-name spanner-s4-n3-l4-s1962608395
(define (problem spanner-s4-n3-l4-s1962608395)
 (:domain spanner)
 (:objects 
     obj_03 - type_1
     obj_04 obj_11 obj_09 obj_06 - type_2
     obj_13 obj_10 obj_08 - type_4
     obj_14 obj_01 obj_07 obj_05 - type_5
     obj_12 obj_02 - type_5
    )
 (:init 
    (pred_1 obj_03 obj_12)
    (pred_1 obj_04 obj_01)
    (pred_2 obj_04)
    (pred_1 obj_11 obj_01)
    (pred_2 obj_11)
    (pred_1 obj_09 obj_07)
    (pred_2 obj_09)
    (pred_1 obj_06 obj_01)
    (pred_2 obj_06)
    (pred_4 obj_13)
    (pred_1 obj_13 obj_02)
    (pred_4 obj_10)
    (pred_1 obj_10 obj_02)
    (pred_4 obj_08)
    (pred_1 obj_08 obj_02)
    (pred_3 obj_12 obj_14)
    (pred_3 obj_05 obj_02)
    (pred_3 obj_14 obj_01)
    (pred_3 obj_01 obj_07)
    (pred_3 obj_07 obj_05)
)
 (:goal
  (and
   (pred_6 obj_13)
   (pred_6 obj_10)
   (pred_6 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_13)) (not (pred_6 obj_10))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_12)))
  )
)
)
