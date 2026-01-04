; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1967935042 --problem-name spanner-s3-n2-l4-s1967935042
(define (problem spanner-s3-n2-l4-s1967935042)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_05 obj_06 obj_09 - type_2
     obj_03 obj_01 - type_5
     obj_11 obj_10 obj_12 obj_04 - type_1
     obj_07 obj_02 - type_1
    )
 (:init 
    (pred_6 obj_08 obj_07)
    (pred_6 obj_05 obj_10)
    (pred_2 obj_05)
    (pred_6 obj_06 obj_10)
    (pred_2 obj_06)
    (pred_6 obj_09 obj_11)
    (pred_2 obj_09)
    (pred_1 obj_03)
    (pred_6 obj_03 obj_02)
    (pred_1 obj_01)
    (pred_6 obj_01 obj_02)
    (pred_4 obj_07 obj_11)
    (pred_4 obj_04 obj_02)
    (pred_4 obj_11 obj_10)
    (pred_4 obj_10 obj_12)
    (pred_4 obj_12 obj_04)
)
 (:goal
  (and
   (pred_3 obj_03)
   (pred_3 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_01))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_07)))
  )
)
)
