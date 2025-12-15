; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1094073249 --problem-name spanner-s3-n3-l4-s1094073249
(define (problem spanner-s3-n3-l4-s1094073249)
 (:domain spanner)
 (:objects 
     obj_01 - type_2
     obj_07 obj_12 obj_06 - type_3
     obj_02 obj_03 obj_04 - type_5
     obj_13 obj_11 obj_08 obj_05 - type_1
     obj_09 obj_10 - type_1
    )
 (:init 
    (pred_5 obj_01 obj_09)
    (pred_5 obj_07 obj_08)
    (pred_4 obj_07)
    (pred_5 obj_12 obj_05)
    (pred_4 obj_12)
    (pred_5 obj_06 obj_08)
    (pred_4 obj_06)
    (pred_3 obj_02)
    (pred_5 obj_02 obj_10)
    (pred_3 obj_03)
    (pred_5 obj_03 obj_10)
    (pred_3 obj_04)
    (pred_5 obj_04 obj_10)
    (pred_6 obj_09 obj_13)
    (pred_6 obj_05 obj_10)
    (pred_6 obj_13 obj_11)
    (pred_6 obj_11 obj_08)
    (pred_6 obj_08 obj_05)
)
 (:goal
  (and
   (pred_1 obj_02)
   (pred_1 obj_03)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_03)) (not (pred_1 obj_04))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_09)))
  )
)
)
