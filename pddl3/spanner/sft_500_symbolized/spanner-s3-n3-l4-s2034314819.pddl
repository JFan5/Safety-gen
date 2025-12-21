; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2034314819 --problem-name spanner-s3-n3-l4-s2034314819
(define (problem spanner-s3-n3-l4-s2034314819)
 (:domain spanner)
 (:objects 
     obj_01 - type_3
     obj_10 obj_07 obj_13 - type_5
     obj_06 obj_04 obj_11 - type_4
     obj_12 obj_05 obj_08 obj_03 - type_2
     obj_09 obj_02 - type_2
    )
 (:init 
    (pred_2 obj_01 obj_09)
    (pred_2 obj_10 obj_12)
    (pred_1 obj_10)
    (pred_2 obj_07 obj_03)
    (pred_1 obj_07)
    (pred_2 obj_13 obj_08)
    (pred_1 obj_13)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_02)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_02)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_02)
    (pred_6 obj_09 obj_12)
    (pred_6 obj_03 obj_02)
    (pred_6 obj_12 obj_05)
    (pred_6 obj_05 obj_08)
    (pred_6 obj_08 obj_03)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_04)
   (pred_3 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
