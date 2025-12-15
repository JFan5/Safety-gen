; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 609260874 --problem-name spanner-s3-n2-l4-s609260874
(define (problem spanner-s3-n2-l4-s609260874)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_11 obj_08 obj_04 - type_4
     obj_03 obj_01 - type_1
     obj_06 obj_07 obj_12 obj_09 - type_5
     obj_10 obj_02 - type_5
    )
 (:init 
    (pred_5 obj_05 obj_10)
    (pred_5 obj_11 obj_06)
    (pred_3 obj_11)
    (pred_5 obj_08 obj_06)
    (pred_3 obj_08)
    (pred_5 obj_04 obj_06)
    (pred_3 obj_04)
    (pred_2 obj_03)
    (pred_5 obj_03 obj_02)
    (pred_2 obj_01)
    (pred_5 obj_01 obj_02)
    (pred_6 obj_10 obj_06)
    (pred_6 obj_09 obj_02)
    (pred_6 obj_06 obj_07)
    (pred_6 obj_07 obj_12)
    (pred_6 obj_12 obj_09)
)
 (:goal
  (and
   (pred_4 obj_03)
   (pred_4 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_03)) (not (pred_4 obj_01))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
