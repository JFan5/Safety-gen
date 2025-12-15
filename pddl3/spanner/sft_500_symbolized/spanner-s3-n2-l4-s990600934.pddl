; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 990600934 --problem-name spanner-s3-n2-l4-s990600934
(define (problem spanner-s3-n2-l4-s990600934)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_09 obj_03 obj_11 - type_4
     obj_10 obj_04 - type_1
     obj_07 obj_06 obj_08 obj_01 - type_3
     obj_05 obj_12 - type_3
    )
 (:init 
    (pred_2 obj_02 obj_05)
    (pred_2 obj_09 obj_06)
    (pred_6 obj_09)
    (pred_2 obj_03 obj_08)
    (pred_6 obj_03)
    (pred_2 obj_11 obj_08)
    (pred_6 obj_11)
    (pred_5 obj_10)
    (pred_2 obj_10 obj_12)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_12)
    (pred_1 obj_05 obj_07)
    (pred_1 obj_01 obj_12)
    (pred_1 obj_07 obj_06)
    (pred_1 obj_06 obj_08)
    (pred_1 obj_08 obj_01)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_04))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_05)))
  )
)
)
