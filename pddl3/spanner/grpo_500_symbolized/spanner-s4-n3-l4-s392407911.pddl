; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 392407911 --problem-name spanner-s4-n3-l4-s392407911
(define (problem spanner-s4-n3-l4-s392407911)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_03 obj_12 obj_14 obj_08 - type_3
     obj_09 obj_02 obj_10 - type_1
     obj_13 obj_11 obj_01 obj_07 - type_2
     obj_06 obj_04 - type_2
    )
 (:init 
    (pred_6 obj_05 obj_06)
    (pred_6 obj_03 obj_01)
    (pred_5 obj_03)
    (pred_6 obj_12 obj_11)
    (pred_5 obj_12)
    (pred_6 obj_14 obj_01)
    (pred_5 obj_14)
    (pred_6 obj_08 obj_01)
    (pred_5 obj_08)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_04)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_04)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_04)
    (pred_3 obj_06 obj_13)
    (pred_3 obj_07 obj_04)
    (pred_3 obj_13 obj_11)
    (pred_3 obj_11 obj_01)
    (pred_3 obj_01 obj_07)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_02)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
