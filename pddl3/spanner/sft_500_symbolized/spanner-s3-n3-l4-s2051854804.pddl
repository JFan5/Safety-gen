; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2051854804 --problem-name spanner-s3-n3-l4-s2051854804
(define (problem spanner-s3-n3-l4-s2051854804)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_05 obj_04 obj_08 - type_5
     obj_09 obj_12 obj_11 - type_3
     obj_01 obj_13 obj_03 obj_10 - type_2
     obj_07 obj_06 - type_2
    )
 (:init 
    (pred_3 obj_02 obj_07)
    (pred_3 obj_05 obj_03)
    (pred_2 obj_05)
    (pred_3 obj_04 obj_13)
    (pred_2 obj_04)
    (pred_3 obj_08 obj_03)
    (pred_2 obj_08)
    (pred_6 obj_09)
    (pred_3 obj_09 obj_06)
    (pred_6 obj_12)
    (pred_3 obj_12 obj_06)
    (pred_6 obj_11)
    (pred_3 obj_11 obj_06)
    (pred_5 obj_07 obj_01)
    (pred_5 obj_10 obj_06)
    (pred_5 obj_01 obj_13)
    (pred_5 obj_13 obj_03)
    (pred_5 obj_03 obj_10)
)
 (:goal
  (and
   (pred_4 obj_09)
   (pred_4 obj_12)
   (pred_4 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_12)) (not (pred_4 obj_11))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
