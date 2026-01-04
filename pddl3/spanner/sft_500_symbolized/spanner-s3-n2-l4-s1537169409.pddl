; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1537169409 --problem-name spanner-s3-n2-l4-s1537169409
(define (problem spanner-s3-n2-l4-s1537169409)
 (:domain spanner)
 (:objects 
     obj_12 - type_2
     obj_01 obj_06 obj_04 - type_1
     obj_02 obj_03 - type_4
     obj_05 obj_10 obj_09 obj_11 - type_5
     obj_07 obj_08 - type_5
    )
 (:init 
    (pred_1 obj_12 obj_07)
    (pred_1 obj_01 obj_05)
    (pred_2 obj_01)
    (pred_1 obj_06 obj_10)
    (pred_2 obj_06)
    (pred_1 obj_04 obj_09)
    (pred_2 obj_04)
    (pred_5 obj_02)
    (pred_1 obj_02 obj_08)
    (pred_5 obj_03)
    (pred_1 obj_03 obj_08)
    (pred_3 obj_07 obj_05)
    (pred_3 obj_11 obj_08)
    (pred_3 obj_05 obj_10)
    (pred_3 obj_10 obj_09)
    (pred_3 obj_09 obj_11)
)
 (:goal
  (and
   (pred_6 obj_02)
   (pred_6 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_02)) (not (pred_6 obj_03))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
