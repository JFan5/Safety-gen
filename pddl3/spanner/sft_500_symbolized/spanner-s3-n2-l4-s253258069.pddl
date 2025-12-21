; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 253258069 --problem-name spanner-s3-n2-l4-s253258069
(define (problem spanner-s3-n2-l4-s253258069)
 (:domain spanner)
 (:objects 
     obj_01 - type_3
     obj_03 obj_10 obj_05 - type_5
     obj_11 obj_08 - type_4
     obj_07 obj_12 obj_09 obj_04 - type_2
     obj_06 obj_02 - type_2
    )
 (:init 
    (pred_2 obj_01 obj_06)
    (pred_2 obj_03 obj_12)
    (pred_1 obj_03)
    (pred_2 obj_10 obj_09)
    (pred_1 obj_10)
    (pred_2 obj_05 obj_12)
    (pred_1 obj_05)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_02)
    (pred_5 obj_08)
    (pred_2 obj_08 obj_02)
    (pred_6 obj_06 obj_07)
    (pred_6 obj_04 obj_02)
    (pred_6 obj_07 obj_12)
    (pred_6 obj_12 obj_09)
    (pred_6 obj_09 obj_04)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_11)) (not (pred_3 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_06)))
  )
)
)
