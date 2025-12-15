; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 2060289450 --problem-name spanner-s3-n2-l4-s2060289450
(define (problem spanner-s3-n2-l4-s2060289450)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_04 obj_11 obj_08 - type_5
     obj_06 obj_01 - type_1
     obj_12 obj_03 obj_07 obj_05 - type_3
     obj_09 obj_02 - type_3
    )
 (:init 
    (pred_3 obj_10 obj_09)
    (pred_3 obj_04 obj_03)
    (pred_1 obj_04)
    (pred_3 obj_11 obj_03)
    (pred_1 obj_11)
    (pred_3 obj_08 obj_12)
    (pred_1 obj_08)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_02)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_02)
    (pred_4 obj_09 obj_12)
    (pred_4 obj_05 obj_02)
    (pred_4 obj_12 obj_03)
    (pred_4 obj_03 obj_07)
    (pred_4 obj_07 obj_05)
)
 (:goal
  (and
   (pred_2 obj_06)
   (pred_2 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_01))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
