; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1533582912 --problem-name spanner-s3-n3-l4-s1533582912
(define (problem spanner-s3-n3-l4-s1533582912)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_13 obj_08 obj_01 - type_3
     obj_07 obj_02 obj_11 - type_2
     obj_03 obj_04 obj_05 obj_09 - type_1
     obj_12 obj_10 - type_1
    )
 (:init 
    (pred_3 obj_06 obj_12)
    (pred_3 obj_13 obj_05)
    (pred_2 obj_13)
    (pred_3 obj_08 obj_04)
    (pred_2 obj_08)
    (pred_3 obj_01 obj_05)
    (pred_2 obj_01)
    (pred_4 obj_07)
    (pred_3 obj_07 obj_10)
    (pred_4 obj_02)
    (pred_3 obj_02 obj_10)
    (pred_4 obj_11)
    (pred_3 obj_11 obj_10)
    (pred_6 obj_12 obj_03)
    (pred_6 obj_09 obj_10)
    (pred_6 obj_03 obj_04)
    (pred_6 obj_04 obj_05)
    (pred_6 obj_05 obj_09)
)
 (:goal
  (and
   (pred_5 obj_07)
   (pred_5 obj_02)
   (pred_5 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_02)) (not (pred_5 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_12)))
  )
)
)
