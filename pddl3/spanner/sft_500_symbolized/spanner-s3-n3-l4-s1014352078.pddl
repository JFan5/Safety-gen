; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1014352078 --problem-name spanner-s3-n3-l4-s1014352078
(define (problem spanner-s3-n3-l4-s1014352078)
 (:domain spanner)
 (:objects 
     obj_07 - type_4
     obj_05 obj_13 obj_02 - type_3
     obj_11 obj_01 obj_06 - type_1
     obj_10 obj_08 obj_04 obj_03 - type_2
     obj_12 obj_09 - type_2
    )
 (:init 
    (pred_6 obj_07 obj_12)
    (pred_6 obj_05 obj_08)
    (pred_4 obj_05)
    (pred_6 obj_13 obj_03)
    (pred_4 obj_13)
    (pred_6 obj_02 obj_10)
    (pred_4 obj_02)
    (pred_1 obj_11)
    (pred_6 obj_11 obj_09)
    (pred_1 obj_01)
    (pred_6 obj_01 obj_09)
    (pred_1 obj_06)
    (pred_6 obj_06 obj_09)
    (pred_3 obj_12 obj_10)
    (pred_3 obj_03 obj_09)
    (pred_3 obj_10 obj_08)
    (pred_3 obj_08 obj_04)
    (pred_3 obj_04 obj_03)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_01)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_01))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
