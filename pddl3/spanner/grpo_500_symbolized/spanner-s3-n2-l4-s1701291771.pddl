; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1701291771 --problem-name spanner-s3-n2-l4-s1701291771
(define (problem spanner-s3-n2-l4-s1701291771)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_03 obj_11 obj_12 - type_5
     obj_02 obj_09 - type_1
     obj_10 obj_06 obj_01 obj_08 - type_3
     obj_07 obj_04 - type_3
    )
 (:init 
    (pred_3 obj_05 obj_07)
    (pred_3 obj_03 obj_08)
    (pred_1 obj_03)
    (pred_3 obj_11 obj_06)
    (pred_1 obj_11)
    (pred_3 obj_12 obj_08)
    (pred_1 obj_12)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_04)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_04)
    (pred_4 obj_07 obj_10)
    (pred_4 obj_08 obj_04)
    (pred_4 obj_10 obj_06)
    (pred_4 obj_06 obj_01)
    (pred_4 obj_01 obj_08)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
