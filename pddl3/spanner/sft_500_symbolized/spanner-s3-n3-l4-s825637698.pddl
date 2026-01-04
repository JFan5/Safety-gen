; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 825637698 --problem-name spanner-s3-n3-l4-s825637698
(define (problem spanner-s3-n3-l4-s825637698)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_13 obj_07 obj_12 - type_2
     obj_09 obj_05 obj_06 - type_4
     obj_10 obj_04 obj_03 obj_02 - type_3
     obj_01 obj_11 - type_3
    )
 (:init 
    (pred_3 obj_08 obj_01)
    (pred_3 obj_13 obj_03)
    (pred_2 obj_13)
    (pred_3 obj_07 obj_03)
    (pred_2 obj_07)
    (pred_3 obj_12 obj_03)
    (pred_2 obj_12)
    (pred_6 obj_09)
    (pred_3 obj_09 obj_11)
    (pred_6 obj_05)
    (pred_3 obj_05 obj_11)
    (pred_6 obj_06)
    (pred_3 obj_06 obj_11)
    (pred_1 obj_01 obj_10)
    (pred_1 obj_02 obj_11)
    (pred_1 obj_10 obj_04)
    (pred_1 obj_04 obj_03)
    (pred_1 obj_03 obj_02)
)
 (:goal
  (and
   (pred_5 obj_09)
   (pred_5 obj_05)
   (pred_5 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_05)) (not (pred_5 obj_06))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_01)))
  )
)
)
