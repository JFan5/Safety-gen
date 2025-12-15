; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1290291895 --problem-name spanner-s3-n3-l4-s1290291895
(define (problem spanner-s3-n3-l4-s1290291895)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_01 obj_11 obj_06 - type_4
     obj_03 obj_08 obj_13 - type_1
     obj_05 obj_02 obj_09 obj_04 - type_3
     obj_12 obj_07 - type_3
    )
 (:init 
    (pred_4 obj_10 obj_12)
    (pred_4 obj_01 obj_02)
    (pred_5 obj_01)
    (pred_4 obj_11 obj_04)
    (pred_5 obj_11)
    (pred_4 obj_06 obj_02)
    (pred_5 obj_06)
    (pred_3 obj_03)
    (pred_4 obj_03 obj_07)
    (pred_3 obj_08)
    (pred_4 obj_08 obj_07)
    (pred_3 obj_13)
    (pred_4 obj_13 obj_07)
    (pred_6 obj_12 obj_05)
    (pred_6 obj_04 obj_07)
    (pred_6 obj_05 obj_02)
    (pred_6 obj_02 obj_09)
    (pred_6 obj_09 obj_04)
)
 (:goal
  (and
   (pred_2 obj_03)
   (pred_2 obj_08)
   (pred_2 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_12)))
  )
)
)
