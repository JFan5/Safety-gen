; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1094073249 --problem-name spanner-s3-n3-l4-s1094073249
(define (problem spanner-s3-n3-l4-s1094073249)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_03 obj_04 obj_12 - type_5
     obj_06 obj_07 obj_08 - type_2
     obj_02 obj_09 obj_01 obj_11 - type_4
     obj_13 obj_05 - type_4
    )
 (:init 
    (pred_4 obj_10 obj_13)
    (pred_4 obj_03 obj_01)
    (pred_5 obj_03)
    (pred_4 obj_04 obj_11)
    (pred_5 obj_04)
    (pred_4 obj_12 obj_01)
    (pred_5 obj_12)
    (pred_3 obj_06)
    (pred_4 obj_06 obj_05)
    (pred_3 obj_07)
    (pred_4 obj_07 obj_05)
    (pred_3 obj_08)
    (pred_4 obj_08 obj_05)
    (pred_1 obj_13 obj_02)
    (pred_1 obj_11 obj_05)
    (pred_1 obj_02 obj_09)
    (pred_1 obj_09 obj_01)
    (pred_1 obj_01 obj_11)
)
 (:goal
  (and
   (pred_2 obj_06)
   (pred_2 obj_07)
   (pred_2 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_13)))
  )
)
)
