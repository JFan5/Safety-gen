; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 913678599 --problem-name spanner-s3-n3-l4-s913678599
(define (problem spanner-s3-n3-l4-s913678599)
 (:domain spanner)
 (:objects 
     obj_12 - type_5
     obj_03 obj_10 obj_01 - type_3
     obj_09 obj_05 obj_07 - type_1
     obj_02 obj_13 obj_08 obj_06 - type_2
     obj_04 obj_11 - type_2
    )
 (:init 
    (pred_6 obj_12 obj_04)
    (pred_6 obj_03 obj_08)
    (pred_5 obj_03)
    (pred_6 obj_10 obj_13)
    (pred_5 obj_10)
    (pred_6 obj_01 obj_02)
    (pred_5 obj_01)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_11)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_11)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_11)
    (pred_3 obj_04 obj_02)
    (pred_3 obj_06 obj_11)
    (pred_3 obj_02 obj_13)
    (pred_3 obj_13 obj_08)
    (pred_3 obj_08 obj_06)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_05)
   (pred_1 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_04)))
  )
)
)
