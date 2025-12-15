; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 464709922 --problem-name spanner-s3-n2-l4-s464709922
(define (problem spanner-s3-n2-l4-s464709922)
 (:domain spanner)
 (:objects 
     obj_01 - type_1
     obj_02 obj_03 obj_05 - type_4
     obj_07 obj_10 - type_5
     obj_11 obj_04 obj_09 obj_06 - type_3
     obj_08 obj_12 - type_3
    )
 (:init 
    (pred_2 obj_01 obj_08)
    (pred_2 obj_02 obj_06)
    (pred_1 obj_02)
    (pred_2 obj_03 obj_11)
    (pred_1 obj_03)
    (pred_2 obj_05 obj_06)
    (pred_1 obj_05)
    (pred_5 obj_07)
    (pred_2 obj_07 obj_12)
    (pred_5 obj_10)
    (pred_2 obj_10 obj_12)
    (pred_6 obj_08 obj_11)
    (pred_6 obj_06 obj_12)
    (pred_6 obj_11 obj_04)
    (pred_6 obj_04 obj_09)
    (pred_6 obj_09 obj_06)
)
 (:goal
  (and
   (pred_4 obj_07)
   (pred_4 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_07)) (not (pred_4 obj_10))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
