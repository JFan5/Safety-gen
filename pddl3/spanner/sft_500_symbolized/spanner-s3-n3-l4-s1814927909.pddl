; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1814927909 --problem-name spanner-s3-n3-l4-s1814927909
(define (problem spanner-s3-n3-l4-s1814927909)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_12 obj_06 obj_03 - type_4
     obj_07 obj_04 obj_05 - type_2
     obj_08 obj_02 obj_10 obj_01 - type_3
     obj_11 obj_09 - type_3
    )
 (:init 
    (pred_4 obj_13 obj_11)
    (pred_4 obj_12 obj_10)
    (pred_1 obj_12)
    (pred_4 obj_06 obj_02)
    (pred_1 obj_06)
    (pred_4 obj_03 obj_08)
    (pred_1 obj_03)
    (pred_3 obj_07)
    (pred_4 obj_07 obj_09)
    (pred_3 obj_04)
    (pred_4 obj_04 obj_09)
    (pred_3 obj_05)
    (pred_4 obj_05 obj_09)
    (pred_5 obj_11 obj_08)
    (pred_5 obj_01 obj_09)
    (pred_5 obj_08 obj_02)
    (pred_5 obj_02 obj_10)
    (pred_5 obj_10 obj_01)
)
 (:goal
  (and
   (pred_6 obj_07)
   (pred_6 obj_04)
   (pred_6 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_04)) (not (pred_6 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_11)))
  )
)
)
