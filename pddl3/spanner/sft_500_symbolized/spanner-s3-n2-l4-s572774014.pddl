; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 572774014 --problem-name spanner-s3-n2-l4-s572774014
(define (problem spanner-s3-n2-l4-s572774014)
 (:domain spanner)
 (:objects 
     obj_12 - type_2
     obj_05 obj_03 obj_04 - type_4
     obj_01 obj_11 - type_5
     obj_09 obj_07 obj_02 obj_08 - type_1
     obj_10 obj_06 - type_1
    )
 (:init 
    (pred_6 obj_12 obj_10)
    (pred_6 obj_05 obj_02)
    (pred_4 obj_05)
    (pred_6 obj_03 obj_07)
    (pred_4 obj_03)
    (pred_6 obj_04 obj_02)
    (pred_4 obj_04)
    (pred_3 obj_01)
    (pred_6 obj_01 obj_06)
    (pred_3 obj_11)
    (pred_6 obj_11 obj_06)
    (pred_5 obj_10 obj_09)
    (pred_5 obj_08 obj_06)
    (pred_5 obj_09 obj_07)
    (pred_5 obj_07 obj_02)
    (pred_5 obj_02 obj_08)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_11))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_10)))
  )
)
)
