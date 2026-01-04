; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 24303772 --problem-name spanner-s3-n2-l4-s24303772
(define (problem spanner-s3-n2-l4-s24303772)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_01 obj_08 obj_07 - type_2
     obj_09 obj_11 - type_3
     obj_12 obj_03 obj_10 obj_05 - type_1
     obj_04 obj_02 - type_1
    )
 (:init 
    (pred_4 obj_06 obj_04)
    (pred_4 obj_01 obj_03)
    (pred_3 obj_01)
    (pred_4 obj_08 obj_12)
    (pred_3 obj_08)
    (pred_4 obj_07 obj_12)
    (pred_3 obj_07)
    (pred_6 obj_09)
    (pred_4 obj_09 obj_02)
    (pred_6 obj_11)
    (pred_4 obj_11 obj_02)
    (pred_2 obj_04 obj_12)
    (pred_2 obj_05 obj_02)
    (pred_2 obj_12 obj_03)
    (pred_2 obj_03 obj_10)
    (pred_2 obj_10 obj_05)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_04)))
  )
)
)
