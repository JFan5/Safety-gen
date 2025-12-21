; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 152292006 --problem-name spanner-s3-n2-l4-s152292006
(define (problem spanner-s3-n2-l4-s152292006)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_08 obj_03 obj_05 - type_5
     obj_02 obj_11 - type_4
     obj_01 obj_07 obj_04 obj_09 - type_2
     obj_10 obj_06 - type_2
    )
 (:init 
    (pred_2 obj_12 obj_10)
    (pred_2 obj_08 obj_01)
    (pred_1 obj_08)
    (pred_2 obj_03 obj_04)
    (pred_1 obj_03)
    (pred_2 obj_05 obj_01)
    (pred_1 obj_05)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_06)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_06)
    (pred_6 obj_10 obj_01)
    (pred_6 obj_09 obj_06)
    (pred_6 obj_01 obj_07)
    (pred_6 obj_07 obj_04)
    (pred_6 obj_04 obj_09)
)
 (:goal
  (and
   (pred_3 obj_02)
   (pred_3 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_02)) (not (pred_3 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
