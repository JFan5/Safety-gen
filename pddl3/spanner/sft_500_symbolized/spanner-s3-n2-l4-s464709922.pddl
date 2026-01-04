; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 464709922 --problem-name spanner-s3-n2-l4-s464709922
(define (problem spanner-s3-n2-l4-s464709922)
 (:domain spanner)
 (:objects 
     obj_03 - type_4
     obj_04 obj_09 obj_06 - type_3
     obj_11 obj_02 - type_5
     obj_07 obj_10 obj_12 obj_05 - type_1
     obj_01 obj_08 - type_1
    )
 (:init 
    (pred_6 obj_03 obj_01)
    (pred_6 obj_04 obj_05)
    (pred_5 obj_04)
    (pred_6 obj_09 obj_07)
    (pred_5 obj_09)
    (pred_6 obj_06 obj_05)
    (pred_5 obj_06)
    (pred_3 obj_11)
    (pred_6 obj_11 obj_08)
    (pred_3 obj_02)
    (pred_6 obj_02 obj_08)
    (pred_4 obj_01 obj_07)
    (pred_4 obj_05 obj_08)
    (pred_4 obj_07 obj_10)
    (pred_4 obj_10 obj_12)
    (pred_4 obj_12 obj_05)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_01)))
  )
)
)
