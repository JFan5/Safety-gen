; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1408015783 --problem-name spanner-s3-n3-l4-s1408015783
(define (problem spanner-s3-n3-l4-s1408015783)
 (:domain spanner)
 (:objects 
     obj_05 - type_3
     obj_04 obj_09 obj_01 - type_4
     obj_07 obj_10 obj_06 - type_2
     obj_02 obj_13 obj_11 obj_08 - type_1
     obj_12 obj_03 - type_1
    )
 (:init 
    (pred_4 obj_05 obj_12)
    (pred_4 obj_04 obj_11)
    (pred_2 obj_04)
    (pred_4 obj_09 obj_02)
    (pred_2 obj_09)
    (pred_4 obj_01 obj_11)
    (pred_2 obj_01)
    (pred_6 obj_07)
    (pred_4 obj_07 obj_03)
    (pred_6 obj_10)
    (pred_4 obj_10 obj_03)
    (pred_6 obj_06)
    (pred_4 obj_06 obj_03)
    (pred_3 obj_12 obj_02)
    (pred_3 obj_08 obj_03)
    (pred_3 obj_02 obj_13)
    (pred_3 obj_13 obj_11)
    (pred_3 obj_11 obj_08)
)
 (:goal
  (and
   (pred_5 obj_07)
   (pred_5 obj_10)
   (pred_5 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_10)) (not (pred_5 obj_06))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_12)))
  )
)
)
