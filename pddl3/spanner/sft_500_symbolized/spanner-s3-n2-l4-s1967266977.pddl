; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1967266977 --problem-name spanner-s3-n2-l4-s1967266977
(define (problem spanner-s3-n2-l4-s1967266977)
 (:domain spanner)
 (:objects 
     obj_04 - type_4
     obj_01 obj_06 obj_02 - type_5
     obj_10 obj_03 - type_3
     obj_12 obj_07 obj_08 obj_11 - type_1
     obj_09 obj_05 - type_1
    )
 (:init 
    (pred_4 obj_04 obj_09)
    (pred_4 obj_01 obj_11)
    (pred_2 obj_01)
    (pred_4 obj_06 obj_12)
    (pred_2 obj_06)
    (pred_4 obj_02 obj_12)
    (pred_2 obj_02)
    (pred_6 obj_10)
    (pred_4 obj_10 obj_05)
    (pred_6 obj_03)
    (pred_4 obj_03 obj_05)
    (pred_3 obj_09 obj_12)
    (pred_3 obj_11 obj_05)
    (pred_3 obj_12 obj_07)
    (pred_3 obj_07 obj_08)
    (pred_3 obj_08 obj_11)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_10)) (not (pred_1 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_09)))
  )
)
)
