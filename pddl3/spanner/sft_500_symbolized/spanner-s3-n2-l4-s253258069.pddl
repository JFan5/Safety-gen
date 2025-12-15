; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 253258069 --problem-name spanner-s3-n2-l4-s253258069
(define (problem spanner-s3-n2-l4-s253258069)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_10 obj_12 obj_07 - type_4
     obj_11 obj_06 - type_3
     obj_04 obj_05 obj_08 obj_01 - type_1
     obj_02 obj_03 - type_1
    )
 (:init 
    (pred_4 obj_09 obj_02)
    (pred_4 obj_10 obj_05)
    (pred_5 obj_10)
    (pred_4 obj_12 obj_08)
    (pred_5 obj_12)
    (pred_4 obj_07 obj_05)
    (pred_5 obj_07)
    (pred_6 obj_11)
    (pred_4 obj_11 obj_03)
    (pred_6 obj_06)
    (pred_4 obj_06 obj_03)
    (pred_2 obj_02 obj_04)
    (pred_2 obj_01 obj_03)
    (pred_2 obj_04 obj_05)
    (pred_2 obj_05 obj_08)
    (pred_2 obj_08 obj_01)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_06))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_02)))
  )
)
)
