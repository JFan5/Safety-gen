; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1918038296 --problem-name spanner-s4-n3-l4-s1918038296
(define (problem spanner-s4-n3-l4-s1918038296)
 (:domain spanner)
 (:objects 
     obj_14 - type_4
     obj_09 obj_02 obj_04 obj_10 - type_1
     obj_05 obj_03 obj_01 - type_5
     obj_06 obj_07 obj_08 obj_12 - type_2
     obj_11 obj_13 - type_2
    )
 (:init 
    (pred_1 obj_14 obj_11)
    (pred_1 obj_09 obj_07)
    (pred_3 obj_09)
    (pred_1 obj_02 obj_07)
    (pred_3 obj_02)
    (pred_1 obj_04 obj_07)
    (pred_3 obj_04)
    (pred_1 obj_10 obj_08)
    (pred_3 obj_10)
    (pred_4 obj_05)
    (pred_1 obj_05 obj_13)
    (pred_4 obj_03)
    (pred_1 obj_03 obj_13)
    (pred_4 obj_01)
    (pred_1 obj_01 obj_13)
    (pred_2 obj_11 obj_06)
    (pred_2 obj_12 obj_13)
    (pred_2 obj_06 obj_07)
    (pred_2 obj_07 obj_08)
    (pred_2 obj_08 obj_12)
)
 (:goal
  (and
   (pred_5 obj_05)
   (pred_5 obj_03)
   (pred_5 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_05)) (not (pred_5 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_11)))
  )
)
)
