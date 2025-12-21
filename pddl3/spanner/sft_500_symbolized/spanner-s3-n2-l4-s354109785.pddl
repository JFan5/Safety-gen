; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 354109785 --problem-name spanner-s3-n2-l4-s354109785
(define (problem spanner-s3-n2-l4-s354109785)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_04 obj_05 obj_07 - type_5
     obj_11 obj_12 - type_4
     obj_10 obj_03 obj_01 obj_08 - type_2
     obj_09 obj_02 - type_2
    )
 (:init 
    (pred_2 obj_06 obj_09)
    (pred_2 obj_04 obj_08)
    (pred_1 obj_04)
    (pred_2 obj_05 obj_08)
    (pred_1 obj_05)
    (pred_2 obj_07 obj_01)
    (pred_1 obj_07)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_02)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_02)
    (pred_6 obj_09 obj_10)
    (pred_6 obj_08 obj_02)
    (pred_6 obj_10 obj_03)
    (pred_6 obj_03 obj_01)
    (pred_6 obj_01 obj_08)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_11)) (not (pred_3 obj_12))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
