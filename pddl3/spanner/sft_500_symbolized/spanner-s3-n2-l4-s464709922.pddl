; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 464709922 --problem-name spanner-s3-n2-l4-s464709922
(define (problem spanner-s3-n2-l4-s464709922)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_12 obj_10 obj_11 - type_5
     obj_01 obj_05 - type_4
     obj_08 obj_04 obj_03 obj_06 - type_2
     obj_07 obj_09 - type_2
    )
 (:init 
    (pred_2 obj_02 obj_07)
    (pred_2 obj_12 obj_06)
    (pred_1 obj_12)
    (pred_2 obj_10 obj_08)
    (pred_1 obj_10)
    (pred_2 obj_11 obj_06)
    (pred_1 obj_11)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_09)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_09)
    (pred_6 obj_07 obj_08)
    (pred_6 obj_06 obj_09)
    (pred_6 obj_08 obj_04)
    (pred_6 obj_04 obj_03)
    (pred_6 obj_03 obj_06)
)
 (:goal
  (and
   (pred_3 obj_01)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_07)))
  )
)
)
