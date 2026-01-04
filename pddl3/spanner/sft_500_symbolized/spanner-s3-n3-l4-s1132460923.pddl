; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1132460923 --problem-name spanner-s3-n3-l4-s1132460923
(define (problem spanner-s3-n3-l4-s1132460923)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_08 obj_12 obj_04 - type_2
     obj_13 obj_10 obj_07 - type_3
     obj_02 obj_11 obj_06 obj_01 - type_1
     obj_03 obj_05 - type_1
    )
 (:init 
    (pred_4 obj_09 obj_03)
    (pred_4 obj_08 obj_06)
    (pred_1 obj_08)
    (pred_4 obj_12 obj_11)
    (pred_1 obj_12)
    (pred_4 obj_04 obj_02)
    (pred_1 obj_04)
    (pred_5 obj_13)
    (pred_4 obj_13 obj_05)
    (pred_5 obj_10)
    (pred_4 obj_10 obj_05)
    (pred_5 obj_07)
    (pred_4 obj_07 obj_05)
    (pred_3 obj_03 obj_02)
    (pred_3 obj_01 obj_05)
    (pred_3 obj_02 obj_11)
    (pred_3 obj_11 obj_06)
    (pred_3 obj_06 obj_01)
)
 (:goal
  (and
   (pred_2 obj_13)
   (pred_2 obj_10)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_03)))
  )
)
)
