; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1014352078 --problem-name spanner-s3-n3-l4-s1014352078
(define (problem spanner-s3-n3-l4-s1014352078)
 (:domain spanner)
 (:objects 
     obj_07 - type_2
     obj_13 obj_08 obj_09 - type_3
     obj_12 obj_01 obj_02 - type_5
     obj_10 obj_05 obj_06 obj_04 - type_4
     obj_03 obj_11 - type_4
    )
 (:init 
    (pred_6 obj_07 obj_03)
    (pred_6 obj_13 obj_05)
    (pred_5 obj_13)
    (pred_6 obj_08 obj_04)
    (pred_5 obj_08)
    (pred_6 obj_09 obj_10)
    (pred_5 obj_09)
    (pred_1 obj_12)
    (pred_6 obj_12 obj_11)
    (pred_1 obj_01)
    (pred_6 obj_01 obj_11)
    (pred_1 obj_02)
    (pred_6 obj_02 obj_11)
    (pred_4 obj_03 obj_10)
    (pred_4 obj_04 obj_11)
    (pred_4 obj_10 obj_05)
    (pred_4 obj_05 obj_06)
    (pred_4 obj_06 obj_04)
)
 (:goal
  (and
   (pred_3 obj_12)
   (pred_3 obj_01)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_12)) (not (pred_3 obj_01))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
