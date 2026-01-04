; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1981771177 --problem-name spanner-s3-n3-l4-s1981771177
(define (problem spanner-s3-n3-l4-s1981771177)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_08 obj_10 obj_05 - type_3
     obj_07 obj_01 obj_13 - type_4
     obj_04 obj_11 obj_02 obj_12 - type_5
     obj_06 obj_09 - type_5
    )
 (:init 
    (pred_4 obj_03 obj_06)
    (pred_4 obj_08 obj_04)
    (pred_3 obj_08)
    (pred_4 obj_10 obj_11)
    (pred_3 obj_10)
    (pred_4 obj_05 obj_02)
    (pred_3 obj_05)
    (pred_6 obj_07)
    (pred_4 obj_07 obj_09)
    (pred_6 obj_01)
    (pred_4 obj_01 obj_09)
    (pred_6 obj_13)
    (pred_4 obj_13 obj_09)
    (pred_2 obj_06 obj_04)
    (pred_2 obj_12 obj_09)
    (pred_2 obj_04 obj_11)
    (pred_2 obj_11 obj_02)
    (pred_2 obj_02 obj_12)
)
 (:goal
  (and
   (pred_1 obj_07)
   (pred_1 obj_01)
   (pred_1 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_01))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_06)))
  )
)
)
