; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 426586745 --problem-name spanner-s3-n2-l4-s426586745
(define (problem spanner-s3-n2-l4-s426586745)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_03 obj_04 obj_11 - type_3
     obj_01 obj_05 - type_1
     obj_02 obj_08 obj_12 obj_10 - type_2
     obj_07 obj_09 - type_2
    )
 (:init 
    (pred_6 obj_06 obj_07)
    (pred_6 obj_03 obj_08)
    (pred_5 obj_03)
    (pred_6 obj_04 obj_12)
    (pred_5 obj_04)
    (pred_6 obj_11 obj_12)
    (pred_5 obj_11)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_09)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_09)
    (pred_3 obj_07 obj_02)
    (pred_3 obj_10 obj_09)
    (pred_3 obj_02 obj_08)
    (pred_3 obj_08 obj_12)
    (pred_3 obj_12 obj_10)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_01)) (not (pred_1 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_07)))
  )
)
)
