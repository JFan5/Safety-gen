; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 710078358 --problem-name spanner-s3-n2-l4-s710078358
(define (problem spanner-s3-n2-l4-s710078358)
 (:domain spanner)
 (:objects 
     obj_07 - type_1
     obj_03 obj_12 obj_01 - type_2
     obj_08 obj_04 - type_4
     obj_10 obj_05 obj_11 obj_02 - type_5
     obj_06 obj_09 - type_5
    )
 (:init 
    (pred_2 obj_07 obj_06)
    (pred_2 obj_03 obj_10)
    (pred_4 obj_03)
    (pred_2 obj_12 obj_11)
    (pred_4 obj_12)
    (pred_2 obj_01 obj_11)
    (pred_4 obj_01)
    (pred_5 obj_08)
    (pred_2 obj_08 obj_09)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_09)
    (pred_3 obj_06 obj_10)
    (pred_3 obj_02 obj_09)
    (pred_3 obj_10 obj_05)
    (pred_3 obj_05 obj_11)
    (pred_3 obj_11 obj_02)
)
 (:goal
  (and
   (pred_1 obj_08)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_08)) (not (pred_1 obj_04))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_06)))
  )
)
)
