; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1967935042 --problem-name spanner-s3-n2-l4-s1967935042
(define (problem spanner-s3-n2-l4-s1967935042)
 (:domain spanner)
 (:objects 
     obj_04 - type_2
     obj_06 obj_10 obj_11 - type_5
     obj_02 obj_12 - type_4
     obj_09 obj_08 obj_03 obj_01 - type_1
     obj_05 obj_07 - type_1
    )
 (:init 
    (pred_1 obj_04 obj_05)
    (pred_1 obj_06 obj_08)
    (pred_3 obj_06)
    (pred_1 obj_10 obj_08)
    (pred_3 obj_10)
    (pred_1 obj_11 obj_09)
    (pred_3 obj_11)
    (pred_6 obj_02)
    (pred_1 obj_02 obj_07)
    (pred_6 obj_12)
    (pred_1 obj_12 obj_07)
    (pred_5 obj_05 obj_09)
    (pred_5 obj_01 obj_07)
    (pred_5 obj_09 obj_08)
    (pred_5 obj_08 obj_03)
    (pred_5 obj_03 obj_01)
)
 (:goal
  (and
   (pred_4 obj_02)
   (pred_4 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_02)) (not (pred_4 obj_12))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
