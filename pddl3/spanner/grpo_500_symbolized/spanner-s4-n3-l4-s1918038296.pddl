; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1918038296 --problem-name spanner-s4-n3-l4-s1918038296
(define (problem spanner-s4-n3-l4-s1918038296)
 (:domain spanner)
 (:objects 
     obj_06 - type_4
     obj_14 obj_13 obj_05 obj_10 - type_5
     obj_12 obj_08 obj_11 - type_1
     obj_07 obj_09 obj_02 obj_01 - type_3
     obj_04 obj_03 - type_3
    )
 (:init 
    (pred_3 obj_06 obj_04)
    (pred_3 obj_14 obj_09)
    (pred_1 obj_14)
    (pred_3 obj_13 obj_09)
    (pred_1 obj_13)
    (pred_3 obj_05 obj_09)
    (pred_1 obj_05)
    (pred_3 obj_10 obj_02)
    (pred_1 obj_10)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_03)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_03)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_03)
    (pred_4 obj_04 obj_07)
    (pred_4 obj_01 obj_03)
    (pred_4 obj_07 obj_09)
    (pred_4 obj_09 obj_02)
    (pred_4 obj_02 obj_01)
)
 (:goal
  (and
   (pred_2 obj_12)
   (pred_2 obj_08)
   (pred_2 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_12)) (not (pred_2 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_04)))
  )
)
)
