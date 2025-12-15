; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 24303772 --problem-name spanner-s3-n2-l4-s24303772
(define (problem spanner-s3-n2-l4-s24303772)
 (:domain spanner)
 (:objects 
     obj_09 - type_3
     obj_11 obj_06 obj_08 - type_2
     obj_07 obj_05 - type_4
     obj_03 obj_10 obj_12 obj_02 - type_1
     obj_01 obj_04 - type_1
    )
 (:init 
    (pred_3 obj_09 obj_01)
    (pred_3 obj_11 obj_10)
    (pred_1 obj_11)
    (pred_3 obj_06 obj_03)
    (pred_1 obj_06)
    (pred_3 obj_08 obj_03)
    (pred_1 obj_08)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_04)
    (pred_5 obj_05)
    (pred_3 obj_05 obj_04)
    (pred_4 obj_01 obj_03)
    (pred_4 obj_02 obj_04)
    (pred_4 obj_03 obj_10)
    (pred_4 obj_10 obj_12)
    (pred_4 obj_12 obj_02)
)
 (:goal
  (and
   (pred_6 obj_07)
   (pred_6 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_07)) (not (pred_6 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_01)))
  )
)
)
