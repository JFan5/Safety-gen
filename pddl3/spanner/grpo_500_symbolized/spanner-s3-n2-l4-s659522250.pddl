; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 659522250 --problem-name spanner-s3-n2-l4-s659522250
(define (problem spanner-s3-n2-l4-s659522250)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_10 obj_09 obj_03 - type_5
     obj_07 obj_04 - type_1
     obj_01 obj_06 obj_11 obj_12 - type_3
     obj_02 obj_05 - type_3
    )
 (:init 
    (pred_3 obj_08 obj_02)
    (pred_3 obj_10 obj_12)
    (pred_1 obj_10)
    (pred_3 obj_09 obj_12)
    (pred_1 obj_09)
    (pred_3 obj_03 obj_12)
    (pred_1 obj_03)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_05)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_05)
    (pred_4 obj_02 obj_01)
    (pred_4 obj_12 obj_05)
    (pred_4 obj_01 obj_06)
    (pred_4 obj_06 obj_11)
    (pred_4 obj_11 obj_12)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_02)))
  )
)
)
