; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1538355567 --problem-name spanner-s3-n3-l4-s1538355567
(define (problem spanner-s3-n3-l4-s1538355567)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_07 obj_10 obj_12 - type_1
     obj_08 obj_06 obj_09 - type_2
     obj_05 obj_04 obj_01 obj_03 - type_5
     obj_11 obj_13 - type_5
    )
 (:init 
    (pred_1 obj_02 obj_11)
    (pred_1 obj_07 obj_05)
    (pred_5 obj_07)
    (pred_1 obj_10 obj_03)
    (pred_5 obj_10)
    (pred_1 obj_12 obj_01)
    (pred_5 obj_12)
    (pred_6 obj_08)
    (pred_1 obj_08 obj_13)
    (pred_6 obj_06)
    (pred_1 obj_06 obj_13)
    (pred_6 obj_09)
    (pred_1 obj_09 obj_13)
    (pred_3 obj_11 obj_05)
    (pred_3 obj_03 obj_13)
    (pred_3 obj_05 obj_04)
    (pred_3 obj_04 obj_01)
    (pred_3 obj_01 obj_03)
)
 (:goal
  (and
   (pred_4 obj_08)
   (pred_4 obj_06)
   (pred_4 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_08)) (not (pred_4 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_11)))
  )
)
)
