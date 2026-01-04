; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 253258069 --problem-name spanner-s3-n2-l4-s253258069
(define (problem spanner-s3-n2-l4-s253258069)
 (:domain spanner)
 (:objects 
     obj_08 - type_1
     obj_01 obj_03 obj_10 - type_4
     obj_06 obj_04 - type_3
     obj_12 obj_11 obj_05 obj_07 - type_2
     obj_09 obj_02 - type_2
    )
 (:init 
    (pred_6 obj_08 obj_09)
    (pred_6 obj_01 obj_11)
    (pred_4 obj_01)
    (pred_6 obj_03 obj_05)
    (pred_4 obj_03)
    (pred_6 obj_10 obj_11)
    (pred_4 obj_10)
    (pred_1 obj_06)
    (pred_6 obj_06 obj_02)
    (pred_1 obj_04)
    (pred_6 obj_04 obj_02)
    (pred_3 obj_09 obj_12)
    (pred_3 obj_07 obj_02)
    (pred_3 obj_12 obj_11)
    (pred_3 obj_11 obj_05)
    (pred_3 obj_05 obj_07)
)
 (:goal
  (and
   (pred_5 obj_06)
   (pred_5 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_06)) (not (pred_5 obj_04))))
    (forall (?m - type_1) (at-most-once (pred_6 ?m obj_09)))
  )
)
)
