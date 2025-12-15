; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 825637698 --problem-name spanner-s3-n3-l4-s825637698
(define (problem spanner-s3-n3-l4-s825637698)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_04 obj_03 obj_07 - type_5
     obj_01 obj_08 obj_05 - type_1
     obj_10 obj_12 obj_09 obj_13 - type_3
     obj_11 obj_06 - type_3
    )
 (:init 
    (pred_3 obj_02 obj_11)
    (pred_3 obj_04 obj_09)
    (pred_1 obj_04)
    (pred_3 obj_03 obj_09)
    (pred_1 obj_03)
    (pred_3 obj_07 obj_09)
    (pred_1 obj_07)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_06)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_06)
    (pred_5 obj_05)
    (pred_3 obj_05 obj_06)
    (pred_4 obj_11 obj_10)
    (pred_4 obj_13 obj_06)
    (pred_4 obj_10 obj_12)
    (pred_4 obj_12 obj_09)
    (pred_4 obj_09 obj_13)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_08)
   (pred_2 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_08)) (not (pred_2 obj_05))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
